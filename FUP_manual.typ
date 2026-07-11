#set page(
  paper: "a4",
  margin: (x: 2.5cm, top: 3cm, bottom: 2.5cm),
  header: align(right, text(fill: gray, size: 9pt)[Typst Feature Showcase]),
  footer: [
    #set text(fill: gray, size: 9pt)
    #grid(
      columns: (1fr, 1fr),
      [Draft Document],
    align(right, context counter(page).display())    )
  ]
)

#set text(
  font: "new computer modern",
  size: 11pt,
  lang: "en"
)

#align(center)[
  #text(size: 24pt, weight: "bold")[FUP - Oral Exam] \
  #v(5mm)
  #text(size: 12pt, style: "italic")[neslusam and question providers] \
  
]

#v(1cm)

#outline(depth: 2, indent: 1.5em)

#v(1cm)

*TRIGGER WARNING -  M\*NAD* - The text below contains repeated, explicit occurences of the "M-Word".If you are currently recovering from trying to understand what  a m*nad actually is, please turn back now.

== Introduction
[V] - Tomáš Votroubek , [H] - Rostislav Horčík , [Z] - Matěj Zorek  *Your examiner is random, your previous lecturer doesn't make a difference.*





= Functional Programming

[Z] _What is pure/Higher-order function + examples of each possible combination?_

*Pure function* is like a mathematical function. Pure function is a *deterministic function without any side effects* (e.g., no modifying global variables, no writing to files)

*Higher-order function:* function taking *other functions as arguments* or *returning a function* or both is called a higher-order function.

#align(center)[
  #table(
    columns: (1.5fr,2.0fr,2.0fr),
    align: (col,row) => if col == 0 or row==0 {center + horizon} else {left + horizon},
    stroke: 0.5pt + rgb("#b0b0b0"),
    fill: (col, row) => if row == 0 or col == 0 { rgb("#f5f5f5") } else { none },

   table.header([*order* \\ *purity*],[*Pure*],[*Impure*]) ,
   [*First-Order*],[`circle_area r =  pi * r * r `] ,[`print x / getLine`],
   [*Higher-order*],[`map / filter / fold / apply`],[`mapM / modify (State monad)` ]
  )
]


[Z] _List types of recursions based on branching factor + examples/classify head/tail recursion._

Recursion is split into *linear/tree recursion*.

*Linear recursion* makes one recursive call per execution step. Example: *Factorial*

*Tree (Non-linear) recursion* makes two or more recursive calls per execution step. Example: *Fibonacci*

In *head recursion*, the recursive call is made before the rest of the function's operations are completed.

Example:

```hs
factorialHead 0 = 1
factorialHead n = n * factorialHead (n - 1)

```

In *tail recursion* the recursive call is the very last operation executed by the function. It often uses an *accumulator*. Tail recursion is always *linear *.

Example:

```hs
factorialTail 0 acc = acc
factorialTail n acc = factorialTail (n - 1) (n * acc)
```

= Racket

[V] How to implement infinite stream of nats/ones 
#pad(left: 2em)[
  1. using stream functions?
  2. without using stream functions?
]
Solution: TODO


[V] Describe how does foldl/foldr work, which parametres are used and what is the difference between foldl and foldr.

Solution: TODO


= $lambda$-Calculus

[Z] List and describe terms in syntax of $lambda$-calculus

Solution: TODO


[H/Z] What is a reduction,redex and normal form?  (Volne vyskyty TODO: remove)

Solution: TODO


[H] List and describe different types of reductions and their usage. (left right inner outer TODO:Remove)

Solution: TODO

[Z] What is the difference between bound and free variable?Which operation is done on them?

Solution: TODO

[H] What is Church-Rosser theorem?

Solution: TODO

[V] how to transform a $lambda$-expression to its normal form?

Solution: TODO

[H] how to represent True/False in $lambda$-Calculus?

Solution: TODO

[H] how to represent number in $lambda$-Calculus? How to represent addition of 2 numbers?

Solution: TODO

[H] reduce this expression (λx.x(λx.xx))e

Solution: TODO

[V] Find all free/bound vars , redexes in Y-combinator. Apply $beta$-reduction and find normal form.

Solution: TODO

= Haskell

Solution: TODO

[V] Describe signature of function map. 

Solution: TODO

[V] Describe signature of function fold.

Solution: TODO

[H] What is a typeclass?


Solution: TODO

[H] How to implement polymorphic typeclass , which adds 1 to an Int and prints out length for String?

Solution: TODO


[V] What is a Monad? Which functions define it?  

Solution: TODO


[V] What is a Applicative typeclass? Which functions define it?  

Solution: TODO


[V] What is Functor typeclass?  Which functions define it?  

Solution: TODO

[H] What is a State Monad, what is it good for? How to implement bind for State Monad?

Solution: TODO





