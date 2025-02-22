;;; init-textile.el --- Edit Textile markup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package textile-mode :straight t)

(setq auto-mode-alist
      (cons '("\\.textile\\'" . textile-mode) auto-mode-alist))


(provide 'init-textile)
;;; init-textile.el ends here
