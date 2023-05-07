(setq user-full-name "Zhao Shuyang")
(setq user-mail-address "contact@zhaoshuyang.com")

(setq inhibit-startup-screen t
      initial-buffer-choice 'shell)

;; Initialize pakcage ecosystem
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
;; This a emacs configuration file following emacs from scratch

(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux and Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)


;; (setq visible-bell t)

(setq frame-title-format "%b")
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(toggle-scroll-bar -1)

(column-number-mode)

;; Key bindings
(require 'iso-transl)
(global-set-key (kbd "<dead-tilde><dead-tilde>") "~")
(global-set-key (kbd "<dead-acute><dead-acute>") "´")
(global-set-key (kbd "<S-dead-circumflex><S-dead-circumflex>") "^")
(global-set-key (kbd "<S-dead-grave><S-dead-grave>") "`")
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-o") 'other-window)

;; Indent setup
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)

(setq sh-basic-offset 2)

(use-package hc-zenburn-theme
  :ensure t
  :load-path "themes"
  :init
  (setq hc-zenburn-theme t)
  :config
  (load-theme 'hc-zenburn t))

;;(require 'font-lock)

(use-package all-the-icons :defer 0.5)
;;(use-package all-the-icons)

(set-face-attribute 'default nil :font "M PLUS 1 Code" :height 200 :weight 'regular)
(set-face-attribute 'mode-line nil :font "M PLUS 1 Code" :height 200 :weight 'regular)
(add-hook 'after-make-frame-functions
		  (lambda(&optional frame)
			(set-face-attribute 'default nil :font "M PLUS 1 Code" :height 200 :weight 'regular)))

(add-to-list 'default-frame-alist '(fullscreen . maximized))


;;(use-package doom-modeline
;;  :init (doom-modeline-mode 1)
;;  :custom ((doom-modeline-height 20)
;;           (doom-modeline-hud t)))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
         ("RET" . ivy-alt-done))
  :init (ivy-mode 1))

(use-package counsel
  :diminish
  :config
  (counsel-mode 1))

(use-package company
  :diminish
  :init (global-company-mode t)
  :config (setq company-idle-delay 0))

(use-package which-key
  :diminish
  :defer 0
  :config (which-key-mode)
  (setq which-key-idle-delay 1))

;;(setq python-shell-interpreter "~/../Local/Programs/Python/Python310/python.exe")


;; Windows settings
(setq default-directory "~/")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'exec-path "C:/cygwin64/bin")

(load "image2text-data-validation.el")

(require 'tramp)
(setq default-tramp-method "plink")
;;(customize-set-variable 'tramp-encoding-shell "/bin/bash")

;;(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
                    vc-ignore-dir-regexp
                    tramp-file-name-regexp))
(setq tramp-verbose 8)

(setq recentf-auto-cleanup 'never)
(setq w32-get-true-file-attributes nil)

(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)

(setq remote-file-name-inhibit-cache nil)
(setq vc-handled-backends nil)

(use-package jedi)
(use-package company-jedi)
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)

(use-package python-mode
  :init  (add-to-list 'company-backends 'company-jedi)
  :config
  (setq python-shell-interpreter "~/AppData/Local/Programs/Python/Python310/python.exe"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(jedi company-jedi python-mode which-key use-package hc-zenburn-theme doom-modeline counsel all-the-icons-gnus all-the-icons-dired)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
