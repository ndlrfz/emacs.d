;;; nadlir emacs - init.el start file

(add-to-list 'load-path "~/.emacs.d/lisp")

(load "ui.el")
(load "common.el")
(load "editor.el")
(load "minibuf.el")
(load "tree-sitter.el")
(load "lsp.el")
(load "completion.el")
(load "formatter.el")
(load "org-config.el")
(load "tools.el")
(load "markdown.el")
(load "cheatsheets.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons all-the-icons-completion all-the-icons-ibuffer
                   ample-theme ansible ansible-doc apheleia autothemer
                   avy bm cape cheatseet cheatsheet
                   color-theme-sanityinc-tomorrow corfu-prescient
                   corfu-terminal crux diredfl doom-modeline
                   doom-themes dracula-theme embark-consult
                   evil-collection evil-escape evil-nerd-commenter
                   evil-surround expand-region flycheck forge
                   format-all go-mode grip-mode gruber-darker-theme
                   highlight-indent-guides hl-todo kanagawa-themes
                   kaolin-themes kind-icon ligature lsp-pyright lsp-ui
                   magit marginalia markdown-toc modus-themes
                   nerd-icons-completion nerd-icons-corfu
                   nerd-icons-dired nix-ts-mode orderless org-modern
                   projectile rainbow-delimiters smartparens
                   treesit-auto typescript-mode vertico-prescient
                   vundo xclip yaml-mode yasnippet yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
