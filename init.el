;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


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

;; omnisharp
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

;; org-mode
(add-to-list 'load-path "C:\Org\lisp")
(add-to-list 'load-path "C:\Org\contrib")
(require 'org)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb) 

;; theme
(require 'emacs-color-themes)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("77d05e0aa0af3321a18aef1a9cea1d12ee0cbc1cfee4c0a1612813469f89e721" "ec0f5324cdd147558e44c5ae8c25f6709400bda26280be9bf9474e73ebe36afe" "8da4938e0e5754d199ef23087edbddfadf78ecbacbd49b6c766d64296310e3e3" "35ce30aa61c3d288dfb6f0687420d8773c6281e77cf07dc9dc9e9e9c315d29ae" default)))
 '(org-agenda-files (quote ("c:/test/test.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


