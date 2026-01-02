;; ================================
;; Core packages
;; ================================

;; which-key

;; company (autocomplete)
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-backends '(company-capf)
   company-tooltip-align-annotations t
        company-minimum-prefix-length 1
        company-selection-wrap-around t))

;; flycheck (linting)
(use-package flycheck
  :hook (after-init . global-flycheck-mode)
  :config
  (with-eval-after-load 'python
    (flycheck-add-next-checker 'python-pylint 'python-ruff)))

;; yasnippet (snippets)
(use-package yasnippet
  :hook (prog-mode . yas-minor-mode)
  :config
  (setq yas-snippet-dirs
        '("~/.emacs.d/straight/repos/yasnippet-snippets"))
  (yas-reload-all))

(use-package yasnippet-snippets
  :after yasnippet)

;; ================================
;; LSP Support
;; ================================

;; lsp-mode
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((php-ts-mode . lsp-deferred)
         (python-ts-mode . lsp-deferred)
         (go-ts-mode . lsp-deferred)
         (js-ts-mode . lsp-deferred)
         (yaml-ts-mode . lsp-deferred)
         (lua-ts-mode . lsp-deferred)
         (typescript-ts-mode . lsp-deferred))
  
  :config
  (setq lsp-headerline-breadcrumb-enable t
        lsp-enable-snippet t
        lsp-prefer-capf t)
  :bind
  ("C-c l c" . lsp-execute-code-action))

;; lsp-ui (UI tambahan)
; (use-package lsp-ui
;   :commands lsp-ui-mode
;   :hook (lsp-mode . lsp-ui-mode)
;   :config
;   (setq lsp-ui-doc-delay 0.5
;         lsp-ui-doc-show-with-cursor t
;         lsp-ui-sideline-show-code-actions t))

(use-package lsp-ui
  :straight t
  :hook (lsp-mode . lsp-ui-mode)
  :bind
  ("C-c l d" . lsp-ui-doc-glance)
  ("C-c l l" . lsp-ui-flycheck-list)
  ("C-c l D" . lsp-ui-peek-find-definitions)
  ("C-c l r" . lsp-ui-peek-find-references)
  :custom
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-delay 0.3)
  (lsp-ui-doc-position 'at-point)) ;; mirip VSCode hover tooltip

;; lsp-treemacs (sidebar)
(use-package lsp-treemacs
  :after lsp)


;; Hooks untuk tree-sitter mode
(add-hook 'python-ts-mode-hook #'lsp-deferred)
(add-hook 'go-ts-mode-hook #'lsp-deferred)
(add-hook 'lua-ts-mode-hook #'lsp-deferred)
(add-hook 'yaml-ts-mode-hook #'lsp-deferred)

; ;; dap-mode (debug)
; (use-package dap-mode
;   :after lsp-mode
;   :config
;   (dap-auto-configure-mode))
;
; ;; ================================
; ;; PHP Support
; ;; ================================
;
; (use-package php-mode
;   :mode "\\.php\\'"
;   :hook (php-mode . lsp-deferred)
;   :config
;   (setq php-mode-coding-style 'psr2))
