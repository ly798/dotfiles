(require 'neotree)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ignore-errors (projectile-project-root)))
        (file-name (buffer-file-name))
        (neo-smart-open t))
    (if (neo-global--window-exists-p)
        (neotree-hide)
      (progn
        (neotree-show)
        (if project-dir
            (neotree-dir project-dir))
        (if file-name
            (neotree-find file-name))))))
(global-set-key [f8] 'neotree-project-dir)

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "h") 'neotree-hidden-file-toggle)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; 图标主题
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
(provide 'init-neotree)
