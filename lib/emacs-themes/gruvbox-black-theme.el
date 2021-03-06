;;; gruvbox-black.el --- Custom variant of grubox with black background

;;; Commentary:

;;; Custom variant of gruvbox with a black background

;;; Code:

(require 'autothemer)

(autothemer-deftheme gruvbox-black "A theme that uses gruvbox colors but is a black background"

 ((((class color) (min-colors #xFFFFFF))) ;; Only concerned about graphical emacs

  ;; Define our color palette
  (gb-background  "#000000")
  (gb-foreground  "#ebdbb2")
  (gb-black       "#181818")
  (gb-red         "#cc241d")
  (gb-green       "#98971a")
  (gb-yellow      "#d79921")
  (gb-blue        "#458588")
  (gb-magenta     "#b16286")
  (gb-cyan        "#689d6a")
  (gb-lgt-grey    "#a89984")
  (gb-drk-grey    "#928374")
  (gb-lgt-red     "#fb4934")
  (gb-lgt-green   "#b8bb26")
  (gb-lgt-yellow  "#fabd2f")
  (gb-lgt-blue    "#83a598")
  (gb-lgt-magenta "#d3869b")
  (gb-lgt-cyan    "#8ec07c")
  (gb-white       "#ebdbb2"))

 (
  ;; Basic UI Components
  (default (:foregroud gb-foreground :background gb-background))
  (cursor  (:background gb-foreground))
  (line-number (:foreground gb-black))
  (line-number-current-line (:foreground gb-yellow))
  (window-divider (:foreground gb-black))

  ;; Code Syntax
  (font-lock-keyword-face (:foreground gb-magenta))
  (font-lock-function-name-face (:foreground gb-blue))
  (font-lock-variable-name-face (:foreground gb-yellow))
  (font-lock-constant-face (:foreground gb-blue))
  (font-lock-string-face (:foreground gb-green))
  (font-lock-builtin-face (:foreground gb-cyan))
  (font-lock-comment-face (:foreground gb-drk-grey))

  ;; Modeline
  (mode-line (:background gb-black))
  (mode-line-inactive (:background "#090909"))

  ;; Org Mode
  (org-document-title (:foreground gb-red))
  (org-document-info (:foreground gb-red))
  (org-level-1 (:foreground gb-green))
  (org-level-2 (:foreground gb-blue))
  (org-level-3 (:foreground gb-magenta))
  (org-level-4 (:foreground gb-cyan))
  (org-level-5 (:foreground gb-cyan))
  (org-headline-done (:foreground gb-drk-grey))
  (org-priority (:foreground gb-yellow))
  (org-ellipsis (:foreground gb-drk-grey :underline nil))
  (org-block-begin-line (:background gb-black))
  (org-block-end-line (:background gb-black))
  (org-block (:background "#090909"))
  (org-table (:foreground gb-yellow))
  (org-formula (:foreground gb-cyan))

  ;; Org Agenda
  (org-agenda-structure (:foreground gb-magenta))
  (org-agenda-done (:foreground gb-drk-grey))
  (org-scheduled (:foreground gb-foreground))
  (org-scheduled-today (:foreground gb-foreground))
  (org-upcoming-deadline (:foreground gb-cyan))
  (org-agenda-date-weekend (:foreground gb-lgt-blue))
  (org-agenda-date (:foreground gb-blue))
  (org-warning (:foreground gb-red))

  ;; Org Habit
  (org-habit-clear-future-face (:background gb-black))
  (org-habit-alert-future-face (:background gb-blue))
  (org-habit-overdue-future-face (:background gb-red))
  (org-habit-overdue-face (:background gb-lgt-red))
  (org-habit-ready-face (:background gb-green))

  ;; VTerm
  (vterm-color-black (:foreground gb-black))
  (vterm-color-red (:foreground gb-red))
  (vterm-color-green (:foreground gb-green))
  (vterm-color-yellow (:foreground gb-yellow))
  (vterm-color-blue (:foreground gb-blue))
  (vterm-color-magenta (:foreground gb-magenta))
  (vterm-color-cyan (:foreground gb-cyan))
  (vterm-color-white (:foreground gb-white))

  ))

(provide-theme 'gruvbox-black)

;;; gruvbox-black.el ends here
