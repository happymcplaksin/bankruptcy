(setq gnus-select-method '(nntp "news.gmane.org"))
(gnus)

;; C-w in Group buffer always causes me grief
(gnus-define-keys gnus-group-mode-map "\C-w"
		  (lambda ()
		    (interactive)
		    (message "Saved your own butt, didn't you?")))

(define-key gnus-group-mode-map "z" 'helm-happy)

(setq
 gnus-list-groups-with-ticked-articles nil
 gnus-topic-display-empty-topics nil
 gnus-topic-indent-level 4)

(add-hook 'message-mode-hook 'flyspell-mode)

(setq user-mail-address "happy@usg.edu")

(require 'bbdb)
(bbdb-initialize 'gnus 'message)
(setq bbdb-default-area-code 706)
(setq bbdb/mail-auto-create-p nil)
(setq bbdb-notice-auto-save-file t)
(setq bbdb-use-pop-up nil)
(setq bbdb-completion-display-record nil)
(setq bbdb-complete-name-allow-cycling t)
(setq bbdb-dwim-net-address-allow-redundancy t)
(setq bbdb-quiet-about-name-mismatches t)

(add-hook 'mail-setup-hook 'bbdb-mail-aliases)
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq 
 gnus-treat-date-local 'head
 gnus-treat-display-face t
 gnus-treat-display-x-face t
 gnus-treat-hide-citation t
 gnus-treat-hide-signature t
 gnus-treat-leading-whitespace 'head
 gnus-treat-mail-picon nil
 gnus-treat-newsgroups-picon nil
 gnus-treat-strip-banner t
 gnus-treat-strip-list-identifiers t
)

(load-library "adv-random-sig")
(setq adv-signature-dir (expand-file-name "~/etc/emacs/sigs/"))
(setq adv-signature-head (expand-file-name "~/etc/emacs/sigs-head"))

(setq gnus-posting-styles 
      '(
	(".*"
	 (signature adv-random-signature-no-sep))))

(setq gnus-message-archive-group
      (concat "nnimap+localhost:sent-"
	      (format-time-string "%Y")))
               
(setq gnus-gcc-mark-as-read t)
