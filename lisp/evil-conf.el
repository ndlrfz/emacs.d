;; Enable Evil Mode - the Vim emulator
(use-package evil
  :straight t ; Tells use-package to install via straight.el
  :demand t    ; Loads the package immediately at startup
  :init
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  ;; Enable evil-mode globally after the package is loaded
  (evil-mode 1)
  ;; Optional: Add other configurations or keybindings here
)

;; Optional: Install evil-collection for consistent bindings across modes
(use-package evil-collection
  :after evil ; Ensures evil is loaded first
  :straight t
  :config
  (evil-collection-init)
)

