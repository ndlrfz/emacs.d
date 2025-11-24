;; UI configurations emacs -

;; Matikan tampilan yang tidak perlu
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

;; Baris status lebih rapi
(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Highlight line
(global-hl-line-mode 1)

;; Smooth scrolling (super penting)
(setq scroll-step 1
      scroll-conservatively 10000
      mouse-wheel-scroll-amount '(2 ((shift) . 1))
      mouse-wheel-progressive-speed nil)

;; transparent
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

;; Font (ubah jika perlu)
;;(set-face-attribute 'default nil :font "Zenbones Mono" :height 160)
;;(set-face-attribute 'fixed-pitch nil :font "Zenbones Mono" :height 160)
;;(set-face-attribute 'variable-pitch nil :font "Inter" :height 120)

;; Display line numbers
(setq display-line-numbers-type 'relative) ;; or 't
(global-display-line-numbers-mode t)

;; Maximize window at startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Better margins (biar file tidak mepet kiri)
(setq-default left-margin-width 1
              right-margin-width 1)
(set-window-buffer nil (current-buffer))

;; Good fringes (tepi kiri-kanan)
(fringe-mode 8)

;; Cursor style
(setq-default cursor-type 'bar)

;; Spasi antar baris lebih enak dibaca
(setq-default line-spacing 3)
(add-hook 'text-mode-hook #'variable-pitch-mode)



