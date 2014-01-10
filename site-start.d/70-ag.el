(require 'ag)

(defun funglaub-todos-in-project ()
  (interactive)
  ;; (ag/search "TODO((?!Prio).)*:" (ag/project-root default-directory ) t))
  (ag-project-regexp "TODO((?!Prio).)*:"))

(global-set-key (kbd "<f5>") 'ag-project-at-point)
(global-set-key (kbd "<f6>") 'ag-regexp-project-at-point)
(global-set-key (kbd "<f7>") 'funglaub-todos-in-project)
