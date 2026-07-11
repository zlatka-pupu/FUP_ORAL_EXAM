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

// 2. Title & Author Block
#align(center)[
  #text(size: 24pt, weight: "bold")[FUP - ústna skúška] \
  #v(5mm)
  #text(size: 12pt, style: "italic")[neslusam] \
  
]

#v(1cm)

// 3. Outline / Table of Contents
#outline(depth: 2, indent: 1.5em)

#v(1cm)

[V] - Tomáš Votroubek , [H] - Rostislav Horčík , [Z] - Matěj Zorek  *Your examiner is random, your previous lecturer doesn't make a difference.*

= Functional Programming

[Z] What is pure/Higher-order function + examples of each possible combination?

[Z] List types of recursions based on branching factor + examples/classify head/tail recursion.

[H] What data types can fold be used on? 

// 4. Content Sections
= Racket

[V] How to implement infinite stream of nats/ones 
#pad(left: 2em)[
  1. using stream functions?
  2. without using stream functions?
]

[V] Describe how does foldl/foldr work, which parametres are used and what is the difference between foldl and foldr.


= $lambda$-Calculus

[Z] List and describe terms in syntax of $lambda$-calculus

[H/Z] What is a reduction,redex and normal form?  (Volne vyskyty TODO: remove)

[H] List and describe different types of reductions and their usage. (left right inner outer TODO:Remove)

[Z] What is the difference between bound and free variable?Which operation is done on them?

[H] What is Church-Rosser theorem?

[V] how to transform a $lambda$-expression to its normal form?


[H] how to represent True/False in $lambda$-Calculus?

[H] how to represent number in $lambda$-Calculus? How to represent addition of 2 numbers?

[H] reduce this expression (λx.x(λx.xx))e

[V] Find all free/bound vars , redexes in Y-combinator. Apply $beta$-reduction and find normal form.






= Haskell


[V] Describe signature of function map. 

[V] Describe signature of function fold.  

[H] What is a typeclass?


[H] How to implement polymorphic typeclass , which adds 1 to an Int and prints out length for String?

[V] What is a Monad? Which functions define it?  


[V] What is a Applicative typeclass? Which functions define it?  

[V] What is Functor typeclass?  Which functions define it?  

[H] What is a State Monad, what is it good for? How to implement bind for State Monad?





