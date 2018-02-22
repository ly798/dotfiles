;; YAML mode
;; https://raw.github.com/yoshiki/yaml-mode/master/yaml-mode.el
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; add reStructuredText mode
;; http://docutils.sourceforge.net/tools/editors/emacs/rst.el
(require 'rst)
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)) auto-mode-alist))

(autoload 'markdown-mode "markdown-mode"
	"Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))

;path to where nxml is
;;(set 'nxml-path (concat site-lisp-path "nxml-mode/"))
;;(load (concat nxml-path "rng-auto.el"))
(add-to-list 'auto-mode-alist
              (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss") t) "\\'")
                    'nxml-mode))
(unify-8859-on-decoding-mode)
(setq magic-mode-alist
	  (cons '("<＼＼?xml " . nxml-mode)
	  magic-mode-alist))
(fset 'xml-mode 'nxml-mode)

(provide 'init-textfile)
