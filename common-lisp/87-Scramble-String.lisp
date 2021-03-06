(defun is-scramble (s1 s2)
  (let ((n (length s1)))
    (cond
      ((not (string= (sort (copy-seq s1) #'string<)
                     (sort (copy-seq s2) #'string<)))
       nil)
      ((or (< n 4)
           (string= s1 s2))
       t)
      (t
       (loop for i from 1 below n
          do (if (or (and (is-scramble (subseq s1 0 i)
                                       (subseq s2 0 i))
                          (is-scramble (subseq s1 i)
                                       (subseq s2 i)))
                     (and (is-scramble (subseq s1 0 i)
                                       (subseq s2 (- n i)))
                          (is-scramble (subseq s1 i)
                                       (subseq s2 0 (- n i)))))
                 (return t)))))))