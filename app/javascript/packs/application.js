import Vue from 'vue';
import App from '../components/app.vue'
import router from '../router'
import store from '../store'
import Vuetify from 'vuetify'
import axios from 'axios'
import 'vuetify/dist/vuetify.min.css'


const vuetify = new Vuetify({
    icons: {
        iconfont: 'mdi'
    }
});

Vue.use(Vuetify, {
    icons: {
        iconfont: 'mdi'
    }
})

axios.defaults.headers.common['Accept'] = "application/json"
axios.defaults.headers.common['Content-Type'] = "application/json"

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el: "app",
    router: router,
    store: store,
    vuetify: vuetify,
    render: h => h(App)
  })
})

