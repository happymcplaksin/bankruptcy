;; Don't save term buffers (and others)
(setq desktop-buffers-not-to-save
      "\\(^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS\\)$\\|^*\\|.newsrc-dribble\\|&bitlbee")
(desktop-save-mode 1)
;;(setq desktop-base-lock-name (concat map-emacs-var "/desktop.lock"))
