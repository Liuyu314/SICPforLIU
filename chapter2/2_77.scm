;;加入(put 'magnitude '(complex) magnitude)后，过程运行如下：
;;(define z (make-complex-from-real-imag x y))
;;(magnitude z)
;;(apply-generic magnitude z)
;;(let type-tags '(complex))
;;(let proc magnitude
;;(apply magnitude (contents z))
;;由于(define (magnitude z) (apply-generic magnitude z))
;;(apply-generic real-part (contents z))
;;(let type-tags '(rectangular))
;;(let proc magnitude)
;;(apply magnitude (contents (contents z)))
;;
;;得到结果
;;apply-generic被调用了两次，一次在(install-complex-package)，一次在(install-rectangular-package)
;;magnitude被调用了三次,一次外部调用，一次在(install-complex-package)，一次在(install-rectangular-package)
