;; ~/.emacs.d/init.el
;; Time-stamp: <2014-11-12 18:08:31 jc>

(load-theme 'zenburn t)

(add-hook 'before-save-hook 'time-stamp)

(fset 'yes-or-no-p 'y-or-n-p)

(scroll-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)
(show-paren-mode 1)
(column-number-mode 1)

;(ido-mode t)
(windmove-default-keybindings)

(setq-default cursor-in-non-selected-windows nil
	      indent-tabs-mode nil)

(setq inhibit-startup-screen t
      uniquify-buffer-name-style 'forward)

(setq gnus-home-directory "~/.emacs.d/gnus"
      message-directory (expand-file-name "Mail/" gnus-home-directory))

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))


;; PKGBUILD

(when (locate-library "pkgbuild-mode")
  (require 'pkgbuild-mode)
  (add-to-list 'auto-mode-alist '("/PKGBUILD$" . pkgbuild-mode)))

;; GnuTLS

(setq gnutls-min-prime-bits 1024)

;; MELPA
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-hook 'before-save-hook 'gofmt-before-save)
