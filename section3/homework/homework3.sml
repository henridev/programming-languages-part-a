(* HELPER Higher Order Functions *)
fun cmap _ [] = []
|   cmap myFunc (x::xs') = (myFunc x)::(cmap myFunc xs');

fun tmap (f,xs) = 
  case xs of [] => [] 
  | x::xs' => (f x)::(tmap(f,xs'));

fun cfilter _ [] = []
|   cfilter myFunc (x::xs') = if myFunc x then x::cfilter myFunc xs' else cfilter myFunc xs'

fun tfilter (_ ,[]) = []
|   tfilter (myFunc, x::xs') = if myFunc x then x::tfilter(myFunc, xs') else tfilter(myFunc, xs')

(*  HELPER curry will take func and arg like it's curry but will call it like tuples *)
fun curry f x y = f(x, y)
fun uncurry f(x, y) = f x y 

(* filter out to get only Capitalized words *)
fun only_capitals listofstrings = List.filter (fn x => Char.isUpper(String.sub(x, 0))) listofstrings;


(* return longest string in a list *)
fun longest_string1 listofstrings = List.foldl (fn x y => if String.size y >= String size x then y else x) "" listofstrings
val longest_string1 = List.foldl (fn x y => if String.size y >= String.size x then y else x) ""

fun longest_string2 listofstrings = List.foldl (fn x y => if String.size y > String size x then y else x) "" listofstrings
val longest_string2 = List.foldl (fn x y => if String.size y > String.size x then y else x) ""
 
fun longest_string_helper comp listofstrings = 
    List.foldl (fn(x, y) => if comp(String.size x, String.size y) then x else y) "" listofstrings;

val longest_string3 = longest_string_helper (fn(x,y) => x > y) 
longest_string3 ["Helldo","worldo"];

val longest_string4 = longest_string_helper (fn(x,y) => x >= y) 
longest_string4 ["Helldo","worldo"];


val longest_capitalized = longest_string3 o only_capitals;

fun rev_string myString = (String.implode o List.rev o String.explode) myString;
val rev_string = String.implode o List.rev o String.explode;

