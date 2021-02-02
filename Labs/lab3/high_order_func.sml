(* Higher-order functions demo *)

(* Lets write map, flat_map, filter, fold *)

(* val map = fn : (('a-> 'b) * 'a list) -> 'b list*)
fun map (f,xs) = 
  case xs of 
       [] => []
     | x::xs' => (f x) ::(mao(f,xs'))
  
fun flat_map (f,xs) 
  case xs of 
       [] => []
     | x::xs' => (f x) @ (flat_map(f,xs'))

fun filter (f,xs) = 
  case xs of 
       [] => []
     | x::xs' => if (f x) 
                 then x :: (filter(f,xs'))
                 else filter(f,xs')

(* val fold = fn : (('a*'b) -> 'a) * 'a*'b list -> 'a) *)
fun fold(f,acc,xs) = 
  case xs of 
       [] => acc
     | x::xs' => fold(f,f(acc,x),xs')


(* Assignment *)

(* double_all which has type int list -> int list. This takes an int list and 
 * reutrns an int list whose elements are twice the orginal *)

fun double_all(f, xs) = map((fn x => x*2),xs)

fun join xss = fold((fn(acc,x) => x @ acc),[] , xss)

fun count_zeros xs fold((fn(acc,x) => if x = 0  then acc+1 else acc),0,xs)
fun count_zeros xs = length(filter((fn (x) => x=0),xs))
