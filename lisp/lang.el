;; ======================================
;; Python (python-ts-mode + ruff)
;; ======================================

(use-package python
  :straight t
  :mode ("\\.py\\'" . python-ts-mode))

(use-package lsp-pyright
  :straight t
  :after lsp-mode
  :custom
  (lsp-pyright-venv-path "~/.virtualenvs")
  :hook ((python-mode . (lambda ()
                          (require 'lsp-pyright)))
         (python-ts-mode . (lambda ()
                             (require 'lsp-pyright)))))

;; ======================================
;; Go (go-ts-mode + gopls)
;; ======================================

(use-package go-ts-mode
  :straight t
  :mode ("\\.go\\'" . go-ts-mode)
  :hook ((go-ts-mode . lsp-deferred)
         (go-ts-mode . yas-minor-mode))
  :config
  (setq gofmt-command "goimports"))

;; Pastikan gopls diinstall
;; go install golang.org/x/tools/gopls@latest

;; ======================================
;; YAML (yaml-ts-mode)
;; ======================================

(use-package yaml-ts-mode
  :straight t
  :mode ("\\.ya?ml\\'" . yaml-ts-mode)
  :hook ((yaml-ts-mode . lsp-deferred)))

;; ======================================
;; Lua (lua-ts-mode + lua-language-server)
;; ======================================

(use-package lua-mode
  :straight t
  :mode ("\\.lua\\'" . lua-ts-mode))

(use-package lua-ts-mode
  :straight t
  :mode ("\\.lua\\'" . lua-ts-mode)
  :hook ((lua-ts-mode . lsp-deferred)))

;; lua-language-server harus diinstall:
;; pacman install, brew install, atau manual build
