(defun org-mu4e-store-link () 
  "Store a link to a mu4e query xor message." 
  (cond 

   ;; storing links to queries 
   ((eq major-mode 'mu4e-headers-mode) 
    (let* ((query (mu4e-last-query)) 
	   desc link) 
      (org-store-link-props :type "mu4e" :query query) 
      (setq 
       desc (concat "mu4e:query:" query) 
       link desc) 
      (org-add-link-props :link link :description desc)
      link)) 

   ;; storing links to messages 
   ((eq major-mode 'mu4e-view-mode)
    (let* ((msg  (mu4e-message-at-point))
	   (msgid   (or (plist-get msg :message-id) "<none>"))
	   (from (car (car (mu4e-message-field msg :from)))) ;; edited
	   (to (car (car (mu4e-message-field msg :to))))     ;; edited
	   (subject (mu4e-message-field msg :subject))       ;; edited
	   link)
      (setq link (concat "mu4e:msgid:" msgid))
      (org-store-link-props 
       :type "mu4e" :from from :to to :subject subject
       :message-id msgid)

      (org-add-link-props :link link
			  :description (funcall org-mu4e-link-desc-func msg))
      link))))

(add-hook 'org-store-link-functions 'org-mu4e-store-link)

(provide 'mu4e-org-capture)
