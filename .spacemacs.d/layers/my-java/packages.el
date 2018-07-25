;;; packages.el --- my-java layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: marat <marat@ubuntu>
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
;; added to `my-java-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-java/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-java/pre-init-PACKAGE' and/or
;;   `my-java/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-java-packages
  '(meghanada groovy-mode gradle-mode)
  "The list of Lisp packages required by the my-java layer.

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
(defun my-java/init-meghanada ()
  (require 'flycheck-meghanada)
  (require 'meghanada)
  (add-hook 'java-mode-hook
            (lambda ()
              ;; meghanada-mode on
              (meghanada-mode t)
              (flycheck-mode t)
              (setq c-basic-offset 4)
              (setq tab-width 4)
              (setq meghanada-javac-xlint "-Xlint:all,-processing")
              ;; use code format
              ;; (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
              )))

(defun my-java/init-groovy-mode () (require 'groovy-mode))
(defun my-java/init-gradle-mode () (require 'gradle-mode))

;;; packages.el ends here
