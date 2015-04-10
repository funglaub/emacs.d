(require 'emmet-mode)
(setq scss-compile-at-save nil)
(setq css-indent-offset 2)

(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
