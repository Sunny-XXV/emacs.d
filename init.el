;;; init.el --- Load the full configuration -*- lexical-binding: t; -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce bactraces when errors occur: for diagnosing startup issues
;; (setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; (require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if preferred
(defconst *is-a-mac* (eq system-type 'darwin))

;; Process preformance tuning
(setq gc-cons-threshold (* 128 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)
(setq jit-lock-defer-time 0)

;; Supress some warnings
(setq byte-compile-warnings '(not nresolved
				  free-vars
				  callargs
				  redefine
				  obsolete
				  noruntime
				  cl-functions
				  interactive-only
				  ))

;; Bootstrap config

(setq custom-file (locate-user-emacs-file "custom.el"))
;; (require 'init-utils)
(require 'init-site-lisp)
;; (require 'init-exec-path)

;; (require 'init-frame-hooks)
;; (require 'init-xterm)
;; (require 'init-colorschemes)
(require 'init-interface)
(require 'init-modeline)
(require 'init-flymake)
(require 'init-eglot)

(require 'init-vertico)
(require 'init-corfu)

(require 'init-git)

(require 'init-whitespace)
(require 'init-editing-utils)

(require 'init-textile)
(require 'init-org)
(require 'init-evil)


(require 'init-python)

(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(savehist-mode 1) ; Buffer history
(setq visible-bell t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq scroll-conservatively 10)
(setq scroll-margin 8)
(require 'dirvish)
(dirvish-override-dired-mode)

;(require 'init-envrc)

;; treesit
(require 'init-treesitter)


;;; configurations go above
(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; initiel.el ends here
