;; Catppuccin
(load-theme 'catppuccin :no-confirm)

;; For eshell colours
(add-hook 'eshell-mode-hook (lambda () (setenv "TERM" "xterm-256color"))) 

;; Linux/macOS/BSDs
(when (member system-type '(gnu gnu/linux gnu/kfreebsd darwin))
  (unless (find-font (font-spec :name "Symbols Nerd Font Mono"))
    (nerd-icons-install-fonts t)))

;; Inserts an icon for Emacs Lisp
(insert (nerd-icons-icon-for-file "init.el"))

;; Mess with the time display
(setq display-time-day-and-date t) 
(setq display-time-24hr t) ;; Set to 't' prefer 24-hour time format 'nil' otherwise
(display-time-mode 1)
(setq tab-bar-format '(tab-bar-format-tabs 
                       tab-bar-format-align-right 
                       tab-bar-format-global))    
    
;; Show line numbers
(global-display-line-numbers-mode)

;; Get rid of tool bar
(tool-bar-mode -1)

;; Get rid of menu bar
(menu-bar-mode -1)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Disable horizontal scroll bar
(horizontal-scroll-bar-mode -1)

;; Disable scroll bars
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)
