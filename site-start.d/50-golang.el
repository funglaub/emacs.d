(add-hook 'go-mode-hook
          (lambda ()
            "go mode defaults"
            (add-hook 'before-save-hook 'gofmt-before-save nil t)))
