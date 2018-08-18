; encoding utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

; don't show the startup screen
(setq inhibit-startup-screen t)

; stop emacs from using tabs by default
(setq-default indent-tabs-mode nil)

; menu bar and tool bars disabler
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; line numbers
; (setq global-linum-mode t)
; (setq linum-format "%4d | ")
(setq global-nlinum-mode t)

; offsets
(setq c-basic-offset 4)

(electric-pair-mode 1)

; stop emacs from making backups of absolutely every file I open
(setq make-backup-files nil)
(setq auto-save-default nil)

; list of packages
(setq package-list '(web-mode color-theme-sanityinc-tomorrow challenger-deep-theme nlinum))


;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;(load-theme 'challenger-deep t)

; list of repositories containing packages
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("MELPA Stable" . "http://stable.melpa.org/packages/")
                         ("MELPA" . "http://melpa.org/packages/")))

; fetch the list of packages available
(package-initialize)
(package-refresh-contents)


(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))


;(load-theme sanityinc-tomorrow-blue)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#4d4d4c" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#d6d6d6"))
 '(custom-enabled-themes (quote (challenger-deep)))
 '(custom-safe-themes
   (quote
    ("bcd8b3fc2d82d764a9692c754485344257caf017d3fbdfb18f4db022a7b9a58f" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#d6d6d6")
 '(package-selected-packages (quote (web-mode)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
