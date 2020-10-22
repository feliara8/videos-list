<template>
  <div id='app'>
    <v-app color="deep-purple">
      <nav>
        <v-app-bar flat app>
          <v-toolbar-title class="title text-uppercase grey--text">
            <span>Zype</span>
            <span>Videos</span>
          </v-toolbar-title>
          <v-spacer></v-spacer>
          <v-btn  @click="logout" v-if="isLoggedIn" text color="grey">
            <span> Sign Off </span>
            <v-icon right>mdi-exit-to-app</v-icon>
          </v-btn>
        </v-app-bar>
      </nav>
      <v-main class="grey lighten-3">
        <router-view></router-view>
      </v-main>
    </v-app>
  </div>
</template>

<script>
  export default {
    computed: {
      isLoggedIn : function(){ return this.$store.getters.isLoggedIn}
    },
    data: function () {
      return {
        message: "Welcome to asas!"
      }
    },
    methods: {
      logout() {
        this.$store.dispatch('logout')
      }
    },
  }
</script>

<style scoped>
</style>