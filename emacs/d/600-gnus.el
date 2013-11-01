(setq gnus-select-method '(nntp "news.gmane.org"))

;; C-w in Group buffer always causes me grief
(gnus-define-keys gnus-group-mode-map "\C-w"
		  (lambda ()
		    (interactive)
		    (message "Saved your own butt, didn't you?")))

(define-key gnus-group-mode-map "z" 'helm-happy)
