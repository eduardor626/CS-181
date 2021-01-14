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


(* 7 *)
fun date_to_string(date: (int*int*int) ) = 
  let
    val months = ["January","February","March","April", "May", "June", "July",
                      "August","September","October","November","December"]
    val cur_month = #2 date
    val cur_day = Int.toString(#1 date)
    val cur_year = Int.toString(#3 date)
    val month = get_nth(months,cur_month)
  in
    month ^"-"^cur_day^"-"^cur_year
  end

(* 8 *)
(* return the number n of the elements in the list that when adding 
 * gives you < the sum thats given *)
fun number_before_reaching_sum(sum: int, xs: int list) = 
    if sum <= 0 then 0
    else
      let
        val cur_element = hd xs
        val cur_sum = sum - cur_element
      in 
        if cur_sum > 0 then 1 + 
        number_before_reaching_sum(cur_sum, tl xs) 
        else 
          number_before_reaching_sum(cur_sum,tl xs)
      end

(* 9 *)
(* return an int of what month the day lands on*)
fun what_month(day: int) = 
  if day < 1 orelse day > 365 then 0
  else
    let 
      val months = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
      number_before_reaching_sum(day,months) + 1
    end

(* 10 *)
fun month_range(day1: int , day2: int) = 
  if day1 > day2 then []
  else
    let
      val month1 = what_month(day1)
      val month2 = what_month(day2)
      fun append(month1: int, month2: int) = 
        if month1 = month2 then month1::[]
        else month1::append(month1+1,month2)
    in 
      append(month1,month2)
    end

(* 11 *)
fun oldest(dates: (int*int*int) list) = 
  if null dates then NONE
  else
    let
      val cur_date = hd dates
      fun check_older(xs: (int*int*int) , d : (int*int*int) list) = 
        if null d then xs
        else
          let
            val date = xs
            val next_date = hd d
          in
            if is_older(date,next_date) then check_older(date, tl d)
            else
              check_older(next_date,tl d)
          end
    in
      SOME (check_older(cur_date,dates))
    end

(* 12 *)
fun cumulative_sum(xs: int list) = 
  if null xs then []
  else
    let
      val cur_el = hd xs
      fun helper(a:int, xs: int list) =
        if null xs then []
        else
          let 
            val next_el = hd xs
            val added = a + next_el
          in
            added::helper(added, tl xs)
          end
    in
      cur_el::helper(cur_el, tl xs)
    end

