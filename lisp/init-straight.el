;;; init-straight.el --- Settings and helpers for straight.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; Initialization of Straight
;; Stop package.el from auto-initializing
(setq package-enable-at-startup nil)

;; Bootstrap straight.el
(defvar bootstrap-version
  (let ((bootstrap-file
         (expand-file-name
	  "straight/repos/straight.el/bootstrap.el"
	  (or (bound-and-true-p straight-base-dir)
	      user-emacs-directory)))
        (bootstrap-version 7))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage)))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
()
(straight-use-package
 '(melpa :type git :host github :repo "melpa/melpa"))
(straight-use-package
 '(gnu-elpa :type git :host github :repo "emacs-straight/gnu-elpa"))
;(setq straight-recipe-repositories
;      '(gnu-elpa melpa))

(provide 'init-straight)
;; init-straight.el ends here
