;;; init-corfu.el --- Interactive completion in buffers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(setq tab-always-indent 'complete)
(with-eval-after-load 'vertico
  (require 'orderless)
  (setq completion-styles '(orderless basic)))
(setq completion-category-defaults nil
      completion-category-overrides '((file (styles . (partial-completion)))))
(setq completion-cycle-threshold 4)

(require 'cape)
(with-eval-after-load 'cape
                      (add-hook 'completion-at-point-functions #'cape-dabbrev)
                      (add-hook 'completion-at-point-functions #'cape-file)
                      (add-hook 'completion-at-point-functions #'cape-history))


(require 'corfu)
(setq corfu-auto t
      corfu-auto-delay 0.2
      corfu-separator ?\s
      corfu-quit-at-boundary nil
      corfu-quit-no-match nil
      corfu-preview-current nil
      corfu-preselect-first t
      corfu-on-exact-match nil
      corfu-scroll-margin 5)

;; Add nerd-icons for corfu completion margin
(require 'nerd-icons-corfu)
(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)


;(with-eval-after-load 'eshell
;  (add-hook 'eshell-mode-hook (lambda () (setq-local corfu-auto nil))))

(add-hook 'after-init-hook 'global-corfu-mode)


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
