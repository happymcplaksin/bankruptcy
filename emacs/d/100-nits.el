(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(line-number-mode -1)

(put 'upcase-region 'disabled nil)

(setq term-debug nil)

;; helm
(global-set-key (kbd "C-^") 'helm-happy)
(define-key helm-map (kbd "C-^") 'helm-exit-minibuffer)
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay .1)
(helm-mode)

(server-start)

(display-time)
