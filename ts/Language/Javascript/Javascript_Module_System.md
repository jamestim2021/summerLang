
# JavaScript 模块化

## 引言

在 ECMA2005 以前，Javascript 连文件和文件之间的引用都没有关键字支持，真是名副其实的浏览器脚本语言。在那个时候，使用 jQuery 只需要在 html 中使用 `<script>` 标签引入 Jquery 文件。

只有编程语言具有模块化的功能，才能将各个功能以不同的模块拆分，合并，引用，复用。简单的说，就是大型软件不能够以一个文件存在。我们需要将能够复用的代码分散到不同的文件中。这里的怎么拆分，引用，便是一门编程语言模块化功能的实现。不同的编程语言由各自的实现，比如 c 语言使用 `#include "xx"`；scheme 使用 `(load "xx")`；Java 使用 `import xx.yy.zz`，等等。

### 术语

- 引入，编写的代码引用其他已经编写好的功能模块代码
- 导出，编写的模块代码暴露出指定的接口或者属性

现在是 2020 年，对于 Javascript 来说，最重要的加载有两种重要的实现。

- CommonJS Modules，nodejs 所使用的规范
- ECMAScript Modules，ECMA2015 提出的规范 

## 什么是 CommonJS Modules

CommonJs 创立的目标是为了提供在浏览器之外的 Javascript 模块单元。使用 Javascript 开发 server 端和开发浏览器端是完全不一样的环境。为了能在开发 server 端时让 JavaScript 能复用，开发人员创立了 CommonJs。

既然时 server 端的 module 单元，那么第一个想到的就是 Nodejs。没错，Nodejs 就是使用的 CommonJs 规范（ES Module 正在试验阶段）。下面就以 NodeJs 的 Module 单元介绍 CommonJs。

在 Node.js 的 module system 中，每个文件作为一个模块单元。在 Node.js 中，使用 `require` **全局方法**  和 `module.exports` 属性分别进行模块的导入和模块 API 暴露

```javascript
// math.js 
function add(x, y) {
    return x + y
}

module.exports = {
    add
}

// a.js
const math = require('./math.js')

// sum == 3
cosnt sum = math.add(1, 2) 
```

**在 Node.js 中，文件就是模块，模块就是文件吗？**

是的，在 Node.js 中，文件就是模块，模块就是文件。

**如果一个文件没有写 `module.exports` 模块导出，那么 `require()` 这个文件，返回值是什么？**

如果一个 `a.js` 文件没有 `module.exports`，那么这个文件被其他文件引用的时候，`require('./a')` 返回 `{}`。其实，`module.exports` 初始化就是一个空对象 `{}`。


## ES Module

在 ES 2015 中，Javascript 自己推出了语言级别的模块系统，**在 Node.js 中，提供的是全局方法和变量**。

`import` 和 `export` 关键字

```javascript
// math.js
export function add(x , y) {
    return x + y
}

// a.js
import math from './a'
math.add(1, 2)
```

### 模块整体加载

加载模块指定的导出

```javascript
import {add, sub, div, mul} from 'math'
```

如果想要将模块中的所有 `export` 的 api 都一并导出的话，就应该使用 `*` 通配符

```javascript
import * as math from 'math'
```



## 参考

- [浏览器加载 CommonJS 模块的原理与实现](https://www.ruanyifeng.com/blog/2015/05/commonjs-in-browser.html)
- [AMD 规范](https://github.com/amdjs/amdjs-api/wiki/AMD)
- [CMD 规范](https://github.com/seajs/seajs/issues/242)
- [AMD 和 CMD 的区别有哪些？](https://www.zhihu.com/question/20351507/answer/14859415)
- [seajs 和 RequireJs 异同](https://github.com/seajs/seajs/issues/277)