<template>
  <VideoList :videos='videos'/>
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
    font-size: 2em;
    text-align: center;
  }
</style>