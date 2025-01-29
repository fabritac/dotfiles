;; --- Defaults
(setq ring-bell-function 'ignore)
(setq use-short-answers t)
(setq confirm-kill-processes nil)
(setq-default indent-tabs-mode nil)

;; --- Modes
(delete-selection-mode t)
(cua-mode t)

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

;; --- Keybindings -- Experimental!!

;; Save file with Ctrl-s
(global-set-key (kbd "C-s") 'save-buffer)

;; Search with Ctrl-f
(global-set-key (kbd "C-f") 'isearch-forward)

;; Select all with Ctrl-a
(global-set-key (kbd "C-a") 'mark-whole-buffer)

;; Quit current window with Ctrl-w
(global-set-key (kbd "C-w") 'delete-window)

;; Switch window focus with Ctrl-Tab
(global-set-key (kbd "C-<tab>") 'other-window)

;; Create a horizontal split with Ctrl-/
(global-set-key (kbd "C-/") 'split-window-right)

;; Undo with Ctrl-u
(global-set-key (kbd "C-u") 'undo)

;; List all buffers with Ctrl-b
(global-set-key (kbd "C-b") 'ibuffer)

;; Mark the current line with Ctrl-l
(global-set-key (kbd "C-l") (lambda ()
                              (interactive)
                              (move-beginning-of-line nil)
                              (set-mark-command nil)
                              (move-end-of-line nil)))

;; Compile with F5
(global-set-key (kbd "<f5>") 'compile)

;; Recompile with F8
(global-set-key (kbd "<f8>") 'recompile)

;; Quit things with Escape, this does not work that well!
(global-set-key (kbd "<escape>") 'keyboard-quit)

;; Instead use Escape to cycle between buffers
(global-set-key (kbd "C-o") (lambda ()
                                   (interactive)
                                   (switch-to-buffer (other-buffer))))

;; Experimental!!
;; Change default the behaviour of the cursor . If at the beginning of a line and pressing C-←, move to the end of the same line instead of the previous line.
;; If at the end of a line and pressing C-→, move to the beginning of the same line instead of the next line.
(global-set-key (kbd "<C-left>")
                (lambda ()
                  (interactive)
                  (if (bolp)  ;; If at beginning of line
                      (end-of-line)
                    (backward-word))))  ;; Default behavior

(global-set-key (kbd "<C-right>")
                (lambda ()
                  (interactive)
                  (if (eolp)  ;; If at end of line
                      (beginning-of-line)
                    (forward-word))))  ;; Default behavior

(defvar my-terminal-buffer "*shell*")  ;; Name of the terminal buffer
(global-set-key (kbd "<f1>")
                (lambda ()
                  (interactive)
                  (let ((buf (get-buffer-create (generate-new-buffer-name my-terminal-buffer))))  ;; Create a unique buffer name
                    (switch-to-buffer buf)  ;; Switch to the new buffer
                    (shell buf))))  ;; Start the shell in the new buffer
