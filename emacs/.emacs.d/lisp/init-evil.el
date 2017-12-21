(require 'evil)
(evil-mode 1)
(evil-global-set-key 'motion "j" 'evil-next-visual-line)
(evil-global-set-key 'motion "k" 'evil-previous-visual-line)
(defvar my-leader-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")
(define-key evil-normal-state-map "," my-leader-map)
;; binding ",b"
(define-key my-leader-map "b" 'list-buffers)
;; change the "leader" key to space
;;(define-key evil-normal-state-map "," 'evil-repeat-find-char-reverse)
;;(define-key evil-normal-state-map (kbd "SPC") my-leader-map)

(defun evil-paste-after-from-0 ()
  (interactive)
  (let ((evil-this-register ?0))
    (call-interactively 'evil-paste-after)))
(define-key evil-visual-state-map "p" 'evil-paste-after-from-0)

(provide 'init-evil)
