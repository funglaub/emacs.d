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


(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session
;; http://emacsblog.org/2007/07/21/package-faves-rcodetools/
(require 'rcodetools)

;; Fix ruby-mode indenting. Example:
;; class Comment < ActiveRecord::Base
;;   after_create :send_email_to_author,
;;                :if => :author_wants_emails?,
;;                :unless => Proc.new { |comment| comment.post.ignore_comments? }
;; end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
(defadvice ruby-indent-line (after line-up-args activate)
  (let (indent prev-indent arg-indent)
    (save-excursion
      (back-to-indentation)
      (when (zerop (car (syntax-ppss)))
        (setq indent (current-column))
        (skip-chars-backward " \t\n")
        (when (eq ?, (char-before))
          (ruby-backward-sexp)
          (back-to-indentation)
          (setq prev-indent (current-column))
          (skip-syntax-forward "w_.")
          (skip-chars-forward " ")
          (setq arg-indent (current-column)))))
    (when prev-indent
      (let ((offset (- (current-column) indent)))
        (cond ((< indent prev-indent)
               (indent-line-to prev-indent))
              ((= indent prev-indent)
               (indent-line-to arg-indent)))
        (when (> offset 0) (forward-char offset))))))


(global-set-key (kbd "C-c '") 'ruby-tools-to-single-quote-string)
(global-set-key (kbd "C-c \"") 'ruby-tools-to-double-quote-string)
(global-set-key (kbd "C-c :") 'ruby-tools-to-symbol)
