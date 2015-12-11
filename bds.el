(defvar bds-mode-hook nil)

(defvar bds-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for BDS major mode")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.bds\\'" . bds-mode))

;; font-lock-keyword-face 
;; font-lock-builtin-face 
;; font-lock-variable-name-face 
;; font-lock-constant-face

(defvar bds-keywords '("break" "breakpoint" "continue" "debug" "error" "exit"
                       "for" "if" "else" "include" "kill" "print" "println" "return"
                       "warning" "while" "<-" "checkpoint" "dep" "par" "sys" "task"
                       "wait"))
(defvar bds-data-types '("int" "real" "string" "bool"))
(defvar bds-global-variables '("K" "M" "G" "T" "P" "E" "PI" "minute" "hour" "day" "week"
                               "cpuLocal" "ppwd" "args" "programPath" "programName"
                               "allowEmpty" "canFail" "cpus" "mem" "timeout" "node" "queue"
                               "retry" "system" "taskName" "timeout" "walltimeout"))
(defvar bds-predefined-functions '("config" "max" "min" "print" "printErr"
                                   "rand" "randInt" "randSeed"
                                   "range" "sleep" "toInt"))

(defvar bds-keywords-regexp (regexp-opt bds-keywords 'words))
(defvar bds-type-regexp (regexp-opt bds-data-types 'words))
(defvar bds-functions-regexp (regexp-opt bds-predefined-functions 'words))

(setq bds-font-lock-keywords
      `(
        (,bds-keywords-regexp . font-lock-keyword-face)
        (,bds-type-regexp . font-lock-type-face)
        (,bds-functions-regexp . font-lock-function-name-face)
        ;; note: order above matters, because once colored, that part won't change.
        ;; in general, longer words first
        ))

;;;###autoload
(define-derived-mode bds-mode shell-script-mode
  "bds mode"
  "Major mode for editing bds (Big Data Script)…"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((bds-font-lock-keywords))))

;; clear memory. no longer needed
(setq bds-keywords nil)
(setq bds-types nil)
(setq bds-constants nil)
(setq bds-events nil)
(setq bds-functions nil)

;; clear memory. no longer needed
(setq bds-keywords-regexp nil)
(setq bds-types-regexp nil)
(setq bds-constants-regexp nil)
(setq bds-events-regexp nil)
(setq bds-functions-regexp nil)

;; add the mode to the `features' list
(provide 'bds-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; bds-mode.el ends here
