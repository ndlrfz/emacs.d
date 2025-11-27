;; utility packages

;; enable winner-mode
(winner-mode 1)

;; rg
(use-package rg
  :straight t
  :bind
  ("C-c s" . rg-menu))

(use-package ivy
  :straight t
  :config
  (ivy-mode 1))

(use-package counsel
  :straight t
  :config
  (counsel-mode 1)
  :bind
  ("C-x C-r" . counsel-recentf)
  ("C-x C-b" . counsel-bookmark))

(use-package swiper
  :straight t
  :bind
  ("C-s" . swiper)
  ("C-M-s" . swiper-all))

(use-package highlight-thing
  :straight t
  :config
  (global-highlight-thing-mode 1)
  (setq)
  (setq highlight-thing-what-thing 'word
        highlight-thing-delay-seconds 1))

;; google-this in cursor
(use-package google-this
  :straight t
  :config
  (google-this-mode 1)
  :bind
  ("C-x j" . google-this-mode-submap))

;; projectile
(use-package projectile
  :straight t
  :init
  (projectile-mode 1)
  :bind
  ("C-c p" . projectile-command-map))

;; magit
(use-package magit
  :straight t
  :commands (magit-status magit-blame)
  :config
  :bind
  ("C-x g" . magit-status))
