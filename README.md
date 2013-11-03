emacs-config
============

This repository contains my personal emacs configuration, the contents of my ~/.emacs.d directory. This configuration should be able to run everywhere where emacs24 is installed. The needed elisp applications will be installed with MELPA at the first emacs launch.

Depends:
 - emacs24
 - GnuPG
 - mu4e

This configuration provides the following features :
 - MELPA packages installed at the first boot (list below)
 - Custom file automatically created in `~/.emacs.d/custom/custom.el`
 - Opening URLs with the web browser set by debian alternatives (`x-www-browser`)
 - EShell with `C-x M-s` (new with `C-x M-S`)
 - Undo tree
 - tangotango theme (currently)
 - *Disabled by default* Python Jedi (autocompletion)
   - To enable: uncomment `jedi` in `packages/packages.el` and uncomment `(load 'jedi-settings)` in `init.el`
 - *Optional* emacs-hyde: mode for editing jekyll (started only if hyde is located in `~/.emacs.d/hyde/`)
 - org-mode (+ agenda keybindings; indented mode)
   - **You should change the `org-default-notes-file` value in `org-settings.el`**
 - Guru Mode (not activated by default, see `modes.el` ; great for learning emacs base keybindings)
 - mu4e configuration
   - **This is also an example, you should change the default maildirs, and smtp servers**
   - Default maildir : `~/mail`, default mailboxes in `~/default/`
   - SMTP credentials stored GPG-encrypted in `.authinfo.gpg` (decrypted when needed, using gpg-agent if possible)
   - (Attachment) Downloads in `~/mail/downloads`
   - Will run `offlineimap` when updating mail
   - Integration with **org-capture**
   - Uses `mu4e-maildirs-extension` to show list of read/unread mails in different maildirs.
     - **You should also change the folders listed in `mu4e-maildirs-shortcuts`**
   - Custom action in message view, to open the HTML part of a message in the default file browser, using a temporary file. To me, far more efficient than viewing it in `w3m`.
   - Multiple accounts : possibly to set different ougoing mail accounts
     - mu4e will ask for which account to use when composing a new mail
     - mu4e will guess it automatically if it's an answer to an incoming mail
     - Password will be read from encrypted file `.authinfo.gpg`
     - **You should change the accounts defined in `my-mu4e-account-alist`**
