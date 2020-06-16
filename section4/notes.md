# Section 

- type inference
- mutual recursion
- modules
- what are equivalent functions?

## Type inference

* staticaly typed = types are determined at compile time -> things have to be type checked beforehand
* dynamicaly typed = types are determined at runtime

* implicitly types = language that implicitly infers types at compile time 

steps:
- binding types in order
- for each val fun binding 
    * analyze definition for all **constraints**
    * if cannot hold because of **over-constraints** type error 
- for unconstrained types use **type variables** 'a
- enforce value restricitions
