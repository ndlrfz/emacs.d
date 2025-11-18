;; ================================
;;  Minibuffer Completion (Vertico)
;; ================================

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles basic partial-completion)))))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
:custom
(orderless-matching-styles
 '(orderless-literal
   orderless-prefixes
   orderless-initialism
   orderless-regexp
   ;; orderless-flex                       ; Basically fuzzy finding
   ;; orderless-strict-leading-initialism
   ;; orderless-strict-initialism
   ;; orderless-strict-full-initialism
   ;; orderless-without-literal          ; Recommended for dispatches instead
   )))
