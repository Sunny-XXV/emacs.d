;;; init-vertico.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Vertico + Marginalia + Consult
(require 'vertico)
(vertico-mode t)

(require 'marginalia)
(marginalia-mode)

(require 'consult)
;(with-eval-after-load 'consult
;  (define-key mode-specific-map (kbd "C-c M-x") 'consult-mode-command)
;  (define-key mode-specific-map (kbd "C-c h") 'consult-history)
;  (define-key mode-specific-map (kbd "C-c k") 'consult-kmacro)
;  (define-key mode-specific-map (kbd "C-c m") 'consult-man)
;  (define-key mode-specific-map (kbd "C-c i") 'consult-info)
  ; C-x bindings in `ctl-x-map'
  ;(define-key ctl-x-map (kbd "C-x M-:") 'consult-complex-command)
  ;(define-key ctl-x-map (kbd "C-x b") 'consult-buffer)
  ;(define-key ctl-x-map (kbd "C-x 4 b") 'consult-buffer-other-window)
  ;(define-key ctl-x-map (kbd "C-x 5 b") 'consult-buffer-other-frame)
  ;(define-key ctl-x-map (kbd "C-x r b") 'consult-bookmark)
  ;(define-key ctl-x-map (kbd "C-x p b") 'consult-project-buffer)
  ; Other custom bindings
  ;(define-key global-map (kbd "M-y") 'consult-yank-pop)
  ; M-g bindings in `goto-map'
  ;(define-key goto-map (kbd "M-g e") 'consult-compile-error)
  ;(define-key goto-map (kbd "M-g f") 'consult-flymake)
  ;(define-key goto-map (kbd "M-g g") 'consult-goto-line)
  ;(define-key goto-map (kbd "M-g M-g") 'consult-goto-line)
  ;(define-key goto-map (kbd "M-g o") 'consult-outline)
  ;(define-key goto-map (kbd "M-g m") 'consult-mark)
  ;(define-key goto-map (kbd "M-g k") 'consult-global-mark)
  ;(define-key goto-map (kbd "M-g i") 'consult-imenu)
  ;(define-key goto-map (kbd "M-g I") 'consult-imenu-multi)
  ; M-s bindings in `search-map'
  ;(define-key saerch-map (kbd "M-s d") 'consult-find)
  ;(define-key saerch-map (kbd "M-s D") 'consult-locate)
  ;(define-key saerch-map (kbd "M-s g") 'consult-grep)
  ;(define-key saerch-map (kbd "M-s G") 'consult-git-grep)
  ;(define-key saerch-map (kbd "M-s r") 'consult-ripgrep)
  ;(define-key saerch-map (kbd "M-s l") 'consult-line)
  ;(define-key saerch-map (kbd "M-s L") 'consult-line-multi)
  ;(define-key saerch-map (kbd "M-s k") 'consult-keep-lines)
  ;(define-key saerch-map (kbd "M-s u") 'consult-focus-lines)
  ; Isearch integration
  ;(define-key isearch-mode-map (kbd "M-s e") 'consult-isearch-history))

(provide 'init-vertico)
;;; init-vertico.el ends here
