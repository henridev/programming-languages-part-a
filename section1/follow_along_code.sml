(* 

  ML language = sequence of binding

  SEMANTICS (how it type checks and evaluates)
  Type checked --> type is determined by static environment
  Evaluated --> value is determined by dynamic environment 

 *)

(* variable binding *)
(* SYNTAX (how to write it) keyword variable = expression *)
(* val x = e; *)
val one = 1;

(* type check variable => use current static env => type check e (result depends on kind of expression) 
   => new static env = current static env + x having type t (t is type of e)*)
(* evaluate variable => use current dynamic env => evaluate e (result depends on kidn of expression)
   => new dynamic env = current dynamic env + x having value v (v is result of evaluating e)*)


(* add a sequence of bindings to your current file *)
(* use "foo.sml" *)


(* function bindings *)
(* fun x0 (x1: t1, x2: t2) = e  *)
fun test (x1:int) = if x1 > 0 then "bigger than zero" else "lower than zero";
test(1)

(* type checking -> thank to type inference theh function type of the output does not have to be known *)

(* tuples -- pairs, triplets ... *)
(* syntax (e1, e2) | evaluate e1 to v1 and e2 to v2 to form pair (v1, v2) *)
(* use #number to access the areas *)

(* lists *)
(* [] type t list for any type of t aka a´ list *)
(* push to list -> e1 :: e2 *)
(* 
USE lists -- three main functions 
  - null -> evals to true if list is empty
  - hd -> returns first list element other wise an exception
  - tl -> returns list without first argument 
*)

(* Let expressions = lets you define local bindings of any sort *)
(* syntax: let b1 b2 in e end *)

(* Options *)
(* NONE = option carrying nothing | SOME e = evalauates e to value v and becomes option carrying one value v *)
(* USE OPTIONS 
   - isSome = false if argument is NONE
   - valOf = get value carried by SOME
 *)

