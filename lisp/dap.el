;;; dap mode

(use-package envrc
  :ensure t
  :config
  (envrc-global-mode))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  
  :config
  (dap-auto-configure-mode)
  
  ;; --- Setup GO (Updated) ---
  (require 'dap-dlv-go)
  ;; Perhatikan: Kita TIDAK butuh (dap-go-setup) lagi.
  ;; dap-dlv-go akan langsung mencari binary 'dlv' di system path kamu.

  ;; --- Setup PYTHON (Tetap sama) ---
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy))

(with-eval-after-load 'dap-mode
  (define-key dap-mode-map (kbd "C-c d d") #'dap-debug)
  (define-key dap-mode-map (kbd "C-c d b") #'dap-breakpoint-toggle)
  (define-key dap-mode-map (kbd "C-c d c") #'dap-continue)
  (define-key dap-mode-map (kbd "C-c d n") #'dap-next)
  (define-key dap-mode-map (kbd "C-c d i") #'dap-step-in)
  (define-key dap-mode-map (kbd "C-c d o") #'dap-step-out)
  (define-key dap-mode-map (kbd "C-c d r") #'dap-restart)
  (define-key dap-mode-map (kbd "C-c d l") #'dap-debug-last))
