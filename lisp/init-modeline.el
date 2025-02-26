;;; init-modeline.el --- customize mode-line -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'awesome-tray)
;(setq awesome-tray-active-modules '("location" "pdf-view-page" "belong" "file-path" "mode-name" "last-command" "battery" "date"))
(setq awesome-tray-active-modules '("evil" "location" "belong" "file-path" "mode-name" "date"))
(setq awesome-tray-info-padding-right 0)
(setq awesome-tray-hide-mode-line nil)
(setq-default mode-line-format nil)
(awesome-tray-mode 1)

(provide 'init-modeline)
;;; init-modeline.el ends here
