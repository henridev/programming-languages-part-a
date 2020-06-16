(* Programming Languages, Dan Grossman *)
(* Section 4: A Module Example *)

(* will assign different signatures to this module in later segments *)
signature RATIONAL =
sig
(* expose the datatype to clients --> datatype rational = Whole of int | Frac of int*int *)
(* unexpose the datatype to clients but use in struct*)
type rational
(* expose part of datatpe by just exporting constructor*) 
val Whole : int -> rational
exception BadFrac
val make_frac : (int * int) -> rational
val add: (rational * rational) -> rational
val toString : rational -> string
end

structure Rational1 :> RATIONAL = 
struct

(* 
   RULE 1: prevent zero denominators
   RULE 2: reduce fractions to indivicible 
   RULE 3: prevent negative denominators
*)

  datatype rational = Whole of int | Frac of int*int
  exception BadFrac


  fun gcd (x,y) =
       if x=y
       then x
       else if x < y
       then gcd(x,y-x)
       else gcd(y,x)
  (* 
  eg 3, 9 
  gcd(3, 6)
  gcd(3, 3)
  return 3
  in reduce d is 3 and y is 9 
  not equal so fraction (3/3,9/3) = 1/3
  *)

   fun reduce r =
       case r of
          Whole _ => r 
        | Frac(x,y) => 
          if x=0 (* numerator 0 means everything 0*)
          then Whole 0 
          else let val d = gcd(abs x,y) in (* RULE 2 *)
              if d=y 
              then Whole(x div d) 
              else Frac(x div d, y div d) 
          end

(* when making a frac, we ban zero denominators *)
   fun make_frac (x,y) =
       if y = 0 (* RULE 1 *)
       then raise BadFrac
       else if y < 0 (* RULE 3 *)
       then reduce(Frac(~x,~y)) (* move over - to numerator keep y positive*)
       else reduce(Frac(x,y)) (* y was already positive keep hoing baby *)

(* using math properties, both invariants hold of the result
   assuming they hold of the arguments *)
   fun add (r1,r2) = 
       case (r1,r2) of
	   (Whole(i),Whole(j))   => Whole(i+j)
	 | (Whole(i),Frac(j,k))  => Frac(j+k*i,k)
	 | (Frac(j,k),Whole(i))  => Frac(j+k*i,k)
	 | (Frac(a,b),Frac(c,d)) => reduce (Frac(a*d + b*c, b*d))

(* given invariant, prints in reduced form *)
   fun toString r =
       case r of
	   Whole i => Int.toString i
	 | Frac(a,b) => (Int.toString a) ^ "/" ^ (Int.toString b)

end
