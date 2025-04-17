;; --- Defaults
(setq ring-bell-function 'ignore)
(setq use-short-answers t)
(setq confirm-kill-processes nil)
(setq-default indent-tabs-mode nil)
(setq warning-minimum-level :emergency)

;; --- Modes
(delete-selection-mode t)
(column-number-mode t)
(global-auto-revert-mode t)

;; --- Files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; --- Whitespace
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(setq require-final-newline t)

;; --- Window
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; --- Custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; --- Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; --- use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; --- Packages
(use-package lsp-mode
  :hook ((prog-mode . lsp))
  :commands lsp)
