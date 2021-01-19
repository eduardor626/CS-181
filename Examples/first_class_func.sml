fun double x = 2 *x
fun incr x = x+1


fun inc_n_times_bad (n,x) = 
  if n = 0
  then x
  else 1 + inc_n_times_bad(n-1,x)

fun double_n_times_bad (n,x) = 
  if n = 0 
  then x
  else 2 * double_n_times_bad(n-1,x)

(* Write higher order function to abstract out this logic *)
fun n_times (f,n,x) = 
  if n = 0 
  then x
  else
    f (n_times(f,n-1,x))

fun inc_n_times (n,x)= 
  n_times(incr,n,x) 

fun double_n_times (n,x) = 
  n_times(double,n,x)
