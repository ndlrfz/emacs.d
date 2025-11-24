;;; cheatseets -- for my sake
;;; Commentary:
;;; Code:

(use-package cheatsheet
  :ensure t
  :bind (("C-c h" . cheatsheet-show)
         ("C-c H" . cheatsheet-add))
  :config

  (dolist (item '(
                  ("M-d"            . "Delete word")
                  ("C-k"            . "Delete this line")
                  ("M-z X"  . "Delete until the X char")
                  
                  ))
    
    (cheatsheet-add
     :group 'editing-texts
     :key (car item)
     :description (cdr item)))

  (dolist (item '(("C-f"  . "Forward (kanan)")
                  ("C-b"  . "Backward (kiri)")
                  ("C-n"  . "Next line (turun)")
                  ("C-p"  . "Previous line (naik)")
                  ("M-f"  . "Forward word")
                  ("M-b"  . "Backward word")
                  ("C-a"  . "Beginning of line")
                  ("C-e"  . "End of line")
                  ("M-<"  . "Beginning of buffer")
                  ("M->"  . "End of buffer")))
    (cheatsheet-add
     :group 'navigation
     :key (car item)
     :description (cdr item)))

  (dolist (item '(("C-/"     . "Undo")
                  ("C-_"     . "Undo (alternate)")
                  ("C-x u"   . "Akses Vundo")
                  ("C-g C-/" . "Redo (jika pakai undo-tree / undo-fu)")))
    (cheatsheet-add
     :group 'undo-redo
     :key (car item)
     :description (cdr item)))

  (dolist (item '(("C-SPC" . "Set mark (mulai selection)")
                  ("C-w"   . "Cut region (kill)")
                  ("M-w"   . "Copy region")
                  ("C-y"   . "Paste (yank)")
                  ("M-y"   . "Yank cycle (browse kill-ring)")))
    (cheatsheet-add
     :group 'copy-cut-paste
     :key (car item)
     :description (cdr item)))

  (dolist (item '(("C-x C-f" . "Open file")
                  ("C-x C-s" . "Save file")
                  ("C-x C-w" . "Save as")
                  ("C-x k"   . "Kill buffer")
                  ("C-x b"   . "Switch buffer")
                  ))
    (cheatsheet-add
     :group 'file-handling
     :key (car item)
     :description (cdr item)))

  (dolist (item '(("C-s"     . "Search forward (incremental)")
                  ("C-r"     . "Search backward")
                  ("M-%"     . "Query replace")
                  ("C-M-%"   . "Query replace regexp")))
    (cheatsheet-add
     :group 'search-replace
     :key (car item)
     :description (cdr item)))

  (dolist (item '(("C-s"     "Search in buffer"             consult-line)
                  ("C-x b"   "Switch buffer"                consult-buffer)
                  ("C-x C-r" "Open recent file"             consult-recent-file)
                  ("M-g g"   "Go to line"                   consult-goto-line)
                  ("M-g i"   "Go to symbol/imenu"           consult-imenu)
                  ("M-s d"   "Find file"                    consult-find)
                  ("M-s r"   "Search using ripgrep"         consult-ripgrep)))
    (cheatsheet-add
     :group 'search-with-consult
     :key (nth 0 item)
     :description (nth 1 item)))

  ;; todo - comment uncomment region

  ;; --- Group: Heading & Structure ---
  (dolist (item '(("M-RET"       "New heading"                  org-meta-return)
                  ("M-S-RET"     "New TODO heading"             org-insert-todo-heading)
                  ("M-left"      "Promote heading"              org-metaleft)
                  ("M-right"     "Demote heading"               org-metaright)
                  ("M-up"        "Move heading up"              org-metaup)
                  ("M-down"      "Move heading down"            org-metadown)
                  ("C-c C-w"     "Refile subtree"               org-refile)
                  ("C-c ^"       "Sort entries"                 org-sort)))
    (cheatsheet-add
     :group 'org-heading
     :key (nth 0 item)
     :description (nth 1 item)))

  ;; --- Group: Navigation ---

  (dolist (item '(("M-n"         "Next visible heading"          outline-next-visible-heading)
                  ("M-p"         "Previous visible heading"      outline-previous-visible-heading)
                  ("C-c C-n"     "Next heading"                  org-next-visible-heading)
                  ("C-c C-p"     "Previous heading"              org-previous-visible-heading)
                  ("C-c C-f"     "Next heading same level"       org-forward-heading-same-level)
                  ("C-c C-b"     "Prev heading same level"       org-backward-heading-same-level)
                  ("M-g i"       "Jump to heading (consult-imenu)" consult-imenu)))
    (cheatsheet-add
     :group 'org-navigation
     :key (nth 0 item)
     :description (nth 1 item)))

  (cheatsheet-add :group 'Org-TODO
                  :description "Cycle TODO states"
                  :key "C-c C-t"
                  :command "Cycle TODO / DONE / custom states")


  (cheatsheet-add :group 'Org-TODO
                  :description "Set TODO state"
                  :key "C-c C-s"
                  :command "Set specific TODO state with prompt")


  (cheatsheet-add :group 'Org-TODO
                  :description "Insert new TODO heading"
                  :key "C-c C-x t"
                  :command "Insert new TODO entry at point")


  (cheatsheet-add :group 'Org-TODO
                  :description "Mark DONE"
                  :key "C-c C-t d"
                  :command "Set state to DONE quickly")


  (cheatsheet-add :group 'Org-TODO
                  :description "Mark TODO"
                  :key "C-c C-t t"
                  :command "Set state to TODO quickly")


  (cheatsheet-add :group 'Org-TODO
                  :description "Add priority A/B/C"
                  :key "C-c ,"
                  :command "Set priority for current heading")


  (cheatsheet-add :group 'Org-TODO
                  :description "Change TODO state with fast selection"
                  :key "t (in agenda)"
                  :command "Change task state from agenda buffer")


  (cheatsheet-add :group 'Org-TODO
                  :description "Refile task"
                  :key "C-c C-w"
                  :command "Move TODO to another heading or file")


  (cheatsheet-add :group 'Org-TODO
                  :description "Schedule task"
                  :key "C-c C-s"
                  :command "Schedule a TODO with a date")


  (cheatsheet-add :group 'Org-TODO
                  :description "Set DEADLINE"
                  :key "C-c C-d"
                  :command "Add deadline to TODO entry")


  (cheatsheet-add :group 'Org-TODO
                  :description "Open agenda view"
                  :key "C-c a"
                  :command "Org agenda dispatcher")

  
  )

