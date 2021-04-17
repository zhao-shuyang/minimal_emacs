(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))

  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t))
  
(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t))

(package-initialize)

(load-theme 'zenburn  t)

(custom-set-variables
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))) 
 '(inhibit-startup-screen t)
 '(ivy-mode t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 )

;; Using ibuffer 
(global-set-key (kbd "C-x C-b") 'ibuffer)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))


