;; Basic config

(setq package-enable-at-startup nil
      inhibit-startup-message   t
      frame-resize-pixelwise    t   ; fine resize
      package-native-compile    t   ; native compile packages
      warning-minimum-level :error) ; only show errors

(scroll-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Visual configuration

(setq visible-bell t)
; Column number
(column-number-mode)
; Set font and size
;(set-face-attribute 'default nil :font "Consolas" :height 140)
;(set-face-attribute 'default nil :font "Lucida Console" :height 140)
;(set-face-attribute 'default nil :font "Iosevka" :height 140)
;(set-face-attribute 'default nil :font "Anonymous Pro" :height 140)
(set-face-attribute 'default nil :font "Fira mono" :height 140)
; Set theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; Melpa

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Misc

; Remember and restore the last cursor location of opened files
(save-place-mode 1)
; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)
; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)
; Make editing text files more intuitively
(setq-default sentence-end-double-space nil)
; Jump words like camelCase better
(global-subword-mode 1)
; Stop the cursor from changing half of the screen when scrolling
(setq scroll-conservatively 1000)
; Disable tabs for indent
(setq-default indent-tabs-mode nil)
; Delete files in dired moves things to trash
(setq delete-by-moving-to-trash t)
; Dont show message in scratch buffer
(setq-default initial-scratch-message nil)
; Auto save, backups and better undo memory
(setq undo-limit        100000000
      auto-save-default t
      make-backup-files nil)
; take new window space from all other windows
(setq window-combination-resize t)
; Short answers
(setopt use-short-answers t)
; Make Ctrl+Enter save file
;(global-set-key [C-return] 'save-buffer)
; If in end of file and C-n add new line
(setq next-line-add-newlines t)
; Automatically delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
; M-/ hippie expand, autocomplete (remember this)
; Ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)  ; Enable fuzzy matching
(setq ido-everywhere t)             ; Use ido everywhere
; Switch between buffers like other apps
(global-set-key (kbd "<C-tab>") 'bs-cycle-next)
(global-set-key (kbd "<C-S-tab>") 'bs-cycle-previous)
; Delete region with C-d
(delete-selection-mode t)

;; Package configuration

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

; Add ace-window which-key, and easy-kill using use-package
(use-package ace-window
  :bind (("M-o" . ace-window))  ; Bind ace-window to M-o for easy window switching
  :config
  (setq aw-scope 'global))      ; Set scope to global for switching between frames

(use-package easy-kill
  :bind (("M-w" . easy-kill)))  ; Bind M-w to easy-kill for better kill functionality

(use-package which-key
  :config
  (which-key-mode)  ; Activate which-key-mode
  (setq which-key-idle-delay 0.5)  ; Set delay before which-key popup appears
  (setq which-key-separator " → ")  ; Customize the separator
  (setq which-key-prefix-prefix "+"))  ; Prefix to indicate more bindings