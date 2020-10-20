import Vue from 'vue/dist/vue.esm.js';
import Router from 'vue-router'
import Main from './components/Main.vue'

Vue.use(Router)

let router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'main',
      component: Main
    }
  ]
})

export default router