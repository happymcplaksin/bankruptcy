
(helm-mode)
(global-set-key (kbd "C-^") 'helm-happy)
(define-key helm-map (kbd "C-^") 'helm-exit-minibuffer)
(setq helm-idle-delay 0.05)
(setq helm-input-idle-delay .05)

(if work
  (progn
    (require 'helm-noodle-multi-term)
    (setq helm-happy-sources '(
                           helm-source-noodle
			   helm-source-buffers-list
                           helm-source-multi-term
			   helm-source-recentf)))
  (setq helm-happy-sources '(
			   helm-source-buffers-list
                           helm-source-multi-term
			   helm-source-recentf)))

(defun helm-happy ()
  "helm-happy, duped helm-mini plus changes"
  (interactive)
  (require 'helm-files)
  (unless helm-source-buffers-list
    (setq helm-source-buffers-list
          (helm-make-source "Buffers" 'helm-source-buffers)))
  (let ((helm-ff-transformer-show-only-basename nil))
    (setq debug-on-error t)
    (helm :sources helm-happy-sources
          :buffer "*helm happy*"
          :truncate-lines t)
    (setq debug-on-error nil)
    ))
