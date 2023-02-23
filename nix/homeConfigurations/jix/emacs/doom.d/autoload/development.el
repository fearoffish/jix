;;;###autoload
(defadvice! my-comment-and-next-line-a (func &rest args)
  :around 'evilnc-comment-or-uncomment-lines
  (let ((no-selection-p (not (region-active-p))))
    (apply func args)
    (when no-selection-p
      (next-line)
      (goto-char (point-at-bol))
      (skip-chars-forward " \t\r"))))
