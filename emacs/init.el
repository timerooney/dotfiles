(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" "123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(company-jedi gruvbox-theme neotree which-key autopair evil-surround evil-escape rainbow-delimiters company helm-slime slime evil-collection evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Hook configuration
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'evil-escape-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Enable helm mode
(helm-mode 1)

;; Configure and start evil and evil-collection
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(evil-mode 1)
(evil-collection-init)

;; Theme
(load-theme 'gruvbox-light-medium t)

;; General helpers
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-fixed-size nil)
(add-hook 'window-setup-hook #'neotree-show)

;; Key helpers
(which-key-mode)

;; Brackets and surrounding
(autopair-global-mode)
(global-evil-surround-mode 1)

;; General shortcuts
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

;; General configuration
(global-display-line-numbers-mode)

;; Lisp configuration
(setq inferior-lisp-program "sbcl.exe")

;; Python configuration
(add-hook 'python-mode-hook
	  (lambda ()
	    (add-to-list 'company-backends 'company-jedi)))
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")
