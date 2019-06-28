;; various tunings...
(in-package "RT-MUSIC")

(defclass equal-temperament ()
  ((size :initarg :size
	 :type fixnum
	 :documentation "Number of pitch classes"
	 :accessor tuning-size)
   (octave :initarg :octave-multiplier
	   :initform 2.0
	   :type single-float
	   :documentation "The size of an octave (typically 2)"
	   :accessor tuning-octave-multiplier)
   (bpch :initarg :base-pch
	 :accessor tuning-base-pch
	 :documentation "The pitch class that has the base cps in this tuning.")
   (base :initarg :base-cps
	 :type single-float
	 :documentation "The frequency of the base pch"
	 :accessor tuning-base-cps))
  (:documentation "Represents an equal-division tuning"))

(defgeneric pch->cps (tuning pch)
  (:documentation "converts a pitch class to cps for a given tuning"))

(defmethod pch->cps ((tuning equal-temperament) (pch cons))
  (let ((sz (/ 1 (tuning-size tuning)))
	(oct (tuning-octave-multiplier tuning))
	(base (tuning-base-pch tuning))
	(freq (tuning-base-cps tuning)))
    (* freq
       (expt oct (+ (- (car pch) (car base))
		    (* (- (cdr pch) (cdr base)) sz))))))
     
;; TODO (defclass twelve-et (equal-temperament) ...)

;; twelve-tone-et has these ideas on midi note numbers and "names" like C#4
;; or really any twelve-note tuning could have a close mapping.
;; need to think about how I want to get all these mapped?  Maybe I want
;; to always just find the closest one.
(defun name->pch (nn)
  "Convert a note name (e.g., `C4`) to a (octave . pc)"
  ;; TODO
  60)

(defun midi->pch (midi)
  "Convert a midi note number to a (octave . pc)"
  (multiple-value-bind (oct pc) (floor midi 12)
    (cons (- oct 1) pc)))


