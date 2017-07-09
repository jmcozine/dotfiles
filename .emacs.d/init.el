;; ~/.emacs.d/init.el
;; Time-stamp: <2017-07-04 22:17:57 jc>

(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(setenv "PATH" (concat (getenv "PATH") ":/home/jc/bin"))

;; packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; themes
(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

;; defaults
(add-hook 'before-save-hook 'time-stamp)

(fset 'yes-or-no-p 'y-or-n-p)

(blink-cursor-mode 0)
(show-paren-mode 1)
(column-number-mode 1)

(windmove-default-keybindings)

(setq-default cursor-in-non-selected-windows nil)
(setq-default indent-tabs-mode nil)

(setq uniquify-buffer-name-style 'forward)
(setq visible-bell t)

(setq gnus-home-directory "~/.emacs.d/gnus"
      message-directory (expand-file-name "Mail/" gnus-home-directory))

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq browse-url-browser-function 'eww-browse-url)

;; list buffers

(add-hook 'dired-mode-hook 'auto-revert-mode)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; PKGBUILD

(use-package pkgbuild-mode
             :mode "/PKGBUILD$")

;; GnuTLS

(setq gnutls-min-prime-bits 1024)

;; Golang

(use-package company-go
  :ensure t
  :config
  (setq company-go-gocode-command "/home/jc/bin/gocode"))

(use-package go-mode
  :ensure t
;  :init (require 'go-mode-autoloads)
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode))))

;; Word Count
(use-package wc-mode
  :ensure t)

;; Magit
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; Helm
(use-package helm
  :ensure t
  :diminish helm-mode
  :init (require 'helm-config)
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-z" . helm-select-action))
  :config (setq helm-split-window-in-side-p t
                helm-ff-file-name-history-use-recentf t))

;; Twittering
;; (use-package twittering-mode
;;   :config (setq twittering-use-master-password t))

;; Org-journal
(use-package org-journal
  :ensure t
  :config (setq org-journal-enable-encryption nil))

(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; tramp
(setq tramp-default-method "ssh")
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

;;(add-to-list 'load-path "/home/jc/.emacs.d/site-lisp")
;;(require 'beancount)
;;(add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))

;; quote region
(global-set-key (kbd "M-\"") 'insert-pair)

(use-package elfeed
  :ensure t)

(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elfeed-org elfeed zenburn-theme wc-mode use-package org-journal magit ledger-mode helm company-go))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
