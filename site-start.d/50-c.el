;;(autoload 'google-c-style "Google's indent style" t)
(require 'google-c-style)
(require 'cc-mode)

(add-hook 'c-mode-common-hook 'google-set-c-style)
;; see site-list/google-c-style.el
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))
(define-key c-mode-base-map (kbd "C-c m") 'compile)

(defun makefile-mode-defaults ()
  (setq indent-tabs-mode t))

(setq makefile-mode-hook 'makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda ()
                                (run-hooks 'makefile-mode-hook)))
