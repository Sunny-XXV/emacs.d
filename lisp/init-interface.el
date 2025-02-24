;;; init-interface.el --- icons etc. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'nerd-icons)

(require 'awesome-tab)
(awesome-tab-mode t)

;; Better window border
(set-face-background 'vertical-border (face-background 'default))
(set-face-foreground 'vertical-border "white")
(set-display-table-slot standard-display-table
                        'vertical-border
                        (make-glyph-code ?┃))

(provide 'init-interface)
;;; init-utils.el ends here
