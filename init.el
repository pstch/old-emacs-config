;; emacs init file
;; pistache, september 2013

;; Add custom paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/packages/")
(add-to-list 'load-path "~/.emacs.d/hyde/")

;; Safe load
(require 'safe-load)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Custom file
(setq custom-file "~/.emacs.d/custom/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

;; Set default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "x-www-browser")

;; Shell shortcuts
(global-set-key (kbd "C-x M-s") 'eshell)
(global-set-key (kbd "C-x M-S") (lambda () (interactive) (eshell t)))

;; Magit shortcuts
(global-set-key (kbd "C-x g") 'magit-status)

;; Hyde (optional)
(safe-load "hyde" nil t)
(safe-load "hyde-settings" nil t)

;; EFP
(safe-load  "~/.emacs.d/emacs-python/epy-init.el" nil t)

;; Undo-tree
;; Package setup & initialization
(require 'packages)

;; Timestamps in *Messages*
(require 'message-timestamps)

;; Themes
(require 'themes)

;; Modes
(require 'modes)

;; Speedbar
(require 'speedbar-settings)

;; Custom org settings
(require 'org-settings)
(require 'org-capture-templates)
;; Custom mu4e settings
(require 'mu4e-settings)
(require 'mu4e-org-capture)

;; Custom Python JEDI settings
;; disabled by default
;;
;; (require 'jedi-settings)
