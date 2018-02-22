(add-to-list 'load-path "~/.emacs.d/lisp/go")
(require 'go-mode-autoloads)
(require 'company)
(require 'company-go)

;; removes all unused imports
(add-hook 'go-mode-hook '(lambda() (local-set-key (kbd "C-c C-r")'go-remove-unused-imports)))
 
;; format the current buffer
(add-hook 'go-mode-hook '(lambda () (local-set-key (kbd "C-c C-f") 'gofmt)))
 
;; format the buffer when save
;;(add-hook 'before-save-hook 'gofmt-before-save)
 
;; show the go documentation for a given package
;; Note: godoc depends on the godoc utility.
;; It must be installed and on your $PATH.
;; To install it run: go get code.google.com/p/go.tools/cmd/godoc.
(add-hook 'go-mode-hook '(lambda() (local-set-key (kbd "C-c C-k") 'godoc)))
 
;; Gocode autocomplete
;;(add-hook 'go-mode-hook 'company-mode)
(setq company-tooltip-limit 20)                      ; bigger popup window
;;(setq company-minimum-prefix-length 1)
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
(defun my-go-mode-hook ()
  (push 'company-go company-backends))
(add-hook 'go-mode-hook 'my-go-mode-hook)
 
;; Go oracle
;; Note: $GOPATH will defined in init-exec-path-from-shell
;;(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
;;(add-hook 'go-mode-hook 'go-oracle-mode)

(provide 'init-golang)
