;; ~/.emacs.d/init.el
;; Time-stamp: <2015-10-09 16:52:38 jc>

(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; themes
(use-package zenburn-theme
  :ensure t
  :init (load-theme 'zenburn t))

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


;; list buffers

(defalias 'list-buffers 'ibuffer)
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
  :ensure t)

(use-package go-mode
  :ensure t
  :init (require 'go-mode-autoloads)
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends)
                                 '(company-go))
                            (company-mode))))

;; Word Count
(use-package wc-mode
  :ensure t)

;; Magit
(use-package magit
  :ensure t
  :config (define-key magit-status-mode-map (kbd "q") 'magit-quit-session))
