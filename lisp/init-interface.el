;;; init-interface.el --- icons etc. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'nerd-icons)

(require 'awesome-tab)
(awesome-tab-mode t)
(setq-default awesome-tab-background-color (face-background 'default))
(setq awesome-tab-ace-str-style 'left)
(when (not (display-graphic-p))
  (setq frame-background-mode 'dark))


;; Better window border
(set-face-background 'vertical-border (face-background 'default))
(set-face-foreground 'vertical-border "white")
(set-display-table-slot standard-display-table
                        'vertical-border
                        (make-glyph-code ?┃))

(require 'neotree)
(setq neo-theme 'nerd-icons)
(add-hook 'neotree-mode-hook
          (lambda ()
            (display-line-numbers-mode -1)
            (setq mode-line-format nil)))

(provide 'init-interface)
;;; init-utils.el ends here
