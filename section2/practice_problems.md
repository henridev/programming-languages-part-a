Extra Practice Problems
Here are some extra programming problems that can be done using the material in this module. Many are similar in difficulty and content to the homework, but they are not the homework, so you are free to discuss solutions, etc. on the discussion forum. Thanks to Pavel Lepin and Charilaos Skiadas for contributing most of these.

0. Consider any of the extra Practice Problems from Section 1 and redo them using pattern matching.

Problems 1-4 use these type definitions:


Note that the grade might be absent (presumably because the student unregistered from the course).

Write a function \verb|pass_or_fail|pass_or_fail of type \verb|{grade : int option, id : 'a} -> pass_fail|{grade : int option, id : ’a} -> pass_fail that takes a \verb|final_grade|final_grade (or, as the type indicates, a more general type) and returns \verb|pass|pass if the grade field contains \verb|SOME|\;iSOMEi for an i\geq 75i≥75 (else \verb|fail|fail).
Using \verb|pass_or_fail|pass_or_fail as a helper function, write a function \verb|has_passed|has_passed of type \verb|{grade : int option, id : 'a} -> bool|{grade : int option, id : ’a} -> bool that returns \verb|true|true if and only if the the grade field contains \verb|SOME|\;iSOMEi for an i\geq 75i≥75.
Using \verb|has_passed|has_passed as a helper function, write a function \verb|number_passed|number_passed that takes a list of type \verb|final_grade|final_grade (or a more general type) and returns how many list elements have passing (again, \geq 75≥75) grades.
Write a function \verb|number_misgraded|number_misgraded of type \verb|(pass_fail _ final_grade) list -> int|(pass_fail _ final_grade) list -> int that indicates how many list elements are "mislabeled" where mislabeling means a pair \verb|(pass,x)|(pass,x) where \verb|has_passed x|has_passed x is \verb|false|false or \verb|(fail,x)|(fail,x) where \verb|has_passed x|has_passed x is \verb|true|true.
Problems 5-7 use these type definitions:



5. Write a function \verb|tree_height|tree_height that accepts an \verb|'a tree|’a tree and evaluates to a height of this tree. The height of a tree is the length of the longest path to a leaf. Thus the height of a leaf is \verb|0|0.

6. Write a function \verb|sum_tree|sum_tree that takes an \verb|int tree|int tree and evaluates to the sum of all values in the nodes.

7. Write a function \verb|gardener|gardener of type \verb|flag tree -> flag tree|flag tree -> flag tree such that its structure is identical to the original tree except all nodes of the input containing \verb|prune_me|prune_me are (along with all their descendants) replaced with a leaf.

8. Re-implement various functions provided in the SML standard libraries for lists and options. See http://sml-family.org/Basis/list.html and http://sml-family.org/Basis/option.html. Good examples include \verb|last|last, \verb|take|take, \verb|drop|drop, \verb|concat|concat, \verb|getOpt|getOpt, and \verb|join|join.

Problems 9-16 use this type definition for natural numbers:


A "natural" number is either zero, or the "successor" of a another integer. So for example the number 1 is just \verb|SUCC ZERO|SUCC ZERO, the number 2 is \verb|SUCC (SUCC ZERO)|SUCC (SUCC ZERO), and so on.

9. Write \verb|is_positive : nat -> bool|is_positive : nat -> bool, which given a "natural number" returns whether that number is positive (i.e. not zero).

10. Write \verb|pred : nat -> nat|pred : nat -> nat, which given a "natural number" returns its predecessor. Since 0 does not have a predecessor in the natural numbers, throw an exception \verb|Negative|Negative (will need to define it first).

11. Write \verb|nat_to_int : nat -> int|nat_to_int : nat -> int, which given a "natural number" returns the corresponding \verb|int|int. For example, \verb|nat_to_int (SUCC (SUCC ZERO)) = 2|nat_to_int (SUCC (SUCC ZERO)) = 2. (Do not use this function for problems 13-16 -- it makes them too easy.)

12. Write \verb|int_to_nat : int -> nat|int_to_nat : int -> nat which given an integer returns a "natural number" representation for it, or throws a \verb|Negative|Negative exception if the integer was negative. (Again, do not use this function in the next few problems.)

13. Write \verb|add : nat _ nat -> nat|add : nat _ nat -> nat to perform addition.

14. Write \verb|sub : nat _ nat -> nat|sub : nat _ nat -> nat to perform subtraction. (Hint: Use \verb|pred|pred.)

15. Write \verb|mult : nat _ nat -> nat|mult : nat _ nat -> nat to perform multiplication. (Hint: Use \verb|add|add.)

16. Write \verb|less_than : nat _ nat -> bool|less_than : nat _ nat -> bool to return \verb|true|true when the first argument is less than the second.

The remaining problems use this datatype, which represents sets of integers:



17. Write \verb|isEmpty : intSet -> bool|isEmpty : intSet -> bool that determines if the set is empty or not.

18. Write \verb|contains: intSet _ int -> bool|contains: intSet _ int -> bool that returns whether the set contains a certain element or not.

19. Write \verb|toList : intSet -> int list|toList : intSet -> int list that returns a list with the set's elements, without duplicates.
