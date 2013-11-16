;; (speedbar 1)
;; disabled at the moment

(setq speedbar-mode-hook '(lambda ()
    (interactive)
    (other-frame 0)))

(global-set-key "\C-cs" 'speedbar-get-focus)

(provide 'speedbar-settings)
