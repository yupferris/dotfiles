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
 '(fsharp-tab-always-indent nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(menu-bar-mode nil)
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
 )

;; Line numbers
(global-linum-mode t)

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
(add-to-list 'load-path "~/emacs/tomorrow-night-paradise-theme/")
(add-to-list 'custom-theme-load-path "~/emacs/tomorrow-night-paradise-theme/")
(require 'tomorrow-night-paradise-theme)

;; Buffer helpers
(ensure-and-require 'buffer-move)

;; Git helpers
(ensure-and-require 'magit)
(setq magit-auto-revert-mode nil)

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
