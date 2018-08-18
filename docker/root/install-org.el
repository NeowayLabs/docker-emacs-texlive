;;; install.el --- Local Emacs package installation script.

;;; Code:
(package-initialize)

;; configure ELPA repositories
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))


(package-refresh-contents)    ; update package lists

;; install org with contrib directory...workaround for the "'org' is already installed" issue
;; see https://github.com/jwiegley/use-package/issues/319#issuecomment-186181569
(package-install 'org-plus-contrib)
;;; install.el ends here
