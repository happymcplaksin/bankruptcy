(require 'erc)
(setq erc-modules '(autoaway autojoin button completion fill irccontrols log match netsplit noncommands readonly ring services scrolltobottom stamp spelling track))
(erc-update-modules)

(setq
 erc-autoaway-idle-seconds 900
 erc-autoaway-use-emacs-idle t)
(erc-autoaway-mode)

(setq
 erc-autojoin-channels-alist (quote (("freenode.net" "#logstash" "#peachnet" "#rvc" "#rbvmomi" "#teamdowntime" "#yaketystats" "#itsup")))
 erc-join-buffer 'buffer)
(erc-autojoin-mode)

(setq
 erc-log-insert-log-on-open nil
 erc-log-write-after-insert t
 erc-log-write-after-send t
 erc-save-buffer-on-part t
 erc-save-queries-on-quit t)
(erc-log-mode)

(setq 
 erc-auto-query 'bury
 erc-timestamp-format "[%D %H:%M]"
 erc-timestamp-format-right " [%D %H:%M]"
 erc-hide-list '("JOIN" "KICK" "MODE" "NICK" "PART" "QUIT")
 erc-notifications-mode t
 erc-nick "happymcplaksin"
 erc-track-exclude nil
 erc-track-exclude-types '("NICK" "MODE" "305" "306" "QUIT" "JOIN")
 erc-server "localhost"
)
(erc-services-mode)

(erc :server "irc.freenode.net")
(erc :server "localhost" :nick "happy")

;; (erc-scrolltobottom-mode)
