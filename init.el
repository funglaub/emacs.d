;; emacs configuration
(setq dotfiles-dir
      (file-name-directory (or (buffer-file-name) load-file-name)))

(require 'cask)
(cask-initialize)

(setq load-path (cons "~/.emacs.d/site-lisp" load-path))
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(autoload 'my-site-start "~/.emacs.d/site-lisp/my-site-start.el" nil t)
(my-site-start "~/.emacs.d/site-start.d/")

(setq auto-save-default nil)

;; TODO: Is this still working?
;; flyspell-mode does spell-checking on the fly as you type
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'message-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
;; abbrev config
(add-hook 'text-mode-hook 'abbrev-mode)

;; replaces "yes or no" with "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Open new files without asking
(setq confirm-nonexistent-file-or-buffer nil)

(delete-selection-mode t)

(when (eq system-type 'darwin)
    (setq ns-right-alternate-modifier nil)
    (setenv "PATH" (concat (getenv "HOME") "/bin:"
                           "/usr/local/bin:"
                           (getenv "PATH"))))

;; Make buffer names unique:
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Start server
(server-start)

(setq host (getenv "DISPLAY"))
(if (string-equal host ":0")
    (setq host (system-name)))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

;; Tell gist.el to use curl
(setq gist-use-curl t)

;; became an Emacs guru in the keystroke department
(require 'guru-mode)
(guru-global-mode +1)

;;Byte compile .emacs upon save
(defun autocompile nil
  "compile itself if ~/.emacs.d/init.el"
  (interactive)
  (require 'bytecomp)
  (let ((dotemacs (expand-file-name "~/.emacs.d/init.el")))
    (if (string= (buffer-file-name) (file-chase-links dotemacs))
        (byte-compile-file dotemacs))))

(add-hook 'after-save-hook 'autocompile)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sml/active-background-color "color-238")
 '(sml/inactive-background-color "color-242"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sml/global ((t (:foreground "brightblue")))))
