;; Briefly, each package to be installed or configured by this layer should be
;; added to `my-web-packages'. Then, for each package PACKAGE:
;;
;; - Ihttps://www.gnu.org/software/emacs/manual/html_node/elisp/Key-Binding-Commands.htmlf PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-web/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-web/pre-init-PACKAGE' and/or
;;   `my-web/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-web-packages '(hippie-exp))

(defun my-web/pre-init-hippie-exp ()
  (use-package emmet-mode
    :config (unbind-key "<C-return>" emmet-mode-keymap))
  (use-package hippie-exp
    :bind (("<C-return>" . hippie-expand))
    :config
    (setq-default
     hippie-expand-try-functions-list '(yas-hippie-try-expand emmet-expand-line)))
  (add-hook 'web-mode-hook
            (lambda ()
              ;; (yas-reload-all)
              (yas-minor-mode))))

;; (defun my-web/post-init-yasnippet ()
;;   (require 'yasnippet)
;;   ;; (setq yas-snippets-dirs '("~/.emacs.d/private/snippets" "~/.emacs.d/snippets" yas-installed-snippets-dir))
;;   (add-hook 'web-mode-hook
;;             (lambda ()
;;               ;; (yas-reload-all)
;;               (yas-minor-mode)))  )

;;; packages.el ends here
