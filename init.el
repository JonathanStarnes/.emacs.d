
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
        "~/.emacs.d/plugins/mysnippets"))                 ;; Personal snippets
(yas-global-mode 1)

;; company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; omnisharp
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

;;
(defvar slack-token "xoxb-3617248270-CuTTL3hCYC6uhJxK2aIIM7Q2")
(defvar slack-username "Jonathan")

;; Set aspell as ispell program
(setq-default ispell-program-name "aspell")
;; Flyspell
(add-hook `org-mode `flyspell-mode)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;; org-mode
(add-to-list 'load-path "C:\Org\lisp")
(add-to-list 'load-path "C:\Org\contrib")
(require 'org)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb) 


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("c:/Users/jstarnes/Google Drive/Org/outlook.org" "c:/Users/jstarnes/Google Drive/Org/master.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


