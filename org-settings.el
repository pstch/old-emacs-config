(provide 'org-settings)

;; set org to respect todo dependencies and to use timestamps
(setq org-enforce-todo-dependencies t)
(setq org-log-done 'time)
(setq org-hierarchical-todo-statistics nil)

(setq org-startup-indented t)

;; agenda file for notes capture
(setq org-default-notes-file "~/documents/agenda/default.org")

;; configure global keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; MD export
(setq org-export-backends (quote (
       md
       )))
