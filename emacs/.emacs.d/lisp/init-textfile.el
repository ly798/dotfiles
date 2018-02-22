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

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
)
(add-to-list 'auto-mode-alist '("\\.api\\'" . web-mode))
(add-to-list 'auto-mode-alist '("/some/react/path/.*\\.js[x]?\\'" . web-mode))
;;(setq web-mode-content-types-alist
;;  '(("json" . "/some/path/.*\\.api\\'")
;;    ("xml"  . "/other/path/.*\\.api\\'")
;;    ("jsx"  . "/some/react/path/.*\\.js[x]?\\'")))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
(define-key web-mode-map (kbd "C-n") 'web-mode-tag-match)
(setq web-mode-extra-snippets
      '(("erb" . (("toto" . "<% toto | %>\n\n<% end %>")))
        ("php" . (("dowhile" . "<?php do { ?>\n\n<?php } while (|); ?>")
                  ("debug" . "<?php error_log(__LINE__); ?>")))
       ))
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("beg" "end")))
        ("php"  . (("beg" "end")
                   ("beg" "end")))
       ))
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-block-face t)
(setq web-mode-enable-part-face t)
;;(setq web-mode-enable-comment-keywords t)
(setq web-mode-enable-heredoc-fontification t)
;;(setq web-mode-extra-constants '(("php" . ("CONS1" "CONS2")))
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

(provide 'init-textfile)
