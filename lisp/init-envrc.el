;;; init-envrc.el --- Integrate with envrc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (require 'envrc)
  (add-hook 'after-init-hook 'envrc-global-mode))

(provide 'init-envrc)

;;; init-envrc.el ends here
