;; Basic UI cleanup
(menu-bar-mode -1)          ; Hide menu bar
(tool-bar-mode -1)          ; Hide tool bar
(scroll-bar-mode -1)        ; Hide scroll bar
(tooltip-mode -1)           ; Hide tooltips
(set-fringe-mode 0)         ; Remove fringe

;; Disable startup screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Better scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 1)
(setq scroll-margin 2)
(setq scroll-conservatively 101)

;; Line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)  ; Relative line numbers

;; Column indicator
(setq-default fill-column 100)
(global-display-fill-column-indicator-mode 1)

;; tab 4 spaces
(setq-default indent-tabs-mode nil)  ;; pakai spaces, bukan tab
(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq tab-stop-list (number-sequence 4 200 4))

;; ignore tuit
(setq ring-bell-function 'ignore)

;; yes to y - no to n
(fset 'yes-or-no-p 'y-or-n-p)

;; Default font settings
(defun my/set-default-font ()
  (set-face-attribute 'default nil
                      :family "Zenbones Mono"
                      :height 165)   ;; 120 = 12pt
  (set-face-attribute 'fixed-pitch nil
                      :family "Zenbones Mono"
                      :height 165)
  (set-face-attribute 'variable-pitch nil
                      :family "Zenbones Mono"
                      :height 150))

;; Apply font for GUI frames (emacsclient included)
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (my/set-default-font))))
  ;; Normal non-daemon startup
  (my/set-default-font))

;; Add bin path for Nixos
(setenv "PATH" (concat (getenv "PATH") ":/run/current-system/sw/bin"))
(add-to-list 'exec-path "/run/current-system/sw/bin")

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; emacs directory cache history
(setq user-emacs-directory "~/.emacs.d/data"
      url-history-file (expand-file-name "url/history" user-emacs-directory))

;; Buat direktori jika belum ada
(make-directory user-emacs-directory t)

;; backup file pindah ke .cache
(setq backup-directory-alist
      `((".*" . ,(expand-file-name "backup/" user-emacs-directory))))
(setq make-backup-files t)     ;; aktifkan backup
(setq backup-by-copying t)

;; Auto-save pindah ke .cache
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "autosave/" user-emacs-directory) t)))
(setq auto-save-list-file-prefix
      (expand-file-name "autosave/sessions-" user-emacs-directory))

;; recentf
(use-package recentf
  :ensure nil ;; built-in package, jadi tidak perlu install
  :init
  (setq recentf-max-menu-items 25
        recentf-max-saved-items 300
        recentf-auto-cleanup 'never)
  :config
  (recentf-mode 1)
  :bind
  (("C-x C-r" . recentf)))

;; history
(use-package savehist
  :ensure nil
  :init
  (setq history-length 1000
        savehist-autosave-interval 300
        savehist-additional-variables
        '(command-history
          kill-ring
          read-expression-history
          file-name-history))
  :config
  (savehist-mode 1))

;; activate windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; copy dan paste emacs to os
(use-package xclip
  :straight t
  :config
  (xclip-mode 1))

(use-package beacon
  :straight t
  :config
  (beacon-mode 1))

;; use path system too
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; Modeline minimal dengan doom-modeline
(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 36
        doom-modeline-buffer-file-name-style 'truncate-upto-project
        doom-modeline-bar-width 3
        doom-modeline-minor-modes nil
        doom-modeline-buffer-encoding t
        doom-modeline-lsp t))

;; Icons
(use-package all-the-icons
  :straight t
  :if (display-graphic-p))

;; Install theme
(use-package doom-themes
  :straight t
  :config
  (load-theme 'doom-bluloco-dark t))

;; Vertico untuk completion UI yang minimal
(use-package vertico
  :straight t
  :init
  (vertico-mode))

;; Marginalia untuk annotations
(use-package marginalia
  :straight t
  :init
  (marginalia-mode))

;; Orderless untuk fuzzy completion
(use-package orderless
  :straight t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  :straight t
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  :init
  (marginalia-mode))

;; Which-key untuk keybind hints
(use-package which-key
  :straight t
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay 0.5))

;; Hide mode line di beberapa buffer
(use-package hide-mode-line
  :straight t)

;; Clean up mode line
(setq mode-line-format
      '("%e"
        mode-line-front-space
        mode-line-mule-info
        mode-line-client
        mode-line-modified
        mode-line-remote
        mode-line-frame-identification
        mode-line-buffer-identification
        " "
        mode-line-position
        (vc-mode vc-mode)
        " "
        mode-line-modes
        mode-line-misc-info
        mode-line-end-spaces))

;; Auto-hide cursor in inactive windows
(setq cursor-in-non-selected-windows nil)

;; Smooth scrolling
(use-package smooth-scrolling
  :straight t
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 2))
