(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(line-number-mode -1)
(scroll-bar-mode -1)

(put 'upcase-region 'disabled nil)

(setq term-debug nil)

(server-start)

(setq display-time-day-and-date t
      display-time-mail-file nil
      display-time-default-load-average nil
      display-time-24hr-format t)
(display-time)
