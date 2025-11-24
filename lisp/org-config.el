(use-package org
  :ensure nil  ;; org bawaan Emacs, jangan install dari ELPA
  :config
  ;; Directory untuk org file
  ;;(setq org-directory "~/org")
  

  ;; Default notes file
  (setq org-default-notes-file (expand-file-name "notes.org" org-directory))

  ;; Indentasi rapi
  (setq org-startup-indented t)

  ;; Auto wrap line
  (setq org-startup-truncated nil)

  ;; Log timestamps
  (setq org-log-done 'time
        org-log-into-drawer t)

  (add-hook 'org-mode-hook
            (lambda ()
              (setq line-spacing 0.3)))   ;; 0.2 = sedikit renggang, sesuaikan

  (add-hook 'org-mode-hook
            (lambda ()
              (display-line-numbers-mode -1)))

  (add-hook 'org-mode-hook
            (lambda ()
              (local-set-key (kbd "TAB") #'org-cycle)))

  ;; Body text
  (set-face-attribute 'org-default nil :family "Fira Sans" :height 120)

  ;; Headings (ukuran berbeda-beda)
  (set-face-attribute 'org-level-1 nil :family "Fira Sans" :height 160 :weight 'medium)
  (set-face-attribute 'org-level-2 nil :family "Fira Sans" :height 150 :weight 'regular)
  (set-face-attribute 'org-level-3 nil :family "Fira Sans" :height 140)
  (set-face-attribute 'org-level-4 nil :family "Fira Sans" :height 130)
  (set-face-attribute 'org-level-5 nil :family "Fira Sans" :height 125)
  (set-face-attribute 'org-level-6 nil :family "Fira Sans" :height 120)

  ;; Jangan ubah font untuk code, src block, table, dll
  (set-face-attribute 'org-code nil :family "Zenbones Mono")
  (set-face-attribute 'org-block nil :family "Zenbones Mono")
  (set-face-attribute 'org-table nil :family "Zenbones Mono")

  ;; Images auto display
  (setq org-startup-with-inline-images t))

;; Kalau pakai treesitter Emacs 29+
(with-eval-after-load 'org
  (setq org-element-use-cache nil))

;; 10) Small quality-of-life tweaks
(with-eval-after-load 'org
  (setq org-hide-emphasis-markers t    ;; hide /bold/ markers
        org-use-sub-superscripts '{}
        org-startup-with-inline-images t
        org-image-actual-width '(300))) ;; scale inline images

(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-hide-stars t
        org-modern-list-spacing 4
        org-modern-star '("● " "○ " "◆ " "◇ " "▶ ")))

;; --- nicer faces for headings (scale) ---
;; (use-package org-indent
;;   :ensure nil
;;   :hook (org-mode . org-indent-mode))

(setq org-lowest-priority ?F)  ;; Gives us priorities A through F
(setq org-default-priority ?E) ;; If an item has no priority, it is considered [#E].

(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline "~/todo.org" "Tasks")
         "* TODO %?\n  %U\n")
        ("n" "Note" entry
         (file+headline "~/notes.org" "Notes")
         "* %?\n  %U\n")))

