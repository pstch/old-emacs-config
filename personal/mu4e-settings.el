;; global shortcut
(global-set-key "\C-cm" 'mu4e)

(setq mail-user-agent 'mu4e-user-agent)

;; default folders
(setq
 mu4e-maildir       "~/mail"              ;; top-level Maildir
 mu4e-sent-folder   "/default/sent"       ;; folder for sent messages
 mu4e-drafts-folder "/default/drafts"     ;; unfinished messages
 mu4e-trash-folder  "/default/trash"      ;; trashed messages
 mu4e-refile-folder "/default/archive"    ;; saved messages
 smtpmail-queue-folder  "/default/queue"  ;; queued mail
 smtpmail-local-domain "pstch.net"
 smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
 smtpmail-smtp-server "preeza.vpn.pstch.net"
 smtpmail-smtp-service 12025)

(setq mu4e-attachment-dir  "~/mail/downloads")

;; HTML reader
(setq mu4e-html-renderer 'w3m)

;; offlineimap link
(setq mu4e-get-mail-command "offlineimap -a default")
(setq mu4e-update-interval 180)

;; cryptography
(setq mml2015-use 'epg)

;; maildirs extension
(mu4e-maildirs-extension)
(setq mu4e-maildir-shortcuts
	'(("/default/INBOX"         . ?i)
	  ("/default/queue"	    . ?q)
	  ("/default/sent"          . ?s)
	  ("/default/drafts"        . ?d)


	  ("/servers/kahlo"         . ?k)
	  ("/servers/arthur"        . ?a)
	  ("/servers/carlingue"     . ?c)
	  ("/servers/flock"         . ?f)
	  ("/servers/preeza"        . ?p)

	  ("/workstations/tranquility"   . ?l)
	  ("/workstations/floyd"         . ?y)

	  ("/gmail/hugo.geoffroy" . ?h)
	  ("/gmail/1st4ch"        . ?1)
	  ("/gmail/sp4ce.1s.b1g"  . ?4)))


;; HTML open
(defun mu4e-msgv-action-view-in-browser (msg)
  "View the body of the message in a web browser."
  (interactive)
  (let ((html (mu4e-msg-field (mu4e-message-at-point t) :body-html))
	(tmpfile (format "%s/%d.html" temporary-file-directory (random))))
    (unless html (error "No html part for this message"))
    (with-temp-file tmpfile
      (insert
       "<html>"
       "<head><meta http-equiv=\"content-type\""
       "content=\"text/html;charset=UTF-8\">"
       html))
    (browse-url (concat "file://" tmpfile))))
(add-to-list 'mu4e-view-actions
	     '("View in browser" . mu4e-msgv-action-view-in-browser) t)

;;  multiple accounts
(defvar my-mu4e-account-alist
  '(("default"
     (user-mail-address "hugo@pstch.net")
     (smtpmail-default-smtp-server "preeza.vpn.pstch.net")
     (smtpmail-smtp-service 12025))
    ("gmail/hugo.geoffroy"
     (user-mail-address "hugo.geoffroy@gmail.com")
     (smtpmail-default-smtp-server "smtp.gmail.com"))
    ("gmail/1st4ch"
     (user-mail-address "1st4ch@gmail.com")
     (smtpmail-default-smtp-server "smtp.gmail.com"))
    ("gmail/sp4ce.1s.b1g"
     (user-mail-address "sp4ce.1s.b1g@gmail.com")
     (smtpmail-default-smtp-server "smtp.gmail.com"))))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
	  (if mu4e-compose-parent-message
	      (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
		(string-match "/\\(.*\\)/.*" maildir)
		(match-string 1 maildir))
	    (completing-read (format "Compose with account: (%s) "
				     (mapconcat #'(lambda (var) (car var)) my-mu4e-account-alist " | "))
			     (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
			     nil t nil nil (caar my-mu4e-account-alist))))
	 (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
	(mapc #'(lambda (var)
		  (set (car var) (cadr var)))
	      account-vars)
           (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(provide 'mu4e-settings)
