在使用 Laravel Permission 的时候，以 api 接口为单位。

**在 lumen 中如何获取当前路由信息？**

在 lumen 中获取当前路由信息和 laravel 中获取路由信息不一样

```php
$request->route() // 返回的是一个 route array
```

**permission 字段使用 uri 字段好？还是 action 好？**

用 uri 的话，在改动对外接口的时候，就需要改动 permission，而且 uri 需要搭配 http method 使用

用 action 的话，在改动 Controller 的 method 方法时就需要改动 permission

折中选择 `methods_{uri}` 这种方式

