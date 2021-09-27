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

;; Set font family. The line below is for client mode
(set-face-attribute 'default nil :font "M PLUS 1 Code" :height 200 :weight 'regular)
(add-hook 'after-make-frame-functions (lambda(&optional frame) (set-face-attribute 'default nil :font "M PLUS 1 Code" :height 200 :weight 'regular)))


;; Keep folder clean, backup and autosave files stored in emacs folder
(make-directory (expand-file-name "tmp/backups/" user-emacs-directory) t)
(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))

(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)
(setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))


;; Key bindings
(require 'iso-transl)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-o") 'other-window)

;; Indent setup
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)


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

(use-package magit  :commands magit-status)

(use-package eshell-git-prompt :after eshell)

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



;;; init.el ends here


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(windsize which-key use-package python-mode magit hc-zenburn-theme flycheck doom-modeline counsel company-jedi auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-ellipsis ((t (:underline nil :weight normal))))
 '(org-level-1 ((t (:weight bold)))))
