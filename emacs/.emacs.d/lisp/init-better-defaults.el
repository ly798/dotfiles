(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(global-linum-mode t)
(require 'linum-relative)
(linum-relative-on)

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default abbrev-mode t)

(define-abbrev-table 'global-abbrev-table '())

;;不生成备份文件，即 xxx.xx~ 类文件
(setq make-backup-files nil)

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
(global-set-key (kbd "s-/") 'hippie-expand)

(electric-pair-mode 1)
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\` . ?\`)
                            (?\( . ?\))
                            (?\{ . ?\})
                            ))

(require 'better-defaults)

(provide 'init-better-defaults)
