(defun make-circular-list (n)
  (let* ((list (loop for i below n
                     collect i))
         (last (last list)))
    (setf (cdr last) list)
    list))

(defun kill (n d)
  (let ((list (make-circular-list n)))
    (flet ((one-element-clist-p (list)
             (eq list (cdr list)))
           (move-forward ()
             (loop repeat (1- d)
                   until (eq list (cdr list))
                   do (setf list (cdr list))))
           (kill-item ()
             (setf (car list) (cadr list)
                   (cdr list) (cddr list))))
      (loop until (one-element-clist-p list) do
            (move-forward)
            (kill-item))
      (first list))))