;;; init-evil.el --- Evil to uss vim keybindings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; global-evil-leader-mode should come before evil
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'neotree-toggle
  "bb" 'switch-to-buffer
  "tt" 'awesome-tab-ace-jump
  "tl" 'awesome-tab-forward-tab
  "th" 'awesome-tab-backward-tab
  "tj" 'awesome-tab-forward-group
  "tk" 'awesome-tab-backward-group
  "tgx" 'awesome-tab-kill-all-buffers-in-current-group
  "tgg" 'awesome-tab-switch-group
  "bx" 'kill-buffer)


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

;; For Neotree
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "j") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "o") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd ".") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "a") 'neotree-create-node)
(evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)

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
