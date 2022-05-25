;;; -*- Mode: Emacs-Lisp; -*-

(defun $blee:emacs|early-init ()
  "Package initialization happens after this but before init.el
The variables determined here are local in scope, 
they will be determined globally later."

  (message (format "blee:ann $blee:emacs|early-init from %s" (or load-file-name buffer-file-name)))
  (let (
	($blee:emacs:type "fsf")
	($blee:emacs:id (intern (format "%df" emacs-major-version)))
	)
    (setq package-user-dir
	  (file-name-as-directory 
	   (expand-file-name
	    (format "/bisos/blee/%s/elpa" $blee:emacs:id))))
    )
  )

(when (>= emacs-major-version 26)
  ($blee:emacs|early-init)
  )

(when (<= emacs-major-version 26.2)
  ;;; NOTYET, Temporary hack
  (setq package-check-signature nil))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; All subsequent package-initialize invokations should be eliminated or:
;; (unless package--initialized (package-initialize t))  

;;;
;;; Blee bootstrap Start
;;;

;;; (blee:bootstrap:file-name-obtain)
(defun blee:bootstrap:file-name-obtain ()
  "Also add an environment variable -- export blee-bootstrap=fileName"
    (let (
	  (blee-3-bootstrap "/bisos/blee/env3/main/emacs-blee.el")
	  (blee-2-bootstrap "~/lisp/bystar-emacs.el")
	  )

      (when (>= emacs-major-version 26)
	(setq blee-3-bootstrap "/bisos/blee/env3/boot/boot-blee.el"))

      (when (>= emacs-major-version 27)
	(setq blee-3-bootstrap "/bisos/blee/env3/boot/boot-blee.el"))
      
      (cond
       ((file-exists-p blee-3-bootstrap)
	blee-3-bootstrap
	)
       ((file-exists-p blee-2-bootstrap)
	blee-2-bootstrap
	)
       (t
	(message "Missing Blee bootstrap file")
	nil
	)
       )))

(defvar blee:bootstrap:file-name (blee:bootstrap:file-name-obtain)  "Initial Blee Load File")

(if blee:bootstrap:file-name
    (load  blee:bootstrap:file-name)
  )

;;;
;;; END OF .emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-custom-commands
   '(("d" todo "DELEGATED" nil)
     ("c" todo "DONE|DEFERRED|CANCELLED" nil)
     ("w" todo "WAITING" nil)
     ("W" agenda ""
      ((org-agenda-ndays 21)))
     ("A" agenda ""
      ((org-agenda-skip-function
	(lambda nil
	  (org-agenda-skip-entry-if 'notregexp "\\=.*\\[#A\\]")))
       (org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's Priority #A tasks: ")))
     ("u" alltodo ""
      ((org-agenda-skip-function
	(lambda nil
	  (org-agenda-skip-entry-if 'scheduled 'deadline 'regexp "<[^>
]+>")))
       (org-agenda-overriding-header "Unscheduled TODO entries: ")))))
 '(org-agenda-files
   '("~/org/captures.org" "~/org/events/main.org" "~/org/events/family.org"))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/org/notes.org")
 '(org-fast-tag-selection-single-key 'expert)
 '(org-reverse-note-order t)
 '(package-selected-packages
   '(auctex yasnippet-snippets slime elpy markdown-mode emms multishell calfw-ical calfw-org calfw-cal calfw engine-mode epc org-bullets bbdb-ext bbdb magit ov f async use-package))
 '(safe-local-variable-values
   '((major-mode . sh-mode)
     (eval bx:load-file:ifOneExists "./panelActions.el")
     (eval blee:fill-column-indicator/enable)
     (eval set-fill-column 115)
     (eval img-link-overlays)
     (eval setq-local ~blee:dblockController "interactive")
     (eval setq-local ~blee:dblockEnabler nil)
     (eval setq-local ~blee:panelUpdater nil)
     (eval setq-local ~primaryMajorMode 'org-mode)
     (eval setq-local ~selectedSubject "noSubject"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfw:face-annotation ((t :foreground "green" :inherit cfw:face-day-title)))
 '(cfw:face-day-title ((t :background "brown")))
 '(cfw:face-default-content ((t :foreground "yellow")))
 '(cfw:face-default-day ((t :weight bold :inherit cfw:face-day-title)))
 '(cfw:face-disable ((t :foreground "DarkGray" :inherit cfw:face-day-title)))
 '(cfw:face-grid ((t :foreground "DarkGrey")))
 '(cfw:face-header ((t (:foreground "#d0bf8f" :weight bold))))
 '(cfw:face-holiday ((t :background "black" :foreground "red" :weight bold)))
 '(cfw:face-periods ((t :foreground "cyan")))
 '(cfw:face-saturday ((t :foreground "yellow" :background "black" :weight bold)))
 '(cfw:face-select ((t :background "red")))
 '(cfw:face-sunday ((t :foreground "orange" :background "black" :weight bold)))
 '(cfw:face-title ((t (:foreground "#f0dfaf" :weight bold :height 2.0 :inherit variable-pitch))))
 '(cfw:face-today ((t :background: "grey10" :weight bold)))
 '(cfw:face-today-title ((t :background "blue" :weight bold)))
 '(cfw:face-toolbar ((t :foreground "blue" :background "magenta")))
 '(cfw:face-toolbar-button-off ((t :foreground "Gray50" :weight bold)))
 '(cfw:face-toolbar-button-on ((t :foreground "white" :weight bold)))
 '(gnus-group-mail-1 ((((class color) (background dark)) (:foreground "red" :bold t))))
 '(gnus-group-mail-1-empty ((((class color) (background dark)) (:foreground "green1" :bold t))))
 '(gnus-group-mail-2 ((((class color) (background dark)) (:foreground "firebrick" :bold t))))
 '(gnus-group-mail-2-empty ((((class color) (background dark)) (:foreground "green2" :bold t))))
 '(gnus-group-mail-3 ((((class color) (background dark)) (:foreground "orange" :bold t))))
 '(gnus-group-mail-3-empty ((((class color) (background dark)) (:foreground "green3" :bold t))))
 '(gnus-group-mail-low ((((class color) (background dark)) (:foreground "yellow" :bold t))))
 '(gnus-group-mail-low-empty ((((class color) (background dark)) (:foreground "green4" :bold t))))
 '(gnus-group-news-1 ((((class color) (background dark)) (:foreground "red" :bold t))))
 '(gnus-group-news-1-empty ((((class color) (background dark)) (:foreground "green1" :bold t))))
 '(gnus-group-news-2 ((((class color) (background dark)) (:foreground "firebrick" :bold t))))
 '(gnus-group-news-2-empty ((((class color) (background dark)) (:foreground "green2" :bold t))))
 '(gnus-group-news-3 ((((class color) (background dark)) (:foreground "orange" :bold t))))
 '(gnus-group-news-3-empty ((((class color) (background dark)) (:foreground "green3" :bold t))))
 '(gnus-group-news-4 ((((class color) (background dark)) (:foreground "yellow" :bold t))))
 '(gnus-group-news-4-empty ((((class color) (background dark)) (:foreground "green4" :bold t))))
 '(gnus-group-news-5 ((((class color) (background dark)) (:foreground "purple3" :bold t))))
 '(gnus-group-news-5-empty ((((class color) (background dark)) (:foreground "green5" :bold t))))
 '(gnus-group-news-6 ((((class color) (background dark)) (:foreground "turquoise" :bold t))))
 '(gnus-group-news-6-empty ((((class color) (background dark)) (:foreground "green6" :bold t))))
 '(gnus-group-news-low ((((class color) (background dark)) (:foreground "pink" :bold t))))
 '(gnus-group-news-low-empty ((((class color) (background dark)) (:foreground "green" :bold t))))
 '(gnus-header-content ((((class color) (background dark)) (:foreground "white" :bold))))
 '(gnus-header-from ((((class color) (background dark)) (:bold t :foreground "red"))))
 '(gnus-header-name ((((class color) (background dark)) (:foreground "orange" :background "black" :bold t))))
 '(gnus-header-newsgroups ((((class color) (background dark)) (:underline t :foreground "DarkGreen" :italic t))))
 '(gnus-header-subject ((((class color) (background dark)) (:bold t :foreground "DarkGreen"))))
 '(message-header-cc ((((class color) (background dark)) (:foreground "orange"))))
 '(message-header-newsgroups ((((class color) (background dark)) (:foreground "yellow"))))
 '(message-header-subject ((((class color) (background dark)) (:foreground "yellow"))))
 '(message-header-to ((((class color) (background dark)) (:foreground "red"))))
 '(tabbar-button-highlight ((t (:background "grey50" :foreground "white" :height 0.8 :family "Sans Serif"))))
 '(tabbar-default ((t (:background "grey50" :foreground "yellow" :height 0.8 :family "Sans Serif"))))
 '(tabbar-modified ((t (:background "grey50" :foreground "yellow" :box (:line-width 1 :color "white" :style released-button)))))
 '(tabbar-selected ((t (:background "white" :foreground "black" :box (:line-width 1 :color "white" :style pressed-button) :height 0.8 :family "Sans Serif"))))
 '(tabbar-unselected ((t (:background "grey50" :foreground "blue" :box (:line-width 2 :color "black" :style released-button) :height 0.8 :family "Sans Serif")))))
