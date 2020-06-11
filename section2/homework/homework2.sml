(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
(* Problem 1: a *)
fun all_except_option (letters, lettersList) = 
    case lettersList of
         [] => NONE (* base case *)
    |    x::xs' => if same_string(x, letters) 
                    then SOME xs' (* base case *)
                    else case all_except_option(letters, xs') of
                            NONE => NONE  (* base case *)
                        |   SOME endNoOption => SOME(x::endNoOption) ;


    
(* Problem 1:b *) 
fun get_substitutions1 (listOfListsWithStrings, aString) = 
    case listOfListsWithStrings of
        [] =>  []
    |   x::xs' => case all_except_option(aString, x) of 
                        NONE => get_substitutions1(xs', aString)
                    |   SOME endNoOption => endNoOption @ get_substitutions1(xs', aString);
(* this one will alway return a list no matter what
in case of none we can keep going without anything 
in case of some endpoint is going to be a list so we can jsut start appending it *)
    
    

(* Problem 1:c *)
fun get_substitutions2 (listOfListsWithStrings, aString) =
    let 
        fun aux(acc, listOfListsWithStrings) = 
                case listOfListsWithStrings of
                        [] => acc
                    |   x::xs' =>  case all_except_option(aString, x) of 
                            NONE => aux(acc, xs')
                        |   SOME endNoOption => aux((acc @ endNoOption), xs')
    in
        aux([], listOfListsWithStrings)
    end;


(* Problem 1:d *)
(* base case is returning an empty list *)
(* begin by inserting the given name *)
fun similar_names (listOfListsWithStrings, nameRecord) = 
    let
    fun replacewithRecord(endNoOption) =
        case nameRecord of 
            {first, middle, last} => case endNoOption of
                                        [] => []
                                        |    x::xs' => {first = x, last = last , middle = middle}::replacewithRecord(xs')


    fun sub_similar_name (listOfListsWithStrings, acc) =
        case nameRecord of 
            {first, middle, last} => case listOfListsWithStrings of
                            [] => acc
                        |   x::xs' => case all_except_option(first, x) of 
                                NONE => sub_similar_name(xs' ,acc)
                            |   SOME endNoOption => sub_similar_name(xs', (acc @ replacewithRecord(endNoOption)))
    in
        case nameRecord of 
                {first, middle, last} => sub_similar_name(listOfListsWithStrings, [{first = first, last = last , middle = middle}])
    end
  

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* diamond heart are red *)
(* put your solutions for problem 2 here *)
(* Problem 2:a *)
fun card_color (suit, _) =  case suit of Clubs => Black
                                         |  Spades => Black
                                         |  Hearts => Red
                                         |  Diamonds => Red;

fun card_color_two (Clubs, _) = Black
                             |  card_colors(Spades, _) = Black
                             |  card_colors(Hearts, _) = Red
                             |  card_colors(Diamonds, _) = Red;
   

(* Problem 2:b *)
fun card_value (_, rank) = case rank of Num(i) => i
                                    |   Ace => 11
                                    |   _ => 10;
 

(* Problem 2:c *)
fun remove_card (cs, c, exc) = 
    let fun sub_remove_card (acc, cs) = 
        case cs of  
            [] => raise exc
        |   x::xs' => if x = c 
                      then acc @ xs'
                      else sub_remove_card(x::acc, xs')
    in
        sub_remove_card([], cs)
    end;

(* Problem 2:d *)
fun  all_same_color () =


(* Problem 2:e *)
fun sum_cards  =
  
(* Problem 2:f *)
fun p_score () =

fun score () = 

(* Problem 3:a-1 *)
fun count_ace () = ace


fun score_challenge () =
  

(* Problem 2:g *)
fun run () =

fun officiate () =


(* Problem 3:a-2 *)
fun min_sum () = 

fun officiate_challenge () =
*) 