;; Fix magit comitting on OSX
(when (eq system-type 'darwin)
    (setq magit-emacsclient-executable "/usr/local/bin/emacsclient"))

(add-hook 'git-commit-mode-hook
          (lambda ()
            "git-commit-mode-defaults"

            (set (make-local-variable 'comment-start) ">")))
