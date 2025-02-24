;;; init-interface.el --- icons etc. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'nerd-icons)

;; Rainbow delimiters colorful brackets
(require 'rainbow-delimiters)
(add-hook 'prog-mode 'rainbow-delimiters-mode)

(require 'awesome-tab)
(awesome-tab-mode t)

(provide 'init-interface)
;;; init-utils.el ends here
