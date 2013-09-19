(autoload 'js-mode "js" "Start js-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
;; two spaces.
(setq js-indent-level 2)
