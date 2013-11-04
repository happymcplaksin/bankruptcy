;; helm
(helm-mode)
(global-set-key (kbd "C-^") 'helm-happy)
(define-key helm-map (kbd "C-^") 'helm-exit-minibuffer)
(setq helm-idle-delay 0.05)
(setq helm-input-idle-delay .05)

(defun helm-happy ()
  "helm-happy, duped helm-mini plus changes"
  (interactive)
  (require 'helm-files)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm-other-buffer '(helm-source-noodle
			 helm-source-buffers-list
			 helm-source-recentf)
                       "*helm happy*")))
