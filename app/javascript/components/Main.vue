<template>
  <v-container>
    <VideoList :videos='videos'/>
  </v-container>
</template>

<script>
  import VideoList from './VideoList.vue'
  import axios from 'axios'

  export default {
    components: {
      VideoList,
    },
    data: function () {
      return {
        videos: []
      }
    },
    created () {
      axios.get('/videos', {
        params: {
          page: 1,
        },
        data: {},
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      }).then(response => {
        this.videos = response['data']['videos']
      })
    },
  }
</script>

<style scoped>
  p {
    text-align: center;
  }
</style>