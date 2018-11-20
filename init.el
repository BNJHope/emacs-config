(custom-set-variables
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(package-selected-packages
   (quote
    (markdown-mode auctex-latexmk auctex intero all-the-icons 0xc cider clojure-mode magit neotree ac-js2 auto-complete flycheck rjsx-mode docker counsel-projectile projectile linum-relative evil ivy))))
(custom-set-faces
)

(add-to-list 'exec-path "~/.local/bin")
(add-to-list 'exec-path "/usr/local/bin")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'linum-relative)

(use-package evil
  :ensure t
  :init (evil-mode 1))

(use-package magit
  :ensure t)

(use-package linum-relative
  :ensure t
  :init (setq linum-relative-current-symbol ""))

(use-package auctex-latexmk
  :ensure t
  :init (auctex-latexmk-setup))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "markdown"))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package neotree
    :ensure t
    :config
        (global-set-key (kbd "C-c f") 'neotree-toggle)

        (add-hook 'neotree-mode-hook
            (lambda ()
                (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
                (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))
(global-set-key [f8] 'neotree-toggle)

(projectile-mode)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(add-hook 'prog-mode-hook (lambda ()
			    (linum-mode 1)
			    (linum-relative-on)
			    (electric-pair-mode)))

(add-hook 'haskell-mode-hook (lambda ()
			  (intero-global-mode)))

(add-hook 'eshell-mode-hook (lambda ()
			      (define-key eshell-mode-map (kbd "TAB") 'completion-at-point)))

(ac-config-default)

(ivy-mode 1)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x t") 'eshell)

(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline Bold" ))

(setenv "DOCKER_TLS_VERIFY" "1")
(setenv "DOCKER_HOST" "tcp://10.11.12.13:2376")
(setenv "DOCKER_CERT_PATH" "/Users/benhope/.docker/machine/machines/box")
(setenv "DOCKER_MACHINE_NAME" "box")

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(provide 'init)
;;; init.el ends here
