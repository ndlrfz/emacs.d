;;; LSP

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.05)
  (corfu-auto-prefix 1)
  (corfu-preselect 'prompt)
  :config
  (require 'corfu-popupinfo)
  (corfu-popupinfo-mode 1)
  (setq corfu-popupinfo-delay 0.1
        corfu-popupinfo-max-height 20
        corfu-popupinfo-max-width 70))

;; Ikon di completion (optional)
(use-package kind-icon
  :ensure t
  :after corfu
  :custom (kind-icon-default-face 'corfu-default)
  :config (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package corfu-terminal
  :ensure t
  :config
  (corfu-terminal-mode))

;; ----------------------------------------
;; Cape — extra completion backends
;; ----------------------------------------
(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

;; ----------------------------------------
;; LSP + UI (VSCode-like)
;; ----------------------------------------
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((python-ts-mode . lsp-deferred)
         (js-ts-mode . lsp-deferred)
         (go-ts-mode . lsp-deferred)
         (yaml-ts-mode . lsp-deferred)
         (lua-ts-mode . lsp-deferred))
  :custom
  ;; Biarkan CAPF diambil oleh Corfu.
  (lsp-completion-provider :capf)
  ;; Hover seperti VSCode
  (lsp-eldoc-enable-hover nil)
  (lsp-signature-render-documentation nil)
  ;; Diagnostic VSCode-like
  (lsp-diagnostics-provider :flycheck))
;; (lsp-enabled-clients '(ruff)))

;; Pyright (type checking + hover docs + signature help)
(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :custom
  (lsp-pyright-venv-path "~/.virtualenvs")
  :hook ((python-mode . (lambda ()
                          (require 'lsp-pyright)))
         (python-ts-mode . (lambda ()
                             (require 'lsp-pyright)))))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil)
  (lsp-ui-doc-delay 0.3)
  (lsp-ui-doc-position 'at-point)) ;; mirip VSCode hover tooltip

;; ----------------------------------------
;; Flycheck Diagnostics
;; ----------------------------------------
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Yasnippets
(use-package yasnippet
  :ensure t
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'markdown-mode-hook 'yas-minor-mode))

(use-package yasnippet-snippets
  :ensure t)

;; C-i = expand snippet langsung
(define-key yas-minor-mode-map (kbd "C-i") #'yas-expand)
