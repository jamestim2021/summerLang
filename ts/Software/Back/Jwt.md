

 Jwt 就如同票据一般

ttl，指的是 jwt time to live，token 的有效期。token 过期有两种可能

1. 本次 token 过期，但是可以通过这个过期的 token 换取 新的 token
2. 本次 token 过期，过期的这个 token 不能用作换取新的 token

refresh_ttl，token 能过换取新的 token 有效时间范围。这个才是 token 的真正过期时间，

所有换取的 token 只会改变 ttl，并不会更改这个 token 的 refresh_ttl，也就是说，换取的 token 有 ttl 时长的有效期，但是新的 token 和旧的 token 不能 refresh 的时间是固定不变的。



## 参考

- [JSON Web Tokens(JWT)教程](https://www.jdon.com/artichect/json-web-tokens.html)