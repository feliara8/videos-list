import Vue from 'vue';
import Router from 'vue-router'
import Vuelidate from 'vuelidate'
import Main from './components/Main.vue'

Vue.use(Router)
Vue.use(Vuelidate)

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