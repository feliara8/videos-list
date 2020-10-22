<template>
  <div class="videos-list">
    <h1 class="subheading grey--text">Videos List</h1>

    <v-container class="my-5">

      <v-text-field
        label="Search"
        @input="debouncedSearch()"
        v-model="q"
        filled
      ></v-text-field>
      
      <v-card flat v-for="video in videos" :key="video.id">
        <v-row wrap class="pa-6" >
          <v-col xs12 md6 align="center" justify="center">
            <div class="caption grey--text">Video title</div>
            <div>{{ video.title }}</div>
          </v-col>
          <v-col xs6 sm4 md2 align="center" justify="center">
            <div class="caption grey--text">Thumbnail</div>
            <VideoDialog v-if="!video.subscription_required || isLoggedIn" :thumbnailUrl="video.thumbnail.url" :videoId="video.youtube_id"/>
            <LoginDialog v-else :thumbnailUrl="video.thumbnail.url" :videoId="video.youtube_id"/>
          </v-col>
          <v-col xs6 sm4 md2 align="center" justify="center">
            <div class="caption grey--text">Subscription Required</div>
            <div>{{ video.subscription_required ? 'Yes' : 'No' }}</div>
          </v-col>
        </v-row>
        <v-divider></v-divider>
      </v-card>
      <v-row justify="center">
        <v-col cols="8">
          <v-container class="max-width">
            <v-pagination
              v-model="page"
              @input="search()"
              class="my-4"
              :length="pages"
            ></v-pagination>
          </v-container>
        </v-col>
      </v-row>
    </v-container>  
  </div>
</template>

<script>
  import VideoDialog from './VideoDialog.vue'
  import LoginDialog from './LoginDialog.vue'
  import axios from 'axios'
  import lodash from 'lodash'

  export default {
    name: 'VideoList',
    components: {
      VideoDialog,
      LoginDialog,
    },
    data: function () {
      return {
        videos: [],
        page: 0,
        pages: 0,
        q: ""
      }
    },
    computed: {
      isLoggedIn : function() { return this.$store.getters.isLoggedIn }
    },
    methods: {
      debouncedSearch: lodash.debounce(function () { this.search() }, 1000),
      search() {
        axios.get('/videos', {
          params: {
            q: this.q,
            page: this.page,
          },
        }).then(response => {
          this.videos = response['data']['videos']
          this.page = response['data']['pagination']['current']
          this.pages = response['data']['pagination']['pages']
        })
      }
    },
    created () {
      this.search()
    }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>