<template>
  <v-dialog max-width="600px" v-model="dialog">

    <template v-slot:activator="{ on, attrs }">
      <v-img
        :lazy-src="`${thumbnailUrl}`"
        max-height="60"
        max-width="100"
        v-bind="attrs"
        v-on="on"
        :src="`${thumbnailUrl}`"
      ></v-img>
    </template>
    <iframe ref="videoDialog" width="560" height="315" :src="`//www.youtube.com/embed/${videoId}`" frameborder="0" allowfullscreen></iframe>
    <v-divider></v-divider>
  </v-dialog>
</template>

<script>
  export default {
    name: 'VideoDialog',
    props: {
      thumbnailUrl: { type: String, default: "" },
      videoId: { type: String, default: "" },
    },
    watch: {
      dialog (val) {
        !val && this.pauseVideo()
      }
    },
    computed: {
      isLoggedIn : function() { return this.$store.getters.isLoggedIn }
    },
    methods: {
      // Internal: Refreshes the search results after a change is made.
      pauseVideo() {
        let iframe_tag = this.$refs.videoDialog
        if ( iframe_tag) {
          let iframeSrc = iframe_tag.src;
          iframe_tag.src = iframeSrc; 
        }
      }
    },
    data: function () {
      return {
        dialog: false,
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