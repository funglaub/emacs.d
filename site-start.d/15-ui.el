;; Take from http://rawsyntax.com/blog/learn-emacs-fit-your-workflow/
;;default display position/size based on display resolution
;;warning: assumption that the 24/22 " displays are oriented
;;         above the laptop's display
;;         Haven't found a way to check multiple monitor
;;         relative orientation via emacs yet...
;;
;; a frame is passed in when firing on after-make-frame-fuctions,
;; but not necessary when calling interactively

;;; Code:
(setq inhibit-startup-message t)
;; Remove splash screen
(setq inhibit-splash-screen t)

;; Disable the menu bar
(menu-bar-mode -1)

(blink-cursor-mode t)

(require 'powerline)

;; Moe-theme
(require 'moe-theme)

(setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))

;; Choose a color for mode-line.(Default: blue)
(moe-theme-set-color 'blue)

;; Finally, apply moe-theme now.
;; Choose what you like, (moe-light) or (moe-dark)
(moe-dark)
(powerline-moe-theme)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

;; Scrolling
(setq
 scroll-margin 0
 scroll-conservatively 100000
 scroll-preserve-screen-position 1
 mouse-wheel-scroll-amount '(1 ((shift) . 1))
 mouse-wheel-progressive-speed nil
 mouse-wheel-follow-mouse 't)

(when (eq system-type 'darwin)
  (set-face-attribute 'default nil
                      :family "Monaco" :height 140 :weight 'normal))
