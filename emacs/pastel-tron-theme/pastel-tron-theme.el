;; pastel-tron-theme

;; based on Jim Myhrberg's tomorrow-night-paradise-theme:
;; https://github.com/jimeh/tomorrow-night-paradise-theme.el/blob/master/tomorrow-night-paradise-theme.el

(deftheme pastel-tron
  "Two things I like to look at")

(let ((background "#0f0f0f")
      (selection "#ff71dd")
      (region "#303030")
      (foreground "#e0e0e0")
      (comment "#686868")
      (cursor "#949494")
      (gray "#212121") (gray-2 "#1c1c1c") (gray-3 "#121212")
                       (gray-4 "#080808")
      (red "#ff4450") (red-2 "#cd0000") (red-3 "#5f0000")
      (yellow "#ffedc0") (yellow-2 "#cdcd00")
      (orange "#e78700")
      (green "#c0ffdd")
      (aqua "#71ddff")
      (blue "#71ddff")
      (purple "#dda0ff"))

  (custom-theme-set-faces
   'pastel-tron

   ;; Basics
   `(default ((t (:background ,background :foreground ,foreground))))
   `(region ((t (:background ,region))))
   `(fringe ((t (:background ,gray-2))))
   `(minibuffer-prompt ((t (:foreground ,blue))))
   `(hl-line ((t (:background ,gray-3))))

   ;; Font-lock stuff
   `(font-lock-builtin-face ((t (:foreground ,blue))))
   `(font-lock-comment-face ((t (:foreground ,comment))))
   `(font-lock-constant-face ((t (:foreground ,green))))
   `(font-lock-doc-face ((t (:foreground ,comment))))
   `(font-lock-doc-string-face ((t (:foreground ,comment))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,purple))))
   `(font-lock-negation-char-face ((t (:foreground ,aqua))))
   `(font-lock-preprocessor-face ((t (:foreground ,red))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,aqua))))
   `(font-lock-warning-face ((t (:foreground ,red))))

   ;; UI related
   `(mode-line ((t (:background ,blue :foreground ,gray))))
   `(mode-line-inactive ((t (:background ,gray :foreground ,red))))
   `(vertical-border ((t (:background ,background :foreground ,selection))))

   ;; Linum
   `(linum ((t (:background ,background :foreground ,gray))))

   ;; show-paren-mode
   `(show-paren-match ((t (:background ,purple :foreground ,gray-2))))
   `(show-paren-mismatch ((t (:background ,orange :foreground ,gray-2))))

   ;; ido
   `(ido-only-match ((t (:foreground ,orange))))
   `(ido-subdir ((t (:foreground ,purple))))

   ;; whitespace-mode
   `(whitespace-empty ((t (:background ,yellow-2 :foreground ,red))))
   `(whitespace-hspace ((t (:foreground ,gray-2))))
   `(whitespace-indentation ((t (:foreground ,gray-2))))
   `(whitespace-line ((t (:background ,gray-2))))
   `(whitespace-newline ((t (:foreground ,gray-2))))
   `(whitespace-space ((t (:foreground ,gray-2))))
   `(whitespace-space-after-tab ((t (:foreground ,gray-2))))
   `(whitespace-tab ((t (:foreground ,gray-2))))
   `(whitespace-trailing ((t (:background ,red-3 :foreground ,yellow))))

   ;; magit
   `(magit-diff-add ((t (:foreground ,green))))
   `(magit-diff-del ((t (:foreground ,red))))
   `(magit-item-highlight ((t (:background ,gray-2))))

   ;; highlight-indentation-mode
   `(highlight-indentation-face ((t (:background ,gray-4))))
   `(highlight-indentation-current-column-face ((t (:background ,gray-3))))

   ;; org-mode
   `(org-date ((t (:foreground ,purple))))
   `(org-done ((t (:foreground ,green))))
   `(org-hide ((t (:foreground ,gray-2))))
   `(org-link ((t (:foreground ,blue))))
   `(org-todo ((t (:foreground ,red))))

   ;; company
   `(company-tooltip ((t (:background "#404040" :foreground "#f0f0f0"))))
   `(company-scrollbar-bg ((t (:background "#707070"))))
   `(company-scrollbar-fg ((t (:background "#c0c0c0"))))
   `(company-tooltip-selection ((t (:background "#707070" :foreground ,blue))))
   `(company-tooltip-common ((t (:foreground ,green))))
   `(company-tooltip-annotation ((t (:foreground ,purple))))
   )

  (custom-theme-set-variables
   'pastel-tron

   ;; Fill Column Indicator mode
   `(fci-rule-color ,gray-2)
   `(fci-rule-character-color ,gray-2)

   `(ansi-color-names-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [,background ,red ,green ,yellow ,blue ,purple ,blue ,foreground])
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [unspecified ,background ,red ,green ,yellow ,blue ,purple ,blue ,foreground])))

(provide-theme 'pastel-tron)
