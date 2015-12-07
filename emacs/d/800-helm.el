
(helm-mode)
(global-set-key (kbd "C-^") 'helm-mini)
(define-key helm-map (kbd "C-^") 'helm-exit-minibuffer)
(setq helm-idle-delay 0.05)
(setq helm-input-idle-delay .05)

(if work
  (progn
    (require 'helm-noodle-multi-term)
    (add-to-list 'helm-mini-default-sources 'helm-source-noodle t)
    (add-to-list 'helm-mini-default-sources 'helm-source-multi-term t))
  (add-to-list 'helm-mini-default-sources 'helm-source-multi-term t))

