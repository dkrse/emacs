;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)
;;; excutable paths (for unix commands from MSYS and git from msysgit)


;; no
(setq make-backup-files nil)

;;update dired files
;;(revert-buffer) ;; g

;;auto reload file
(global-auto-revert-mode t)
;;only y, n
(fset 'yes-or-no-p 'y-or-n-p)
;;tab for... 
(setq-default tab-width 4
              indent-tabs-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (projectile smooth-scrolling scroll-restore smex ripgrep exec-path-from-shell helm-gtags counsel-gtags company-ctags ctags-update auto-complete-exuberant-ctags ggtags phi-search wgrep undo-tree hlint-refactor clang-format idle-highlight-mode cmake-mode counsel-etags ac-etags helm-etags-plus helm-cscope helm company irony hydra magit color-theme swiper)))
 '(safe-local-variable-values
   (quote
    ((projectile-tags-file-name . testik)
     (encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;--------------------------------------------------------------------------------------------------------
;; projectile
(setq projectile-use-git-grep t)



;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;tema
(load-theme 'sanityinc-solarized-light t)
 
;;hladanie retazca
;;ctrl + f + hladanie retazca
;;ctrl + shift + f - hladanie retazca na poziicii kurzora
;;M-s . - hladanie retazca na poziicii kurzora, pohyb Ctrl+s

;;zvacsenie zmansenie pisma
;;ctrl x ctrl +
;;ctrl x ctrl -

;;select rectangle of text
;;ctrl-x space
;;ctrl-RET (RET - enter)
;;M-x (rectangle-mark-mode)

;;Prvy Znak V Kazdom Slove Vybranej Oblasti
;;M-x (capitalize-region)
;;M-x (upcase-initials-region

;;selectovana oblast na vsetko velke
;;M-x (upcase-region)

;;selectovana oblast na vsetko male
;;M-x (downcase-region)

;;text na zaciatok kazdeho riadku (select oblasti)
;;M-x (string-insert-rectangle)

;;text na koniec kazdeho riadku (select oblasti)
;;M-x (replace-regexp) RET $ RET text RET

;;autometicke doplnanie
;;M-x(global-auto-complete-mode t)
;;company-mode is better

;;highlight words
;;M-x(idle-highlight-mode)

;;pocet riadkov, znakov, slov oznaceneho regionu
;;M-=
;;--------------------------------------------------------------------------------------------------------

;;(load-theme 'sanityinc-solarized-dark t)

;;ido mod - 
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

;;scroll mouse slower

;;normal text mode--
(setq initial-major-mode 'text-mode)


;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)

;; scroll window under mouse
(setq mouse-wheel-follow-mouse 't) 


;;bez toolbaru
(tool-bar-mode -1)

;;full name path
(setq frame-title-format
      '("" invocation-name ": "(:eval (if buffer-file-name (abbreviate-file-name buffer-file-name) "%b"))))

;;namiesto <esc> <esc> <esc> (3x esc)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;;zabrani zatvoreniu okien, okrem spodneho M-x
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))


(global-set-key (kbd "<C-mouse-4>") (lambda () (interactive) (text-scale-decrease 1)))
(global-set-key (kbd "<C-mouse-wheel-up>") (lambda () (interactive) (text-scale-increase 1)))


;;case sensitive hladanie
;;(setq case-fold-search nil) 

;;kurzor, box and bar
;;(setq-default cursor-type 'box)
(setq-default cursor-type 'bar)

;;zvyraznenie riadku
;;(global-hl-line-mode 1)

;;change size ctrl x ctrl + -
;;pismo
(set-face-attribute 'default nil :height 100 :family "Consolas")
;;(set-face-attribute 'default nil :height 105 :family "Fira Code")

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

(global-set-key (kbd "<f7>") (kbd "C-u C-c C-c"))

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
(global-set-key (kbd "C-S-f") 'swiper-thing-at-point)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-o") 'counsel-find-file)
(global-set-key (kbd "C-x n") 'create-new-buffer)
;;find string under cursor in files
(global-set-key (kbd "<f3>") 'recursive-grep)

;;(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; ak je subor vacsi nezasekava sa tak
(setq jit-lock-defer-time 0)
(setq fast-but-imprecise-scrolling t)

;;
(setq recentf-auto-cleanup 'never)

 ;; pre vacsie subory
  (defun check-large-file ()
    (when (> (buffer-size) (* 1024 1024))
      (when (y-or-n-p "Open file literally?")
        ;;(setq buffer-read-only t)
        (buffer-disable-undo)
        (fundamental-mode))))
  (add-hook 'find-file-hook 'check-large-file)

;; highlight double click
(defun highlight-thing-double-click ()
  (interactive)
   (unhighlight-regexp t)
   (highlight-symbol-at-point)
;;   (backward-word)
;;   (mark-word)
   )
(global-set-key [double-mouse-1] 'highlight-thing-double-click)


(require 'hi-lock)
(defun jpt-toggle-mark-word-at-point ()
  (interactive)
  (if hi-lock-interactive-patterns
      (unhighlight-regexp (car (car hi-lock-interactive-patterns)))
    (highlight-symbol-at-point)))

;;(global-set-key [double-mouse-1] 'jpt-toggle-mark-word-at-point)

;;un-highlight
(defun un-highlight ()
  (interactive)
  (unhighlight-regexp t))
 
(defun run-bash ()
      (interactive)
      (let ((shell-file-name "C:/Program Files/Git/bin/bash.exe"))
        (shell "*bash*")))

;;tento
(defun rep-str (what with in)
  (interactive)
  (message "co = %S s =  %S v = %S" what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

(defun test-fun (str)
    (interactive)
  (let ((ss (replace-regexp "[ ]+" "" "tento")))
    (message ss)))

(defun xx ()
  "print current word."
  (interactive)
  (message "%s" (thing-at-point 'word)))


(setq prettify-symbols-unprettify-at-point 'right-edge)
(setq inhibit-compacting-font-caches t)

;;moje moje mi xxx moje moja moje

;;(defun echo-char ()
;;  (if (eq this-command 'self-insert-command)
;;      (message "Inserted %s" (save-excursion
;;                               (backward-char)
;;                               (thing-at-point 'char)))))

;;(add-hook 'x- #'echo-char)

;;(with-selected-window (get-buffer-window YOUR-BUFFER)
;;  (goto-char (point-max)))

(defun foo () (insert "ABCDE"))
;;(add-hook 'find-file-hook)
;;(add-hook 'post-self-insert-hook #'foo)

;;doplni meno suboru... 
(autoload 'comint-dynamic-complete-filename "comint" nil t)
(global-set-key (kbd "C-x t") 'comint-dynamic-complete-filename)

(defun akt-dat ()
  "Insert string for the current time formatted like '2:34 PM'."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string  "%Y-%m-%d %T")))

;;----------------------------------------------------------------------------
;;copy paste s oznacenym suborom  
(defun filter-buffer-substring-add-line (func beg end delete)
  (concat
   (format "//---> line:%5d file: [%s]\n"
           (line-number-at-pos beg)
           (or (buffer-file-name) (buffer-name)))
   (funcall func beg end delete)
   (format "\n//<--- line:%5d" (line-number-at-pos end))))

(defun int-mod ()
  (interactive)
  (if (memq 'filter-buffer-substring-add-line
            filter-buffer-substring-functions)
      (progn
        (setq filter-buffer-substring-functions
              (delq 'filter-buffer-substring-add-line
                    filter-buffer-substring-functions))
        (message "int-mod je off!"))
    (push 'filter-buffer-substring-add-line
          filter-buffer-substring-functions)
    (message "int-mod je on!")))

;;----------------------------------------------------------------------------

(add-hook 'find-file-hook
  (lambda ()
    (setq hl-line-mode +1)))

(defun meno-suboru ()
  (when (string= (file-name-nondirectory (buffer-file-name)) "moj.txt")
    ;;(toggle-truncate-lines 1)
      (global-hl-line-mode 1)))
(add-hook 'find-file-hook 'meno-suboru)

;;vytvori novy buffer
(defun create-new-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer "buffer")))


(require 'hi-lock)
(defun jpt-toggle-mark-word-at-point ()
  (interactive)
  (if hi-lock-interactive-patterns
      (unhighlight-regexp (car (car hi-lock-interactive-patterns)))
    (highlight-symbol-at-point)))

(global-set-key (kbd "M-,") 'jpt-toggle-mark-word-at-point)

;;anotacia todo:
(defun annotate-todo ()
  "put fringe marker on TODO: lines in the curent buffer"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "TODO:" nil t)
      (let ((overlay (make-overlay (- (point) 5) (point))))
        (overlay-put overlay
                     'before-string (propertize "A"
                                                'display'(left-fringe right-triangle)))))))

(set-window-margins nil 1)
(set-fringe-mode 0)


;; (defun gcm-scroll-down ()
;;       (interactive)
;;       (scroll-up 1))
;;     (defun gcm-scroll-up ()
;;       (interactive)
;;       (scroll-down 1))
;;     (global-set-key [(control down)] 'gcm-scroll-down)
;;     (global-set-key [(control up)]   'gcm-scroll-up)
;; 

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;;(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;;for grep in ms windows
(setenv "PATH"
  (concat
   ;; Change this with your path to MSYS bin directory
   "c:\\Program Files\\Git\\usr\\bin;"
   (getenv "PATH")))

(add-to-list 'exec-path "c:\\Program Files\\Git\\usr\\bin;")
(setenv "PATH" (mapconcat #'identity exec-path path-separator))

;;najde retazec v suboroch...
;; i -  case insensitive
;; n - print line number;
;; I - ignore binary files
;; E - extended regular expressions;
;; r - recursive"
(defun recursive-grep ()
(interactive)
  (let* ((search-term (read-string "find in files:  "(thing-at-point 'word 'no-properties)))
         (search-path
           (directory-file-name (expand-file-name (read-directory-name "directory:  "))))
         (default-directory (file-name-as-directory search-path))
         (grep-command
           (concat
             grep-program
             " "
             "-nIEr --color=always"
             " "
             search-term
             " "
             search-path)))
    (compilation-start grep-command 'grep-mode (lambda (mode) "*grep*") nil)))


	
