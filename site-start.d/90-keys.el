(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;; Magit
(global-set-key "\C-x\C-g" 'magit-status)
(global-set-key "\C-cr" 'revert-buffer)
(global-set-key [delete]   'delete-char)
(global-set-key [?\M-c]    'calc)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)

;; File finding
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c q") 'join-line)

(global-set-key "\C-c_w" 'whitespace-mode)
(global-set-key "\C-c_t" 'whitespace-toggle-options)
(global-set-key "\C-c=w" 'global-whitespace-mode)
(global-set-key "\C-c=t" 'global-whitespace-toggle-options)

(global-set-key (kbd "C-x y") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x .") 'align-regexp)

(global-set-key (kbd "C-c @") 'er/expand-region)

(global-set-key (kbd "C-c o") 'occur)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c w") 'rename-file-and-buffer)

(global-set-key (kbd "C-h f") 'helm-apropos)

(global-set-key (kbd "C-c k") 'prelude-kill-other-buffers)
(global-set-key (kbd "<S-s-down>") 'prelude-move-line-down)
(global-set-key (kbd "<S-s-up>") 'prelude-move-line-up)

(global-set-key (kbd "C-u") 'er/expand-region)
(global-set-key [f8] 'neotree-toggle)
