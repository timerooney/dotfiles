;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     org
     bibtex
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control

     ;; My additions
     shell
     python
     ess
     common-lisp
     themes-megapack
     pandoc
     ranger
     html
     csv
     latex
     javascript
     deft
     lua
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     visual-fill-column
     writeroom-mode
     sphinx-doc
     org-ref
     org-download
     js-comint
     company-jedi
     company-lua
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(lush sanityinc-solarized-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Mono"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq user-full-name "Tim Rooney")

  (defun sync-org-personal-website ()
    (interactive)
    (shell-command "aws s3 sync --delete \"C:\\Users\\trooney\\publish\\org\\personal\" s3://org.timothy.engineer/ --profile trooney-org"))

  ;; Custom commands
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "es" 'sync-org-personal-website)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "r" 'ess-switch-to-end-of-ESS)

  ;; Configure writeroom-mode
  (spacemacs/set-leader-keys "tz" 'writeroom-mode)
  (setq writeroom-width 100)
  (setq writeroom-fullscreen-effect 'maximized)
  (add-hook 'markdown-mode-hook 'writeroom-mode)
  (add-hook 'org-mode-hook 'writeroom-mode)
  (add-hook 'markdown-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'visual-line-mode)

  ;; Slime configuration
  (if (eq system-type 'windows-nt)
      (setq inferior-lisp-program "sbcl.exe")
    (setq inferior-lisp-program "/usr/bin/sbcl"))
  (setq slime-contribs '(slime-fancy slime-company))

  ;; Markdown preview configuration
  (setq markdown-command "pandoc")
  ;; Enable markdown mode by default
  (setq markdown-enable-math t)
  ;; Associate markdown mode with .taskpaper filetype
  (add-to-list 'auto-mode-alist '("\\.taskpaper$" . markdown-mode))

  ;; Associate the latex layer with .latex filetype
  (add-to-list 'auto-mode-alist '("\\.latex$" . latex-mode))

  ;; Change the default font for markdown-mode
  (add-hook 'markdown-mode-hook (lambda ()
                                  (setq buffer-face-mode-face '(:family "Open Sans"))
                                  (buffer-face-mode)))

  ;; Change the default font for org-mode
  (add-hook 'org-mode-hook (lambda ()
                             (setq buffer-face-mode-face '(:family "Open Sans"))
                             (buffer-face-mode)))

  ;; Configure Python-mode to load sphinx-doc
  (add-hook 'python-mode-hook (lambda ()
                                (require 'sphinx-doc)
                                (sphinx-doc-mode t)))

  ;; Configure ESS-mode to use ';' instead of the smart arrow key instead of underscore
  (setq ess-smart-S-assign-key ";")

  ;; Set org-mode configuration
  (setq org-directory "~/Dropbox/org")
  (setq org-agenda-files '("~/Dropbox/org"))
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))
  (setq org-capture-templates
        '(("t" "todo" entry (file+datetree "~/Dropbox/org/taskdiary.org")
           "* TODO %^{Task} %^g\n%U\n%?")
          ("n" "Note" entry (file+datetree "~/Dropbox/org/taskdiary.org")
           "* %^{Note description} %^g\n%U\n%?")
          ("m" "Meeting" entry (file+datetree "~/Dropbox/org/meetings.org")
           "* MEETING %^{Meeting title} %^g:MEETING:\nSCHEDULED: %^{Scheduled}t\n%U\n")
          ("e" "Event" entry (file+datetree "~/Dropbox/org/events.org")
           "* EVENT %^{Event} %^g:EVENT:\nSCHEDULED: %^{Scheduled}t\n%U\n")
          ("p" "Phone call" entry (file+datetree "~/Dropbox/org/phonecalls.org")
           "* Call: %^{Summary} %^g:call:\n  Added: %U\nPhone number: %^{Phone number}\nAttendees: %^{Attendees}\nPurpose: %^{Purpose}\n** Notes\n%?")
          ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
           "* %^g %U\n%?\n")
          ("l" "Log Time" entry (file+datetree "~/Dropbox/org/timelog.org")
           "* %U - %^{Activity} %^g:TIME:")))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAITING(w@)" "INACTIVE(i@)" "|" "EVENT(e)" "CANCELED(c@)" "MEETING(m)" "DONE(d)")))
  (setq org-agenda-custom-commands
        '(("c" "Main"
           ((agenda "" ((org-agenda-span 1)
                        (org-deadline-warning-days 0)
                        (org-agenda-overriding-header "Today's Schedule:")))
            (todo "NEXT" ((org-agenda-overriding-header "Next Tasks:")))
            ;(tags-todo "LEVEL=1" ((org-agenda-overriding-header "Active Projects:")))
            (agenda "" ((org-agenda-start-day "+1d")
                        (org-agenda-span 6)
                        (org-agenda-overriding-header "Week at a Glance:")))
            (todo "WAITING" ((org-agenda-overriding-header "Waiting Tasks:")))
            (tags "-DEADLINE={.+}/!+TODO|+NEXT|+WAITING" ((org-agenda-overriding-header "Tasks without Deadlines:"))))
           nil
           ("~/publish/org/personal/agenda.html"))
          ("o" "Month view"
           ((agenda "" ((org-agenda-overriding-header "Month View")
                        (org-agenda-month-view)))))))

  ;;; exporting data
  (setq org-publish-project-alist
        '(("orgfiles-personal"
           :base-directory "~/Dropbox/org/drafts/"
           :base-extension "org"
           :exclude "wkx\\|scx"
           :publishing-directory "~/publish/org/personal/"
           :publishing-function org-html-publish-to-html
           :sitemap-title "Index of Notes"
           :auto-sitemap t)
          ("images-personal"
           :base-directory "~/Dropbox/org/drafts/img/"
           :base-extension any
           :recursive t
           :publishing-directory "~/publish/org/personal/img/"
           :publishing-function org-publish-attachment)
          ("content-personal"
           :base-directory "~/Dropbox/org/drafts/content/"
           :base-extension any
           :recursive t
           :publishing-directory "~/publish/org/personal/web/content/"
           :publishing-function org-publish-attachment)
          ("website-personal" :components ("orgfiles-personal" "images-personal" "content-personal"))

          ("orgfiles-school"
           :base-directory "~/Dropbox/org/drafts/school/"
           :base-extension "org"
           :publishing-directory "~/publish/org/school/"
           :publishing-function org-html-publish-to-html)
          ("images-school"
           :base-directory "~/Dropbox/org/drafts/school/img/"
           :base-extension any
           :recursive t
           :publishing-directory "~/publish/org/school/web/img/"
           :publishing-function org-publish-attachment)
          ("content-school"
           :base-directory "~/Dropbox/org/drafts/school/content/"
           :base-extension any
           :recursive t
           :publishing-directory "~/publish/org/school/content/"
           :publishing-function org-publish-attachment)
          ("website-school" :components ("orgfiles-school" "images-school" "content-school"))

          ("orgfiles-work"
           :base-directory "~/Dropbox/org/drafts/work/"
           :base-extension "org"
           :publishing-directory "~/publish/org/work/"
           :publishing-function org-html-publish-to-html)
          ("images-work"
           :base-directory "~/Dropbox/org/drafts/work/img/"
           :base-extension any
           :recursive t
           :publishing-directory "~/publish/org/work/img/"
           :publishing-function org-publish-attachment)
          ("content-work"
           :base-directory "~/Dropbox/org/drafts/work/content/"
           :base-extension any
           :recursive t
           :publishing-directory "~/publish/org/work/content/"
           :publishing-function org-publish-attachment)
          ("website-work" :components ("orgfiles-work" "images-work" "content-work"))))

  ;;; Misc configurations
  (setq org-latex-create-formula-image-program 'dvipng)
  (setq org-html-validation-link nil)
  (setq org-confirm-babel-evaluate nil)

  (setq org-mobile-inbox-for-pull "~/Dropbox/org/inbox.org")
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
  (setq org-mobile-files '("~/Dropbox/org"))
  (setq org-agenda-window-setup "only-window")
  (setq org-download-image-dir "~/Dropbox/org/drafts/img")

  (setq org-ref-default-bibliography '("~/Dropbox/org/drafts/content/references.bib"))

  (setq org-html-head "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.css\"/> <link rel=\"stylesheet\" href=\"http://assets.timothy.engineer/css/notes.css\"/>")

  ;; Set the default deft directory location and filetype
  (setq deft-directory "~/Dropbox/org/drafts")
  (setq deft-default-extension "org")

  ;; Flyspell configuration on Windows
  (when (eq system-type 'windows-nt)
    (setq ispell-program-name "C:\\Program Files (x86)\\Aspell\\bin\\aspell.exe"))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#eee8d5" t)
 '(org-agenda-files nil)
 '(org-structure-template-alist
   (quote
    (("s" "#+BEGIN_SRC ?

#+END_SRC")
     ("e" "#+BEGIN_EXAMPLE
?
#+END_EXAMPLE")
     ("q" "#+BEGIN_QUOTE
?
#+END_QUOTE")
     ("v" "#+BEGIN_VERSE
?
#+END_VERSE")
     ("V" "#+BEGIN_VERBATIM
?
#+END_VERBATIM")
     ("c" "#+BEGIN_CENTER
?
#+END_CENTER")
     ("C" "#+BEGIN_COMMENT
?
#+END_COMMENT")
     ("l" "#+BEGIN_EXPORT latex
?
#+END_EXPORT")
     ("L" "#+LaTeX: ")
     ("h" "#+BEGIN_EXPORT html
?
#+END_EXPORT")
     ("H" "#+HTML: ")
     ("a" "#+BEGIN_EXPORT ascii
?
#+END_EXPORT")
     ("A" "#+ASCII: ")
     ("i" "#+INDEX: ?")
     ("I" "#+INCLUDE: %file ?")
     ("t" "#+TITLE: ?")
     ("img" "#+NAME: fig:?
#+CAPTION: ")
     ("tbl" "#+NAME: tbl:?
#+CAPTION: "))))
 '(package-selected-packages
   (quote
    (platformio-mode company-lua nodemcu-mode lua-mode company-jedi jedi-core python-environment epc concurrent js-comint disaster company-c-headers cmake-mode clang-format zotxt request-deferred deferred ob-async org-ref pdf-tools key-chord ivy helm-bibtex biblio parsebib biblio-core tablist ess-smart-equals ess-R-data-view ctable ess julia-mode deft workgroups2 anaphora web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode sphinx-doc writeroom-mode visual-fill-column company-auctex auctex-latexmk auctex csv-mode flyspell-correct-helm flyspell-correct auto-dictionary org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data zenburn-theme zen-and-art-theme yapfify xterm-color white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slime-company slime shell-pop seti-theme reverse-theme rebecca-theme ranger railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pandoc-mode ox-pandoc ht orgit organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme multi-term monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme lush-theme live-py-mode light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme hy-mode dash-functional heroku-theme hemisu-theme helm-pydoc helm-gitignore helm-company helm-c-yasnippet hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme fuzzy flycheck-pos-tip pos-tip flycheck flatui-theme flatland-theme farmhouse-theme exotica-theme evil-magit magit magit-popup git-commit ghub let-alist with-editor espresso-theme eshell-z eshell-prompt-extras esh-help dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-statistics company-anaconda company common-lisp-snippets color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet yasnippet apropospriate-theme anti-zenburn-theme anaconda-mode pythonic ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((org-download-image-dir . "./img/cbecc-res-initial-report")
     (org-download-image-dir . "./img/cbecc-res"))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Mono" :foundry "outline" :slant normal :weight normal :height 90 :width normal))))
 '(fixed-pitch ((t (:family "Fira Mono"))))
 '(font-lock-comment-face ((t (:foreground "#93a1a1" :slant italic :family "Fira Code"))))
 '(markdown-bold-face ((t (:inherit bold))))
 '(markdown-header-delimiter-face ((t (:inherit markdown-header-face :foreground "gray"))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :height 140 :family "RobotoSlab"))))
 '(markdown-italic-face ((t (:inherit italic :slant italic))))
 '(markdown-math-face ((t (:inherit font-lock-string-face :family "Fira Mono"))))
 '(markdown-url-face ((t (:inherit font-lock-string-face :family "Fira Mono"))))
 '(org-block ((t (:foreground "#cb4b16" :family "Fira Code"))))
 '(org-code ((t (:foreground "#b58900" :family "Fira Code"))))
 '(org-date ((t (:foreground "#268bd2" :underline t :family "Fira Code"))))
 '(org-document-info-keyword ((t (:foreground "#859900" :family "Fira Code"))))
 '(org-document-title ((t (:foreground "#b58900" :weight bold :height 1.44 :family "Roboto Slab"))))
 '(org-level-1 ((t (:inherit outline-1))))
 '(org-level-2 ((t (:inherit outline-2))))
 '(org-meta-line ((t (:inherit font-lock-comment-face :family "Fira Code"))))
 '(org-special-keyword ((t (:foreground "#b58900"))))
 '(org-table ((t (:foreground "#6c71c4" :family "Fira Code"))))
 '(org-verbatim ((t (:inherit shadow :family "Fira Code"))))
 '(outline-1 ((t (:foreground "#268bd2" :family "Roboto Slab"))))
 '(outline-2 ((t (:inherit outline-1 :foreground "#6c71c4")))))
