(import mygraph math)

(let [scaler 10
a (mygraph.happyset (mygraph.scaleGraph math.sin scaler))
b (mygraph.happyset (mygraph.scaleGraph (fn [x] (** 2 x)) scaler))
c (mygraph.happyset (mygraph.scaleGraph (fn [x] (+ (* 2 (** (+ x 5) 2)) -5)) scaler))
d (mygraph.happyset (mygraph.scaleGraph (fn [x] (if (not (= x -2)) (+ (/ 3 (+ x 2)) 3) 0)) scaler))]
(print (mygraph.toPBM (mygraph.mergeGraph a (mygraph.mergeGraph b (mygraph.mergeGraph c d))))))


; (print (mygraph.toPBM (mygraph.happyset (let [a ] (mygraph.scaleGraph math.sin 5) a))))
