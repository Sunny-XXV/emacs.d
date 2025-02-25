;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; I use nix + direnv instead of virtualenv/pyenv/pyvenv, and it is an
;; approach which extends to other languages too. I recorded a
;; screencast about this: https://www.youtube.com/watch?v=TbIHRHy7_JM


(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(setq python-shell-interpreter "python3")

;(require-package 'pip-requirements)

(when (require 'flymake-ruff)
  (defun sanityinc/flymake-ruff-maybe-enable ()
    (when (executable-find "ruff")
      (require 'ruff-format)
      (flymake-ruff-load)))
  (add-hook 'python-mode-hook 'sanityinc/flymake-ruff-maybe-enable))


(when (require 'reformatter)
  (add-hook 'python-mode 'ruff-format-on-save-mode)
  (reformatter-define ruff
                      :program "ruff"
                      :args '("format" "--stdin-filename", buffer-file-name "-")))

(provide 'init-python)
;;; init-python.el ends here
