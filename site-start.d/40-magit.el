;; Fix magit comitting on OSX
(when (eq system-type 'darwin)
    (setq magit-emacsclient-executable "/usr/local/bin/emacsclient"))
