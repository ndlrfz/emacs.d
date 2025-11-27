;; common configuration and packages
;; vundo atau undo-tree,

;; smartparens
(use-package smartparens
  :straight t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

;; undo-tree
(use-package undo-tree
  :straight t
  :config
  ;; 1. Mengaktifkan mode global
  (global-undo-tree-mode t)

  ;; 2. Mengaktifkan penyimpanan riwayat secara otomatis
  (setq undo-tree-auto-save-history t)

  ;; 3. Menentukan direktori tempat file history akan disimpan
  ;;    Ini akan menyimpan file di ~/.emacs.d/undo-history/
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/data/undo-history/")))

  ;; Opsional: Membersihkan file history lama
  ;; (untuk menghindari direktori membengkak terlalu besar)
  (setq undo-tree-history-size 200000) ; Jumlah perubahan maksimum
  (setq undo-tree-history-save-limit 200000)) ; Batas ukuran file dalam bytes

;; rainbow-delimiters
(use-package rainbow-delimiters
  :straight t
  :hook
  ((prog-mode-hook) . rainbow-delimiters-mode))

;; flycheck
(use-package flycheck
  :straight t
  ;; Mengaktifkan flycheck-mode hanya di mode Python dan JS
  :hook ((prog-mode-hook) . flycheck-mode))

;; indent-guide
(use-package highlight-indent-guides
  :straight t
  :hook
  ((prog-mode-hook) . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character))

