;; Rebind buffer list to neater version
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ------ Move Text Keybindings -------
(global-set-key (kbd "M-<down>") 'move-text-down)
(global-set-key (kbd "M-<up>") 'move-text-up)

;; ------ Move Window Keybindings -------
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; ------ Edit Multiple Lines ------
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)

;; For auto complete without company
(global-set-key (kbd "M-SPC") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-list
        try-expand-line))

;; ------ CPP related things ------
(defun insert-cpp-header-guard ()
  "Insert C/C++ header guards based on the current buffer name."
  (interactive)
  (let* ((buf-name (buffer-name))
         (clean-name (upcase (replace-regexp-in-string "[^A-Za-z0-9]" "_" buf-name))))
    (save-excursion
      (goto-char (point-min))
      (insert (format "#ifndef %s\n#define %s\n\n" clean-name clean-name))
      (goto-char (point-max))
      (insert (format "\n#endif /* %s */\n" clean-name)))))

(defun insert-cpp-template-class (class-name template-type)
  "Insert a C++ template class skeleton at the current cursor position."
  (interactive
   (list (read-string "Class name: ")
         (let ((type (read-string "Template type [default T]: ")))
           (if (string-empty-p type) "T" type))))
  (let ((start (point)))
    (insert (format "template <typename %s>\n" template-type))
    (insert (format "class %s {\n" class-name))
    (insert "public:\n")
    (insert (format "    %s() = default;\n" class-name))
    (insert (format "    ~%s() = default;\n" class-name))
    (insert (format "    %s(const %s& other);\n" class-name class-name))
    (insert (format "    %s& operator=(const %s& other);\n" class-name class-name))
    (insert (format "    %s(%s&& other) noexcept;\n" class-name class-name))
    (insert (format "    %s& operator=(%s&& other);\n" class-name class-name))    
    (insert "\nprivate:\n")
    (insert "    \n")
    (insert "};\n")
    
    ;; Indent the newly inserted region according to c++-mode rules
    (indent-region start (point))
    
    ;; Move the cursor to the blank line inside the private section
    (search-backward "private:")
    (forward-line 1)
    (end-of-line)
    (indent-according-to-mode)))
