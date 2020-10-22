import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    loading: false,
    token: localStorage.getItem('token') || '',
  },
  mutations: {
    auth_success(state, token, user){
      state.status = 'success'
      state.token = token
      state.user = user
    },
    auth_error(state){
      state.loading = false
    },
    logout(state){
      state.status = ''
      state.token = ''
    },
    pending_request(state){
      state.loading = true
    },
  },
  actions: {
    login({commit}, user){
      return new Promise((resolve, reject) => {
        commit('pending_request')
        axios({url: '/signin', data: user, method: 'POST' })
        .then(resp => {
          const token = resp.data.access_token
          if (token) {
            localStorage.setItem('token', token)
            axios.defaults.headers.common['access_token'] = token
            commit('auth_success', token, user)
            resolve(resp)
          } else {
            commit('auth_error')
            reject()
          }
        })
        .catch(err => {
          commit('auth_error')
          localStorage.removeItem('token')
          reject(err)
        })
      })
    },
    logout({commit}){
      return new Promise((resolve, reject) => {
        commit('logout')
        localStorage.removeItem('token')
        delete axios.defaults.headers.common['access_token']
        resolve()
    })
}
  },
  getters : {
    isLoggedIn: state => !!state.token
  }
})
