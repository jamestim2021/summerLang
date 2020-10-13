
**在 vuex 中怎么使用 module 呢？**

简单的项目，只需要使用一个 state 文件就可以描述应用的所有的共享状态。复杂的项目，需要将这些状态分到各自模块的 state 中。只需要在 export 一个 `namespaced` 属性，**注意不是 `namespace`**

```javascript

export default {
    namespaced: true
}

```


**如果使用了 `module` 那么怎么访问 state 呢？**

不使用 module，访问 state 使用 `this.$store.state.xxx`，否则，加入要访问 `userStore` 中的 `userName`，应该这样写 `this.$store.state.userStore.userName`


**在 module 中的 actions 应该怎么 dispatch 呢**

使用 namespace 的 module，使用 `this.$store.dispatch('userStore/login')`，注意，这里的 `userStore/login` 中，`userStore` 是文件名，而 `login` 才是这个 store module 的 action 名字。

