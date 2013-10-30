;;(setq debug-on-error t)

(setq map-emacs-etc (expand-file-name "~/etc/emacs"))

;; Load files from ~/etc/emacs/d in order based on file name
(defun map-load-libraries-in-order (directory)
  (let ((files (sort
		(delq nil 
		      (mapcar '(lambda (elt)
				 (and
				  (string-match "^[0-9].*[^~]$" elt)
				  elt)) (directory-files directory)))
		'string<)))
    (while files
      (let ((file (car files)))
	(if (file-directory-p (concat directory "/" file))
	    (map-load-libraries-in-order (concat directory "/" file))
	  (load-library (concat directory "/" file)))
	(setq files (cdr files))))))
(map-load-libraries-in-order (concat map-emacs-etc "/d"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-nick "happymcplaksin"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
