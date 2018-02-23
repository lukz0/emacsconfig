(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )(defun fontify-frame (frame)
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
(setq indent-tabs-mode nil)
(infer-indentation-style)
;;don't show startup screen
(setq inhibit-startup-screen t)
