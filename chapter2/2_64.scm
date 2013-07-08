(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))


(define (make-tree entry left right)
  (list entry left right))
;;a
;;partial-tree每次仅将elements的一部分转换为左子树和右子树。
;;代码最后返回转换后的子树和未处理的elements部分。
;;partial-tree每次取elements的前(n-1)/2个元素来进行转换，只将这部分转换为左子树，
;;而将后(n-((n-1)/2+1))个元素转换为右子树。
;;若元素个数不为0，则继续将这些元素按照上面规则再划分为两部分分别进行转换。
;;假设elements个数为10，则左子树为前四个元素(这时对于左子树，未处理部分为余下6个数据)，右子树为后五个元素。
;;我们继续将左子树的四个元素划分为第一个元素为左子树，后2个元素为右子树。而对于右子树(五个元素)，
;;我们将其划分为前两个元素我左子树(未处理部分为后三个元素)，后两个元素为右子树。
;;如果元素个数为2个，则在elements前加'()，
;;取(car left-result)为左子叶，取(car non-left-elts)为子树根，取(car right-result)为右子叶。
;;若元素个数为1，则在elements前加'()，取(car left-result)为左子叶,取(car non-left-elts)为子树根，
;;在right-result前加'()，再取(car right-result)为右子叶。
;;如果元素个数大于2，继续使用partial-tree分解为更小子树进行转换。
;;
;;
;;        5
;;       / \
;;      /   \
;;     1     9
;;      \   / \
;;       \ /   \  
;;       3 7    11

;;b
;;以下数字代表元素个数
;;n = 6
;;a1         a2         a3         a4         a5         a6
;;        2 (a1a2)            a3           3 (a4a5a6)    
;;        /\                              /\
;;       /  \                            /  \
;;      0    1                          1    1
;;           /\                        /\    /\
;;          /  \                      /  \  /  \
;;         0    0                    0    00    0
;;n = 7
;;a1         a2         a3         a4         a5         a6         a7
;;        3 (a1a2a3)            a4         3 (a5a6a7)    
;;        /\                              /\
;;       /  \                            /  \
;;      1    1                          1    1
;;     /\    /\                        /\    /\
;;    /  \  /  \                      /  \  /  \
;;   0    00    0                    0    00    0
;;n = 8
;;a1         a2         a3         a4         a5         a6         a7         a8
;;        3 (a1a2a3)            a4         4 (a5a6a7a8)    
;;        /\                              /\
;;       /  \                            /  \
;;      1    1                          1    2
;;     /\    /\                        /\    /\
;;    /  \  /  \                      /  \  /  \
;;   0    00    0                    0    00    1
;;                                              /\
;;                                             /  \
;;                                            0    0
;;我们发现步长以2为量级增加，复杂度为n
