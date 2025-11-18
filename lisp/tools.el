;;; magit -- magit package

(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch)))

;; Optional: open magit buffers full screen
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
(setq magit-ssh-command "ssh")

(use-package forge
  :after magit)

(use-package all-the-icons
  :ensure t)

;; projectile
(use-package projectile
  :ensure t
  :demand t
  :init
  ;; gunakan mode sejak startup
  (projectile-mode +1)

  :bind-keymap
  ("C-c p" . projectile-command-map)

  :config
  ;; caching biar cepat
  (setq projectile-enable-caching t)

  ;; auto menemukan project via git
  (setq projectile-project-search-path '("~/Projects/" "~/work/" "~/code/"))

  ;; ignore folder bawaaan
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "vendor")
  (add-to-list 'projectile-globally-ignored-directories ".terraform")

  ;; gunakan ripgrep kalau ada
  (when (executable-find "rg")
    (setq projectile-generic-command "rg --files --hidden --follow -0")
    (setq projectile-indexing-method 'alien))

  ;; switch-project langsung buka file pencarian
  (setq projectile-switch-project-action #'projectile-find-file)

  ;; gunakan mode-line sederhana
  (setq projectile-mode-line-function
        (lambda () (format " [%s]" (projectile-project-name)))))

(provide 'projectile-config)

;; dired nerd icons
(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-dired
  :ensure t
  :hook (dired-mode . nerd-icons-dired-mode))

;; crux
(use-package crux
  :ensure t
  :bind
  (("C-c d" . crux-duplicate-current-line-or-region)
   ("C-c M-f" . crux-recentf-find-file)
   ("C-k" . crux-smart-kill-line)
   ("C-c o" . crux-open-with)
   ("C-c n" . crux-cleanup-buffer-or-region)
   ("C-c r" . crux-rename-buffer-file)))
