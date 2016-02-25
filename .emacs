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
 '(company-ghc-show-info t)
 '(fsharp-continuation-offset 4)
 '(fsharp-indent-offset 4)
 '(fsharp-tab-always-indent t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(menu-bar-mode nil)
 '(nyan-animate-nyancat nil)
 '(nyan-animation-frame-interval 0.2)
 '(nyan-mode nil)
 '(nyan-wavy-trail t)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/"))))
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
(unless package-archive-contents (package-refresh-contents))
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
  (erc :server "irc.freenode.net"
       :port 6667
       :nick "yupferris")
  (erc :server "efnet.port80.se"
       :port 6667
       :nick "yupferris"))
(global-set-key (kbd "\C-c i") 'irc)

;; F# settings
(ensure-and-require 'fsharp-mode)

;; Haskell settings
(ensure-and-require 'haskell-mode)
(ensure-and-require 'company)
(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(setq haskell-process-path-cabal "~/.cabal/bin/cabal")
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

;; Rust settings
(ensure-and-require 'rust-mode)

;; CC settings
(setq-default c-basic-offset 4)
