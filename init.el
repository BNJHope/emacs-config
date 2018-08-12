(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(package-selected-packages
   (quote
    (magit neotree ac-js2 auto-complete flycheck rjsx-mode docker counsel-projectile projectile linum-relative evil ivy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Add additional package archives and read form them
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Set of modules to require
(require 'evil)
(require 'linum-relative)

;; Emacs autocomplete mode to use
(ivy-mode 1)

;; Key binding mode to use
(evil-mode 1)

;; Projectile mode to navigate projects
(projectile-mode)

;; Autocomplete
(ac-config-default)

;; Hooks
;; Prog
(add-hook 'prog-mode-hook (lambda ()
			    (linum-mode 1)
			    (linum-relative-on)
			    ))

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Font
(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline Bold" ))

;; Neotree
(use-package neotree
    :ensure t
    :config
        (global-set-key (kbd "C-c f") 'neotree-toggle)

        (add-hook 'neotree-mode-hook
            (lambda ()
                (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
                (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))
(global-set-key [f8] 'neotree-toggle)

;; Docker Settings
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
;; Use "docker-machine env box" command to find out your environment variables
(setenv "DOCKER_TLS_VERIFY" "1")
(setenv "DOCKER_HOST" "tcp://10.11.12.13:2376")
(setenv "DOCKER_CERT_PATH" "/Users/benhope/.docker/machine/machines/box")
(setenv "DOCKER_MACHINE_NAME" "box")
