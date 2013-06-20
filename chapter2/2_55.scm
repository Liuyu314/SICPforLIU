(car ''abracadabra)

;;It is actually (car (quote (quote abracadabra)))
;;(car ''abracadabra) => quote
;;(cdr ''abracadabra) => (abracadabra)
;;(cadr ''abracadabra) => abracadabra
