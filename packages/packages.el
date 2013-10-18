(provide 'packages)

;; load package.el
(require 'package)

;; add repositories
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; autoload packages
(package-initialize)

;; packages to check for
(setq package-list '(direx
		     deferred
		     epc
		     git-commit-mode
		     git-rebase-mode
		     guru-mode
		     hide-lines
		     jedi
		     jedi-direx
		     latex-pretty-symbols
		     magit
		     markdown-mode
		     markdown-mode+
		     mu4e-maildirs-extension
		     nginx-mode
		     offlineimap
		     pastebin
		     popup
		     python-django
		     python-info
		     rainbow-mode
		     shell-history
		     sql-indent
		     ssh
		     ssh-config-mode
		     syslog-mode
		     tangotango-theme
		     top-mode
		     undo-tree
		     web-mode
		     zenburn-theme))

;; fetch list
(when (not package-archive-contents)
  (package-refresh-contents))

;; install missing
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))
