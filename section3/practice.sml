fun compose_opt f1 f2 a = 
      let fun compose_opt_sub f a = case f a of
                                   NONE => NONE
                                |  SOME v => v
in 
    (compose_opt_sub f1 (compose_opt_sub f2 a))
end;


fun do_until f1 f2 a = if f2 a then do_until f1 f2 (f1 a) else f1 a;

fun do_until (fn x => x div 2) (fn x => x mod 2 <> 1)


fun fatorial num = #2 (do_until (fn (x, acc) => (x-1, acc * x)) (fn (x, _) => x < 1) (num, 1));

fun app_all func g x =  List.foldr (fn(x, y)=> (func x) @ y) [] (g x);