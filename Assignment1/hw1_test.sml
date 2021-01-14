(* Note: 
 * use "hw1.sml" in REPL , don't load in this file.
 * after loading "hw1.sml" in REPL , load this file
 *
 * *)


(*test question 1 *)
val test1 = is_older((2,10,1993),(1,1,1993)) = false
val test2 = is_older((1,12,1965),(3,12,1992)) = true

(* test question 2 *) 
val dates =
  [(12,12,1990),(2,2,1999),(2,10,1993),(31,10,2020),(10,10,2021),(1,2,1880)]
val test3 = number_in_month(dates,10) = 3
val test4 = number_in_month(dates,12) = 1
val test5 = number_in_month(dates,3) = 0 

(* test question 3 *)
val months = [10,2,3,1]
val test6 = number_in_months(dates,months) = 5
val test7 = number_in_months(dates,[1,3]) = 0

(* test question 4*)
val test8 = dates_in_month(dates, 10) = [(2,10,1993),(31,10,2020),(10,10,2021)]
val test9 = dates_in_month(dates,1) = []

(* test question 5*)
val test10 = dates_in_months(dates,months) =
  [(2,10,1993),(31,10,2020),(10,10,2021),(2,2,1999),(1,2,1880)]
val test11 = dates_in_months(dates, [3,1]) = []

(* test question 6 *)
val str_list = [("hello"),("i'm"),("bob"),("ross")]
val test12 = get_nth(str_list,1) = "hello"
val test13 = get_nth(str_list,3) = "bob"

(* test question 7 *)
val test14 = date_to_string((2,10,1993)) = "October-2-1993"
val test15 = date_to_string((1,1,1990)) = "January-1-1990"

(* test question 8  *)
val test16 = number_before_reaching_sum(5,[1,2,3,4,5]) = 2
val test17 = number_before_reaching_sum(12,[1,2,3,4,5]) = 4

(* test question 9 *)
val test18 = what_month(33) = 2
val test19 = what_month(365) = 12  
val test20 = what_month(70) =  3 
val test21 = what_month(304) = 10 
val test22 = what_month(28) = 1

(* test question 10 *)
val test23 = month_range(33,365) = [2,3,4,5,6,7,8,9,10,11,12]
val test24 = month_range(33,37) = [2]
val test25 = month_range(70,304) = [3,4,5,6,7,8,9,10]
