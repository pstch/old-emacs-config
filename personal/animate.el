(defconst animate-n-steps 16)
(defun emacs-reloaded ()
(animate-string (concat ";; Initialization successful, welcome to "
                  (substring (emacs-version) 0 16)
                  ".")
                  0 0)
(newline-and-indent)  (newline-and-indent))
(add-hook 'after-init-hook 'emacs-reloaded)

