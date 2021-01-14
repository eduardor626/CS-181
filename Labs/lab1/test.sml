(* power x^y recursive function *)
fun pow(x:int,y:int) = 
  if y = 0
  then 1
  else x * pow(x,y-1);

(* will produce an it - temporal variable*)
5;
