;; Basic UI cleanupaa
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
(setq-default fill-column 88)
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
                      :family "Iosevka"
                      :height 170)   ;; 120 = 12pt
  (set-face-attribute 'fixed-pitch nil
                      :family "Iosevka"
                      :height 170)
  (set-face-attribute 'variable-pitch nil
                      :family "Iosevka"
                      :height 160))

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

(use-package nerd-icons
  :straight t)

;; Icons
(use-package all-the-icons
  :straight t)

; (use-package punch-line
;   :straight (punch-line :host github :repo "konrad1977/punch-line")
;   :hook ((after-init . punch-line-mode)        ;; Load punch-line
;           (after-init . punch-load-tasks))      ;; Load saved current tasks
;   :config
;   (setq
;    punch-line-left-separator "  "
;    punch-line-right-separator "  "
;    punch-show-lsp-info t
;    punch-show-flycheck-info t
;    punch-show-project-info t
;    punch-show-git-info t
;    punch-line-show-time-info nil))
;
(use-package maple-modeline
  :straight (maple-modeline :host github :repo "honmaple/emacs-maple-modeline")
  :hook (after-init . maple-modeline-mode)
  :config
  (setq maple-modeline-style 'standard
        maple-modeline-height 26
        maple-modeline-icon t
        maple-modeline-separator 'wave
        maple-modeline-direction '(right . left)))


;; (use-package mood-line
;; :straight t
;;   ;; Enable mood-line
;;   :config
;;   (mood-line-mode)

;;   ;; Use pretty Fira Code-compatible glyphs
;;   :custom
;;   (mood-line-glyph-alist mood-line-glyphs-unicode))

;
;; ;; Modeline minimal dengan doom-modeline
;; (use-package doom-modeline
;;   :straight t
;;   :init (doom-modeline-mode 1)
;;   :config
;;   (setq doom-modeline-height 30
;;         doom-modeline-buffer-file-name-style 'truncate-except-project
;;         doom-modeline-project-name t
;;         doom-modeline-bar-width 3
;;         doom-modeline-minor-modes nil
;;         doom-modeline-buffer-encoding t
;;         nerd-icons-color-icons nil
;;         doom-modeline-major-mode-icon t
;;         doom-modeline-major-mode-color-icon t
;;         doom-modeline-buffer-modification-icon t
;;         doom-modeline-time t
;;         doom-modeline-lsp t))

;; modus-theme
;; (use-package ef-themes
;;   :straight t
;;   :init
;;   (ef-themes-take-over-modus-themes-mode 1)
;;   :demand t
;;   :config
;;   (setq modus-themes-mixed-fonts t
;;         modus-themes-italic-constructs t)
;;   (load-theme 'ef-owl t))

;; base16-theme
(use-package base16-theme
  :straight t
  :config
  (load-theme 'base16-eighties t))

;; (use-package apropospriate-theme
;;   :straight t
;;   :config
;;   (load-theme 'apropospriate-dark t))

;; ;; ;; modus-theme
;; (use-package modus-themes
;;   :straight t
;;   :init
;;   (modus-themes-include-derivatives-mode 1)
;;   :demand t
;;   :config
;;     (setq modus-themes-to-toggle '(modus-operandi modus-vivendi)
;;         modus-themes-to-rotate modus-themes-items
;;         modus-themes-mixed-fonts t
;;         modus-themes-variable-pitch-ui t
;;         modus-themes-italic-constructs t
;;         modus-themes-bold-constructs t
;;         modus-themes-completions '((t . (bold)))
;;         modus-themes-prompts '(bold)
;;         modus-themes-headings
;;         '((agenda-structure . (variable-pitch light 2.2))
;;           (agenda-date . (variable-pitch regular 1.3))
;;           (t . (regular 1.15))))
;;     (setq modus-themes-common-palette-overrides nil)
;;   (load-theme 'modus-vivendi-tinted t))

;; Install theme
;; (use-package doom-themes
;;   :straight t
;;   :config
;;   (load-theme 'doom-tokyo-night t))

;; (use-package flexoki-themes
;;   :straight t
;;   :config
;;   (load-theme 'flexoki-themes-dark t))

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
