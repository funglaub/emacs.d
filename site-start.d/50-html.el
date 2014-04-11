(require 'handlebars-sgml-mode)
(handlebars-use-mode 'global)

(add-to-list 'auto-mode-alist '("\\.hbs$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars$" . html-mode))

(add-hook 'html-mode-hook (lambda()(handlebars-sgml-minor-mode 1)))
