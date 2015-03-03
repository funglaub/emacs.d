;; General coding hook
;; TODO: This is actually pretty obsolete. Hooks should be added to Prog-mode
;;       See: http://emacsredux.com/blog/2013/04/05/prog-mode-the-parent-of-all-programming-modes/

;; Ruby-Tools FTW
(add-hook 'ruby-mode-hook 'ruby-tools-mode)
;; Autoclosing defs and blocks
(add-hook 'ruby-mode-hook 'ruby-end-mode)

(add-hook 'ruby-mode-hook
          (lambda ()
            "ruby mode defaults"
            ;; Better indenting of content between paranthesis
            (setq ruby-deep-indent-paren nil)
            (setq ruby-deep-arglist nil)
            (setq ruby-end-insert-newline nil)
            (setq ruby-insert-encoding-magic-comment nil)))

;; Overwrite ruby-mode's default behaviour
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (defadvice ruby-mode-set-encoding
;;               (around ruby-mode-set-encoding-disable activate) nil)))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.god$" . ruby-mode))
