;; apheleia formatter
(use-package apheleia
  :straight t
  :config
  (setq apheleia-formatters
        '((ruff      . ("ruff" "format" "--stdin-filename" filepath "-"))
          (gofmt     . ("gofmt"))
          (php-cs    . ("php-cs-fixer" "fix" "--quiet" "--using-cache=no"
                         "--no-interaction" "--stdin" "--stdout"
                         "--allow-risky=yes" filepath))
          (yamlfmt   . ("yamlfmt" "-"))
          (prettierd . ("prettierd" filepath)))

        apheleia-mode-alist
        '((python-mode . ruff)
          (python-ts-mode . ruff)

          (go-mode . gofmt)
          (go-ts-mode . gofmt)

          (php-mode . php-cs)
          (php-ts-mode . php-cs)

          (yaml-mode . yamlfmt)
          (yaml-ts-mode . yamlfmt)

          (js-mode . prettierd)
          (js-ts-mode . prettierd)
          (typescript-mode . prettierd)
          (typescript-ts-mode . prettierd)))

  (apheleia-global-mode +1))
