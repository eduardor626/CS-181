datatype mytype = TwoInts of int * int
                |Str of string
                | Pizza

val x = Str "hello"


fun f x = 
  case x of 
       Pizza => 3 
     | TwoInts(i1,i2) => i1+i2
     | Str s => String.size s

val y = f(x)

fun f2 x = 
  case x of Pizza => 3
     | TwoInts(i1,i2) => 4
     | Str s => 5
     (* | Pizza => 6  Produces error because repeated *)

(* we want a datatype for this type of expression like calculator *)
(*  (10+9)+(-4) *)
datatype exp = Constant of int
             | Negate of exp
             | Add of exp*exp
             | Mult of exp*exp

val e1 = Add (Constant (10+9), Negate (Constant 4))

fun eval e = 
  case e of 
       Constant i => i
     | Negate e2=> ~ (eval e2)
     | Add(e1,e2) => (eval e1) + (eval e2)
     | Mult(e1,e2) => (eval e1) * (eval e2)

fun max_constant e = 
  let 
      fun max_of_two(e1,e2) =
    let
      val m1 = max_constant(e1)
      val m2 = max_constant(e2)
    in
      if m1 > m2 then m1 else m2
    end
  in
    case e of 
       Constant i => i
     | Negate e2 => max_constant e2
     | Add(e1,e2) =>  max_of_two(e1,e2)
     | Mult(e1,e2) => max_of_two(e1,e2)
  end

fun sum_triple triple = 
  case triple of
       (x,y,z) => x + y + z

val s1 = sum_triple((3,4,5))

fun full_name {first = x, middle = y , last = z} =
  x^ " "^ y ^ " " ^ z 

(* old way to write min pair without pattern matching*)
fun min_pair(tr:int*int) = 
  let 
    val x1 = #1 tr
    val x2 = #2 tr
  in
    if x1 < x2 then x1 else x2
  end

(* new way to write min pair with pattern matching *)
fun min_pair2(p:int*int) = 
  case p of
       (x1,x2) => if x1 < x2 then x1 else x2

fun min_pair3(x1,x2) = 
  if x1 < x2 then x1 else x2
