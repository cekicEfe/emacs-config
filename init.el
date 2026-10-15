(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;(require 'nerd-icons)
;(require 'catppuccin-theme)
;(require 'multiple-cursors)
;(require 'company)
;(require 'xclip)
;(require 'magit)
;(require 'move-text)
;(require 'undo-tree)
;(require 'docker)

(require 'package)
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)   ; implies :ensure t for every use-package

(use-package ag)
(use-package company)
(use-package consult)
(use-package consult-ag)
(use-package docker)
(use-package embark)
(use-package embark-consult)
(use-package magit)
(use-package markdown-mode)
(use-package move-text)
(use-package multiple-cursors)
(use-package nerd-icons)
(use-package nix-mode)
(use-package nix-ts-mode)
(use-package qml-mode)
(use-package sed-mode)
(use-package transpose-frame)
(use-package undo-tree)
(use-package xclip)

(load-file "~/.emacs.d/display-config.el")
(load-file "~/.emacs.d/keybindings.el")

(global-undo-tree-mode)
(setq undo-tree-auto-save-history nil)

(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(setq ag-arguments (append ag-arguments '("--skip-vcs-ignores")))
(setq mc/always-run-for-all t)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

;; Init complete company version
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1)

;; Add xclip support so we can copy/paste from emacs
(xclip-mode 1) 

;; Dunno probably gets rid of redundant save files
;; Stole it from SO
(setq make-backup-files t  
      backup-directory-alist '(("." . "~/.emacs.d/backups/"))  
      version-control 't  
      kept-old-versions 2  
      kept-new-versions 2  
      delete-old-versions t  
      backup-by-copying-when-linked t  
      backup-by-copying t)  
(make-directory "~/.emacs.d/backups/" t)  

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(ag company consult consult-ag docker embark embark-consult magit
        markdown-mode move-text multiple-cursors nerd-icons nix-mode
        nix-ts-mode qml-mode sed-mode transpose-frame undo-tree xclip)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
