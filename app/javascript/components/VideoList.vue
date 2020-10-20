<template>
  <ul id="videos">
    <li v-for="video in videos" :key="video.id">
      {{ video.video.title }}
      <iframe width="560" height="315" :src="`//www.youtube.com/embed/${video.video.youtube_id}`" frameborder="0" allowfullscreen></iframe>
    </li>
  </ul>
</template>

<script>
  export default {
    name: 'VideoList',
    props: {
      videos: { type: Array, default: () => [] },
    },
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>