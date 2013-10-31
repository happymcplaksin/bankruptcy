(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(put 'upcase-region 'disabled nil)

(setq term-debug nil)

;; helm
(global-set-key (kbd "C-^") 'helm-happy)
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay .1)

(server-start)

(display-time)
