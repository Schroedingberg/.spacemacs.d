(with-eval-after-load 'org
      (setq org-agenda-files
            (quote

             ("~/.org/Food.org"
              "~/.org/JGU.org"
        "~/.org/Organizer.org"
        "~/.org/Birthdays.org")))

;; Org Agenda settings
;; Give my window view back to me when I am finished with agenda stuff
(setq org-agenda-restore-windows-after-quit t)
;; ;; Tasks mit Datum in der Agenda ausblenden, wenn sie bereits erledigt sind:
(setq org-agenda-skip-deadline-if-done t)
(setq org-deadline-warning-days 7)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-timestamp-if-deadline-is-shown t)
(setq org-agenda-skip-timestamp-if-done t)
(setq org-deadline-warning-days 14)
(setq org-return-follows-link t)

 ;;Org TODO settings
  (setq org-todo-keywords
  '((sequence "TODO(t)" "|" "DONE(d)")
  (sequence "STARTED(s)" "WAITING(w)" "|" "DELEGATED(g)")
  (sequence "APPT(a)" "|" "ATTENDED(1)")
  (sequence "BUG(b@)" "TESTING(i)""|" "FIXED(f)")
  (sequence "|" "CANCELED(c)")  ))
  ;; ;; Farben anpassen
(setq org-todo-keyword-faces
      '(("STARTED"  . (:foreground "#b70101" :weight bold))
	("APPT"  . (:foreground "blue" :weight bold))
 	("BUG" . (:foreground "brown" :weight bold))
 	("TESTING" . (:foreground "purple" :weight bold))
	("WAITING"  . (:foreground "orange" :weight bold))
	("DELEGATED"  . (:foreground "forestgreen" :weight bold))
	("CANCELED"  . shadow)

	))
;; ;; Capture settings
 (setq org-default-notes-file "~/.org/Organizer.org")
;;  ;;Org Capture templates
(setq org-capture-templates
       '(
	 ("i" "Information" entry (file+headline  "~/.org/Organizer.org" "Captured information")
	  "* %?\n Entered on %U\n %i")
	 ("t" "Todo" entry (file+headline "~/.org/Organizer.org" "Tasks")
             "* TODO %?\n %t\nEntered on %U\n  %i")
   ("j" "Journal" entry (file+datetree "~/.org/Journal.org")
    "* %?\nEntered on %U\n  %i\n")
   ("f" "Food" entry (file+datetree "~/.org/Food.org" "Food tracking")
    "* %?\n Entered on %U\n %i")
	("c" "Configure" entry (file+headline "~/.org/Organizer.org" "Configure")
	 )
	("b" "Birthday" entry (file+headline "~/.org/Birthdays.org" "New Birthdays")
	 "* APPT %?\n %i\n")

))
		 

(setq org-latex-pdf-process
      (quote
       ("xelatex -interaction nonstopmode -output-directory %o %f"
        "biber %b" "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f")))

(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("koma-article"
               "\\documentclass{scrartcl}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'load-path "~/.emacs.d/elpa/org-plus-contrib-20160718/")
(require 'ox-koma-letter)

(add-to-list 'org-latex-classes
               '("my-letter"
                 "\\documentclass\[%
  DIV=14,
  fontsize=12pt,
  parskip=half,
  subject=titled,
  backaddress=false,
  fromalign=left,
  fromemail=true,
  fromphone=true\]\{scrlttr2\}
  \[DEFAULT-PACKAGES]
  \[PACKAGES]
  \[EXTRA]"))
(add-to-list 'org-latex-packages-alist '("AUTO" "babel" nil))

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-src-preserve-indentation t)
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
(add-hook 'org-mode-hook 'org-hide-block-all)


(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block
       ;;; display/update images in the buffer after I evaluate
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
;;Time settings
(setq org-clock-persist 'history)


;;Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 (quote
  ((emacs-lisp . t)
   (ditaa . t)
   (python . t)
   (latex . t)
   (sh . t)
   (ledger . t)
   (dot . t))))


;; Keybindings
(add-hook 'org-mode-hook
          (lambda ()
            ;(local-set-key (kbd "C-c C-x C-i") 'org-clock-in)
            (local-set-key (kbd "C-c C-x C-o") 'org-clock-out)


            ))

)

