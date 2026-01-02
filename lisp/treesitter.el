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

(use-package nix-ts-mode
  :straight t
  :config
  (nix-ts-mode))

(use-package vue-mode
  :straight t
  :config
  (vue-mode))

;; force php to php-ts-mode
(add-to-list 'auto-mode-alist '("\\.sgml\\'" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'"  . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-ts-mode))
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

