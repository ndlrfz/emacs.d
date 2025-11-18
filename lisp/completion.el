;; Completion with prescient
(use-package prescient
  :ensure t
  :config
  (prescient-persist-mode +1))

(use-package corfu-prescient
  :after (corfu prescient)
  :ensure t
  :init
  (corfu-prescient-mode +1))

(use-package vertico-prescient
  :after (vertico prescient)
  :ensure t
  :init
  (vertico-prescient-mode +1))
