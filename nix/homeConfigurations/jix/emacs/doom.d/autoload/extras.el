;;;###autoload
(defadvice! my-themes-enable-treemacs-variable-pitch-labels-a (&rest _)
  "This advice changes the treemacs variable pitch font to one without serif so
the UI looks more polished."
  :override #'doom-themes-enable-treemacs-variable-pitch-labels
  (when doom-themes-treemacs-enable-variable-pitch
    (dolist (face '(treemacs-root-face
                    treemacs-git-unmodified-face
                    treemacs-git-modified-face
                    treemacs-git-renamed-face
                    treemacs-git-ignored-face
                    treemacs-git-untracked-face
                    treemacs-git-added-face
                    treemacs-git-conflict-face
                    treemacs-directory-face
                    treemacs-directory-collapsed-face
                    treemacs-file-face
                    treemacs-tags-face))
      (let ((faces (face-attribute face :inherit nil)))
        (set-face-attribute
         face nil :inherit
         `(my-default-ui ,@(delq 'unspecified (if (listp faces) faces (list faces)))))))))

;;;###autoload
(defun my-treemacs-visit-node-and-close-h (&optional arg)
  "Closes treemacs window after selecting a file to visit."
  (treemacs-visit-node-default arg)
  (delete-window (treemacs-get-local-window)))

;;;###autoload
(defun my-treemacs-buffer-config-h ()
  (let ((bg (face-attribute 'default :background))
        (fg (face-attribute 'default :foreground)))
    (face-remap-add-relative 'header-line
                             :background bg :foreground fg
                             :box `(:line-width ,(/ my-line-pixel-height 2) :color ,bg)))
  (setq header-line-format
        '((:eval
           (concat
            " ☰ "
            (propertize (s-titleize (persp-current-name)) 'face 'my-ui-window-header))))))

;;;###autoload
(defadvice! my-treemacs-add-and-display-current-project-a ()
  "Open treemacs with current project. This function removes any project that is
not the current one."
  :override #'treemacs-add-and-display-current-project
  (interactive)

  (cl-dolist (p (treemacs-workspace->projects (treemacs-current-workspace)))
    (unless (string= (doom-project-name) (treemacs-project->name p))
      (treemacs-do-remove-project-from-workspace p t)))

  (when (treemacs-workspace->is-empty?)
      (treemacs-do-add-project-to-workspace (doom-project-root) (doom-project-name)))

  (treemacs-select-window)
  (treemacs-pulse-on-success))

;;;###autoload
(defun my-dired-toggle-git-mode ()
  "Toggle `dired-git-info-mode' in git repos."
  (interactive)
  (when (and (not (file-remote-p default-directory))
             (locate-dominating-file "." ".git"))
    (call-interactively 'dired-git-info-mode)))

;;;###autoload
(defun my-dired-open-directory ()
  "Enters in the directory at point. If the cursor is not on a directory, do
nothing."
  (interactive)
  (let ((target-file (dired-get-file-for-visit)))
    (when (or (file-directory-p target-file)
              (dired-avfs--archive-p target-file))
      (dired-find-file))))

;;;###autoload
(defun my-dired-mac-quick-view ()
  "Invoke the macOS Quiclview on the file under point."
  (interactive)
  (shell-command (concat "qlmanage -p \""
                         (dired-get-file-for-visit)
                         "\" > /dev/null 2>&1")))

;;;###autoload
(defun my-dired-widen-or-quit-all ()
  "If `dired-narow' is on, revert to the normal view. If there is no active
narrow, quit Dired."
  (interactive)
  (if dired-narrow-mode
      (revert-buffer)
    (mapc (lambda (buf)
            (let ((win (get-buffer-window buf)))
              (unless (append (window-prev-buffers win) (window-prev-buffers win))
                (delete-window win))
              (kill-buffer buf)))
          (doom-buffers-in-mode 'dired-mode))))

;;;###autoload
(defun my-dired-narrow (narrow-func)
  "Start a dynamic narrowing of files in current view."
  (interactive
   (list (if current-prefix-arg
             'dired-narrow-fuzzy
           'dired-narrow-regexp)))
  (call-interactively narrow-func))

;;;###autoload
(defun my-dired-yank-absolute-path ()
  "Copy the absolute path of file on pointer to kill ring."
  (interactive)
  (dired-copy-filename-as-kill 0))

;;;###autoload
(defun my-dired-yank-relative-path ()
  "Copy the relative path of file on pointer to kill ring."
  (interactive)
  (dired-copy-filename-as-kill))

;;;###autoload
(defun my-dired-open-externally ()
  "Open file with application defined by OS."
  (interactive)
  (shell-command (concat "open \""
                         (dired-get-file-for-visit)
                         "\" > /dev/null 2>&1")))

;;;###autoload
(defun my-dired-reveal-on-finder ()
  "Show current file in Finder."
  (interactive)
  (shell-command (concat "open --reveal \""
                         (dired-get-file-for-visit)
                         "\" > /dev/null 2>&1")))

;;;###autoload
(defun my-dired-marked-file-p ()
  "Return non-nil if we have marked file at point."
  (dired-file-marker (dired-get-file-for-visit)))

;;;###autoload
(defun my-dired-toggle-mark (&optional _)
  "Toggle mark of file at point."
  (interactive)
  (if (my-dired-marked-file-p)
      (dired-unmark 1)
    (dired-mark 1)))

;;;###autoload
(defun my-dired-open-split-right ()
  (interactive)
  (select-window
   (window--display-buffer (find-file-noselect (dired-get-file-for-visit))
                           (split-window-right)
                           'window)))

;;;###autoload
(defun my-dired-open-split-bellow ()
  (interactive)
  (select-window
   (window--display-buffer (find-file-noselect (dired-get-file-for-visit))
                           (split-window-below)
                           'window)))

;;;###autoload
(defun my-after-switch-project-action-h (dir)
  "A project first action to execute when we switch our current project."
  (let ((file (file-exists-p! (ignore-errors (expand-file-name (or "README.org"
                                                                   "README.md"
                                                                   "README"
                                                                   "README.rst"
                                                                   "NEWS.org"
                                                                   "NEWS.md"
                                                                   "NEWS"
                                                                   "NEWS.rst"
                                                                   "CHANGELOG.org"
                                                                   "CHANGELOG.md"
                                                                   "CHANGELOG"
                                                                   "CHANGELOG.rst") dir)))))
    (if file
        (find-file file)
      (doom-project-find-file dir))))
