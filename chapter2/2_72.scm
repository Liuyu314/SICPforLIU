;;If now we have a huffman tree of which n=t, 
;;when n=t+1, we need to add 1 step for the most frequent symbol,
;;and n-1 steps for the least frequent symbol.
;;
;;If n changes from t to t+m, we need to add m steps for the most frequent symbol,
;;and m^2 steps for the least frequent symbol.
