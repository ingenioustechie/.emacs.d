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
;; (setq(setq jedi:server-command '("python" "/home/mak/.emacs.d/elpa/jedi-0.1.2/jediepcserver.py"))
;; (setq jedi:tooltip-method '(pos-tip))
;;(autoload 'jedi:setup "jedi" nil t)
;;(add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)                 ; optional


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes (quote ("9a9e75c15d4017c81a2fe7f83af304ff52acfadd7dde3cb57595919ef2e8d736" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))




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
