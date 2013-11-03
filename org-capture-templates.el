(setq org-capture-templates
      '(("t" "TODO - Computer tasks" entry (file+headline "~/documents/agenda/default.org" "Captured tasks")
	"* TODO %?\n  %i\n  %a")
      ("p" "TODO - Personal tasks" entry (file+headline "~/documents/agenda/default.org" "Personal captured tasks")
	"* TODO %?\n  %i\n  %a")
      ("m" "TODO - Mailing task" entry (file "~/documents/agenda/mail.org")
	"* TODO Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n\n")
      ("t" "Ideas" entry (file+headline "~/documents/notes/ideas.org" "Captured tasks")
	"* TODO %?\n  %i\n  %a")))

(provide 'org-capture-templates)
