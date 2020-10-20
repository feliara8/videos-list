import Vue from 'vue/dist/vue.esm.js';
import App from '../components/app.vue'
import router from '../router'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el: "app",
    router: router,
    render: h => h(App)
  })
})

