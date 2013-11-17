;; helm-multi-term.el -- helm source for creating multiple M-x term's
;;
;; happy@mcplaksin.org
;;
;; Here's an easy way to have M-x term's for every host to which you ssh
;; (or telnet, etc).  Each buffer is named after the host you connected to
;; (it can also have a random name of your choosing :) Create
;; multi-term-host-list with an entry for each of your hosts, add
;; helm-source-multi-term to helm-sources and then use helm to
;; create a M-x term for a host in your list.
;;
;; I'm a sysadmin and end up connecting to many machines.  I prefer M-x
;; term to M-x eshell and such.  This could probably be made to work with
;; those other guys without too much work.
;;
;; This is an improvement on multi-term.el which I posted to
;; gnu.emacs.sources a thousand years ago (and nobody seems to use besides
;; me :)
;;
;; Sample host list:
;; (setq multi-term-host-list
;;       '(
;;         ;; Use the defaults for everything
;;         ("go.example.com")
;;
;;         ;; Crazy example: Name buffer "*jojo*", log in as root, let the
;;         ;; environment know you are root, use telnet, and require ipv6
;;         ;; address resolution (-6 works on Linux anyhow)
;;         ("jojo.example.com" "jojo" "root" "export I_AM_ROOT=t" "telnet" "-6")
;;
;;         ;; Maybe you have a cluster and know the machines by their
;;         ;; canonical names but often talk application admins who know them
;;         ;; mainly by their service names.  Connect by hostname and make the
;;         ;; canonical and service names part of the buffer name:
;;         ("kermit.example.com" "kermit/web1")
;;         ("fozzie.example.com" "fozzie/web2")
;;         ("animal.example.com" "animal/web2")
;;
;;         ;; Defaults for everything except username
;;         ("pizza.example.com" nil "oracle")
;;         ))

(defvar helm-multi-term-version
  "0.1")

(defvar multi-term-localhost
  (system-name)
  "What multi-term considers to be the local host.
Terms created to \"connect to\" multi-term-localhost do not invoke ssh.")

(defvar multi-term-alist
  nil
  "List of existing multi-terms.")

(defvar multi-term-shell shell-file-name
  "Run this shell when multi-term invokes term.")

(defvar multi-term-default-buffer-name
  nil
  "Default for naming multi-term buffers.
See the documentation for `multi-term-host-list'.")

(defvar multi-term-default-args
  nil
  "Default string of ssh arguments to send when creating new terms.
If nil, do not send any arguments.  Arguments specified in
`multi-term-host-list' override the default.")

;;;; TODO: What the heck is this for?
;;(defvar multi-term-default-init
;;  t
;;  "Default init value for multi-term hosts.
;;See the documentation for `multi-term-host-list'.")

(defvar multi-term-default-init-string "export TERM=eterm-color"
  "Send this string after starting a shell.")

(defvar multi-term-kill-buffer
  nil
  "If t, kill multi-term buffer when process dies.
Otherwise just print a silly message.")

(defvar multi-term-kill-message
  "your own self."
"Silly message to print after `Kill the buffer (BUFFER-NAME)'
when multi-term does not kill a buffer.  Be sure to end it with a
period :)")

(defvar multi-term-host-list
  nil
  "List of potential multi-term's.
Each element looks like this:

\(HOSTNAME &optional BUFFERNAME USERNAME INIT SSH-PROGRAM SSH-ARGS)

HOSTNAME is the host to which to connect.

If BUFFERNAME is a string, multi-term will name the buffer
`*BUFFERNAME*'.  Otherwise if either BUFFERNAME or
multi-term-default-buffer-name is t, multi-term will name the
buffer after the short hostname \(everything before the first
`.').  For example, jojo.example.com's buffer would be named
`*jojo*'.  If BUFFERNAME is nil, the buffer will be named
`*HOSTNAME*'.

USERNAME is the username given to SSH-PROGRAM (via -l).  If nil,
do not supply a username.

INIT, if nil, means send multi-term-default-init-string before running
ssh.  Otherwise, the send value of INIT.

SSH-PROGRAM can be used to specify an alternative to ssh.

SSH-ARGS specifies extra arguments to be passed to SSH-PROGRAM.")

(defun multi-term-new (host-info &optional no-switch)
  "Create and configure a new term and add it to multi-term-alist."
  (let* ((hostname        (elt host-info 0))
	 (buffer-spec     (elt host-info 1))


	 (buffer-name     (if (stringp buffer-spec)
			      buffer-spec
			    (if (or
				 multi-term-default-buffer-name
				 (eq buffer-spec t))
				(progn
				  (string-match "^[^.]+" hostname)
				  (match-string 0 hostname))
			      hostname)))
	 (username        (elt host-info 2))
	 (init-string     (let ((init (elt host-info 3)))
			    (if (eq init nil)
				multi-term-default-init-string
			      init)))
;;			    (if (or
;;				 multi-term-default-init
;;				 (eq init t))
;;				multi-term-default-init-string
;;			      init)))
	 (program         (or (elt host-info 4)
			      "ssh"))
	 (args            (or (elt host-info 5)
			      multi-term-default-args
			      "")))
    (setq buffer-name (concat "*" buffer-name "*"))
    (setq username
	  (if username
	      (concat "-l " username)
	    ""))

    ;; Create term
    (ansi-term multi-term-shell)
    (rename-buffer buffer-name)
    (set-process-sentinel (get-buffer-process buffer-name) 'multi-term-sentinel)
    (make-local-variable 'kill-buffer-hook)
    (add-hook 'kill-buffer-hook 'multi-term-delete)

    ;; If term is for localhost
    (if (string-equal multi-term-localhost hostname)
	;; Only send init-string if it exists
	(if init-string
	    (term-send-raw-string (concat init-string "\n")))
      ;; Otherwise use ssh
      (if init-string
	  (progn
	    (term-send-raw-string (concat init-string "; "))
	    (term-send-raw-string
	     (concat "exec " program " " args " " username " " hostname "\n")))))
    ;; If term is local and for root, su
    (if (and (string-equal multi-term-localhost hostname)
	     (string-equal username "-l root"))
	(term-send-raw-string "su -\n"))
    ;; Make a buffer-local variable multi-term-id used by multi-term-delete
    ;; and multi-term-non-terms.  Seems like there should be a better way
    ;; to do this.
    (make-local-variable 'multi-term-id)
    (setq multi-term-id host-info)
    ;; Add term to list
    (add-to-list 'multi-term-alist multi-term-id)
    ;; maybe switch to it
    (if (not no-switch)
	(switch-to-buffer buffer-name))))

(defun multi-term-sentinel (process change)
  "Maybe kill term buffer when process dies.
When the process dies kill the multi-term buffer if
`multi-term-kill' is t.  Otherwise display a reminder."
  (if (or
       (string-match "finished" change)
       (string-match "exited" change))
      (progn
	(let* ((buffer (buffer-name (process-buffer process))))
	  (make-local-variable 'term-raw-map)
	  (if multi-term-kill-buffer
	      (kill-buffer buffer)
	    (message (concat "Kill the buffer (" buffer ") " multi-term-kill-message)))))))

(defun multi-term-delete ()
  "Remove current buffer from `multi-term-alist'.
This is part of `kill-buffer-hook' for multi-terms."
  (interactive)
  (setq multi-term-alist (delete multi-term-id multi-term-alist)))

(defun multi-term-non-terms ()
  "Returns a list of terms that could but do not exist."
  ;; If multi-term-alist is non-nil, delete the elements it contains from
  ;; the list of possibilities
  (if multi-term-alist
      (let ((list (copy-tree multi-term-host-list)))
	(mapc
	 '(lambda (multi-term)
	    (mapc
	     '(lambda (possibility)
		(if (equal possibility multi-term)
		    (setq list (delete possibility list))))
	     multi-term-host-list))
	 multi-term-alist)
	list)
    ;; otherwise, the list is simply all possibilities
    multi-term-host-list))

;; helm config for creating multi-term.
;;
;; switching to existing terms is already covered by helm's
;; buffer-switching source)
(defvar helm-source-multi-term
  '((name . "multi-term")
    (candidates
     . (lambda ()
	 (mapcar '(lambda (a)
		    (let ((host (elt a 0))
			  (buffer (elt a 1))
			  text)
		      (if (stringp buffer)
			  (setq text (concat host " -- " buffer))
			(setq text host))
		      `(,text ,a)))
		 (multi-term-non-terms))))
    (action
     . (("Create term"
	 . (lambda (term-info)
	     (multi-term-new (car term-info))))))))

(provide 'helm-multi-term)
