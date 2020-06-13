type student_id = int
type grade = int (* must be in 0 to 100 range *)
type final_grade = { id : student_id, grade : grade option }
datatype pass_fail = pass | fail


fun pass_or_fail({grade, id}) = case grade of 
                                    NONE => fail
                                |   SOME num => if num >= 75 then pass else fail

fun pass_or_fail_two({NONE, _}) = fail
  | pass_or_fail_two({SOME num, _}) = if num >= 75 then pass else fail



fun has_passed(gradeFinal) = 
    let
        val isPassed = pass_or_fail(gradeFinal)
    in
        if isPassed = pass then true else false
    end

fun number_passed(x::xs') = if has_passed(x) then 1 + number_passed(xs') else number_passed(xs')
  | number_passed([]) = 0

fun number_misgraded((pf, fg)::xs') = 
    let
        val isPassed = has_passed({grade = fg, id = 0})
    in
        if (isPassed andalso pf = fail) then 1 + number_misgraded(xs')
        else if isPassed andalso pf = pass then 1 + number_misgraded(xs')
        else number_misgraded(xs')
    end
   | number_misgraded([]) = 0;



datatype 'a tree = leaf 
                 | node of { value : 'a, left : 'a tree, right : 'a tree }
datatype flag = leave_me_alone | prune_me



fun tree_height leaf = 0
  | tree_height (node({value, left, right})) = 1 + let 
          val l_depth = tree_height(left) 
          val r_depth = tree_height(right) 
        in if l_depth < r_depth then r_depth else l_depth 
        end;

tree_height(node({value = 1 , left = node{value = 1 , left = leaf, right = leaf }, right = leaf }));


fun sum_tree leaf = 0
  | sum_tree (node({value, left, right})) = value + let
            val traversalone = sum_tree(left)
            val traversaltwo = sum_tree(right)
        in 
            traversalone + traversaltwo
        end