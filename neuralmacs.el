;;; neuralmacs.el --- Neuralmacs minor mode for Hy Repl support  -*- lexical-binding: t -*-

;; Copyright (C) 2018 Andres Mariscal

;; Author: Andres Mariscal <carlos.mariscal.melgar@gmail.com>
;; Created: 1 May 2018
;; Version: 0.0.1
;; Keywords: hy languages repl
;; URL: https://github.com/serialdev/neuralmacs-mode
;; Package-Requires: ((emacs "24.3", hy-mode ))
;;; Commentary:
;; Neural Networks in emacs

;; Usage

(defun nm-dot (v1 v2)
  "
  Dot Product of Two Vectors of same size"
  (setq-local dot 0.0)


  (dotimes (num (length v1))

    (setq-local dot_ (* (nth num v1) (nth num v2)))
    (setq-local dot (+ dot dot_ ))
    )
  dot 
  )


(defun nm-vec-add (v1 v2)
  "Addition of Two Vectors of same size"
    (setq-local added '())
    (dotimes (num (length v1))
      (setq-local added_  (+ (nth num v1) (nth num v2)))
      (setq-local added (append added (list added_)))
      )
    added
  )

(defun nm-scalar-matmul(scalar mat)
  "Multiplication of a scalar & Matrix"
  (setq-local result '())
  (dotimes (num (length mat))
      (setq-local result_  (* scalar (nth num mat)))
      (setq-local result (append result (list result_)))
    )
  result
  )


(provide 'neuralmacs)

;;; neuralmacs.el ends here
