fun is_older (date1: int*int*int, date2: int*int*int) =
  if (#1 date1 < #1 date2) then true 
  else if (#1 date1 > #1 date2) then false
  else if (#2 date1 < #2 date2) then true
  else if (#2 date1 > #2 date2) then false
  else if (#3 date1 < #3 date2) then true
  else false;

fun number_in_month (dates: (int*int*int) list, month: int) =
  if null dates then 0
  else if (#2 (hd dates) = month) then 1 + number_in_month(tl dates, month)
  else number_in_month(tl dates, month);

fun number_in_months (dates: (int*int*int) list, months: int list) =
  if null months then 0
  else number_in_month(dates, hd months) + number_in_months(dates, (tl months));
					      
fun dates_in_month (dates: (int*int*int) list, month: int) =
  if null dates then []
  else if (#2 (hd dates) = month) then (hd dates) :: dates_in_month ((tl dates), month)
  else dates_in_month ((tl dates), month);

fun dates_in_months (dates: (int*int*int) list, months: int list) =
  if null months then []
  else dates_in_month(dates, (hd months)) @ dates_in_months(dates, (tl months));

fun get_nth (strings: string list, numb: int) =
  if numb = 1 then (hd strings)
  else get_nth(tl strings, numb - 1);

fun date_to_string (date: (int * int * int)) =
  let val months = ["January","February","March","April","May","June","July","August", "September", "October", "November", "December"]
      val month = get_nth(months, #2 date)
  in month ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
  end;

(* probably need to thinker with this one a tiny bit *)
fun number_before_reaching_sum (sum: int,  myList: int list) =
  if not (sum > 0) then 0	
  else 1 + number_before_reaching_sum(sum - (hd myList), (tl myList));

fun what_month (day: int) =
  let val monthsNum = [31,28,31,30,31,30,31,30,31,30,31,30]
  in number_before_reaching_sum(day, monthsNum)
  end;

fun month_range (dates: (int * int)) =
  if #1 dates > #2 dates then []
  else what_month(#1 dates) :: month_range((#1 dates + 1, #2 dates))


(*fun oldest(dates : (int * int * int) list) =
  if null dates then NONE
  else let fun oldest_nonempty(dates : (int * int * int) list) =
       if null (tl dates)then hd dates
       else let val tl_ans = oldest_nonempty(tl dates)			     
	    in
		if is_older(hd dates, tl_ans)
		then hd dates
		else tl_ans
	    end
  in
      SOME (oldest_nonempty dates)
  end*)
	   
fun oldest (dates: (int * int * int) list) =
  if null dates then NONE
  else if is_older((hd (tl dates)),(hd dates)) then (* is next element older then current one? *)
      if  null (tl (tl dates)) then SOME (hd (tl dates)) (* if the next element has nothing after just return it then*)
      else oldest(tl dates) (* there are other elements after the next one so make next current and check again*)
  else if null (tl (tl dates)) then SOME (hd dates) (* if current element is older then the next one and after next there is nothing than just return the current element  *)
  else oldest( (hd dates :: (tl (tl dates)) )); (* next element was younger so we can skip over it but we have to leave current head because it is currently the oldest*)

(*Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It
evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list*) 
