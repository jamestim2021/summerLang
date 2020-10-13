**php 怎么通过方法的 identification 调用方法呢？**

调用 function

```php
function summer($str = "winter") {
        echo "Hi, " . $str;
}

call_user_func("summer", "winter winter");
```

调用 class 中的 method

```php
class Foo {
        public function bar($str = 'summer') {
                echo "foo bar " . $str ."\n";
        }
}


call_user_func(['Foo' ,'bar'], "summer summer");
```

