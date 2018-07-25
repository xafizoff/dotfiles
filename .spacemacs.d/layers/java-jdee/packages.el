(defconst java-jdee-packages '(jdee))

(defun java-jdee/init-jdee ()
  (use-package jdee
    :defer t
    :init
    (progn
      (setq jdee-server-dir "~/.spacemacs.d/jdee-server"))))
