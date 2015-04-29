(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(line-number-mode -1)
(scroll-bar-mode -1)

(put 'upcase-region 'disabled nil)

(server-start)

(setq display-time-day-and-date t
      display-time-mail-file nil
      display-time-default-load-average nil
      display-time-24hr-format t)
(display-time)

(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq puppet-indent-level 4)
(setq ruby-indent-level 4)

(global-set-key "\C-cj" 'goto-line)

(require 'edit-server)
(edit-server-start)
(setq edit-server-new-frame nil)

(setq ispell-silently-savep t)
(setq ispell-program-name "ispell")
(global-set-key "\C-csw" 'ispell-word)
(global-set-key "\C-csb" 'ispell-buffer)
(global-set-key "\C-csr" 'ispell-region)

(require 'flymake-puppet)
(add-hook 'puppet-mode-hook (lambda () (flymake-puppet-load)))

(require 'el-pocket)
(el-pocket-load-auth)

(setq puppet-lint-command "puppet-lint --no-80chars-check --with-context --log-format \"%{path}:%{linenumber}: %{kind}: %{message} (%{check})\"")
