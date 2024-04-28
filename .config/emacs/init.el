(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq visible-bell t)

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

(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(su systemd tmux-pane tmux-mode zenburn-theme wc-mode use-package s org-journal magit-popup magit ledger-mode helm diminish company-go)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
