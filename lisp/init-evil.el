;;; init-evil.el --- Evil to uss vim keybindings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; global-evil-leader-mode should come before evil
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'find-file
  "b1" 'switch-to-buffer
  "bk" 'kill-buffer)


;; Evil
(require 'evil)
(evil-mode)

;; Evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)


;; Avy
(require 'avy)

; make avy work like easy motion in vim
(evil-define-key 'normal 'global "s" 'avy-goto-char-timer)
(evil-define-key 'visual 'global "s" 'avy-goto-char)

(define-key evil-motion-state-map (kbd "C-h") #'evil-window-left)
(define-key evil-motion-state-map (kbd "C-j") #'evil-window-down)
(define-key evil-motion-state-map (kbd "C-k") #'evil-window-up)
(define-key evil-motion-state-map (kbd "C-l") #'evil-window-right)

;; Evil-mc multi cursor editing
(require 'evil-mc)
(global-evil-mc-mode 1)  ; enable globally

  ;; Default keybindings will be:
  ;; grm - Make cursor at point and move to the next match
  ;; grc - Toggle cursor at point
  ;; grh - Make cursor at point and move to the next match
  ;; gru - Undo last cursor
  ;; grq - Remove all cursors
;  )

(provide 'init-evil)
;;; init-evil.el ends here
