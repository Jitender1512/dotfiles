;; Sets the default font to Inconsolata
(set-default-font "-unknown-Inconsolata-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")

;; Add ~/.emacs.d to load-path
(add-to-list 'load-path "~/.emacs.d")

;; Auto Complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; Use wombat theme
(require 'color-theme-wombat)
(color-theme-wombat)

;; Switch off menubar, scrollbar and toolbar and the startup message
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message 0)

;; Use column-number-mode
(setq column-number-mode t)

;; Stop making backup files and save files
(setq make-backup-files         nil) 
(setq auto-save-list-file-name  nil)

;; Use spaces for indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-width 2)

;; Cucumber mode
(add-to-list 'load-path "~/.emacs.d/feature-mode")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; HAML & SASS mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\.haml$" . haml-mode))
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\.scss$" . sass-mode))

;; Coffeescript mode
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; Clojure mode
(require 'clojure-mode)

;; YASnippet
(add-to-list 'load-path
              "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

;; Flymake
(require 'flymake)

;; rspec-mode
(require 'rspec-mode)

;; I don't like the default colors :)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          '(lambda ()

	     ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
	     (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		 (flymake-mode))
	     ))
