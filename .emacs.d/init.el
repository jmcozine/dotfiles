<<<<<<< HEAD
=======
;; ~/.emacs.d/init.el
;; Time-stamp: <2019-02-06 12:19:19 jc>

>>>>>>> db4fac6b98ede9eee26c4b6568dfd81a2173f745
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;(require 'diminish)
(require 'bind-key)

;; themes
(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

(fset 'yes-or-no-p 'y-or-n-p)

(blink-cursor-mode 0)
(show-paren-mode 1)
(column-number-mode 1)

(windmove-default-keybindings)

(setq-default cursor-in-non-selected-windows nil)
(setq-default indent-tabs-mode nil)

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; PKGBUILD

(use-package pkgbuild-mode
             :mode "/PKGBUILD$")

;; GnuTLS

(setq gnutls-min-prime-bits 1024)

<<<<<<< HEAD
;; Org-journal
(use-package org-journal
  :ensure t
  :config (setq org-journal-enable-encryption nil
                org-journal-date-format "%A, %F"
                org-journal-file-header "#+TITLE: Journal for %Y
#+OPTIONS: toc:nil num:nil
#+LATEX_CLASS_OPTIONS: [titlepage]
#+LATEX_HEADER: \\usepackage{palatino}
#+LATEX_HEADER: \\usepackage{fancyhdr}
#+LATEX_HEADER: \\fancypagestyle{empty}{\\fancyhf{} \\fancyhf[C]{CUI//SP-PRVCY}}
#+LATEX_HEADER: \\pagestyle{fancy}
#+LATEX_HEADER: \\fancyhf{}
#+LATEX_HEADER: \\renewcommand{\\headrulewidth}{0pt}
#+LATEX_HEADER: \\fancyhf[C]{CUI//SP-PRVCY}
#+LATEX_HEADER: \\fancyfoot[R]{\\thepage}
"))

(setq org-journal-file-type 'yearly)

;; (defun org-journal-save-entry-and-exit()
;;   "Simple convenience function.
;;   Saves the buffer of the current day's entry and kills the window
;;   Similar to org-capture like behavior"
;;   (interactive)
;;   (save-buffer)
;;   (kill-buffer-and-window))
;; (define-key org-journal-mode-map (kbd "C-x C-s") 'org-journal-save-entry-and-exit)
=======
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
                            (company-mode)
                            (setq tab-width 4)
                            (setq indent-tabs-mode 1))))

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
(use-package twittering-mode
  :config (setq twittering-use-master-password t))
>>>>>>> db4fac6b98ede9eee26c4b6568dfd81a2173f745

(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

<<<<<<< HEAD
=======
;; Org-journal
;; (use-package org-journal
;;   :ensure t
;;   :config (setq org-journal-enable-encryption nil))

;; ledger
(use-package ledger-mode
  :ensure t
  :mode "\\.dat\\'")

;; tramp
(setq tramp-default-method "ssh")
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

(add-to-list 'load-path "/home/jc/.emacs.d/site-lisp")
(require 'beancount)
(add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))

(setq org-element-use-cache nil)

;; quote region
(global-set-key (kbd "M-\"") 'insert-pair)

>>>>>>> db4fac6b98ede9eee26c4b6568dfd81a2173f745
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
<<<<<<< HEAD
   '(zenburn-theme wc-mode use-package s org-journal magit-popup magit ledger-mode helm diminish company-go)))
=======
   (quote
    (company-jedi org-mode powershell pass helm-pass zenburn-theme wc-mode use-package twittering-mode pinentry org-journal org magit ledger-mode helm-go-package helm-emms flycheck company-go auctex))))
>>>>>>> db4fac6b98ede9eee26c4b6568dfd81a2173f745
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )