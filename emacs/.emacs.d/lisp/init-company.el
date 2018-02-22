(global-company-mode t)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-show-numbers t); 显示序号
(setq company-idle-delay 0.2); 菜单延迟
(setq company-minimum-prefix-length 1); 开始补全字数
(provide 'init-company)
