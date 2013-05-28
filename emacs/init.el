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

