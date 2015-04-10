(setq tab-always-indent nil)

;; Highlight matching paranthesis
(show-smartparens-global-mode +1)

(column-number-mode t)

;; Whitespaces instead of tabs
(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)

;; 80 chars limit
(setq-default fill-column 80)
(turn-on-auto-fill)

(autoload 'whitespace-toggle-options "whitespace"
  "Toggle local `whitespace-mode' options." t)

;; whitespace-mode config
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length to 80 chars
;; See http://emacsredux.com/blog/2013/05/16/whitespace-cleanup/
(setq whitespace-style '(face tabs empty trailing lines-tail indentation
                         tab-mark space-before-tab space-after-tab))

;; Newline at the end of a file
(setq-default require-final-newline t)
;; Clean up the buffer when saving
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Enable whitespace mode for all
(add-hook 'prog-mode-hook 'whitespace-mode)

;; Minor mode for visual feedback on some operations.
(require 'volatile-highlights)
(volatile-highlights-mode t)

(add-hook 'after-init-hook 'global-flycheck-mode)

(setq-default tab-width 2)

(set-default 'indent-tabs-mode nil)    ;; Whitespaces instead of tabs
(set-default 'indicate-empty-lines t)

(setq vc-follow-symlinks nil)
