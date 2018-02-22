;;; package --- Summary
;;; Commentary:
;;; Code:
(package-initialize)

;; 把目录lisp/添加到搜索路径中去
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  ;;(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
  ;;                         ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
  (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/"))))
  ;(add-to-list 'package-archives
  ;        '("popkit" . "http://elpa.popkit.org/packages/")))

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      company ;;补全
                      better-defaults
		      hungry-delete
		      smartparens
		      linum-relative
		      exec-path-from-shell
		      popwin
		      evil
		      helm
                      spaceline ;;powerline
		      projectile
		      helm-projectile
                      flycheck
                      elpy
                      yasnippet
                      yasnippet-snippets
                      neotree
                      deft
                      all-the-icons ;;图标
                      page-break-lines
                      dashboard ;;首页
                      ox-pandoc
                      imenu-list
                      which-key
                      go-mode
                      company-go
                      ;; text file
                      yaml-mode
                      markdown-mode
                      dockerfile-mode
                      json-mode
                      json-reformat
                      ;;web
                      web-mode
                      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 初始化
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)

;; PATH
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "PATH")
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "GOROOT")

;; 插件
(require 'init-company)
(require 'init-evil)
(require 'brin-theme)
(require 'init-popwin)
(require 'init-org)
(require 'init-ivy)
(require 'init-helm)
(require 'init-powerline)
(require 'init-projectile)
(require 'init-elpy)
(require 'init-yasnippet)
(require 'init-neotree)
(require 'init-smartparens)
(require 'init-deft)
(require 'init-dashboard)
(require 'init-pandoc)
(require 'init-imenu)
(require 'init-whichkey)
(require 'init-golang)
(require 'init-textfile)

(provide 'init)
