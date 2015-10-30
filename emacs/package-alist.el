;; Poor man's version control for MELPA packages.
;; Once in a while I save the value of package-alist.
(setq package-alist
((yaml-mode
  [cl-struct-package-desc yaml-mode
                          (20150816 2235)
                          "Major mode for editing YAML files" nil nil nil "/home/happy/var/emacs/elpa/yaml-mode-20150816.2235"
                          ((:keywords "data" "yaml"))
                          nil])
 (web
  [cl-struct-package-desc web
                          (20141231 1201)
                          "useful HTTP client"
                          ((dash
                            (2 9 0))
                           (s
                            (1 5 0)))
                          nil nil "/home/happy/var/emacs/elpa/web-20141231.1201" nil nil])
 (w3m
  [cl-struct-package-desc w3m
                          (20151013 327)
                          "an Emacs interface to w3m" nil nil nil "/home/happy/var/emacs/elpa/w3m-20151013.327"
                          ((:keywords "w3m" "www" "hypermedia"))
                          nil])
 (ujelly-theme
  [cl-struct-package-desc ujelly-theme
                          (20150807 2136)
                          "Ujelly theme for GNU Emacs 24 (deftheme)" nil nil nil "/home/happy/var/emacs/elpa/ujelly-theme-20150807.2136"
                          ((:url . "http://github.com/marktran/color-theme-ujelly"))
                          nil])
 (s
  [cl-struct-package-desc s
                          (20150924 406)
                          "The long lost Emacs string manipulation library." nil nil nil "/home/happy/var/emacs/elpa/s-20150924.406"
                          ((:keywords "strings"))
                          nil])
 (puppetfile-mode
  [cl-struct-package-desc puppetfile-mode
                          (20131017 833)
                          "Syntax highlighting for Puppetfiles" nil nil nil "/home/happy/var/emacs/elpa/puppetfile-mode-20131017.833" nil nil])
 (puppet-mode
  [cl-struct-package-desc puppet-mode
                          (20150730 1208)
                          "Major mode for Puppet manifests"
                          ((emacs
                            (24 1))
                           (pkg-info
                            (0 4)))
                          nil nil "/home/happy/var/emacs/elpa/puppet-mode-20150730.1208"
                          ((:keywords "languages")
                           (:url . "https://github.com/lunaryorn/puppet-mode"))
                          nil])
 (powershell
  [cl-struct-package-desc powershell
                          (20150428 1421)
                          "No description available." nil nil nil "/home/happy/var/emacs/elpa/powershell-20150428.1421" nil nil])
 (pkg-info
  [cl-struct-package-desc pkg-info
                          (20150517 443)
                          "Information about packages"
                          ((epl
                            (0 8)))
                          nil nil "/home/happy/var/emacs/elpa/pkg-info-20150517.443"
                          ((:keywords "convenience")
                           (:url . "https://github.com/lunaryorn/pkg-info.el"))
                          nil])
 (php-mode
  [cl-struct-package-desc php-mode
                          (20151002 2030)
                          "Major mode for editing PHP code" nil nil nil "/home/happy/var/emacs/elpa/php-mode-20151002.2030"
                          ((:url . "https://github.com/ejmr/php-mode"))
                          nil])
 (php+-mode
  [cl-struct-package-desc php+-mode
                          (20121129 1252)
                          "A better PHP mode with Zend Framework 1 support." nil nil nil "/home/happy/var/emacs/elpa/php+-mode-20121129.1252" nil nil])
 (molokai-theme
  [cl-struct-package-desc molokai-theme
                          (20151016 845)
                          "molokai theme with Emacs theme engine" nil nil nil "/home/happy/var/emacs/elpa/molokai-theme-20151016.845"
                          ((:url . "https://github.com/alloy-d/color-theme-molokai"))
                          nil])
 (markdown-mode
  [cl-struct-package-desc markdown-mode
                          (20151011 1256)
                          "Emacs Major mode for Markdown-formatted text files" nil nil nil "/home/happy/var/emacs/elpa/markdown-mode-20151011.1256"
                          ((:keywords "markdown" "github flavored markdown" "itex")
                           (:url . "http://jblevins.org/projects/markdown-mode/"))
                          nil])
 (helm-core
  [cl-struct-package-desc helm-core
                          (20151024 2233)
                          "Development files for Helm"
                          ((emacs
                            (24))
                           (cl-lib
                            (0 5))
                           (async
                            (1 5)))
                          nil nil "/home/happy/var/emacs/elpa/helm-core-20151024.2233"
                          ((:url . "https://emacs-helm.github.io/helm/"))
                          nil])
 (helm
  [cl-struct-package-desc helm
                          (20151027 732)
                          "Helm is an Emacs incremental and narrowing framework"
                          ((emacs
                            (24))
                           (cl-lib
                            (0 5))
                           (async
                            (1 5))
                           (helm-core
                            (1 8 0)))
                          nil nil "/home/happy/var/emacs/elpa/helm-20151027.732"
                          ((:url . "https://emacs-helm.github.io/helm/"))
                          nil])
 (flymake-puppet
  [cl-struct-package-desc flymake-puppet
                          (20141006 1855)
                          "An Emacs flymake handler for syntax-checking puppet using puppet-lint"
                          ((flymake-easy
                            (0 9)))
                          nil nil "/home/happy/var/emacs/elpa/flymake-puppet-20141006.1855" nil nil])
 (flymake-easy
  [cl-struct-package-desc flymake-easy
                          (20140818 55)
                          "Helpers for easily building flymake checkers" nil nil nil "/home/happy/var/emacs/elpa/flymake-easy-20140818.55" nil nil])
 (epl
  [cl-struct-package-desc epl
                          (20150517 433)
                          "Emacs Package Library"
                          ((cl-lib
                            (0 3)))
                          nil nil "/home/happy/var/emacs/elpa/epl-20150517.433"
                          ((:keywords "convenience")
                           (:url . "http://github.com/cask/epl"))
                          nil])
 (el-pocket
  [cl-struct-package-desc el-pocket
                          (20150202 1528)
                          "Read and write to Pocket (getpocket.com) ;;"
                          ((web
                            (0 5 2))
                           (emacs
                            (24)))
                          nil nil "/home/happy/var/emacs/elpa/el-pocket-20150202.1528" nil nil])
 (edit-server
  [cl-struct-package-desc edit-server
                          (20141231 1358)
                          "server that responds to edit requests from Chrome" nil nil nil "/home/happy/var/emacs/elpa/edit-server-20141231.1358"
                          ((:url . "https://github.com/stsquad/emacs_chrome"))
                          nil])
 (dash
  [cl-struct-package-desc dash
                          (20151021 113)
                          "A modern list library for Emacs" nil nil nil "/home/happy/var/emacs/elpa/dash-20151021.113"
                          ((:keywords "lists"))
                          nil])
 (cyberpunk-theme
  [cl-struct-package-desc cyberpunk-theme
                          (20150828 508)
                          "Cyberpunk Color Theme" nil nil nil "/home/happy/var/emacs/elpa/cyberpunk-theme-20150828.508"
                          ((:keywords "color" "theme" "cyberpunk"))
                          nil])
 (color-theme-solarized
  [cl-struct-package-desc color-theme-solarized
                          (20150619 1734)
                          "Solarized themes for Emacs"
                          ((color-theme
                            (6 5 5)))
                          nil nil "/home/happy/var/emacs/elpa/color-theme-solarized-20150619.1734" nil nil])
 (color-theme-sanityinc-tomorrow
  [cl-struct-package-desc color-theme-sanityinc-tomorrow
                          (20150803 1419)
                          "A version of Chris Kempson's various Tomorrow themes" nil nil nil "/home/happy/var/emacs/elpa/color-theme-sanityinc-tomorrow-20150803.1419" nil nil])
 (color-theme-sanityinc-solarized
  [cl-struct-package-desc color-theme-sanityinc-solarized
                          (20150803 1420)
                          "A version of Ethan Schoonover's Solarized themes" nil nil nil "/home/happy/var/emacs/elpa/color-theme-sanityinc-solarized-20150803.1420" nil nil])
 (color-theme-buffer-local
  [cl-struct-package-desc color-theme-buffer-local
                          (20151012 1628)
                          "No description available." nil nil nil "/home/happy/var/emacs/elpa/color-theme-buffer-local-20151012.1628" nil nil])
 (color-theme-approximate
  [cl-struct-package-desc color-theme-approximate
                          (20140227 2036)
                          "Makes Emacs theme works on terminal transparently" nil nil nil "/home/happy/var/emacs/elpa/color-theme-approximate-20140227.2036" nil nil])
 (color-theme
  [cl-struct-package-desc color-theme
                          (20080305 34)
                          "install color themes" nil nil nil "/home/happy/var/emacs/elpa/color-theme-20080305.34"
                          ((:keywords "faces")
                           (:url . "http://www.emacswiki.org/cgi-bin/wiki.pl?ColorTheme"))
                          nil])
 (clues-theme
  [cl-struct-package-desc clues-theme
                          (20140922 2056)
                          "an Emacs 24 theme which may well be fully awesome..."
                          ((emacs
                            (24 0)))
                          nil nil "/home/happy/var/emacs/elpa/clues-theme-20140922.2056"
                          ((:url . "https://github.com/jasonm23/emacs-clues-theme"))
                          nil])
 (badger-theme
  [cl-struct-package-desc badger-theme
                          (20140716 1932)
                          "A dark theme for Emacs 24." nil nil nil "/home/happy/var/emacs/elpa/badger-theme-20140716.1932" nil nil])
 (async
  [cl-struct-package-desc async
                          (20150909 2257)
                          "Asynchronous processing in Emacs"
                          ((emacs
                            (24))
                           (cl-lib
                            (0 5)))
                          nil nil "/home/happy/var/emacs/elpa/async-20150909.2257"
                          ((:url . "https://github.com/jwiegley/emacs-async"))
                          nil]))
