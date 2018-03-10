
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages (quote (web-mode yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun fontify-frame (frame)
    (set-frame-parameter frame 'font "DejaVu Sans Mono-11"))
;;Fontity current frame
(fontify-frame nil)
;;Fontify any future frames
(push 'fontify-frame after-make-frame-functions)
;;change backup location
(setq backup-directory-alist `((".". "~/.saves")))
;;
(tool-bar-mode -1)
;;Set tab width to 2
(setq-default tab-width 2)
;;CC modes
(defvaralias 'c-basic-offset 'tab-width)
;;Perl modes
(defvaralias 'cperl-indent-level 'tab-width)
;;javascript
(setq js-indent-level 2)
;;html
(add-hook 'html-mode-hook
  (lambda ()
    ;; Default indentation is usually 2 spaces, changing to 2.
    (set (make-local-variable 'sgml-basic-offset) 2)))
;;tab stop list
(setq tab-stop-list (number-sequence 2 120 2))
;;Don't use tabs unless the document already uses tabs
(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if        
  ;; neither, we use the current indent-tabs-mode                               
  (let ((space-count (how-many "^  " (point-min) (point-max)))
        (tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))
(setq-default indent-tabs-mode nil)
;;(infer-indentation-style)
;;don't show startup screen
(setq inhibit-startup-screen t)
;;line numbers in margin
(global-linum-mode 1)
;;yasnippets
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
;;git bash
(defun git-bash () (interactive)
  (let ((explicit-shell-file-name "D:/Program Files/git/bin/bash"))
    (call-interactively 'shell)))
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))
;;Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-style-padding 0)
  (setq web-mode-script-padding 0)
  (setq web-mode-block-padding 0)
  (setq web-mode-enable-current-element-highlight t)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
;; Delete autosaves on exit
(add-hook 'kill-emacs-hook (lambda ()
          (mapcar (lambda (buf)
                    (with-current-buffer buf
                     (delete-auto-save-file-if-necessary t)))
                  (buffer-list))))
;;Electric pair mode
(electric-pair-mode 1)
