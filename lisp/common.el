(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; emacs directory cache history
(setq user-emacs-directory "~/.cache/emacs/"
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

;; tab 4 spaces
(setq-default indent-tabs-mode nil)  ;; pakai spaces, bukan tab
(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq tab-stop-list (number-sequence 4 200 4))

;; yes to y - no to n
(fset 'yes-or-no-p 'y-or-n-p)

;; copy dan paste emacs to os
(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))

;; Select
(global-set-key (kbd "C-c w") 'mark-word) ;; word
(global-set-key (kbd "C-c l") (lambda () (interactive) ;; entire line
                                (move-beginning-of-line nil)
                                (set-mark-command nil)
                                (move-end-of-line nil))) 
(global-set-key (kbd "C-c r") 'rectangle-mark-mode) ;; block of code

;; C-u dan C-d untuk scroll up down
(defun my-scroll-down-half ()
  (interactive)
  (scroll-down-command)
  (recenter))

(defun my-scroll-up-half ()
  (interactive)
  (scroll-up-command)
  (recenter))

(global-set-key (kbd "C-u") #'my-scroll-down-half)
(global-set-key (kbd "C-d") #'my-scroll-up-half)

(use-package kanagawa-themes
  :ensure t
  :config
  (load-theme 'kanagawa-wave t))

;; ;; Tema modern (gunakan salah satu)
;; (use-package doom-themes         ;;
;;   :ensure t                      ;;
;;   :config                        ;;
;;   (load-theme 'doom-ayu-dark t)) ;;

;; Icon support (penting untuk dashboard, treemacs, etc)
(use-package all-the-icons
  :ensure t)

;; Modeline modern & cepat
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 22)))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; Default font settings
(defun my/set-default-font ()
  (set-face-attribute 'default nil
                      :family "JetBrainsMono Nerd Font"
                      :height 150)   ;; 120 = 12pt
  (set-face-attribute 'fixed-pitch nil
                      :family "JetBrainsMono Nerd Font"
                      :height 150)
  (set-face-attribute 'variable-pitch nil
                      :family "Inter"
                      :height 140))

;; Apply font for GUI frames (emacsclient included)
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (my/set-default-font))))
  ;; Normal non-daemon startup
  (my/set-default-font))

(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures 't '("www" "->" "=>" "::" "==" "===" "!=" "!=="))
  (global-ligature-mode t))
