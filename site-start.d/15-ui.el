(require 'smart-mode-line)
(if after-init-time (sml/setup)
  (add-hook 'after-init-hook 'sml/setup))

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

;; Disable the menu bar on Windows and Linux/BSD,
(if (not (eq system-type 'darwin))
    (menu-bar-mode -1))

(blink-cursor-mode t)

;; http://lists.gnu.org/archive/html/emacs-devel/2011-09/msg00350.html
(setq redisplay-dont-pause t)

;; (setq solarized-termcolors 256)
;; (load-theme 'solarized-dark t)
(load-theme 'sanityinc-tomorrow-eighties t)

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
