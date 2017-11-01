;;; packages.el --- pkgbuild layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <jaszczur@openaliasbox.org>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `pkgbuild-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `pkgbuild/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `pkgbuild/pre-init-PACKAGE' and/or
;;   `pkgbuild/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:


(defconst arch-packages
  '((pkgbuild-mode :location (recipe
                             :fetcher github
                             :repo "juergenhoetzel/pkgbuild-mode"))
)
  "The list of Lisp packages required by the pkgbuild layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(defun  arch/init-pkgbuild-mode ()
  (require 'pkgbuild-mode)
  (setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))
  (spacemacs/set-leader-keys-for-major-mode 'pkgbuild-mode
    "r" 'pkgbuild-increase-release-tag
    "b" 'pkgbuild-makepkg
    "a" 'pkgbuild-tar
    "u" 'pkgbuild-browse-url
    "m" 'pkgbuild-update-sums-line
    "e" 'pkgbuild-etags)

  )

;;; packages.el ends here
