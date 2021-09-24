;;; init.el --- minimal Emacs setup for GUI
;;; Author: Zhao Shuyang
;;; Commentary:
;;; Code:


(setq inhibit-startup-screen t
	  initial-major-mode 'org-mode
	  initial-scratch-message "#+TITLE: Org")

;; Initialize pakcage ecosystem
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux and Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)


(setq frame-title-format "%b")
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 12)
(column-number-mode)

;; (global-auto-complete-mode t)
;; (blink-cursor-mode 1)

;;(size-indication-mode t)
;;(global-display-line-numbers-mode t)
;;(set-face-attribute 'default nil :font "M+ 2m" :height 190)
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 180)



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
  (load-theme 'hc-zenburn t)
  )



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
  :init (global-flycheck-mode t))

(use-package company
  :diminish
  :init (global-company-mode t)
  :config (setq company-idle-delay 0))

(use-package company-jedi)

(use-package python-mode
  :init (add-to-list 'company-backends 'company-jedi)
  :config
  (setq python-shell-interpreter "/usr/bin/python3")
  
  )

(use-package magit
  :commands magit-status
)

(use-package org
  :bind ("C-l" . org-latex-preview)
  :config (setq org-support-shift-select t)
  (setq org-ellipsis " ▾")
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))
  :custom-face
  (org-ellipsis ((t (:underline nil :weight normal))))
  (org-level-1 ((t (:weight bold))))
  )

(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-PDF-mode t))


(use-package windsize
  :bind ("C-x w" . windresize))


(set-face-attribute 'default nil :font "M PLUS 1 Code" :height 190 :weight 'regular)
(set-face-attribute 'variable-pitch nil :font "Segoe UI" :height 170 :weight 'regular)


;; Below is the face setting command for client mode
(add-hook 'after-make-frame-functions (lambda(&optional frame) (set-face-attribute 'default nil :font "M PLUS 1 Code" :height 190 :weight 'regular)))

;;; init.el ends here


