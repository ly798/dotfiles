(require 'neotree)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (if projectile-project-root
      (let ((project-dir (projectile-project-root))
            (file-name (buffer-file-name)))
        (neotree-toggle)
        (if project-dir
            (if (neo-global--window-exists-p)
                (progn
                  (neotree-dir project-dir)
                  (neotree-find file-name)))
          (message "Could not find git project root.")))
    (neotree-toggle)))
(global-set-key [f8] 'neotree-project-dir)

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; 图标主题
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
(provide 'init-neotree)
