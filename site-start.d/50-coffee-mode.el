;; Coffee-Script
(add-to-list 'auto-mode-alist '("\\.coffee" . coffee-mode))
(add-hook 'coffee-mode-hook
          (lambda ()
            "coffee-mode-defaults"

            ;; CoffeeScript uses two spaces.
            (set (make-local-variable 'tab-width) 2)

            ;; Retain coffee-mode's tab behaviour
            (set (make-local-variable 'tab-always-indent) t)
            ;; If you don't have js2-mode
            (setq coffee-js-mode 'javascript-mode)

            ;; If you don't want your compiled files to be wrapped
            (setq coffee-args-compile '("-c" "--bare"))

            ;; *Messages* spam
            (setq coffee-debug-mode t)

            ;; electric-indent doesn't play nice with coffee-mode's "smart"
            ;; indent
            (electric-indent-mode -1)

            ;; Emacs key binding
            (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

            ;; Riding edge.
            (if (not (eq system-type 'darwin))
                ;; Linux
                (setq coffee-command "/usr/local/bin/coffee")
              ;; OSX
              (setq coffee-command "/usr/local/share/npm/bin/coffee"))

            ;; Compile '.coffee' files on every save
            (and (file-exists-p (buffer-file-name))
                 (file-exists-p (coffee-compiled-file-name))
                 (coffee-cos-mode t))))
