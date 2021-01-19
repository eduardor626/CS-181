fun sum xs = 
  case xs of 
       [] => 0
     | x::xs' => x + sum xs'

(* tail recursive version *)
fun sum2 xs =
  let 
    fun aux(xs,acc) = 
      [] => acc
      | x::xs' => aux(xs',acc+x)
  in
    aux(xs,0)
  end

fun rev xs = 
  case xs of 
       [] => []
     | x::xs' => (rev xs') @ [x]

fun rev_tail xs = 
  let
    fun aux(xs,acc) = 
    case xs of 
         [] => acc
       | x::xs' => aux(xs',x::acc)
  in
    aux(xs,[])
  end



