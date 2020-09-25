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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#4d4d4c"))
 '(beacon-color "#c82829")
 '(custom-enabled-themes '(gruvbox-light-hard))
 '(custom-safe-themes
   '("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" "123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" default))
 '(fci-rule-color "#d6d6d6")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'light)
 '(global-display-line-numbers-mode t)
 '(helm-completion-style 'emacs)
 '(inhibit-startup-screen t)
 '(org-agenda-files
   '("~/Notes/prx-UK-Spark.org" "~/Notes/prx-TankModeling.org" "~/Notes/prx-Field-Data.org" "~/Notes/prx-UEF.org" "~/Notes/prx-Tube-in-Tube.org" "~/Notes/prx-HPWHSizer.org" "~/Notes/prx-Gas.org" "~/Notes/prx-GT-SUITE.org" "~/Notes/prx-CBECC.org" "~/Notes/Admin.org"))
 '(org-latex-compiler "xelatex")
 '(package-selected-packages
   '(ess-view-data ess evil-org evil-easymotion org-autolist csv-mode evil-magit color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized helm-projectile magit company-jedi gruvbox-theme neotree which-key autopair evil-surround evil-escape rainbow-delimiters company helm-slime slime evil-collection evil))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#282828"))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00")))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

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
(evilem-default-keybindings "SPC")

;; Theme
;; (load-theme 'sanityinc-tomorrow-day t)

;; General helpers
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-fixed-size nil)

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

;; Projectile configuration
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Org-mode configuration
(global-set-key (kbd "C-c a") 'org-agenda)
(add-hook 'org-mode-hook (lambda () (org-autolist-mode)))
(add-hook 'org-mode-hook 'evil-org-mode)
(add-hook 'org-mode-hook (lambda ()
			   (setq truncate-lines nil)
			   (setq word-wrap t)
			   (flyspell-mode 1)))
(setq org-image-actual-width '(300))
(add-hook 'evil-org-mode-hook (lambda ()
				(evil-org-set-key-theme)
				(require 'evil-org-agenda)
				(evil-org-agenda-set-keys)))
(setq org-html-validation-link nil)

;; Git configuration
(global-set-key (kbd "C-x g") 'magit-status)
(require 'evil-magit)

;; Lisp configuration
(setq inferior-lisp-program "sbcl.exe")

;; Python configuration
(add-hook 'python-mode-hook
	  (lambda ()
	    (add-to-list 'company-backends 'company-jedi)))
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

;; R configuration
(add-hook 'ess-mode-hook (lambda ()
			   (define-key ess-mode-map (kbd "C-c v") 'ess-view-data-print)))
