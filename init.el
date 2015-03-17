;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Add all of the folders from the plugins directory
(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))


;; csharp-mode
(require 'csharp-mode)

;; yasnippet setup
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/plugins/yasnippet-snippets" ;; Default snippets
        "~/.emacs.d/snippets"))                 ;; Personal snippets
(yas-global-mode 1)

;; company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
