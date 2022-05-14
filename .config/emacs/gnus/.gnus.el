(setq gnus-select-method '(nntp "news.gmane.org"))

;(setq gnus-secondary-select-methods '((nntp "news.gwene.org")))

(setq gnus-save-newsrc-file nil
      gnus-read-newsrc-file nil
      gnus-save-killed-list nil
      gnus-check-new-newsgroups nil
      gnus-startup-file "~/.emacs.d/gnus/newsrc"
      ;gnus-treat-from-gravatar 'head
      gnus-treat-body-boundary nil)

(setq mm-discouraged-alternatives '("text/html"))
