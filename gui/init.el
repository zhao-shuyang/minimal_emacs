;;; init.el --- minimal Emacs setup for GUI
;;; Author: Zhao Shuyang
;;; Commentary:
;;; Code:


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


;; GUI setup
(setq inhibit-startup-screen t)
;; (setq visible-bell t)

(setq frame-title-format "%b")
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(column-number-mode)

;; (global-auto-complete-mode t)
;; (blink-cursor-mode 1)

;;(size-indication-mode t)
;;(global-display-line-numbers-mode t)
(set-face-attribute 'default nil :font "M+ 2m" :height 190)
(set-face-attribute 'fixed-pitch nil :font "M+ 1mn" :height 190)
(set-face-attribute 'variable-pitch nil :font "M+ 2m" :height 190)


;; Key bindings
(require 'iso-transl)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-o") 'other-window)

;; Indent setup
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)

;;(use-package doom-themes
  ;;:init (load-theme 'doom-palenight t))

(use-package hc-zenburn-theme
  :ensure t
  :load-path "themes"
  :init
  (setq hc-zenburn-theme t)
  :config
  (load-theme 'hc-zenburn t))

(use-package all-the-icons :defer 0.5)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 14)))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
		 :map ivy-minibuffer-map
         ("RET" . ivy-alt-done)
		 )
  :init (ivy-mode 1))

(use-package counsel
  :diminish
  :config
  (counsel-mode 1))

(use-package which-key
  :diminish
  :defer 0
  :config (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package flycheck
  :init (global-flycheck-mode t)
  (flycheck-add-next-checker 'python-flake8 'python-pylint))

(use-package company
  :init(global-company-mode t)
  :config (setq company-idle-delay 0))

(use-package company-jedi)

(use-package python-mode
  :init (add-to-list 'company-backends 'company-jedi))

(use-package magit
  :commands magit-status
)

(use-package org)

(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-PDF-mode t))



;;; init.el ends here

