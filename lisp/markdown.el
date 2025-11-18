;; Markdown - all things related
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" "\\.markdown\\'")
  :init
  (setq markdown-command "multimarkdown"))

;; markdown preview - C-c C-g
(use-package grip-mode
  :ensure t
  :bind ("C-c C-g" . grip-mode))

;; highlight code block
(setq markdown-fontify-code-blocks-natively t)

;; Markdown TOC (table of contents)
(use-package markdown-toc :ensure t)


