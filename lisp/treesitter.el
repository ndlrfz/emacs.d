;; treesitter
(use-package tree-sitter
  :straight t
  :config
  (global-tree-sitter-mode 1)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; treesitter-lang
(use-package tree-sitter-langs
  :straight t
  :after tree-sitter)

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; force php to php-ts-mode
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-ts-mode))

