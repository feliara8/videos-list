<template>
  <v-dialog class="white" max-width="600px" v-model="dialog">
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        color="blue lighten-2"
        dark
        v-bind="attrs"
        v-on="on"
      >
        Login
      </v-btn>
    </template>
    <v-card class="py-5 px-10">
      <form>
        <v-text-field
          v-model="email"
          :error-messages="emailErrors"
          label="Email"
          required
          @input="$v.email.$touch()"
          @blur="$v.email.$touch()"
        ></v-text-field>
        <v-text-field
          v-model="password"
          :error-messages="passwordErrors"
          :counter="10"
          label="Password"
          required
          type="password"
          @input="$v.password.$touch()"
          @blur="$v.password.$touch()"
        ></v-text-field>

        <v-btn
          class="mr-4"
          @click.native="login()"
        >
          Login
        </v-btn>
        <span v-if="showBadEmailOrPassword" class="red--text">
          Bad email or password
        </span>
      </form>
    </v-card>
  </v-dialog>
</template>

<script>
  import { validationMixin } from 'vuelidate'
  import { required, maxLength, email } from 'vuelidate/lib/validators'


  export default {
    mixins: [validationMixin],
    name: 'LoginDialog',
    props: {
      thumbnailUrl: { type: String, default: "" },
      showThumbnail: { type: Boolean, default: false },
      videoId: { type: String, default: "" },
    },
    validations: {
      password: { required, maxLength: maxLength(10) },
      email: { required, email },
    },
    computed: {
      passwordErrors () {
        const errors = []
        if (!this.$v.password.$dirty) return errors
        !this.$v.password.maxLength && errors.push('Password must be at most 10 characters long')
        !this.$v.password.required && errors.push('Password is required.')
        return errors
      },
      emailErrors () {
        const errors = []
        if (!this.$v.email.$dirty) return errors
        !this.$v.email.email && errors.push('Must be valid e-mail')
        !this.$v.email.required && errors.push('E-mail is required')
        return errors
      },
    },
    methods: {
      login() {
        if (!this.$v.$invalid) {
          this.$store.dispatch('login', { user: this.email,
            password: this.password }).then(() => {
            this.dialog = false
          }).catch(() =>{
            this.showBadEmailOrPassword = true
          })
        }
      },
      clearForm() {
        this.$v.$reset()
        this.password = ''
        this.email = ''
        this.showBadEmailOrPassword = false
      }
    },
    watch: {
      dialog (val) {
        !val && this.clearForm()
      }
    },
    data: function () {
      return {
        showBadEmailOrPassword: false,
        email: "",
        password: "",
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