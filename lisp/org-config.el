;; org-mode
;; Make sure code blocks use fixed-pitch for correct visual indentation
(use-package org
  :config
  (setq org-src-tab-acts-natively t
        org-src-preserve-indentation nil
        org-edit-src-content-indentation 2
        org-adapt-indentation t)

  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-verbatim nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-meta-line nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-special-keyword nil :inherit 'fixed-pitch))


;; (use-package org
;;   :hook ((org-mode . visual-line-mode)
;;          (org-mode . variable-pitch-mode)
;;          (org-mode . org-indent-mode))
;;   :config
;;   (setq org-hide-leading-stars t
;;         org-ellipsis " ▾"
;;         org-pretty-entities t
;;         org-startup-folded t
;;         org-src-tab-acts-natively t
;;         org-src-preserve-indentation nil
;;         org-edit-src-content-indentation 2
;;         org-hide-emphasis-markers t))

(use-package org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star '("●" "○" "◆" "◇" "▹")
        org-modern-block-fringe 2
        org-modern-table t
        org-modern-variable-pitch t
        org-modern-todo t))


(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(i)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("TODO" . "red")
        ("IN-PROGRESS" . "yellow")
        ("DONE" . "green")
        ("CANCELLED" . "gray")))

(use-package org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autolinks t
        org-appear-autosubmarkers t))
