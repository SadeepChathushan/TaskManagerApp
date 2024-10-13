<template>
  <layout-div>
    <div class="row justify-content-md-center mt-5">
      <div class="col-4">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title mb-4">Sign In</h5>
            <form @submit.prevent="loginAction">
              <div class="mb-3">
                <label htmlFor="email" class="form-label">Email address</label>
                <input v-model="email" type="email" class="form-control" id="email"
                       :class="{'is-invalid': validationErrors.email || emailError}" />
                <div v-if="emailError" class="invalid-feedback">{{ emailError }}</div>
              </div>
              <div class="mb-3">
                <label htmlFor="password" class="form-label">Password</label>
                <input v-model="password" type="password" class="form-control" id="password"
                       :class="{'is-invalid': validationErrors.password || passwordError}" />
                <div v-if="passwordError" class="invalid-feedback">{{ passwordError }}</div>
              </div>
              <div class="d-grid gap-2">
                <button :disabled="isSubmitting" type="submit" class="btn btn-primary btn-block">Login</button>
                <p class="text-center">Don't have an account? <router-link to="/register">Register here</router-link></p>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </layout-div>
</template>

<script>
import { userService } from '@/services/userService';
import LayoutDiv from '../LayoutDiv.vue';

export default {
  name: 'LoginPage',
  components: { LayoutDiv },
  data() {
    return {
      email: '',
      password: '',
      validationErrors: {},
      emailError: '',
      passwordError: '',
      isSubmitting: false,
      emailPattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/,
      passwordPattern: /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$/, // At least 8 characters, 1 uppercase, 1 lowercase, 1 number
    };
  },
  methods: {
    async loginAction() {
      if (this.validateInputs()) {
        this.isSubmitting = true;
        try {
          const userData = await userService.login(this.email, this.password);
          localStorage.setItem('token', userData.Jwt); // Ensure correct token key is used
          this.$router.push('/dashboard');
        } catch (error) {
          this.isSubmitting = false;
          this.validationErrors = error; // Show backend validation errors
        }
      }
    },
    validateInputs() {
      this.emailError = '';
      this.passwordError = '';
      let isValid = true;
      if (!this.emailPattern.test(this.email)) {
        this.emailError = 'Please enter a valid email address.';
        isValid = false;
      }
      if (!this.passwordPattern.test(this.password)) {
        this.passwordError = 'Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, and one number.';
        isValid = false;
      }
      return isValid;
    }
  }
};
</script>
