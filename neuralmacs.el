;;; neuralmacs.el --- Neuralmacs neural net support for emacs  -*- lexical-binding: t -*-

;; Copyright (C) 2018 Andres Mariscal

;; Author: Andres Mariscal <carlos.mariscal.melgar@gmail.com>
;; Created: 1 May 2018
;; Version: 0.0.1
;; Keywords: neural networks
;; URL: https://github.com/serialdev/neuralmacs
;; Package-Requires: ((emacs "24.3" ))
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

(cl-defstruct (perceptron
	       (:constructor perceptron-create))
	       (input 0.0)
	       actual-output weights bias epochs )


(defun nm-init (perceptron)
  (setf (perceptron-bias perceptron) 0.0)
  (setf (perceptron-weights perceptron) (make-list (length (perceptron-input perceptron)) 0) )
  (dotimes (num (length (perceptron-input perceptron)))
    (setf
     (nth num (perceptron-weights perceptron)) (random* 1.0)
     )	 )
  perceptron
  )

(defun nm-sigmoid(x)
  "Sigmoid Activation : f(x) = 1 / (1 + e^(-x))"
  (/ 1.0 (+ 1.0 (exp (- x))))
  )

(defun nm-fwd-pass(perceptron inputs)
  (sigmoid( + (nm-dot
	   (perceptron-weights perceptron)
	   inputs)
	      (perceptron-bias perceptron) ) )
  )

(defun nm-grad-w (perceptron y)
  "Calculate Gradients of Weights"
  (let ((pred (nm-fwd-pass perceptron (perceptron-weights perceptron) )))

    (nm-scalar-matmul (- (* (- pred y) (* pred (- 1 pred ))))
		      (perceptron-weights perceptron))
  ))

(defun nm-grad-b (perceptron y)
  "Calculate Gradients of Bias"
  (let ((pred (nm-fwd-pass perceptron (perceptron-input perceptron) ) ))
    (- (* (- pred y) (* pred (- 1 pred))))))

(defun train()
  "Train the Perceptron for n epochs"

  )



(setq test (perceptron-create :input (make-list 3 0)))
(setf (perceptron-bias test) 2)

(nm-init test)

test

(nm-fwd-pass test '(1 2 3 4))

(nm-grad-w test 3)

(nm-grad-b test 3)

(provide 'neuralmacs)

;;; neuralmacs.el ends here
