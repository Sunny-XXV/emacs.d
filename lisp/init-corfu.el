;;; init-corfu.el --- Interactive completion in buffers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(setq tab-always-indent 'complete)
(when (use-package orderless :straight t)
  (with-eval-after-load 'vertico
    (require 'orderless)
    (setq completion-styles '(orderless basic))))
(setq completion-category-defaults nil
      completion-category-overrides '((file (styles . (partial-completion)))))
(setq completion-cycle-threshold 4)

(use-package cape
  :straight t
  :init
  ;; Add useful completion sources
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(use-package corfu
  :straight t
  :custom
  (corfu-auto t)          ;; Enable auto completion
  (corfu-separator ?\s)   ;; Orderless field separator
  (corfu-quit-at-boundary nil) ;; Never quit at completion boundary
  (corfu-quit-no-match nil)    ;; Never quit, even if there is no match
  (corfu-preview-current nil)   ;; Disable current candidate preview
  (corfu-preselect 'prompt)    ;; Preselect the prompt
  (corfu-on-exact-match nil)   ;; Configure handling of exact matches
  (corfu-scroll-margin 5)      ;; Use scroll margin
  :config
  (with-eval-after-load 'eshell
                        (add-hook 'eshell-mode-hook (lambda () (setq-default corfu-auto nil))))
  (add-hook 'after-init-hook 'global-corfu-mode))
;
;(use-package orderless
;  :straight t
;  :custom
;  (completion-styles '(orderless basic))
;  (completion-category-overrides '((file (styles . (partial-completion))))))


;(when (and (version< "28.1" emacs-version) (use-package corfu :straight t))
;  (setq-default corfu-auto t)
;  (steq-default corfu-separator ?\s)   ;; Orderless field separator
;  (steq-default corfu-quit-at-boundary nil) ;; Never quit at completion boundary
;  (steq-default corfu-quit-no-match nil)    ;; Never quit, even if there is no match
;  (steq-default corfu-preview-current nil)   ;; Disable current candidate preview
;  (steq-default corfu-preselect 'prompt)    ;; Preselect the prompt
;  (steq-default corfu-on-exact-match nil)   ;; Configure handling of exact matches
;  (steq-default corfu-scroll-margin 5)      ;; Use scroll margin
;  (with-eval-after-load 'eshell
;    (add-hook 'eshell-mode-hook (lambda () (setq-local corfu-auto nil))))
;  (setq-default corfu-quit-no-match 'separator)
;  (add-hook 'after-init-hook 'global-corfu-mode)
;
;
;
;  (with-eval-after-load 'corfu
;    (corfu-popupinfo-mode))
;
;  ;; Make Corfu also work in terminals, without disturbing usual behaviour in GUI
;  ;(when (use-package corfu-terminal :straight t)
;  ;  (with-eval-after-load 'corfu
;  ;    (corfu-terminal-mode)))
;
;  ;; TODO: https://github.com/jdtsmith/kind-icon
;  )


(provide 'init-corfu)
;;; init-corfu.el ends here
