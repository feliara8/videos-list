<template>
  <div class="videos-list">
    <h1 class="subheading grey--text">Videos List</h1>

    <v-container class="my-5">
      
      <v-card flat v-for="video in videos" :key="video.id">
        <v-row wrap class="pa-6" >
          <v-col xs12 md6 align="center" justify="center">
            <div class="caption grey--text">Video title</div>
            <div>{{ video.title }}</div>
          </v-col>
          <v-col xs6 sm4 md2 align="center" justify="center">
            <div class="caption grey--text">Thumbnail</div>
            <VideoDialog showThumbnail :thumbnailUrl="video.thumbnail.url" :videoId="video.youtube_id"/>
          </v-col>
          <v-col xs6 sm4 md2 align="center" justify="center">
            <div class="caption grey--text">Subscription Required</div>
            <div>{{ video.subscription_required ? 'Yes' : 'No' }}</div>
          </v-col>
          <v-row v-if="isLoggedIn || !video.subscription_required" xs2 sm4 md2 align="center" justify="center">
            <VideoDialog :videoId="video.youtube_id"/> 
          </v-row>
          <v-row v-if="!isLoggedIn && video.subscription_required" xs2 sm4 md2 align="center" justify="center">
            <LoginDialog/> 
          </v-row>

        </v-row>
        <v-divider></v-divider>
      </v-card>

    </v-container>  
  </div>
</template>

<script>
  import VideoDialog from './VideoDialog.vue'
  import LoginDialog from './LoginDialog.vue'

  export default {
    name: 'VideoList',
    components: {
      VideoDialog,
      LoginDialog,
    },
    props: {
      videos: { type: Array, default: () => [] },
    },
    computed: {
      isLoggedIn : function() { return this.$store.getters.isLoggedIn }
    },
    methods: {
      // Internal: Refreshes the search results after a change is made.
      play(videoId) {
        this.currentVideoId = videoId
      }
    }

  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>