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


#let show-exam-answers = true
//#let show-exam-answers = false

#let question-answer(question, answer, show-answer: true) = [
  #block(width: 100%, breakable: false,inset: (bottom: 1.2em))[
    #set text(style: "italic")
    #question
    #if show-answer [
      #v(0.3em)
      #rect(
        width: 100%, 
        stroke: (left: 2pt + rgb("#0066cc")), 
        fill: rgb("#f8fafd"), 
        inset: 10pt
      )[
        #set text(fill: rgb("#1a1a1a"),style: "normal")
        *Solution:* \ #answer
      ]
    ]
  ]
]
#let qa = question-answer.with(show-answer: show-exam-answers)

#v(1cm)

#outline(depth: 2, indent: 1.5em)

#v(1cm)

#text(fill: rgb("#cc0000"))[ #emoji.warning
*TRIGGER WARNING -  M\*NAD* #emoji.warning] - The text below contains repeated, explicit occurences of the "M-Word".If you are currently recovering from trying to understand what  a m*nad actually is, further review of this material is not recommended..


= Introduction
[V] - Tomáš Votroubek , [H] - Rostislav Horčík , [Z] - Matěj Zorek  *Your examiner is random, your previous lecturer doesn't make a difference.*





= Functional Programming
#qa(
  [[Z] What is pure/Higher-order function + examples of each possible combination?],
  [
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
  ]
)

#qa(
  [
  [Z] List types of recursions based on branching factor + examples/classify head/tail recursion.
  ],
  [
  Recursion is split into *linear/tree recursion*.

  *Linear recursion* makes *one* recursive call per execution step. Example: *Factorial*

  *Tree (Non-linear) recursion* makes *two or more* recursive calls per execution step. Example: *Fibonacci*

  In *head recursion*, the recursive call is made *before* the rest of the function's operations are completed.

  Example:

  ```hs
  factorialHead 0 = 1
  factorialHead n = n * factorialHead (n - 1)

  ```

  In *tail recursion* the recursive call is the *very last* operation executed by the function. It often uses an *accumulator*. Tail recursion is always *linear*.

  Example:

  ```hs
  factorialTail 0 acc = acc
  factorialTail n acc = factorialTail (n - 1) (n * acc)
  ```
  ]
)

= Racket
#qa(
  [
  [V] How to implement infinite stream of nats/ones 
  #pad(left: 2em)[
    1. using stream functions?

    2. without using stream functions?
  ]

  ],
  [
  1.  Example - stream of natural numbers using stream-cons
  ```rkt
  (define (stream_nats n)
  (stream-cons n (stream_nats (+ n 1))))

  ```
  2.
  ```Racket
  (define (nats_lambda n)
    (cons n (lambda () (nats_lambda (+ n 1)))))

  ;;for extra points use syntantic sugar thunk ;)

  (define (nats_thunk n)
    (cons n (thunk (nats_thunk (+ n 1)))))

  ```
  ]
)
#qa(
  
  [[V] Describe how does foldl/foldr work, which parametres are used and what is the difference between foldl and foldr. ],

[
  *Foldl/r collapses a list into a single value*, combining its elements with an accumulator from left to right (foldl) / from right to left (foldr).

  Example:

  ```rkt
  (foldl append '() '((1 2) (3 4) (5 6)))
  ;; Output: '(5 6 3 4 1 2)

  (foldr append '() '((1 2) (3 4) (5 6)))
  ;; Output: '(1 2 3 4 5 6)

  ```
  ]
)

= $lambda$-Calculus
#qa(

  [[Z] List and describe terms in syntax of $lambda$-calculus.],
  [
  The syntax of lambda calculus has only three types of terms: a *variable* (denoted by lowercase letters x,y,z...
  ), the *abstraction* of a variable 
  from a term 
  defining a function (denoted as $lambda$x.t
  ), and the *application* of a term 
  to a term (e.g.  xy , ($lambda$x.y)y , ...).
  
  ]
)
#qa(
  [[H/Z] What is a reduction and a redex?],
  [
Solution: TODO
  ]
)


#qa(
[[H] List and describe different types of reductions and their usage. (left right inner outer TODO:Remove)],
[

Solution: TODO  
  ]
)

#qa(
[[V] What is a normal form and how to transform a $lambda$-expression to its normal form?],
[
Solution: TODO
        ]
)
#qa(
[[Z] What is the difference between bound and free variable? Which operation is done on them?],
[

  Solution: TODO
    ]
)

#qa(
  
[[H] What is Church-Rosser theorem?],
[
Solution: TODO
    ]
)


#qa(
[[H] how to represent True/False in $lambda$-Calculus?],
  [
Solution: TODO
  ]
)
#qa(
[[H] how to represent number in $lambda$-Calculus? How to represent addition of 2 numbers?],
  [
Solution: TODO
  ]
)
#qa(
[[H] reduce this expression (λx.x(λx.xx))e],
  [

Solution: TODO
  ]
)
#qa(
[[V] Find all free/bound vars , redexes in Y-combinator. Apply $beta$-reduction and find normal form.],
  [

Solution: TODO
  ]
)

= Haskell

#qa(
  [[V] Describe signature of function map.],
  [
    (a -> b) -> [a] -> [b]
  ] 


)
#qa(
  [[V] Describe signature of function fold.],
  [
    (Foldable t, Monoid m) => t m -> m
  ]

)

#qa(
  [[H] What is a typeclass?],
  [
    *Typeclass is a sort of interface that defines some behavior*. Typeclasses enable functions to work on different types while supporting certain operations.

    For a custom data type , you can usually derive some typeclasses: `Eq, Ord, Enum, Bounded, Show, Read`. If this is not the case, you need to implement it yourself ;).
  ]


)

#qa(
  [[H] How to implement polymorphic typeclass , which adds 1 to an Int and prints out length for String?],

  [

    You need to create a polymorphic typeclass with a single method that *returns IO monad*.
    ```hs
class Magnesium a where
  wheatBran :: a -> IO ()

instance Magnesium Int where
  wheatBran n = do
    let next = n + 1
    print next

instance Magnesium String where
  wheatBran str = do
    let len = length str
    print len
    ```
  ]
)
#qa(
  [[V] What is Functor typeclass?  Which functions define it?],
  [
      *Functor is any data type which can be mapped over*. It enables applying pure functions without changing the structure.

      *Core function*: `fmap :: (a -> b) -> f a -> f b` ( or the `<$>` operator)

      Example: 
      ```hs 
addOne = fmap (+1)

addOne (Map.fromList [('a',1), ('b',2)])
--Output: Map.fromList [('a',2), ('b',3)]
      ```

  ]
)
#qa(

  [[V] What is a Applicative typeclass? Which functions define it?],
  [
      Applicative typeclass *extends Functor* typeclass. With a Functor, you use `<$>` to map a normal function over a wrapped value.
      With a * Applicative* typeclass, you can *apply a function that is already wrapped to a value that is also wrapped* using `<*>`, called *apply* or *ap*.

      Another function of applicative typeclass is to *wrap in the simplest way possible* into a certain data type, using the function *pure*.

      *Core functions*:

      ```hs
pure :: a -> f a

(<*>) :: f (a -> b) -> f a -> f b
      ```


      Examples:
```hs
-- fmap fails here, because the function is wrapped
Just (+10) <$> Just 5  -- Result: Error 

Just (+10) <*> Just 5  -- Result: Just 15
Nothing <*> Just 5  -- Result: Nothing

pure 5 :: Maybe Int   -- Output: Just 5
pure 5 :: [Int]   -- Output: [5]

```
  ]  

)
#qa(
  [[V] What is a Monad? Which functions define it? ],

  [
    A Monad *extends Applicative* typeclass. Monads allow to *chain dependent operations*, 
    meaning the output of *step A directly determines what step B will look like*. 
    In contrast, Applicative executes a series of independent operations that are ignorant to each other 
    until they are combined at the very end.

    *Core Functions*:
    1. *bind* (written as `>>=`): It feeds a boxed value to a function that returns a new box, without double-boxing.In the `do` notation , it is written with a arrow `<-`
  
    ```hs 
     (>>=) :: m a -> (a -> m b) -> m b
    ```
    Example:
    ```hs
    Just 10 >>= (\x -> Just (x + 1))  --Output: Just 11 (Unpacks 10, adds 1, repacks)
    Nothing >>= (\x -> Just (x + 1))  --Output: Nothing

    Just 10 <*> (\x -> Just (x + 1))  --Output: Error (Applicative is not enough)
    
    ```
    2. *>> operator*: >> chains two monadic actions together by running the first, discarding its value, and then running the second. This seems useless at first, but under the hood, every time you write a line in a do block without using `<-`, Haskell translates it to >> under the hood.

  ```hs 
  (>>) :: m a -> m b -> m b

  ```
  Example:
    ```hs

--This is equvalent:
main = do
  putStrLn "Hello"
  putStrLn "World"

--to this:
main = putStrLn "Hello" >> putStrLn "World"
    ```

  3. *return*: the *same function as `pure`* in Applicative typeclass
    
    ```hs 
return :: a -> m a

    ```

  Example from 1. rewritten with do notation.
  
  ```hs 
successExample :: Maybe Int
successExample = do
  x <- Just 10      
  return (x + 1) 
    ```
  ]
)

#qa(
  [[H] What is a State Monad, what is it good for? How to implement bind for State Monad?],
  [
    TODO
  ]
)




