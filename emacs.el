;; Sets the default font to Inconsolata
(set-default-font "-unknown-Inconsolata-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")

;; Add ~/.emacs.d to load-path
(add-to-list 'load-path "~/.emacs.d")

;; Use wombat theme
(require 'color-theme-wombat)
(color-theme-wombat)

;; Switch off menubar, scrollbar and toolbar and the startup message
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message 0)

;; Stop making backup files and save files
(setq make-backup-files         nil) 
(setq auto-save-list-file-name  nil)

;; Use spaces for indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-width 2)