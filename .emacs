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
 '(menu-bar-mode nil)
 '(nyan-animate-nyancat nil)
 '(nyan-animation-frame-interval 0.2)
 '(nyan-mode nil)
 '(nyan-wavy-trail t)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/"))))
 '(tool-bar-mode nil))

;; Fonts'n'shit
(set-face-attribute 'default nil :height 100)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Melpa the fuck
(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)
(package-initialize)

;; Super rad dark-like-my-heart theme
(add-to-list 'load-path "~/emacs/tomorrow-night-paradise-theme/")
(add-to-list 'custom-theme-load-path "~/emacs/tomorrow-night-paradise-theme/")
(require 'tomorrow-night-paradise-theme)

;; Haskell settings
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
