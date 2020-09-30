**在 Laravel 中，什么是 Guard？**

`Illuminate\Contracts\Auth\Guard` ，在 Laravel 中是关于 `current user` 的 `authenticated`  判断的方法。也就是判断当前请求 api 的身份信息。



`Illuminate\Contracts\Auth\UserProvider` 作为 user 的一种抽象，旨在定义如果检索用户，提供 Auth 系统的中的 user 的查询方法。UserProvider 可以被实现成通过 数据库，redis，文件等方式通过 ID 查询 user。默认有两种实现

- DataBaseUserProvider
- EloquentUserProvider

`Illuminate\Contracts\Auth\Authenticatable` 为 Auth 系统的中的 user 抽象，具有一下属性

- name
- token
- rememberToken

