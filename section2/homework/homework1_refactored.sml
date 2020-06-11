fun is_older ((x, y, z), (a, b, c)) = 
    if x < a orelse y < b orelse z < c 
    then true
    else false;


fun number_in_month (dates, month) = 
    case dates of
        [] => 0
    |   (_ , m , _)::xs' => if m = month 
                            then 1 + number_in_month(xs', month) 
                            else number_in_month(xs', month);

fun number_in_months (dates, months) = 
    case months of
        [] => 0
    |   m::xs' => number_in_month(dates, m) + number_in_months(dates, xs');

fun dates_in_month (dates, month) = 
    case dates of
        [] => []
    |   (y, m, d)::xs' => if m = month 
                          then (y, m, d)::dates_in_month(xs', month)
                          else dates_in_month(xs', month);

fun dates_in_months (dates, months) = 
    case months of
        [] => []
    |   m::xs' => dates_in_month(dates, m) @ dates_in_months(dates, xs');

fun get_nth (strings, nth) = 
    case strings of
        s::xs' => if nth = 1 then s else get_nth(xs', nth-1);
 
fun date_to_string (y, m, d) = 
    let val months = ["January","February","March","April","May","June","July","August", "September", "October", "November", "December"]
        val month = get_nth(months, m)
    in
        month ^ " " ^ Int.toString(d) ^ ", " ^ Int.toString(y)
    end


fun number_before_reaching_sum (sum, numList) = 
    let fun checkSum (total, n, listNum) =
        let val newTotal =  total + num
        in
            case listNum of
                [] => 0
            |   num::numRest' => if (newTotal >= sum ) then n else checkSum(newTotal , n + 1, numRest') 
        end
    in
        checkSum(0, 0, numList)
    end;
