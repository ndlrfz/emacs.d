;; fuzzy finder

(use-package consult
  :bind (
         ("C-s"     . consult-line)
         ("C-x b"   . consult-buffer)
         ("C-x C-r" . consult-recent-file)
         ("M-g g"   . consult-goto-line)
         ("M-g i"   . consult-imenu)
         ("M-s d"   . consult-find)
         ("M-s r"   . consult-ripgrep)
         ))

;; vundo
(use-package vundo
  :ensure t
  :bind
  (("C-x u" . vundo))        ; shortcut untuk membuka visual undo tree
  :config
  ;; Gunakan karakter yang lebih enak dibaca
  (setq vundo-glyph-alist vundo-unicode-symbols)
  ;; Buat vundo lebih smooth
  (setq vundo-roll-back-on-quit t))

;; Recent files
(use-package recentf
  :ensure nil   ;; built-in, jadi tidak perlu install
  :init
  (recentf-mode 1)
  :custom
  (recentf-max-menu-items 50)
  (recentf-max-saved-items 200)
  (recentf-auto-cleanup 'never))

;; avy - jump
(use-package avy
  :ensure t
  :bind
  (("C-:" . avy-goto-char)        ;; lompat ke karakter
   ("C-'" . avy-goto-char-2)      ;; lompat ke 2-char
   ("M-g g" . avy-goto-line)      ;; lompat ke baris (better than goto-line)
   ("M-g w" . avy-goto-word-1)    ;; lompat ke awal kata
   ("M-g e" . avy-goto-end-of-line))
  :config
  ;; highlight warna yang nyaman
  (setq avy-background t)
  (setq avy-style 'pre)
  (setq avy-keys (number-sequence ?a ?z))   ;; pakai huruf a–z
  (setq avy-case-fold-search nil))

;; expand select
(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

;; bm - bookmark
(use-package bm
  :ensure t
  :demand t

  :init
  ;; restore on load (even before you require bm)
  (setq bm-restore-repository-on-load t)


  :config
  ;; Allow cross-buffer 'next'
  (setq bm-cycle-all-buffers t)

  ;; where to store persistant files
  (setq bm-repository-file "~/.cache/emacs/bm-repository")

  ;; save bookmarks
  (setq-default bm-buffer-persistence t)

  ;; Loading the repository from file when on start up.
  (add-hook 'after-init-hook 'bm-repository-load)

  ;; Saving bookmarks
  (add-hook 'kill-buffer-hook #'bm-buffer-save)

  ;; Saving the repository to file when on exit.
  ;; kill-buffer-hook is not called when Emacs is killed, so we
  ;; must save all bookmarks first.
  (add-hook 'kill-emacs-hook #'(lambda nil
                                 (bm-buffer-save-all)
                                 (bm-repository-save)))

  ;; The `after-save-hook' is not necessary to use to achieve persistence,
  ;; but it makes the bookmark data in repository more in sync with the file
  ;; state.
  (add-hook 'after-save-hook #'bm-buffer-save)

  ;; Restoring bookmarks
  (add-hook 'find-file-hooks   #'bm-buffer-restore)
  (add-hook 'after-revert-hook #'bm-buffer-restore)

  ;; The `after-revert-hook' is not necessary to use to achieve persistence,
  ;; but it makes the bookmark data in repository more in sync with the file
  ;; state. This hook might cause trouble when using packages
  ;; that automatically reverts the buffer (like vc after a check-in).
  ;; This can easily be avoided if the package provides a hook that is
  ;; called before the buffer is reverted (like `vc-before-checkin-hook').
  ;; Then new bookmarks can be saved before the buffer is reverted.
  ;; Make sure bookmarks is saved before check-in (and revert-buffer)
  (add-hook 'vc-before-checkin-hook #'bm-buffer-save)


  :bind (("<f2>" . bm-next)
         ("S-<f2>" . bm-previous)
         ("C-<f2>" . bm-toggle))
  )
