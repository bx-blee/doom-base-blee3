;;; extras.el --- Loaded from chemacs doom-blee  -*- lexical-binding: t; -*-

(message (format "Loaded: %s -- in emacs-%s" load-file-name emacs-version))

(lambda () "
* See Bleow link as this module's documentation:
* [[/bisos/git/auth/bxRepos/blee-binders/blee-core/blee-boot/_nodeBase_/fullUsagePanel-en.org::pure-blee-init.el]]
")

(setq debug-on-error t)

(defvar b:bootstrap:file-name
  "/bisos/blee/env3/boot/boot-blee.el"
  "Initial Blee Load File")

(defvar b:doom:enabled?
  t
  "Based on this init.el file, we ARE using doom.")

(defvar b:straight:baseDir
  (format "/bisos/blee/emacsVers/%s/blee3" emacs-version)
  "Where straight creates repos and builds elc-s.")

(if b:bootstrap:file-name
    (load  b:bootstrap:file-name)
  )

;;; extras.el ends here
