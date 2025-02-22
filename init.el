;;; init.el --- Load the full configuration -*- lexical-binding: t; -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce bactraces when errors occur: can be helpful to diagnose startup issues
;; (setq debug-on-error t)

(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "Emacs should be updated to v%s or higher" minver)))
(when (version< emacs-version "28.1")
  (message "Update for full functionality"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; (require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if preferred
(defconst *is-a-mac* (eq system-type 'darwin))

;; Process preformance tuning
(setq gc-cons-threshold (* 128 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)
(setq jit-lock-defer-time 0)

;; Bootstrap config

(setq custom-file (locate-user-emacs-file "custom.el"))
(require 'init-straight) ; provides use-package, comes as early as possible
(require 'init-utils)
(require 'init-site-lisp)
;(require 'init-exec-path)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-colorschemes)
(require 'init-interface)
(require 'init-modeline)

(require 'init-vertico)
(require 'init-corfu)

(require 'init-whitespace)

(require 'init-git)


(require 'init-textile)
(require 'init-org)

(setq confirm-kill-emacs #'yes-or-no-p) ; confirm on exit
(electric-pair-mode t) ; Pair brackets automatically
(add-hook 'prog-mode-hook #'show-paren-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode) ; code collapsable
(column-number-mode t) ; show col number on mode line
(global-auto-revert-mode t) ; Auto refresh when other process modifies current file

(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(savehist-mode 1) ; Buffer history
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative) ; Relative line numbers
(setq visible-bell t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq scroll-conservatively 10)
(setq scroll-margin 8)

;; Auto-Save
(require 'auto-save)
(auto-save-enable)

(setq auto-save-silent t)   ; quietly save
(setq auto-save-delete-trailing-whitespace t)  ; automatically delete spaces at the end of the line when saving

;; Ace-window
(use-package ace-window
 :ensure t
 :straight t
 :bind (("C-x o" . 'ace-window)))

;; Undo tree
(use-package undo-tree
 :ensure t
 :straight t
 :init (global-undo-tree-mode)
 :custom
 (undo-tree-auto-save-history nil))

;; Evil
(use-package evil
 :ensure t
 :straight t
 :init (evil-mode))

;; Avy
(use-package avy
 :ensure t
 :straight t)

; make avy work like easy motion in vim
(evil-define-key 'normal 'global "s" 'avy-goto-char-timer)
(evil-define-key 'visual 'global "s" 'avy-goto-char)

(define-key evil-motion-state-map (kbd "C-h") #'evil-window-left)
(define-key evil-motion-state-map (kbd "C-j") #'evil-window-down)
(define-key evil-motion-state-map (kbd "C-k") #'evil-window-up)
(define-key evil-motion-state-map (kbd "C-l") #'evil-window-right)

;; Evil-mc multi cursor editing
(use-package evil-mc
  :straight t
  :config
  (global-evil-mc-mode 1)  ; enable globally

  ;; Default keybindings will be:
  ;; grm - Make cursor at point and move to the next match
  ;; grc - Toggle cursor at point
  ;; grh - Make cursor at point and move to the next match
  ;; gru - Undo last cursor
  ;; grq - Remove all cursors
  )

;; Dashboard
(use-package dashboard
 :ensure t
 :straight t
 :config
 (setq dashboard-banner-logo-title "Welcome to Emacs!")
 (setq dashboard-projects-backend 'projectile)
 (setq dashboard-startup-banner 'official)
 (setq dashboard-items '((recents . 5)
  (bookmarks . 5)
  (projects . 10)))
 (dashboard-setup-startup-hook))

;; Rainbow delimiters colorful brackets
(use-package rainbow-delimiters
 :ensure t
 :straight t
 :hook (prog-mode . rainbow-delimiters-mode))

;; Projectile
(use-package projectile
 :ensure t
 :straight t
 :bind (("C-c p" . projectile-command-map))
 :config
 (setq projectile-mode-line "Projectile")
 (setq projectile-track-known-projects-automatically nil))

(use-package counsel-projectile
 :ensure t
 :straight t
 :after (projectile)
 :init (counsel-projectile-mode))

;; Flycheck
(use-package flycheck
 :ensure t
 :straight t
 :config
 (setq truncate-lines nil)
 :hook
 (prog-mode . flycheck-mode))




;; Auto-generated content
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fc1275617f9c8d1c8351df9667d750a8e3da2658077cfdda2ca281a2ebc914e0"
     "45631691477ddee3df12013e718689dafa607771e7fd37ebc6c6eb9529a8ede5"
     default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; configurations go above
(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; initiel.el ends here
