;; ~/.emacs.d/init.el
;; Time-stamp: <2014-06-28 16:02:58 jc>


;; Load zenburn theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'zenburn t)


;; Set fonts

(add-to-list 'default-frame-alist '(font . "Terminus-12"))
;; (set-fontset-font "fontset-default" 'han
;; 		  '("WenQuanYi Bitmap Song" . "unicode-bmp"))


;; Generic

(add-hook 'before-save-hook 'time-stamp)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (add-hook 'calendar-today-visible-hook 'calendar-mark-today)
;; (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(add-to-list 'load-path "~/.emacs.d/site-lisp")
(ffap-bindings)
(windmove-default-keybindings)

(fset 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(line-number-mode 1)
(desktop-save-mode 1)
(blink-cursor-mode 0)
(display-time-mode 1)
(column-number-mode 1)
;; (display-battery-mode 1)
(delete-selection-mode 1)

(setq-default cursor-in-non-selected-windows nil
 	      indent-tabs-mode nil
              major-mode 'text-mode)

(setq initial-buffer-choice t
      track-eol t)


;; Mail/Usenet

(setq ;;user-full-name "James Cozine"
      user-mail-address "jmcozine@gmail.com"
      message-send-mail-function 'smtpmail-send-it
      gnus-home-directory "~/.emacs.d/gnus"
      message-directory (expand-file-name "Mail/" gnus-home-directory))


;; Buffers

(iswitchb-mode 1)
(require 'ido)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;; VC

;; (setenv "CVS_RSH" "ssh")
;; (setq diff-switches "-u"
;;       vc-diff-switches diff-switches
;;       vc-cvs-global-switches "-z3")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)


;; ;; Calendar/Diary

;; (setq calendar-mark-diary-entries-flag t
;;       diary-file "~/.emacs.d/diary"
;;       display-time-24hr-format t)


;; ;; AUCTeX

;; (when (locate-library "auctex")
;;   (load "auctex.el" nil t t)
;;   (load "preview-latex.el" nil t t))


;; ;; BBDB

;; (when (locate-library "bbdb")
;;   (require 'bbdb)
;;   (bbdb-initialize 'gnus 'message)
;;   (bbdb-insinuate-gnus)
;;   (setq bbdb-quiet-about-name-mismatches t))


;; ;; Contacts

;; (when (locate-library "google-contacts")
;;   (require 'google-contacts)
;;   (require 'google-contacts-gnus)
;;   (require 'google-contacts-message))


;; PKGBUILD

(when (locate-library "pkgbuild-mode")
  (require 'pkgbuild-mode)
  (add-to-list 'auto-mode-alist '("/PKGBUILD$" . pkgbuild-mode)))


;; ;; Lua

;; (when (locate-library "lua-mode")
;;   (require 'lua-mode)
;;   (add-to-list 'auto-mode-alist '("\.lua$" . lua-mode)))


;; ;; Dictionary

;; (when (locate-library "dictionary-init")
;;   (load "dictionary-init")
;;   (global-set-key "\C-cs" 'dictionary-search))

;; ;; EMMS

;; (require 'emms-setup)
;; (emms-standard)
;; (emms-default-players)
;; (require 'emms-player-mpd)
;; (add-to-list 'emms-info-functions 'emms-info-mpd)
;; (add-to-list 'emms-player-list 'emms-player-mpd)
;; (setq emms-player-mpd-music-directory "/data/audio/Music")
;; (setq emms-source-file-default-directory "/data/audio/Music")


;; ;; Personal

;; ;; (load "~/.emacs.d/notes-mode.el")


;; ;; Word Count

;; ;; (add-to-list 'load-path "/home/jc/.emacs.d/site-lisp")
;; ;; (when (locate-library "wc-mode")
;; ;;   (require 'wc-mode))


;; Org
(setq org-agenda-file '("~/Documents/work.org"))


;; Arduino
(when (locate-library "arduino-mode")
  (require 'arduino-mode))


;; ;; PHP
;; (autoload 'php-mode "php-mode.el" "PHP mode." t)
;; (setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))

;; GnuTLS

(setq gnutls-min-prime-bits 1024)

;; Magit
(when (locate-library "magit")
  (require 'magit))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9f443833deb3412a34d2d2c912247349d4bd1b09e0f5eaba11a3ea7872892000" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
