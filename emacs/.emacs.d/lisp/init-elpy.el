(require 'elpy)
(elpy-enable)
(add-hook 'after-init-hook #'global-flycheck-mode)
(provide 'init-elpy)
