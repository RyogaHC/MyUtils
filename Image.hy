(defn replace-at [lst idx val]
  (setv new-list (+ [] lst))         ; 元のリストをコピー
  (setv (get new-list idx) val)      ; 指定した位置の値を変更
  new-list)                          ; 新しいリストを返す

(defn turn [data]
	(setv result [])
	(for [i (range 0 (len (get data 0)))]
	     (setv b [])
	     (for [a data]
	          (.append b (get a i)))
             (.append result b))
	     result)

(defn toPBM [data]
	(+ "P1\n"
	(str (len (get data 0)))
	" "
	(str (len data))
	"\n"
	(.join "\n"
	       (list (map (fn [a] (.join " "
	                           (list (map str a))))
		    data)))))

(defn graph [func begin end]
	(if (< end begin)
	    []
	    (+ [(func begin)] (graph func (+ 1 begin) end))))

(defn drawGraph [data ue shita]
	(let [data2 (list (map round data))]
	     (list (map (fn [a]
	              (let [are (* [0] (+ 1 (- ue shita)))
		            y (- ue a)]
		           (if (and (<= shita a) (<= a ue))
			       (replace-at are y 1)
			       are)))
	      data2))))

(defn draw10 [data ue shita begin]
	(replace-at (list (map (fn [a] (replace-at a ue 1)) data)) (* -1 begin) (* [1] (+ 1 (- ue shita)))))

(defn happyset [func begin end ue shita]
	(toPBM (turn (draw10 (drawGraph (graph func begin end) ue shita) ue shita begin))))

; (print (toPBM (turn (drawGraph (graph (fn [x] (+ (* 2 x) 5)) -20 20) 50 -50))))
(print (happyset (fn [x] (+ (* 0.1 (** (- x 10) 2)) 10)) -50 50 50 -50))
;(print (toPBM [[100 200 0 250] [0 10 20 30]]))

