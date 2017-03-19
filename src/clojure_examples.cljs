; install http://planck-repl.org/

; run examples
; $ planck clojure_examples.cljs

(println "Hello World 1")

((fn [message] (println message)) ; Operation
 "Hello World 2")                 ; Arguments

(#(println %) "Hello World 3")

(def messenger (fn [msg] (println msg)))
(messenger "Hello World 4")

(defn messenger [msg] (println msg))
(messenger "Hello World 5")

(println (let [x 4
               y 5]
           (+ x y)))

(defn printArgs [firstArg secondArg & nextArgs]
  (println "First arg: " firstArg)
  (println "Second arg: " secondArg)
  (println "Next args: " nextArgs))
(printArgs "aaa" "bbb" "ccc" "ddd")

; (myfn "a" "b" "c") is equivalent to (apply myfn ["a" "b" "c"])
(defn addNumbers [numbers]
  (apply + numbers))
(println (addNumbers '(3 6 9)))



