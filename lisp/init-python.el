;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'python-ts-mode-hook 'eglot-ensure)
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(python-ts-mode . ("pylsp"))))

(require 'flymake-ruff)
(add-hook 'python-ts-mode-hook #'flymake-ruff-load)

(require 'ruff-format)
(add-hook 'python-ts-mode-hook 'ruff-format-on-save-mode)

(provide 'init-python)
;;; init-python.el ends here
