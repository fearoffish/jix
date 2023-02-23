;;;###autoload
(defmacro my-repeat-map! (map-name keys-alist &optional docstring)
  "A helper macro to create keymaps for repeatable actions.

MAP-NAME is the variable name for the sparse keymap created, and KEYS-ALIST, is
an association list of functions to keys, where each function is called after
the associated key is pressed after the repeatable action is triggered."
  `(defvar ,map-name
     (let ((map (make-sparse-keymap)))
       (dolist (cmd ,keys-alist)
         (define-key map (cdr cmd) (car cmd))
         (put (car cmd) 'repeat-map ',map-name))
       map)
     ,docstring))

;;;###autoload
(defun my-embark-which-key-action-indicator (map target)
  "Helper function to display the `whichey' help buffer for embark."
  (which-key--show-keymap "Embark" map nil nil 'no-paging)
  #'which-key--hide-popup-ignore-command)

;;;###autoload
(defun my-snippets-delete-backward-char-or-field (&optional field)
  "Delete backward, or skip the current field if it's empty.

Prevents Yas from interfering with backspace deletion."
  (interactive)
  (let ((field (or field (and (overlayp yas--active-field-overlay)
                              (overlay-buffer yas--active-field-overlay)
                              (overlay-get yas--active-field-overlay 'yas--field)))))
    (cond ((not (yas--field-p field))
           (call-interactively #'delete-backward-char))
          ((and (not (yas--field-modified-p field))
                (eq (point) (marker-position (yas--field-start field))))
           (yas--skip-and-clear field)
           (yas-next-field 1))
          ((eq (point) (marker-position (yas--field-start field))) nil)
          ((call-interactively #'delete-backward-char)))))

;;;###autoload
(defadvice! my-super-backward-delete-a (&rest _)
  "Special function to super-delete things.

If the line content before cursor contains only blank characters, this function
will delete all the blank characters, and then, join with the previous line. I
there is any non-blank character before cursor, this function will delete the
entire line, but keep the correct indentation on it."
  :before '+default--delete-backward-char-a
  (let* ((line-pos (- (point) (point-at-bol)))
         (prev-indent (save-excursion
                        (forward-line -1)
                        (current-indentation)))
         (prev-line-bol (point-at-bol 0))
         (next-line-eol (point-at-eol 2))
         (smart-bs-p (or (save-excursion
                           (and (re-search-backward "{[ \t]*\n[ \t]*" prev-line-bol t)
                                (re-search-forward "[ \t]*\n[ \t]*}" next-line-eol t)))
                         (save-excursion
                           (and (re-search-backward "\\[[ \t]*\n[ \t]*" prev-line-bol t)
                                (re-search-forward "[ \t]*\n[ \t]*\\]" next-line-eol t)))
                         (save-excursion
                           (and (re-search-backward "([ \t]*\n[ \t]*" prev-line-bol t)
                                (re-search-forward "[ \t]*\n[ \t]*)" next-line-eol t))))))
    (when (and smart-bs-p
               (<= line-pos (+ prev-indent standard-indent)))
      (delete-char (- line-pos)))))

;;;###autoload
(defun my-line-number-absolute-h ()
  "If line numbers are visible, set the current line number type to `absolute.'"
  (if display-line-numbers
      (setq display-line-numbers t)))

;;;###autoload
(defun my-line-number-visual-h ()
  "If line numbers are visible, set the current line number type to `visual'"
  (if display-line-numbers
      (setq display-line-numbers 'visual)))

;;;###autoload
(defadvice! my-save-all-buffers-a (&rest _)
  "Advice to run `save-some-buffers' before a function.

This is a part of the full auto-save feature."
  :before (list #'save-buffers-kill-emacs #'my-tabs-close-buffer-tab)
  (save-some-buffers t nil))

;;;###autoload
(defun my-save-frame-dimensions-h ()
  "Caches the current frame dimensions and position."
  (if-let ((main-frame (car-safe (visible-frame-list))))
      (doom-store-put 'last-frame-size
                      (list (frame-position main-frame)
                            (frame-width main-frame)
                            (frame-height main-frame)
                            (frame-parameter main-frame 'fullscreen)))))

;;;###autoload
(defun my-restore-frame-dimensions-h ()
  "Restore frame dimensions and position from `my-save-frame-dimensions-h'."
  (if-let (dims (doom-store-get 'last-frame-size "default"))
      (cl-destructuring-bind ((left . top) width height fullscreen) dims
        (setq initial-frame-alist
              (append initial-frame-alist
                      `((left . ,left)
                        (top . ,top)
                        (width . ,width)
                        (height . ,height)
                        (fullscreen . ,fullscreen)))))
    (add-to-list 'default-frame-alist '(height . 40))
    (add-to-list 'default-frame-alist '(width . 140))))
