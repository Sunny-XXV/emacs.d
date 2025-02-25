;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; I use nix + direnv instead of virtualenv/pyenv/pyvenv, and it is an
;; approach which extends to other languages too. I recorded a
;; screencast about this: https://www.youtube.com/watch?v=TbIHRHy7_JM


(add-hook 'python-ts-mode-hook 'eglot-ensure)
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(python-mode . ("ruff" "server")))
  (add-hook 'auto-save-hook 'eglot-format))

(require 'flymake-ruff)
(add-hook 'python-mode-hook #'flymake-ruff-load)

(add-hook 'python-ts-mode-hook 'ruff-format-on-save-mode)

(provide 'init-python)
;;; init-python.el ends here
