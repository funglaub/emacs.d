;; tramp, for sudo access
(require 'tramp)
;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")

;; ;; ido-mode
;; (ido-mode t)
;; (setq ido-enable-prefix nil
;;       ido-enable-flex-matching t
;;       ido-create-new-buffer 'always
;;       ido-use-filename-at-point 'guess
;;       ido-max-prospects 10
;;       ido-default-file-method 'selected-window)

;; ;; auto-completion in minibuffer
;; (icomplete-mode +1)

;; (set-default 'imenu-auto-rescan t)
(require 'lusty-explorer)
