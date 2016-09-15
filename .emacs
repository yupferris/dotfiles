;; Normal customize stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-blinks 0)
 '(blink-cursor-delay 0.2)
 '(blink-cursor-interval 0.2)
 '(fsharp-continuation-offset 4)
 '(fsharp-indent-offset 4)
 '(fsharp-tab-always-indent t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(visible-bell nil))

;; Fonts'n'shit
(set-face-attribute 'default nil :height 100)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "nil" :family "Menlo")))))

;; Line numbers
(global-linum-mode t)

;; Tabs suck
(setq-default indent-tabs-mode nil)

;; Position info
(setq line-number-mode t)
(setq column-number-mode t)

;; Melpa the fuck
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (unless package-archive-contents (package-refresh-contents))
(package-initialize)

;; Package helpers
(defun ensure-and-require (package-name)
  (unless (package-installed-p package-name)
    (package-install package-name))
  (require package-name))

;; Super rad dark-like-my-heart theme
(add-to-list 'load-path "~/emacs/pastel-tron-theme/")
(add-to-list 'custom-theme-load-path "~/emacs/pastel-tron-theme/")
(require 'pastel-tron-theme)
(load-theme `pastel-tron t)

;; Path helpers
(when (memq window-system '(mac ns))
  (ensure-and-require 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "RUST_SRC_PATH"))

;; Meta helpers
(ensure-and-require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; Window helpers
(require 'windmove)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'super))

;; Buffer helpers
(ensure-and-require 'buffer-move)

;; Saving the world helpers
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Misc editor helpers
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)
(defun goto-match-paren (arg)
  "Go to the matching  if on (){}[], similar to vi style of % "
  (interactive "p")
  ;; first, check for "outside of bracket" positions expected by forward-sexp, etc.
  (cond ((looking-at "[\[\(\{]") (forward-sexp))
        ((looking-back "[\]\)\}]" 1) (backward-sexp))
        ;; now, try to succeed from inside of a bracket
        ((looking-at "[\]\)\}]") (forward-char) (backward-sexp))
        ((looking-back "[\[\(\{]" 1) (backward-char) (forward-sexp))
        (t nil)))
(global-set-key (kbd "\C-c )") `goto-match-paren)

(ensure-and-require 'ace-jump-mode)
(global-set-key (kbd "C-<tab>") #'ace-jump-word-mode)

(ensure-and-require 'drag-stuff)
(drag-stuff-global-mode)

;; Org helpers
(ensure-and-require 'org)

;; Eshell helpers
(when (memq window-system '(mac ns))
  (ensure-and-require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; Git helpers
(ensure-and-require 'magit)
(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

;; IRC helpers
(defun irc ()
  "Connect to IRC"
  (interactive)
  (erc :server "irc.us.ircnet.net"
       :port 6667
       :nick "yupferris")
  (erc :server "efnet.port80.se"
       :port 6667
       :nick "yupferris"))
(global-set-key (kbd "\C-c i") 'irc)

;; Company settings
(ensure-and-require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.5)
(setq company-minimum-prefix-length 1)

;; EditorConfig settings
(ensure-and-require 'editorconfig)
(editorconfig-mode 1)

;; F# settings
(ensure-and-require 'fsharp-mode)

;; Haskell settings
(ensure-and-require 'haskell-mode)
(ensure-and-require 'company-ghc)
;;(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

;; Rust settings
(ensure-and-require 'rust-mode)
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))
(ensure-and-require 'cargo)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(ensure-and-require 'racer)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
;;(add-hook 'racer-mode-hook #'company-mode)
(ensure-and-require 'flycheck-rust)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(add-hook 'rust-mode-hook 'flycheck-mode)

;; CC settings
(setq-default c-basic-offset 4)

;; PlantUML settings
(add-to-list 'load-path "~/emacs/plantuml-mode/")
;;(require 'plantuml-mode)

;; GLSL settings
(add-to-list 'load-path "~/emacs/glsl-mode/")
(require 'glsl-mode)

;; Elm settings
(ensure-and-require 'elm-mode)

;; Typescript settings
(ensure-and-require 'typescript-mode)
