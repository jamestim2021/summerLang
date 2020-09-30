

### Lambda 抽象？

通常情况下，函数的参数具体的数字，下面的加法，a 和 b 就是具体的数字。

```scheme
(lambda (a b)
  (+ a b))
```

函数的参数也可以是具体的字符串。像下面这个的函数，打印字符串，并打印换行符。

```scheme
(lambda (str)
  (display str)
  (display-line))
```

不管一个函数是加法还是打印字符串，都有自己的执行逻辑，接受参数，经过一定的逻辑，产生结果。只不过在这里，`lambda` 用来表达对逻辑的抽象。有了抽象就仿佛掌握了火眼金睛，世间万物有千千万万的型，而本源却只有有限。

```scheme
(+ 1 2)
(+ 1 3)
(+ 1 4)
(+ 520 1314)
```

两个数的加法有千千万万的种型，究其根本，却只有下面的形式

```scheme
(define add
  (lambda (a b)
          (+ a b)))
```

掌握了上面的抽象，即便是有千千万万的两位加法，也不在话下。人类负责高层次的抽象，机器按照高层次的抽象一步不差的反复的应对着抽象所对应的实现。所以数，数学是美的，应为数学抽象

###  抽象的组合

被当作参数传递的 `lambda` 一定是做某件事情的完整逻辑

`lambda` 可以当作返回值，我认为这就是函数制造器

### 柯里化

> 如果你固定某些参数，你将得到接受余下参数的一个函数

这就是柯里化，一个多参数函数，固定了某几个参数后生成的只包含余下未固定参数的函数。

```scheme
(define add
  (lambda (a b)
    (+ a b)))

(define addx
  (lambda (a)
    (lambda (x)
      (add a x))))
```

利用这个特性，可以建立很高抽象的带多个参数的函数，然后通过柯里化制作出低层次抽象，不同功能的函数

**立即执行**，立即执行函数不需要给柯里化的命名，可以立即执行

```scheme
((add-x 5) 5) // 10
```

### Y Combinator

如果没有命名，那么回调函数应该怎么实现？

举一个例子，`sum` 函数接受 n 参数，计算从 1 到 n 的和。如果有 define

```scheme
(define sum
  (lambda (n)
    (cond
      ((= n 0) 0)
      (else (+ n (sum (- n 1)))))))
```

现在没有 sum，在 lambda 中还想有 sum 的话，就把 sum 当作参数，从外界传入一个 sum 函数

```scheme
(lambda (sum)
  (lambda (n)
    (cond
      ((= n 0) 0)
      (else (+ n (sum (- n 1)))))))
```

sum 是从外界传入 lambda，但是函数本体就是 sum，把 lambda 传给 lambda

```scheme
((lambda (f)
   (f f))
 (lambda (sum)
   (lambda (n)
     (cond
       ((= n 0) 0)
       (else (+ n (sum (- n 1))))))))
```

f 传入的是第二个 lambda，它是制造 sum 本体的函数，那么函数要有所修改

```scheme
((lambda (f)
   (f f))
 (lambda (sum)
   (lambda (n)
     (cond
       ((= n 0) 0)
       (else (+ n ((sum sum) (- n 1))))))))
```

​	这里的 a 就是 sum

```scheme
(define a
  ((lambda (f)
     (f f))
   (lambda (sum)
     (lambda (n)
       (cond
         ((= n 0) 0)
         (else (+ n ((sum sum) (- n 1)))))))))
```

下一个版本，sum 就要是歌 sum，不要是能产生 sum 的高阶 sum

```scheme
(define a
  ((lambda (f)
     (f f))
   (lambda (mk-sum)
     ((lambda (sum)
        (lambda (n)
          (cond
            ((= n 0) 0)
            (else (+ n (sum (- n 1)))))))
     (lambda (x)
       ((mk-sum mk-sum)
        x))))))
```

Y combinator 就是取消实际的函数的部分

```scheme
(define Y
  (lambda (f)
    ((lambda (mk-f)
       (mk-f mk-f))
     (lambda (mk-f)
       (f (lambda (x)
             ((mk-f mk-f)
              x)))))))
```

