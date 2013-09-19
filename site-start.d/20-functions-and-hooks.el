(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun turn-on-hl-line-mode ()
  (when (> (display-color-cells) 8) (hl-line-mode t)))

(defun turn-on-save-place-mode ()
  (setq save-place t))

(defun add-watchwords ()
  ;; TODOs etc
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO.*\\|FIXME\\|HACK\\|REFACTOR\\IDEE\\):"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'turn-on-hl-line-mode)
(add-hook 'prog-mode-hook 'turn-on-save-place-mode)
(add-hook 'prog-mode-hook 'add-watchwords)
(add-hook 'prog-mode-hook 'idle-highlight-mode)
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)
;; This ruins previously indented lines in Coffee-mode, haml-mode etc.
;; (add-hook 'prog-mode-hook '(lambda () (electric-indent-mode +1)))
;; npm install -g coffeelint jsonlint
(add-hook 'prog-mode-hook 'flycheck-mode)

;; http://emacsredux.com/blog/2013/04/21/edit-files-as-root/
(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; http://emacsredux.com/blog/2013/05/04/rename-file-and-buffer/
(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(defun prelude-kill-other-buffers ()
  "Kill all buffers but the current one.
Doesn't mess with special buffers."
  (interactive)
  (-each
   (->> (buffer-list)
     (-filter #'buffer-file-name)
     (--remove (eql (current-buffer) it)))
   #'kill-buffer))

(defun prelude-move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun prelude-move-line-down ()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
