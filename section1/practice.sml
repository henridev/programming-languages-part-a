fun alternate (myList: int list) =
  let 
    fun sub_alternate(myList: int list, n) =
        if null myList then 0
        else if n = "positive" 
        then (hd myList) + sub_alternate(tl myList, "negative")
        else ~(hd myList) + sub_alternate(tl myList, "positive")
  in 
    sub_alternate(myList, "positive")
  end;

alternate [1,2,3,4];


fun min_max (myList: int list) =
    let 
      fun max_nonempty (xs : int list) =
                     if null (tl xs) 
                     then hd xs
                     else let val tl_ans = max_nonempty(tl xs)
                     in
                      if hd xs > tl_ans
                      then hd xs
                      else tl_ans
                     end
       fun min_nonempty (xs : int list) =
                     if null (tl xs) 
                     then hd xs
                     else let val tl_ans = min_nonempty(tl xs)
                     in
                      if hd xs < tl_ans
                      then hd xs
                      else tl_ans
                     end        
    in
       if null myList then (NONE, NONE) else  (SOME (min_nonempty(myList)), SOME (max_nonempty(myList)))
    end; 

min_max [1,2,6,4];


fun cumsum (myList: int list) = 
    let fun sub_cumsum(myList: int list, acc: int) = 
            if null myList then []
            else let val newacc = (acc + (hd myList)) 
            in newacc::sub_cumsum(tl myList, newacc)
            end
    in
      sub_cumsum(myList, 0)
    end;

cumsum [1,4,20];

fun greeting (name: string option) = 
  if isSome name
  then "Hello there, " ^ (valOf name) ^ "!"
  else "Hello there, you!"
;

greeting(SOME "Henri");

fun repeat (l1: int list, l2: int list) = 
  let fun n_times (n: int, num: int) = 
      if n = 0 then []
      else num::n_times (n-1, num)
  in 
    if null l1 then [] 
    else n_times(hd l2, hd l1) @ repeat(tl l1, tl l2)
  end
;

repeat ([1,2,3], [4,0,3]);


fun addOpt(n1: int option, n2: int option) = 
  if isSome n1 andalso isSome n2 
  then SOME (valOf n1 + valOf n2) 
  else NONE;

addOpt(SOME 4, SOME 3);

fun addAllOpt(myList: (int option) list) = 
  if null myList then NONE 
  else let val last_option = addAllOpt(tl myList)
       in
        if isSome (hd myList)
        then if isSome (last_option)
             then SOME (valOf (hd myList) + valOf last_option)
             else hd myList
        else last_option
       end;

addAllOpt ([SOME 1, NONE, SOME 3]);

fun any(myList: bool list) = 
  if null myList then true 
  else if hd myList then any(tl myList) else false
;

any ([true, false, true]);


fun zip(l1: int list, l2: int list) =
  if null l1 orelse null l2 then []
  else (hd l1, hd l2)::zip(tl l1, tl l2)
;

zip ([1,2,3], [4, 6]);

fun zipRecycle(l1: int list, l2: int list) =
  let 
    fun getLength(aList: int list) = 
        if null aList then 0
        else 1 + getLength(tl aList)
    val listLength = (getLength(l1), getLength(l2))
    fun zip(list1: int list, list2: int list) =
      if (#1 listLength = #2 listLength) then (hd list1, hd list2)::zip(tl list1, tl list2)
        else if (#1 listLength > #2 listLength) andalso null list2 then (hd list1, hd l2)::zip(tl list1, tl l2)
              else if (#1 listLength < #2 listLength) andalso null list1 then (hd l1, hd list2)::zip(tl l1, tl list2)
                     else if null list2 andalso null list2 then []
                        else (hd list1, hd list2)::zip(tl list1, tl list2)
  in
    zip(l1, l2)
  end;

zipRecycle ([1,2,3], [1, 2, 3, 4, 5, 6, 7]);