(defconst my-supported-icons
  (list 'assign       (all-the-icons-material "assignment_ind"          :height 0.95 :v-adjust -0.17)
        'bug          (all-the-icons-material "bug_report"              :height 0.95 :v-adjust -0.17)
        'busy         (all-the-icons-material "event_busy"              :height 0.95 :v-adjust -0.17)
        'calendar     (all-the-icons-octicon  "calendar"                :height 1.05 :v-adjust 0.0)
        'checked      (all-the-icons-material "check_box"               :height 0.95 :v-adjust -0.17)
        'checklist    (all-the-icons-octicon  "checklist"               :height 0.95 :v-adjust 0.1)
        'contact-add  (all-the-icons-material "person_add"              :height 0.95 :v-adjust -0.17)
        'error        (all-the-icons-material "error_outline"           :height 0.95 :v-adjust -0.17)
        'globe        (all-the-icons-faicon   "globe"                   :height 1.15 :v-adjust -0.05)
        'help         (all-the-icons-material "live_help"               :height 0.95 :v-adjust -0.22)
        'history      (all-the-icons-material "history"                 :height 0.95 :v-adjust -0.17)
        'idea         (all-the-icons-material "lightbulb_outline"       :height 0.95 :v-adjust -0.17)
        'inbox        (all-the-icons-material "inbox"                   :height 0.95 :v-adjust -0.15)
        'journal      (all-the-icons-material "book"                    :height 0.95 :v-adjust -0.15)
        'list         (all-the-icons-faicon   "list"                    :height 0.93 :v-adjust -0.05)
        'loop         (all-the-icons-material "loop"                    :height 0.95 :v-adjust -0.17)
        'meeting      (all-the-icons-material "date_range"              :height 0.95 :v-adjust -0.15)
        'new          (all-the-icons-material "new_releases"            :height 0.95 :v-adjust -0.17)
        'notes        (all-the-icons-material "library_books"           :height 0.95 :v-adjust -0.1)
        'pause        (all-the-icons-material "pause_circle_outline"    :height 0.95 :v-adjust -0.17)
        'postit       (all-the-icons-faicon   "sticky-note"             :height 1.15 :v-adjust 0.05)
        'project      (all-the-icons-octicon  "briefcase"               :height 1.05 :v-adjust 0.05)
        'review       (all-the-icons-material "rate_review"             :height 0.95 :v-adjust -0.15)
        'semi-checked (all-the-icons-material "indeterminate_check_box" :height 0.95 :v-adjust -0.17)
        'snooze       (all-the-icons-material "snooze"                  :height 0.95 :v-adjust -0.17)
        'stop         (all-the-icons-octicon  "stop"                    :height 1.05 :v-adjust -0.05)
        'timer        (all-the-icons-material "timer"                   :height 0.95 :v-adjust -0.15)
        'unchecked    (all-the-icons-material "check_box_outline_blank" :height 0.95 :v-adjust -0.17)
        'visibility   (all-the-icons-material "visibility"              :height 0.95 :v-adjust -0.17)
        'wait         (all-the-icons-material "hourglass_empty"         :height 0.95 :v-adjust -0.17))
  "Property list with all supported icons from my configuration.")

;;;###autoload
(defun my-supported-icons-p (icon)
  "Return t if the symbol given on ICON, is one associated with supported icon."
  (and (boundp 'my-supported-icons)
       (listp my-supported-icons)
       (plist-member my-supported-icons icon)))

;;;###autoload
(defun my-raw-icon (icon)
  "This function returns the requested ICON as if you're calling the
`all-the-icons-'* functions directly.

Icons supported by this function were all optimized to use exactly 2 characters
of space when used with the font and size defined in the main configuration.

Check the documentation of `my-supported-icons' to see the list of supported
icons."
  (plist-get my-supported-icons icon))

;;;###autoload
(defun my-icon (icon &optional color)
  "This function returns the requested ICON as a 2-characters string,
propertized to display the associated icon from the `all-the-icons' package. It
uses the COLOR arg to 'paint' the icon.

Check documentation of the function `my-raw-icon' for a list of supported
icons."
  (cond ((eq color 'raw) (my-raw-icon icon))
        (color (propertize "--"
                   'face `(:foreground ,color)
                   'display (my-raw-icon icon)))
        (t (propertize "--"
                   'face `(:foreground ,(face-attribute 'default :foreground))
                   'display (my-raw-icon icon)))))
