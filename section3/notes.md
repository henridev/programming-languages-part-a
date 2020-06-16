# Section 3

## terms

- **first class functions** = functions can be passed / computed and stored wherever other values can be too
- **function closures** = functions using variables defined outside of them
- **higher order function** = function that takes or returns other functions
- **functional programming**
  - not using mutable data (pass by value)
  - functions are used as values (first class)
- **anonymous functions**
  - NOT `let fun triple y = 3*y in triple end`
  - DO `fn y => 3*y` to bind function to other funtion
  - cannot be used for recursion
  - to save anonymous fucntion use val binding `val increment = fn x => x + 1`

## 1️⃣ class functions
---
### **passing f as arguments**

<pre>
<code>fun n_times (f, n, x) =
    if n = 0
    then x
    else f (n_times(f, n-1, x))</code>
</pre>

type: `(’a -> ’a) * int * ’a -> ’a`

- **parametirc polymorphism / generic types** = functions take arguments of any type in this case however a msut be of some type

- **map hof** = apply to each element of list

<pre>
<code>(*NON curried form*)
fun map (f, myList) = 
    case myList of 
        [] => []
        x::xs' => (f x)::map(f, xs')
(*curried form*)
List.map f myList</code>
</pre>

- **filter hof** = return element of list if eval is true

<pre>
<code>(*NON curried form*)
fun filter (f, myList) = 
    case myList of 
        [] => []
        x::xs' => if (f x) then x::filter(f, xs') else filter(f, xs')
(*curried form*)
List.filter f myList</code>
</pre>

- **fold hof** = return element of list if eval is true

<pre>
<code>(*NON curried form*)
fun fold (f, acc ,myList) = 
    case myList of 
        [] => acc
        x::xs' => fold (f, f(acc, x), xs')
(*curried form*)
List.fold f acc myList</code>
</pre>

### **fun as values**

value / closure = #code for fun + #env on definition

- can only be used for calls not accessed
- when called #code is evaluated using #env

## Lexical scope and programming constructs and idioms
---

- Lexical scope
  - body of function evaluation --> done where function defined (in compile time) <--> done where function is called (in run time)
  - arguments are evaluated in dymanic environment (in run time)

semantics --> how is type checked and value bound

why do we want a closure for functions so that we have an extra environment in which we can evaluate a function body?

why do we not just use one dynamic environment in which to look values up? 

### idiom 1️⃣ passing closure to iterators (env on def + code for fun) to functions:

<pre><code>(*look n up in env where fn was defined*)
fun allGreaterThan (xs,n) = filter (fn x => x > n, xs)</code></pre>

### idiom 2️⃣ combine functions:

4 options:
- `fun sqrt_of_abs i = Math.sqrt(Real.fromInt (abs i))` 
- `fun sqrt_of_abs i = (Math.sqrt o Real.fromInt o abs) i` = infix operator o
- `val sqrt_of_abs = Math.sqrt o Real.fromInt o abs` = val binding

infix !> = !> is a function appearing between its two arguments
fun x !> f = f x

- `fun sqrt_of_abs i = i !> abs !> Real.fromInt !> Math.sqrt`

<pre><code>(*look n up in env where fn was defined*)
fun allGreaterThan (xs,n) = filter (fn x => x > n, xs)</code></pre>

### idiom 3️⃣ currying && partial application :

every fun takes one arg:

- we used to pass multiple thanks to pattern matching and tuples
- another option is **currying** = fun takes first conceptual arg which returns fun with second conceptual arg etc. 
  | this way a closure is created with the necesarry arguments 

partial application = don't give in all the possible arguments when currying

<pre><code>currying and uncurrying 
fun other_curry1 f = fn x => fn y => f y x
fun other_curry2 f x y = f y x
fun curry f x y = f (x,y)
fun uncurry f (x,y) = f x y
</code></pre>

### idiom 4️⃣ callbacks:

functions that are executed upon certain events

eg. use a callback to change state of the world via mutation 

## mutation via ML 
---

in order to achieve mutation we have to establisch references so we can do pass by reference instead of pass by value
- `ref e`
- get acces to ref content `!r`
- change ref content `r := e`


