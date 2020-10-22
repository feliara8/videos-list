<template>
  <v-container>
    <VideoList/>
  </v-container>
</template>

<script>
  import VideoList from './VideoList.vue'

  export default {
    components: {
      VideoList,
    }  
  }
</script>

<style scoped>
  p {
    text-align: center;
  }
</style>