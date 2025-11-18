;; Formatter with apheleia
(use-package apheleia
  :ensure t
  :config

  ;; ---------- PYTHON ----------
  (setf (alist-get 'black apheleia-formatters)
        '("ruff" "format" "-"))

  ;; ---------- GO ----------
  (setf (alist-get 'goimports apheleia-formatters)
        '("goimports"))
  (setf (alist-get 'gofmt apheleia-formatters)
        '("gofmt"))

  (setf (alist-get 'prettier apheleia-formatters)
      '("prettier" "--stdin-filepath" filepath))

  ;; Mode associations
  (setf (alist-get 'js-mode apheleia-mode-alist)
        '(prettier))
  (setf (alist-get 'js-ts-mode apheleia-mode-alist)
        '(prettier))
  (setf (alist-get 'javascript-mode apheleia-mode-alist)
        '(prettier))

  (setf (alist-get 'typescript-mode apheleia-mode-alist)
        '(prettier))
  (setf (alist-get 'tsx-ts-mode apheleia-mode-alist)
        '(prettier))

  (setf (alist-get 'json-mode apheleia-mode-alist)
        '(prettier))
  (setf (alist-get 'json-ts-mode apheleia-mode-alist)
        '(prettier))

  (setf (alist-get 'web-mode apheleia-mode-alist)
        '(prettier))

  ;; ---------- YAML / ANSIBLE ----------
  (setf (alist-get 'yamlfmt apheleia-formatters)
        '("yamlfmt" "-"))

  ;; ---------- MARKDOWN ----------
  (setf (alist-get 'mdformat apheleia-formatters)
        '("mdformat" "-"))

  (apheleia-global-mode +1))
