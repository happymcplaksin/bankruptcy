;; multi-term & helm config

(setq term-debug nil)
(require 'term)
(require 'helm-multi-term)

;; X forwarding
(setq multi-term-default-args "-XA")
;; Use short names by default
(setq multi-term-default-buffer-name t)
;; Always send the init string
(setq multi-term-default-init t)
;; My personal host list
(setq multi-term-host-list
      `(
	;; Set TERM to vt100 because I often use these to connect to
	;; machines that don't have eterm-color.
        (,multi-term-localhost "Local")
	(,multi-term-localhost ,multi-term-localhost nil "export TERM=vt100")
	(,multi-term-localhost "1" nil "export TERM=vt100")
	(,multi-term-localhost "2" nil "export TERM=vt100")
	(,multi-term-localhost "3" nil "export TERM=vt100")
	(,multi-term-localhost "4" nil "export TERM=vt100")
	(,multi-term-localhost "5" nil "export TERM=vt100")
	(,multi-term-localhost "6" nil "export TERM=vt100")
	(,multi-term-localhost "7" nil "export TERM=vt100")
	(,multi-term-localhost "8" nil "export TERM=vt100")
	(,multi-term-localhost "9" nil "export TERM=vt100")
	(,multi-term-localhost "0" nil "export TERM=vt100")
	(,multi-term-localhost "q")
	(,multi-term-localhost "root" "root")
	(,multi-term-localhost "jojo" "jojo")
	))

;; My own C-x map for use in terms
(setq map-multi-term-ctl-x-map (copy-keymap ctl-x-map))
(define-key map-multi-term-ctl-x-map "\C-x" 'term-send-raw)
;; This isn't needed, right?
;;(define-key map-multi-term-ctl-x-map "\C-c" (lookup-key ctl-x-map (kbd "C-c")))
(define-key map-multi-term-ctl-x-map "\C-h" help-map)
(define-key term-raw-map "\C-x" map-multi-term-ctl-x-map)

;; Get rid of default escape-char (should this use term-escape-char?)
;;(define-key term-raw-map "\C-c" 'term-send-raw)
(define-key term-raw-map (kbd "C-c") 'term-send-raw)
;; Make ESC just be ESC!
(define-key term-raw-map [27] 'term-send-raw)
;; Put helm on C-^
(define-key term-raw-map "\C-^" 'helm-mini)
(define-key term-raw-map (kbd "C-6") 'helm-mini)

;; My keyboard cut-and-paste
;;
;; Make C-s enter line mode
(define-key term-raw-map "\C-s"
  '(lambda ()
     (interactive)
     (term-line-mode)
     (setq map-term-point (point))
     (set-mark (point))))
;; Make M-w do kill-ring-save, go to end of buffer, and then switch back to
;; char (aka raw) mode and
(define-key term-mode-map "\ew"
  '(lambda ()
     (interactive)
     ;;(debug)
     (kill-ring-save (mark) (point))
     (goto-char map-term-point)
     (term-char-mode)))
;; C-y = yank (isn't it cute?)
(define-key term-raw-map "\C-y"
  '(lambda ()
    (interactive)
    (term-line-mode)
    (yank)
    (term-char-mode)))

;; Finally, start a term on localhost 
(multi-term-new
 (assoc multi-term-localhost
	multi-term-host-list))
