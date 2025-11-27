
;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; set repository untuk straight.el
(setq package-archives '(
  ("gnu" . "https://elpa.gnu.org/packages/")
  ("melpa" . "https://melpa.org/packages/")
  ;; Repositori opsional lain jika diperlukan:
  ;("org" . "https://orgmode.org/elpa/")
))

;; Instal use-package (melalui straight.el)
(straight-use-package 'use-package)

;; Konfigurasi use-package agar SELALU menggunakan straight.el secara default
(setq straight-use-package-by-default t)
