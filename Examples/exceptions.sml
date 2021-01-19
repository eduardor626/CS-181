exception MyUndesirableCondition

fun mydiv(x,y) = 
  if y = 0
  then raise MyUndesirableCondition
  else x div y



fun mydiv_status(x,y) = 
  Int.toString mydiv(x,y) 
    handle MyUndesirableCondition => "FAILED"

fun maxlist(xs,ex) = 
  case xs of
       [] => raise ex
     | x::[] => x
     | x::xs' => Int.max(x,maxlist(xs',ex))
