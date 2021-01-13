
(* Type Generality *)
(* you can think of x::xs’ as two separate statements, 
 * x = hd(xs) and xs’ = tl(xs)   *)
fun append(xs, ys) = 
  case xs of 
       [] => ys
      | x::xs' => x:: (append(xs',ys))

(* function that determines if an item is in a list *)
fun contains(x,xs) = 
  case xs of 
       [] => false
     | x'::xs' => x = x' orelse (contains(x,xs'))




(* Practice Problem 1*)

fun swap_pair(a,b) = (b,a)


fun swap_pairs_list(xs) = 
  case xs of 
       [] => []
     | x::xs' => swap_pair(x)::swap_pairs_list(xs')

(* x::xs' is grabbing the head 
 * xs' is the tail (everything but the head) *)
fun size(xs) = 
  case xs of 
       [] => 0
     | x::xs' => 1 + size(xs')

fun remove_all(x,xs) = 
  case xs of 
    [] => []
     | x'::xs'=> if x = x' then remove_all(x,xs')
                else x'::remove_all(x,xs')

(*
 * Iteration walk through for remove_all 
 *
 * EX: 1 ,2 ,2, 4 -->2
 * 
 * 1:
 * 1+(2,2,4)
 *
 * 2:
 * 1+ (2,4)
 *
 * 3:
 *
 * 1+(4)
 *
 * 4:
 * 
 * 1 + 4 + ([])
 * 1+4 => [1,4]
 *
 *
 * *)




 (* Pattern Matching Example *)
 (* write a datatype shape which represents some 2d shaps and
  * a function val area  = fn:shape -> real
  * which computes a shape area
  *
  * *)
datatype shape = square of real
                 | rectangle of real * real
                 |circle of real

fun area (s:shape): real = 
  case s of 
       (square l) => l*l
     | (rectangle (x,y)) => x*y
     | (circle r) => 3.14 * r * r


