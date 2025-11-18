;;; cheatseets -- for my sake
;;; Commentary:
;;; Code:

(use-package cheatsheet
  :ensure t
  :bind (("C-c h" . cheatsheet-show)
         ("C-c H" . cheatsheet-add))
  :config
  ;; Basic Navigation & File Management
  (cheatsheet-add
   :group 'Navigation
   :key "C-x C-f"
   :description "Find file (buka/membuat file baru)")
  (cheatsheet-add
   :group 'Navigation  
   :key "C-x C-s"
   :description "Save file")
  (cheatsheet-add
   :group 'Navigation
   :key "C-x b"
   :description "Switch buffer")
  (cheatsheet-add
   :group 'Navigation
   :key "C-x k"
   :description "Kill buffer")
  (cheatsheet-add
   :group 'Navigation
   :key "C-x 0"
   :description "Close current window")
  (cheatsheet-add
   :group 'Navigation
   :key "C-x 1"
   :description "Close other windows")
  (cheatsheet-add
   :group 'Navigation
   :key "C-x 2"
   :description "Split window horizontally")
  (cheatsheet-add
   :group 'Navigation
   :key "C-x 3"
   :description "Split window vertically")

  ;; Text Editing
  (cheatsheet-add
   :group 'Editing
   :key "C-space"
   :description "Start selection (set mark)")
  (cheatsheet-add
   :group 'Editing
   :key "C-w"
   :description "Cut region")
  (cheatsheet-add
   :group 'Editing
   :key "M-w"
   :description "Copy region")
  (cheatsheet-add
   :group 'Editing
   :key "C-y"
   :description "Paste (yank)")
  (cheatsheet-add
   :group 'Editing
   :key "C-k"
   :description "Kill line")
  (cheatsheet-add
   :group 'Editing
   :key "C-/"
   :description "Undo")
  (cheatsheet-add
   :group 'Editing
   :key "C-s"
   :description "Forward search")
  (cheatsheet-add
   :group 'Editing
   :key "C-r"
   :description "Backward search")

  ;; Code Navigation
  (cheatsheet-add
   :group 'Code-Navigation
   :key "C-a"
   :description "Beginning of line")
  (cheatsheet-add
   :group 'Code-Navigation
   :key "C-e"
   :description "End of line")
  (cheatsheet-add
   :group 'Code-Navigation
   :key "M-a"
   :description "Beginning of sentence/function")
  (cheatsheet-add
   :group 'Code-Navigation
   :key "M-e"
   :description "End of sentence/function")
  (cheatsheet-add
   :group 'Code-Navigation
   :key "M-<"
   :description "Beginning of buffer")
  (cheatsheet-add
   :group 'Code-Navigation
   :key "M->"
   :description "End of buffer")
  (cheatsheet-add
   :group 'Code-Navigation
   :key "M-g g"
   :description "Go to line")

  ;; LSP Mode
  (cheatsheet-add
   :group 'LSP
   :key "M-."
   :description "Go to definition")
  (cheatsheet-add
   :group 'LSP
   :key "M-,"
   :description "Go back from definition")
  (cheatsheet-add
   :group 'LSP
   :key "C-c C-r"
   :description "Rename symbol")
  (cheatsheet-add
   :group 'LSP
   :key "C-c C-a"
   :description "Code actions")
  (cheatsheet-add
   :group 'LSP
   :key "C-c C-d"
   :description "Show documentation")
  (cheatsheet-add
   :group 'LSP
   :key "C-c C-f"
   :description "Format buffer")

  ;; Debugging (DAP)
  (cheatsheet-add
   :group 'Debugging
   :key "M-x dap-debug"
   :description "Start debugging")
  (cheatsheet-add
   :group 'Debugging
   :key "C-c d b"
   :description "Toggle breakpoint")
  (cheatsheet-add
   :group 'Debugging
   :key "C-c d c"
   :description "Continue")
  (cheatsheet-add
   :group 'Debugging
   :key "C-c d n"
   :description "Next line")

  ;; Version Control (Magit)
  (cheatsheet-add
   :group 'Git
   :key "C-x g"
   :description "Open Magit status")
  (cheatsheet-add
   :group 'Git
   :key "s"
   :description "Stage file (dalam Magit)")
  (cheatsheet-add
   :group 'Git
   :key "c c"
   :description "Commit (dalam Magit)")
  (cheatsheet-add
   :group 'Git
   :key "p p"
   :description "Push (dalam Magit)")

  ;; Terminal
  (cheatsheet-add
   :group 'Terminal
   :key "M-x term"
   :description "Open terminal")
  (cheatsheet-add
   :group 'Terminal
   :key "M-x shell"
   :description "Open shell buffer")
  (cheatsheet-add
   :group 'Terminal
   :key "C-c C-j"
   :description "Switch to line mode (term)")

  ;; Project Management
  (cheatsheet-add
   :group 'Project
   :key "C-c p f"
   :description "Find file in project")
  (cheatsheet-add
   :group 'Project
   :key "C-c p s g"
   :description "Grep in project")
  (cheatsheet-add
   :group 'Project
   :key "C-c p p"
   :description "Switch project")

  ;; Completion & Documentation
  (cheatsheet-add
   :group 'Completion
   :key "M-TAB"
   :description "Complete symbol")
  (cheatsheet-add
   :group 'Completion
   :key "C-M-i"
   :description "Complete at point")
  (cheatsheet-add
   :group 'Completion
   :key "C-c ?"
   :description "Show documentation")

  ;; Window Management
  (cheatsheet-add
   :group 'Windows
   :key "C-x o"
   :description "Switch to other window")
  (cheatsheet-add
   :group 'Windows
   :key "C-x 4 f"
   :description "Find file in other window")
  (cheatsheet-add
   :group 'Windows
   :key "C-x 5 2"
   :description "Make new frame")

  ;; Help System
  (cheatsheet-add
   :group 'Help
   :key "C-h k"
   :description "Describe key binding")
  (cheatsheet-add
   :group 'Help
   :key "C-h f"
   :description "Describe function")
  (cheatsheet-add
   :group 'Help
   :key "C-h v"
   :description "Describe variable")

  ;; Custom key untuk membuka cheatsheet
  (cheatsheet-add
   :group 'Cheatsheet
   :key "C-c h"
   :description "Show cheatsheet")
  (cheatsheet-add
   :group 'Cheatsheet
   :key "C-c H"
   :description "Add new cheatsheet entry"))
