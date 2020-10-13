# Pipeline Pattern

pipeline 就像流水线一样，将 HTTP 送入 pipelines 中，有的 pipeline 用作处理编码，有的 pipeline 用作验证，有的则用来鉴权。当然，当 HTTP Request 送入 pipelines 需要层层把关。把 HTTP Response 也以相反的顺序经过 pipelines。

经过 pipelines 的对象犹如人从一楼上三楼，如果不是发生异常，一定会从三楼经过二楼再回来一楼。那么 pipeline 就有下面的特性

1. 先进后出，进入先访问的 pipeline 会再出来的时候后访问

在 Laravel 中的例子，pipeline 接口表现为

```

interface Pipeline
{
    public function send($traveler);

    public function through($stops);

    public function via($method);

    public function then(Closure $destination);
}
```

在 Dispatcher 中使用 Pipeline，把它当作 Http 请求洋葱模型

```
return $this->pipeline->send($command)->through($this->pipes)->then($callback);
```

上面的代码把 common 送入 pipeline，通过 n 个 pipes，最终调用 callback

除了最后的 destination，中间的所有的 pipeline 都有下面的逻辑

1. 接受前面的 pipeline 处理过的对象
2. 接受后面 pipeline 的启动函数
3. 返回处理结果

由这些特性，单个 pipeline 的 procedure 如下

```php
function pipeline($passable, Closure $next) {
    // do something...
    $rnt = $next($passable);
    // do something...
    return $rnt;
}
```

上面的函数，`$passable` 是 pipeline

```php
public function then(Closure $destination)
{
  $pipeline = array_reduce(
    array_reverse($this->stops),
    function ($next, $stop) {
      return function ($passable) use ($next, $stop) {
        return $stop($passable, $next);
      };
    },
    function ($passable) use ($destination) {
      return $destination($passable);
    }
  );

  return $pipeline($this->traveler);
}
```

上面就是 pipeline 的核心实现，说白了就是从最后的函数依次包裹到最前面的函数。为什么会从后面的函数包裹到前面的函数呢？

因为外面的函数包含了里面函数的调用。所以必须再里层函数准备好了后，才能去准备外面的函数，而且这个函被当作参数传递给当前函数。那么用什么来保持这种餐宿的传递呢？

使用闭包的性质，将传入的里层函数执行函数放在本函数的闭包环境里面，这样就可以再外部不需要参数执行 pipeline 了。