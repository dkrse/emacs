;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)
(custom-set-variables
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages (quote (hydra magit color-theme swiper))))
(custom-set-faces
)

;;(load-theme 'sanityinc-solarized-dark t)

;;ido mod - 
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

;;bez toolbaru
(tool-bar-mode -1)

;;kurzor, box and bar
(setq-default cursor-type 'box)

;;zvyraznenie riadku
;;(global-hl-line-mode 1)

;;pismo
(set-face-attribute 'default nil :height 115 :family "Consolas")

;;ukladanie
;;(setq backup-directory-alist '(("." . "~/emacs_saves")))

;;recent files max 10 
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 10)

;;startup screen + message
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

(global-set-key (kbd "M-<f4>") 'save-buffers-kill-emacs)
(global-set-key (kbd "C-x C-x") 'kill-this-buffer)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;ctrl x 2 --split horizontal
;;ctrl x 3 --split vertical
;;ctrl x 0 --unsplit
(global-set-key (kbd "C-<tab>") 'other-window)

;;undo rendo
(global-set-key (kbd "C-y") 'redo)
(global-set-key (kbd "C-z") 'undo)

;;for windows ctrl a, ctrl c, ctrl v, ctrl x
(cua-mode t)
 (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
 (transient-mark-mode 1) ;; No region when it is not highlighted
 (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;;(global-set-key (kbd "C-v") 'clipboard-yank)

;;zatvorky
(show-paren-mode 1)		

;;numbers of lines
(global-display-line-numbers-mode 1)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-f") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-o") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
