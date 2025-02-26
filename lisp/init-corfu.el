;;; init-corfu.el --- Interactive completion in buffers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(setq tab-always-indent 'complete)
(with-eval-after-load 'vertico
  (require 'orderless)
  (setq completion-styles '(orderless)))
(setq completion-category-defaults nil
      completion-category-overrides '((file (styles . (partial-completion)))))
(setq completion-cycle-threshold 4)

(when (require 'corfu)
    (setq corfu-auto t
        corfu-auto-delay 0.2
        corfu-separator ?\s
        corfu-quit-at-boundary nil
        corfu-quit-no-match nil
        corfu-preview-current nil
        corfu-preselect-first t
        corfu-on-exact-match nil
        corfu-scroll-margin 5))

;; Add nerd-icons for corfu completion margin
(require 'nerd-icons-corfu)
(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)

(add-hook 'after-init-hook 'global-corfu-mode)

(require 'cape)
(with-eval-after-load 'cape
                      (add-hook 'completion-at-point-functions #'cape-dabbrev)
                      (add-hook 'completion-at-point-functions #'cape-file)
                      (add-hook 'completion-at-point-functions #'cape-history))

(provide 'init-corfu)
;;; init-corfu.el ends here
