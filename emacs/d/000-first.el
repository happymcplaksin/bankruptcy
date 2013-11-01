;;; Some things only work when run first

;; my directories
(setq map-emacs-var (expand-file-name "~/var/emacs"))
(setq map-emacs-lisp (expand-file-name "~/src/elisp"))
(setq map-emacs-info (expand-file-name "~/src/elisp/info"))
(setq user-emacs-directory map-emacs-var)

;; variables which set pathnames
(setq custom-file (concat map-emacs-etc "/customized"))
(setq auto-save-list-file-prefix (concat map-emacs-var "/emacs-saves/save-"))
(setq temporary-file-directory (concat map-emacs-var "/tmp"))
(setq erc-log-channels-directory (concat map-emacs-var "/erc-logs"))
(setq save-place-file (concat map-emacs-var "/save-places"))
(setq bbdb-file (concat map-emacs-etc "/bbdb"))
(setq bookmark-default-file (concat map-emacs-var "/bookmarks"))
(setq desktop-base-file-name (concat map-emacs-var "/desktop"))
(setq url-configuration-directory (concat map-emacs-var "/url"))
(setq url-cache-directory (concat map-emacs-var "/url/cache"))
(setq savehist-file (concat map-emacs-var "/savehist"))

