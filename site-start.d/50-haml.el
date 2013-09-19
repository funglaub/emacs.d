(add-hook 'haml-mode-hook
          (lambda ()
            "haml-mode-defaults"

            ;; Haml uses two spaces.
            (set (make-local-variable 'tab-width) 2)
            ;; Still needed?
            ;; (electric-indent-mode -1)

            ;; Retain haml-mode's tab behaviour
            (set (make-local-variable 'tab-always-indent) t)
))
