;; ----------------------------------------------------------------------------
;; ----------------------------------------------------------------------------
;;    _______   ____  __   ______
;;   / ____/ | / / / / /  / ____/___ ___  ____ ___________
;;  / / __/  |/ / / / /  / __/ / __ `__ \/ __ `/ ___/ ___/
;; / /_/ / /|  / /_/ /  / /___/ / / / / / /_/ / /__(__  )
;; \____/_/ |_/\____/  /_____/_/ /_/ /_/\__,_/\___/____/
;; ----------------------------------------------------------------------------
;; My Personal GNU Emacs Configuration
;; ----------------------------------------------------------------------------

;; don't create backups in same directory as source file
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; ----------------------------------------------------------------------------
;; PACKAGE MANAGEMENT
;; ----------------------------------------------------------------------------

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("elpa"  . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; ----------------------------------------------------------------------------
;; APPEARANCE SETTINGS
;; ----------------------------------------------------------------------------

;; no default startup screen!
;; (setq inhibit-startup-message t)
(use-package dashboard
  :ensure t
  :config
  (setq dhasboard-startup-banner 'official)
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-init-info t)
  (setq initial-buffer-choice (lambda() (get-buffer "*dashboard*")))
  (setq dashboard-items '((recents   . 5)
                          (bookmarks . 5)
;;                          (projects  . 5)
                          (agenda    . 5)
                          (registers . 5)))
  (dashboard-modify-heading-icons '((bookmarks . "book")))
  (dashboard-setup-startup-hook))

;; Set up the visible bell
(setq visible-bell t)

;; Cleanup the sidebars
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar

;; Setup line numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers in some modes
(dolist (mode '(term-mode-hook
                eshell-mode-hook
                org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Set custom font (type face)

;; Set default face
;;(set-face-attribute 'default nil :font "Fira Code" :height 100)
;;(set-face-attribute 'default nil :font "xos4 Terminus" :height 110)
(set-face-attribute 'default nil :font "Iosevka Term" :height 100)

;; Set the fixed pitch face
;;(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height 110)

;; Set the variable pitch face
;;(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 110)

;; to install the fonts, you must also run this command
;;    M-x all-the-icons-install-fonts
(use-package all-the-icons)

;; Modeline needs the icons above to be installed
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Setup the gruvbox theme lol
(use-package gruvbox-theme
  :init (load-theme 'gruvbox-dark-hard t))

;; rainbow delimiters for programming parenthesis
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; configure aesthetically pleasing tabs
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-height 24)
  (setq centaur-tabs-set-bar 'over)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker  "●")
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>"  . centaur-tabs-forward))

;; ----------------------------------------------------------------------------
;; CUSTOM KEYBINDINGS
;; ----------------------------------------------------------------------------

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Useful package to show what keybindings are available
;; under each prefix
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.3))

;; Setup evil mode
(use-package evil
  :ensure t
  :init (setq evil-want-keybinding nil)
  :config (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config (evil-collection-init))

;; ----------------------------------------------------------------------------
;; AUTOCOMPLETION ENGINE 
;; ----------------------------------------------------------------------------

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; ----------------------------------------------------------------------------
;; GIT CONFIGURATION
;; ----------------------------------------------------------------------------

(use-package magit)

;; ----------------------------------------------------------------------------
;; ORG MODE SETTINGS
;; ----------------------------------------------------------------------------

;; Create a function that sets up fonts for org-mode
(defun zamlz/org-font-setup ()
  ;; Converts bullet lists to not use the - character but the • character
  (font-lock-add-keywords 'org-mode
    '(("^ *\\([-]\\) "
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.5)
    (org-level-2 . 1.25)
    (org-level-3 . 1.10)
    (org-level-4 . 1.0)
    (org-level-5 . 1.1)
    (org-level-6 . 1.1)
    (org-level-7 . 1.1)
    (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil
      :font "Iosevka Term"
      :weight 'regular
      :height (cdr face))))

;; Setup org-mode
(use-package org
  :config
  (setq org-ellipsis " ▾")
  (setq org-log-done t)
  (setq org-agenda-files (list "~/org"))
  (zamlz/org-font-setup))

;; Change the bullet appearance of org-mode headings
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "●" "○" "●" "○" "●" "○")))

(defun zamlz/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . zamlz/org-mode-visual-fill))

;; Custom keybindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; ----------------------------------------------------------------------------
;; ----------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ivy which-key visual-fill-column use-package spacemacs-theme rainbow-delimiters org-bullets moe-theme magit gruvbox-theme git-auto-commit-mode general evil-collection doom-themes doom-modeline dashboard command-log-mode centaur-tabs)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
