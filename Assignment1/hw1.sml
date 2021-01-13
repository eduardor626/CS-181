(* Assignment1 
 * 
 * (int*int*int) = date
 *  1 = day [1-31]
 *  2 = month [1-12]
 *  3 = year 
 * *)

(* 1 *)
(* true if date1 < date2 *)
fun is_older (xs: (int*int*int) , ys: (int*int*int) ) =
  let
    val day_left = #1 xs
    val month_left = #2 xs
    val year_left = #3 xs
    val day_right = #1 ys
    val month_right = #2 ys
    val year_right = #3 ys
  in
    if year_left > year_right then false
    else if year_left < year_right then true
    else if month_left > month_right then false
    else if month_left < month_right then true
    else if day_left > day_right then false
    else if year_left = year_right andalso month_left = month_right andalso
    day_left = day_right then false
    else true
 end 

(* 2 *)
fun number_in_month (dates: (int*int*int) list, month: int) = 
  if null dates then 0 
  else
    let
      val cur_month = #2 (hd dates)
    in
      if cur_month = month then 1+number_in_month(tl dates,month)
      else number_in_month(tl dates, month)
    end

(* 3 *)
fun number_in_months (dates: (int*int*int) list, months:int list) =
  if null months then 0
  else
    let
      val cur_month = hd months
    in      
      number_in_month(dates,cur_month) + number_in_months(dates,tl months)
    end

(* 4 *)
(* same as 2 accept we add to the list that date *)
fun dates_in_month (dates: (int*int*int) list, month:int) =
  if null dates then []
  else
    let 
      val date = hd dates
      val cur_month = #2 date
    in
      if cur_month = month then date::dates_in_month(tl dates,month)
      else dates_in_month(tl dates, month)
    end

(* 5 *)
(* return list of dates within the lists of months *)
fun dates_in_months (dates: (int*int*int) list, months: int list) =
  if null months then []
  else 
    let
      val cur_month = hd months
    in
      dates_in_month(dates, cur_month) @ dates_in_months(dates,tl months)
    end

(* 6 *)
(* returns nth element of the list where teh head of the list is 1st *)
fun get_nth (xs: string list, n:int) = 
  if n = 1 then hd xs
  else get_nth(tl xs, n-1)
















