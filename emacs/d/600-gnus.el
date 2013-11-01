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
