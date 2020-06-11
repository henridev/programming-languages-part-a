(* Compound types = types containing other types in their definition *)
(* Make compound types with 3 building blocks *)

(* each of | one of | self reference *)
(* each of eg. tuple --> (int * string) is a value containing integer and a string *)
(* one of eg. int option --> contains an integer or it does not  !!! SAY WE WANT AN INT OR BOOL => USE DATATYPE BINDINGS !!!*)
(* self-reference eg. int list -->  a value containing nothing or an integer and another int list *)

(* Records => each-of type with named fields | tuples are just records *)
(* Syntax => {f1= e1, f2= e2} *)
(* type checked => {f1: t1, f2: t2} *)
(* Evaluation and type checking is infered from the expressions *)

(* Syntaxtic sugar --> tuples are syntaxtic sugar for records *)

(* Datatype bindings add datatype to the environment and constructors returning that datatype *)
(* This is an example of our very own one of type *)
datatype mytype = TwoInts of int * int 
                | Str of string
                | Pizza 

(* constructor can be function creating values of mytype eg.TwoInts and Str or actually just a value of mytype eg.Pizza *)
(* HOW do we access the data given a value of mytype ? --> figure out which of contructors was used to get a mytype *)

(* CASE EXPRESSIONS = ACCESS DATATYPE values THE RIGHT WAY *)
(* check variant and access the value in one go  *)
fun eval x = 
    case x of 
        Pizza => 3
    |   TwoInts(i1,i2) => i1 + i2
    |   Str s => String.size s;

eval(TwoInts(3, 4));

datatype my_int_list = Empty 
                     | Cons of int * my_int_list

fun append_mylist(xs, ys) = 
    case xs of 
        Empty => ys
    |   Cons(x, xs') => Cons(x, append_mylist(xs', ys));

val newlist = Cons(4,Cons(3, Cons(2, Empty)));

(* EACH of type pattern matching 
    - pattern matching in val bindings
    - pattern matching in function bindings 
*)

datatype triple = sample of int * int * int;

(* just have to use one branch because we know it is each of *)
fun sum_triple triple =
    case triple of 
        sample(x,y,z) => x + y + z;

sum_triple(sample(1,2,3)); 

(* use pattern matching in val bindings instead *)
fun sum_triple_val triple =
    let val (x,y,z) = triple
    in 
        x + y + z
    end;

(* pattern matching in function binding --> syntaxtic sugar for case expression with 1 branch *)
fun sum_triple(x, y, z) = x + y + z;
(* although it looks like function taking three argument of type int it uses pattern matching to take in only one record *)
(* EVERY FUNCTION --> takes just one argument *)


(*  Nested patterns --> anywhere we use variables in a pattern we can instead put another pattern *)
fun vars (a::(b::(c::d))) = 
    if a = 1
    then "first is one"
    else "first is not one";

val aList = [1, 4, 5];

vars(aList);

(* 
Process
 - take pattern and value 
 - see if pattern matches value 
 - if match bind variables to right part of value 
 *)