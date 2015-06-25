(package-initialize)

;; Using marmalade for packages
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(menu-bar-mode -1)

;; no startup msg  
(setq inhibit-startup-message t)        ; Disable startup message 

;; This mode is for autocomplete file loading file 
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;; Kill whole line
(global-set-key (kbd "M-9") 'kill-whole-line)

;; Ctrl-K with no kill
(defun delete-line-no-kill ()
  (interactive)
  (delete-region
   (point)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
)
(global-set-key (kbd "C-k") 'delete-line-no-kill)

;; Standard Jedi.el setting
;;(require 'epc)
;;(setq jedi:setup-keys t)
;;(setq jedi:complete-on-dot t)
;;(setq(setq jedi:server-command '("python" "/home/mak/.emacs.d/elpa/jedi-0.1.2/jediepcserver.py"))
;;(setq jedi:tooltip-method '(pos-tip))
;;(autoload 'jedi:setup "jedi" nil t)
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)                 ; optional


;; Enable copy in terminal
(setq x-select-enable-clipboard t 
      x-select-enable-primary t)


;; this is for new 24.4 version 
;;(defun slick-cut (beg end)
;;  (interactive
;;   (if mark-active
;;       (list (region-beginning) (region-end))
;;     (list (line-beginning-position) (line-beginning-position 2)))))
;;
;;(advice-add 'kill-region :before #'slick-cut)

;;(defun slick-copy (beg end)
;;  (interactive
;;   (if mark-active
;;       (list (region-beginning) (region-end))
;;     (message "Copied line")
;;     (list (line-beginning-position) (line-beginning-position 2)))))

;;(advice-add 'kill-ring-save :before #'slick-copy)


;; for old version
(defadvice kill-ring-save (before slick-copy activate compile) "When called
  interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end)) (message
  "Copied line") (list (line-beginning-position) (line-beginning-position
  2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
        (line-beginning-position 2)))))




;; Org mode 
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)






(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140414/dict")
(ac-config-default)


;; Reload file when its changed, its not safe so commenting
;;(global-auto-revert-mode t)
