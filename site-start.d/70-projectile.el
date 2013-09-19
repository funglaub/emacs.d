;; projectile is a project management mode
(require 'projectile)
(projectile-global-mode t)

(require 'helm-misc)
(require 'helm-projectile)

(setq projectile-completion-system 'grizzl)

(defun helm-prelude ()
  "Preconfigured `helm'."
  (interactive)
  (if (projectile-project-root)
      ;; add project files and buffers when in project
      (helm-other-buffer '(helm-c-source-projectile-files-list
                           helm-c-source-projectile-buffers-list
                           helm-c-source-buffers-list
                           ;; helm-c-source-recentf
                           helm-c-source-buffer-not-found)
                         "*helm prelude*")
    ;; otherwise fallback to helm-mini
    (helm-mini)))

(setq projectile-globally-ignored-directories
      (append projectile-globally-ignored-directories '("log" "tmp" "vendor")))
