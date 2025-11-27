;; markdown
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do)))

(use-package grip-mode
  :straight t
  :config
  (setq grip-command 'auto)
  :hook ((markdown-mode org-mode) . grip-mode))
