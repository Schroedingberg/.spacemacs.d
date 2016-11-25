;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     csv
     yaml
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     org
     auto-completion
     better-defaults
     emacs-lisp
     git
     github
     markdown
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     dash
     elfeed
     pandoc
     spell-checking
     syntax-checking
     version-control
     mu4e
     finance
     colors
     floobits
     themes-megapack
     django
     erc
     c-c++
     clojure
     common-lisp
     (haskell :variables haskell-enable-hindent-style "fundamental")
     ipython-notebook
     javascript
     java
     latex
     python
     ruby
     scheme
     shell-scripts
     sql
     ess
     semantic
     speed-reading
     ranger
     ;books
;     extra-lang
;     +lang
     myorglayer
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(sicp
                                      helm-bibtex
                                      org-ref
                                      smtpmail-multi
                                      beacon
                                      jdee
                                      shm
                                      edbi
                                      org-page
                                      jdee
                                      org-jekyll
                                      sos
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'emacs 
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         cyberpunk
                         professional
                         organic-green
                         spacegray
                         leuven
                         sunny-day
                         monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         
                         
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   ;; dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize t
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.1
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'right-then-bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

(spacemacs/toggle-mode-line-org-clock-on)

  ;;;;;;;;;;;;;;;;;
  ;; Keybindings ;;
  ;;;;;;;;;;;;;;;;;
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key "\C-x\C-b" 'helm-buffers-list)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key "\M-y" 'helm-show-kill-ring)
  (global-set-key (kbd "M-s") ' helm-occur-from-isearch)
  (global-set-key (kbd "<f9>") ' helm-bibtex)
  (global-set-key (kbd "<f5>") 'helm-semantic-or-imenu)
  (global-set-key (kbd "C-h a") 'helm-apropos)
  (global-set-key (kbd "C-x C-k") 'kill-region)
  (global-set-key [XF86Launch1] 'helm-list-elisp-packages)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-xg" 'magit-status)
  (global-set-key "\C-cb" 'org-iswitchb)
  (global-set-key "\C-cq" 'org-dashboard-display)
  (global-set-key "\C-hb" 'helm-descbinds)
(global-set-key (kbd "<f12>") 'calc)
(global-set-key (kbd "<f7>") 'org-clock-out)
  (global-set-key (kbd "<f8>") 'org-clock-in-last)
  
  ;;;;;;;;;;;
  ;; Modes ;;
  ;;;;;;;;;;;


;;(semantic-stickyfunc-mode)
  (smartparens-global-mode)
(beacon-mode)
(setq eyebrowse-mode nil)
  ;(highlight-tail-mode)
  ;;;;;;;;;;
  ;; Mail ;;
  ;;;;;;;;;;
  (require 'mu4e)
  (global-set-key (kbd "C-x m") 'mu4e)

  (setq  mu4e-maildir       "~/Mail")   ;; top-level Maildir)
  (defvar my-mu4e-account-alist
    '(
      ("HSF"
       (user-mail-address  "rebmann.aaron@stud.hs-fresenius.de")
       (mu4e-sent-folder   "/HSF/Gesendet")
       (mu4e-drafts-folder "/HSF/Entwuerfe")
       (mu4e-trash-folder  "/HSF/Geloescht")
       (mu4e-refile-folder "/HSF/Archive")

       )
      
      ("Gmail"
       (user-mail-address  "aaronrebmann@gmail.com")
       (mu4e-sent-folder   "/Gmail/Sent")
       (mu4e-drafts-folder "/Gmail/Drafts")

       (mu4e-trash-folder  "/Gmail/Trash")
       (mu4e-refile-folder "/Gmail/Archive")

       )

      ("Zoho"
       (user-mail-address "aaronrebmann@zoho.com")
       (mu4e-sent-folder "/zoho/Sent")
       (mu4e-drafts-folder "/zoho/Drafts")
       (mu4e-trash-folder "/zoho/Trash")
       )))


(setq mu4e-user-mail-address-list
     (mapcar (lambda (account) (cadr (assq 'user-mail-address account)))
            my-mu4e-account-alist))
(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

;;ask for account when composing mail
(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")
;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
;; set update interval (testing, there will be trouble with the credentials)
(setq mu4e-update-interval 10)

;; HTML rendering settings

(require 'mu4e-contrib)
(setq mu4e-html2text-command 'mu4e-shr2text)
;If you use the ‘mu4e-shr2text’, it might be useful to emulate some of
;the shr key bindings, with something like:
(add-hook 'mu4e-view-mode-hook
          (lambda()
            ;; try to emulate some of the eww key-bindings
            (local-set-key (kbd "<tab>") 'shr-next-link)
            (local-set-key (kbd "<backtab>") 'shr-previous-link)))
;(setq mu4e-html2text-command "html2text")
(setq mu4e-view-prefer-html t)
;; attachments go here
(setq mu4e-attachment-dir "~/Downloads")
;; when you reply to a message, use the identity that the mail was sent to
;; the cpbotha variation ...unknownsymbols... function that checks to, cc and bcc fields
(defun cpb-mu4e-is-message-to (msg rx)
"Check if to, cc or bcc field in MSG has any address in RX."
(or (mu4e-message-contact-field-matches msg :to rx)
(mu4e-message-contact-field-matches msg :cc rx)
(mu4e-message-contact-field-matches msg :bcc rx)))
;; mu4e-multi settings
;;; Replies
(setq message-citation-line-function 'message-insert-formatted-citation-line) 
(setq message-citation-line-format "On %a, %b %d %Y, %f wrote:\n")
(global-set-key (kbd "C-x m") 'mu4e)
(setq smtpmail-multi-accounts '(
                                (zoho .
                                       ("aaronrebmann@zoho.com" "smtp.zoho.com" 465 nil ssl nil nil nil ))
                                 (HSF .
                                       ("rebmann.aaron@stud.hs-fresenius.de" "mail.hs-fresenius.de" 587 nil nil nil nil nil))
                                  (Gmail .
                                         ("aaronrebmann@gmail.com" "smtp.gmail.com" 587 nil starttls nil nil nil))
                                  (JGU .
                                       ("arebmann" "mail.uni-mainz.de" 587 nil ssl nil nil nil))
                                  ))



(setq smtpmail-multi-associations
      (quote
       (("aaronrebmann@gmail.com" Gmail)
        ("aaronrebmann@zoho.com" zoho)
        ("rebmann.aaron@stud.hs-fresenius.de" HSF)
        ("arebmann@students.uni-mainz.de" JGU))))

(setq smtpmail-multi-default-account (quote zoho))

(setq message-send-mail-function 'smtpmail-multi-send-it)

(setq smtpmail-debug-info t)
(setq smtpmail-debug-verbose t)



;; (add-to-list 'mu4e-bookmarks
;;              '(
;;              ("maildir:/zoho/INBOX" "zoho" ?z)
;;              ("maildir:/HSF/INBOX" ";HSF" ?2)))

 
;;;;;;;;;;;;;;;;
;; Open with  ;;
;;;;;;;;;;;;;;;;
(setq openwith-associations '(("\\.pdf\\'" "zathura" (file))))


;;;;;;;;;;;;;;
;; Haskell  ;;
;;;;;;;;;;;;;;
(setq-default dotspacemacs-configuration-layers
              '(auto-completion
                (haskell :variables haskell-completion-backend 'intero)))


;;;;;;;;;;;;;;
;; Org-page ;;
;;;;;;;;;;;;;;

(setq op/repository-directory "~/blogs/Schroedingberg.github.io")   ;; the repository location
(setq op/site-domain "https://schroedingberg.github.io")         ;; your domain
;;; the configuration below you should choose one, not both
;(setq op/personal-disqus-shortname "")    ;; your disqus commenting system



;;Python
(setq python-auto-set-local-pyenv-version 'on-visit)

)
;; (require 'conda)
;; ;; if you want interactive shell support, include:
;; (conda-env-initialize-interactive-shells)
;; ;; if you want eshell support, include:
;; (conda-env-initialize-eshell)
;; ;; if you want auto-activation (see below for details), include:
;; (conda-env-autoactivate-mode t)





;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"] t)
 '(company-quickhelp-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "5e2dc1360a92bb73dafa11c46ba0f30fa5f49df887a8ede4e3533c3ab6270e08" "cd03a600a5f470994ba01dd3d1ff52d5809b59b4a37357fa94ca50a6f7f07473" "2439e27fb4695fa3f6b6336fa3f053e97f51ee251d583edc1a26e3b392eade55" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "2916d16e583c17bb2a1a9d231ea8ddcb3577f8cb97179eea689e91036213ff03" "bac3f5378bc938e96315059cd0488d6ef7a365bae73dac2ff6698960df90552d" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "3693403316f0127326fa08067c2e3013eda29216829e1478e1656ea4fbbc6560" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "70403e220d6d7100bae7775b3334eddeb340ba9c37f4b39c189c2c29d458543b" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "77c65d672b375c1e07383a9a22c9f9fc1dec34c8774fe8e5b21e76dca06d3b09" "94ba29363bfb7e06105f68d72b268f85981f7fba2ddef89331660033101eb5e5" "8288b9b453cdd2398339a9fd0cec94105bc5ca79b86695bd7bf0381b1fbe8147" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" "3a69621a68c2d3550a4c777ffc000e1ea66f5bc2f61112814c591e1bda3f5704" "bc40f613df8e0d8f31c5eb3380b61f587e1b5bc439212e03d4ea44b26b4f408a" "72c7c8b431179cbcfcea4193234be6a0e6916d04c44405fc87905ae16bed422a" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "9cb6358979981949d1ae9da907a5d38fb6cde1776e8956a1db150925f2dad6c1" "868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "f64c9f8b4241b680b186f4620afb9c82fa2a76cf4498a7431f90db59bb1892eb" "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" "f9805a89d4309ca29b68c4a6b3d8f13f7931603e59b881515a27535d6ffa1a6e" "19ba41b6dc0b5dd34e1b8628ad7ae47deb19f968fe8c31853d64ea8c4df252b8" "f04122bbc305a202967fa1838e20ff741455307c2ae80a26035fbf5d637e325f" "3632cf223c62cb7da121be0ed641a2243f7ec0130178722554e613c9ab3131de" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "66132890ee1f884b4f8e901f0c61c5ed078809626a547dbefbb201f900d03fd8" default)))
 '(evil-want-Y-yank-to-eol t)
 '(eyebrowse-mode nil)
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#073642" t)
 '(haskell-compile-cabal-build-command "stack build")
 '(helm-external-programs-associations (quote (("pdf" . "zathura") ("html" . "firefox"))))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(ledger-post-amount-alignment-column 62 t)
 '(linum-format " %7i " t)
 '(magit-diff-use-overlays nil)
 '(magit-merge-arguments nil)
 '(max-lisp-eval-depth 900)
 '(mu4e-use-fancy-chars t)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files
   (quote
    ("~/.org/JGU.org" "~/.org/Organizer.org" "~/.org/Birthdays.org")))
 '(org-babel-python-command "python3")
 '(org-babel-python-mode (quote anaconda-mode))
 '(org-clock-mode-line-total (quote auto))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (sos csv-mode pyenv-mode-auto org-ref key-chord ivy calfw org-jekyll yaml-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data org-page git mustache o-blog slime-company minitest insert-shebang hide-comnt edbi epc concurrent deferred ebal ido-completing-read+ yapfify uuidgen rake py-isort org-projectile org-download mwim mu4e-maildirs-extension mu4e-alert livid-mode skewer-mode live-py-mode link-hint intero hlint-refactor helm-hoogle github-search flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff goto-chg undo-tree org dumb-jump diminish darkokai-theme company-shell company-ghci company-emacs-eclim common-lisp-snippets column-enforce-mode color-identifiers-mode clojure-snippets pdf-tools tablist ranger spray stickyfunc-enhance srefactor jdee eclim xterm-color shell-pop multi-term eshell-prompt-extras esh-help marshal 4clojure highlight-tail beacon android-mode ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode chicken-scheme quack helm-bibtex biblio parsebib biblio-core sicp solarized-theme smtpmail-multi company-auctex zonokai-theme zenburn-theme zen-and-art-theme zeal-at-point web-beautify underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme sql-indent spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme slime shm seti-theme rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme rbenv rainbow-mode rainbow-identifiers railscasts-theme pyvenv pytest pyenv-mode py-yapf purple-haze-theme professional-theme pony-mode planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme pandoc-mode ox-pandoc ht organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme magit-gh-pulls lush-theme light-soap-theme ledger-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme hy-mode hindent heroku-theme hemisu-theme helm-pydoc helm-dash hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme github-clone github-browse-file git-link gist gh logito pcache geiser gandalf-theme flycheck-ledger flycheck-haskell floobits flatui-theme flatland-theme fish-mode firebelly-theme farmhouse-theme espresso-theme erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks elfeed-web simple-httpd elfeed-org elfeed-goodies ace-jump-mode noflet elfeed ein websocket dracula-theme django-theme disaster darktooth-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-tern dash-functional tern company-ghc ghc haskell-mode company-cabal company-c-headers company-anaconda colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode cmake-mode clues-theme clj-refactor inflections edn cider multiple-cursors paredit peg clang-format cider-eval-sexp-fu queue clojure-mode chruby cherry-blossom-theme busybee-theme bundler inf-ruby bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auctex apropospriate-theme anti-zenburn-theme anaconda-mode pythonic f ample-zen-theme ample-theme alect-themes afternoon-theme toc-org smeargle orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore request helm-flyspell helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flycheck-pos-tip flycheck evil-magit magit magit-popup git-commit with-editor diff-hl company-statistics company-quickhelp pos-tip company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler window-numbering volatile-highlights vi-tilde-fringe spaceline s powerline smooth-scrolling restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox hydra spinner page-break-lines open-junk-file neotree move-text macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight elisp-slime-nav define-word clean-aindent-mode buffer-move bracketed-paste auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build use-package which-key bind-key bind-map evil spacemacs-theme)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(python-shell-interpreter "ipython3" t)
 '(semantic-mode t)
 '(send-mail-function (quote smtpmail-send-it))
 '(smartparens-global-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(timeclock-mode-line-display t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
