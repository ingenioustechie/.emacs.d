



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


;; Standard Jedi.el setting
;; (require 'epc)
;; (setq jedi:setup-keys t)
;; (setq jedi:complete-on-dot t)
;; (setq jedi:server-command '("python" "/home/mak/.emacs.d/elpa/jedi-0.1.2/jediepcserver.py"))
;; (setq jedi:tooltip-method '(pos-tip))
;; (autoload 'jedi:setup "jedi" nil t)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)                 ; optional
