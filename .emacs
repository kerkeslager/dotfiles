;; Make custom store its generated code in .emacs-custom.el
(setq custom-file "~/.emacs-custom.el")
(if (file-exists-p custom-file)
    (load custom-file))

;; Load package.el and some package repos
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

;; Install packages that I use that aren't installed
(unless (package-installed-p 'paredit) (package-install 'paredit))
(unless (package-installed-p 'starter-kit) (package-install 'starter-kit))
(unless (package-installed-p 'starter-kit-bindings) (package-install 'starter-kit-bindings))
(unless (package-installed-p 'starter-kit-eshell) (package-install 'starter-kit-eshell))
(unless (package-installed-p 'starter-kit-lisp) (package-install 'starter-kit-lisp))
(unless (package-installed-p 'solarized-theme) (package-install 'solarized-theme))

;; Require the packages I use
(require 'paredit)
(require 'starter-kit)
(require 'starter-kit-bindings)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'solarized-theme)

;; Set the theme
(load-theme 'solarized-dark)

;; Make tabs not a thing by default
(setq tab-width 4
      indent-tabs-mode nil)

;; Set reasonable C style
(setq c-default-style "linux"
      c-basic-offset 4)
