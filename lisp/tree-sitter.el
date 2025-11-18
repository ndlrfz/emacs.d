;; Editor packages

;; Enable tree-sitter global if available
(when (fboundp 'global-treesit-auto-mode)
  (use-package treesit-auto
    :ensure t
    :config
    (setq treesit-auto-install 'prompt)
    (global-treesit-auto-mode)))

(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

(add-to-list 'major-mode-remap-alist '(go-mode . go-ts-mode))

(use-package go-mode
  :ensure t)

(use-package nix-ts-mode
  :ensure t
  :mode ("\\.nix\\'" . nix-ts-mode))

(add-to-list 'major-mode-remap-alist '(js-mode . js-ts-mode))
(add-to-list 'major-mode-remap-alist '(typescript-mode . typescript-ts-mode))
(add-to-list 'major-mode-remap-alist '(tsx-mode . tsx-ts-mode))

(use-package typescript-mode :ensure t)

(add-to-list 'major-mode-remap-alist '(html-mode . html-ts-mode))
(add-to-list 'major-mode-remap-alist '(css-mode . css-ts-mode))
(add-to-list 'auto-mode-alist '("Dockerfile\\.*" . dockerfile-ts-mode))
(add-to-list 'auto-mode-alist '("Containerfile" . dockerfile-ts-mode))
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode))

(use-package yaml-mode
  :ensure t
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(use-package ansible
  :ensure t
  :hook (yaml-mode . ansible))

(use-package ansible-doc
  :ensure t
  :after ansible)

(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode))

(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-auto-install 'prompt)   ;; 'prompt atau t (langsung install tanpa nanya)
  (global-treesit-auto-mode))

(setq treesit-auto-install t)

(setq major-mode-remap-alist
      '((python-mode          . python-ts-mode)
        (js-mode              . js-ts-mode)
        (typescript-mode      . typescript-ts-mode)
        (tsx-mode             . tsx-ts-mode)
        (json-mode            . json-ts-mode)
        (css-mode             . css-ts-mode)
        (yaml-mode            . yaml-ts-mode)
        (html-mode            . html-ts-mode)
        (c-mode               . c-ts-mode)
        (c++-mode             . c++-ts-mode)
        (go-mode              . go-ts-mode)
        (bash-mode            . bash-ts-mode)
        (sh-mode              . bash-ts-mode)
        (toml-mode            . toml-ts-mode)
        ))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(with-eval-after-load 'rainbow-delimiters
  (set-face-attribute 'rainbow-delimiters-depth-1-face nil :foreground "#7f7f7f")
  (set-face-attribute 'rainbow-delimiters-depth-2-face nil :foreground "#afafaf")
  (set-face-attribute 'rainbow-delimiters-depth-3-face nil :foreground "#dfdfdf")
  (set-face-attribute 'rainbow-delimiters-depth-4-face nil :foreground "#5f87af")
  (set-face-attribute 'rainbow-delimiters-depth-5-face nil :foreground "#87afd7")
  (set-face-attribute 'rainbow-delimiters-depth-6-face nil :foreground "#5f8787")
  (set-face-attribute 'rainbow-delimiters-depth-7-face nil :foreground "#87afaf")
  (set-face-attribute 'rainbow-delimiters-depth-8-face nil :foreground "#5f875f")
  (set-face-attribute 'rainbow-delimiters-depth-9-face nil :foreground "#87af87"))

;; smartparen - auto-pair mode smarter
(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

;; indent
(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :init
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-character ?|
        highlight-indent-guides-auto-enabled t
        highlight-indent-guides-responsive 'top)
  :config
  (set-face-foreground 'highlight-indent-guides-character-face "#474747")
  (set-face-foreground 'highlight-indent-guides-top-character-face "#7f7f7f"))

;; fuzzy finder
(use-package consult
  :bind (
         ("C-s"     . consult-line)
         ("C-x b"   . consult-buffer)
         ("C-x C-r" . consult-recent-file)
         ("M-g g"   . consult-goto-line)
         ("M-g i"   . consult-imenu)
         ("M-s d"   . consult-find)
         ("M-s r"   . consult-ripgrep)
         ))
