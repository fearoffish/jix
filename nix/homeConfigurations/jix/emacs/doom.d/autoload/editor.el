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
