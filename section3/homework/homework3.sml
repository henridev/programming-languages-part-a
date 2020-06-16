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


exception NoAnswer;

fun first_answer f [] = raise NoAnswer
 |  first_answer f (x::xs') = case f x of 
                                SOME value => value
                              | NONE => first_answer f xs';

fun all_answers f aList = 
    let fun sub_all_answers [] acc = acc
        |   sub_all_answers (x::xs') (SOME v)= case f x of
                                                NONE => NONE
                                             |  SOME xv => sub_all_answers xs' (SOME (xv @ v))   
    in
        sub_all_answers aList (SOME [])
    end;


datatype pattern = Wildcard 
                 | Variable of string 
                 | UnitP 
                 | ConstP of int 
                 | TupleP of pattern list 
                 | ConstructorP of string * pattern;

datatype valu = Const of int 
              | Unit 
              | Tuple of valu list 
              | Constructor of string * valu;

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 () (*matches everything produced empty list bindings*)
	  | Variable x        => f2 x  (*produces one element list hold (s,v) *)
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps 
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end;

fun count_wildcards myPattern = g (fn () => 1) (fn  x => 0) myPattern;
val count_wildcards2 = g (fn () => 1) (fn  x => 0);

val count_variablelength = g (fn () => 0) (fn  x => String.size x);
fun count_wild_and_variable_lengths myPattern = (count_wildcards2 myPattern, count_variablelength myPattern);

fun same_string(s1 : string, s2 : string) =
    if s1 = s2 then 1 else 0;

fun count_some_var (myString,myPattern) =  g (fn () => 0) (fn x => same_string(x, myString)) (myPattern);


fun check_pat myPattern =
  let fun stringList (Variable x) = [x]
        | stringList (TupleP ps)  = List.foldl (fn (ptn, i) => i @ (stringList ptn)) [] ps
        | stringList (ConstructorP(_,p)) = stringList p
        | stringList _ = []
      fun check_repeats (x::xs') = if List.exists (fn y => x = y) xs' then false else check_repeats xs'
        | check_repeats [] = true 
  in (check_repeats o stringList) myPattern end;


val test10 = check_pat (TupleP [Variable "t", TupleP [Variable "t", Wildcard]]);

(* TupleP ps matches a value of the form Tuple vs if ps and vs have the same length and for all i, the
ith element of ps matches the ith element of vs. The list of bindings produced is all the lists from the
nested pattern matches appended together. *)
(* ConstructorP(s1,p) matches Constructor(s2,v) if s1 and s2 are the same string (you can compare
them with =) and p matches v. The list of bindings produced is the list from the nested pattern match.
We call the strings s1 and s2 the constructor name. *)
(* 
• ConstP 17 matches only Const 17 and produces the empty list of bindings (and similarly for other
integers). 
*)
fun match (_, Wildcard) = SOME []
  | match (Unit, UnitP) = SOME []
  | match ((Const x), (ConstP y)) = if x = y then SOME [] else NONE
  | match (v, (Variable aString)) = SOME [(aString, v)]
  | match ((Tuple vs), (TupleP ps)) = if List.length vs = List.length ps
                                      then all_answers match (zip(vs, ps))
                                      else NONE             
  | match (Constructor(s',v), ConstructorP(s'',p)) = if s' = s''
                                                     then match (v, p)
                                                     else NONE   
  | match (_ , _) = NONE;


(* 
• Wildcard matches everything and produces the empty list of bindings.
• Variable s matches any value v and produces the one-element list holding (s,v).
• UnitP matches only Unit and produces the empty list of bindings.
• ConstP 17 matches only Const 17 and produces the empty list of bindings (and similarly for other
integers).
• TupleP ps matches a value of the form Tuple vs if ps and vs have the same length and for all i, the
ith element of ps matches the ith element of vs. The list of bindings produced is all the lists from the
nested pattern matches appended together.
• ConstructorP(s1,p) matches Constructor(s2,v) if s1 and s2 are the same string (you can compare
them with =) and p matches v. The list of bindings produced is the list from the nested pattern match.
We call the strings s1 and s2 the constructor name.
• Nothing else matches. 
*)


fun first_match valu ps = SOME (first_answer (fn x => match (valu, x)) ps)
    handle NoAnswer => NONE;
