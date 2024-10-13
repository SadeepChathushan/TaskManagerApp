<template>
  <layout-div>
    <div class="row justify-content-md-center mt-5">
      <div class="col-4">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title mb-4">Register</h5>

            <div v-if="successMessage" class="alert alert-success">
            {{ successMessage }}
            </div> 

            <form @submit.prevent="registerAction">


              <!-- Name Input -->
              <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" v-model="name" />
                <div v-if="validationErrors.name" class="flex flex-col">
                  <small class="text-danger">{{ validationErrors.name[0] }}</small>
                </div>
              </div>

              <!-- Email Input -->
              <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" v-model="email" />
                <div v-if="validationErrors.email" class="flex flex-col">
                  <small class="text-danger">{{ validationErrors.email[0] }}</small>
                </div>
              </div>

              <!-- Password Input -->
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" v-model="password" />
                <div v-if="validationErrors.password" class="flex flex-col">
                  <small class="text-danger">{{ validationErrors.password[0] }}</small>
                </div>
              </div>

              <!-- Confirm Password Input -->
              <div class="mb-3">
                <label for="confirm_password" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="confirm_password" name="confirm_password" v-model="confirmPassword" />
                <div v-if="validationErrors.confirmPassword" class="flex flex-col">
                  <small class="text-danger">{{ validationErrors.confirmPassword[0] }}</small>
                </div>
              </div>

              <!-- Form Submission -->
              <div class="d-grid gap-2">
                <button :disabled="isSubmitting" type="submit" class="btn btn-primary btn-block">Register Now</button>
                <p class="text-center">Already have an account? <router-link to="/">Login here</router-link></p>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </layout-div>
</template>

<script>
import { userService } from '../../services/userService';
import LayoutDiv from '../LayoutDiv.vue';

export default {
  name: 'RegisterPage',
  components: {
    LayoutDiv,
  },
  data() {
    return {
      name: '',
      email: '',
      password: '',
      confirmPassword: '',
      validationErrors: {},
      isSubmitting: false,
      successMessage: '',
      namePattern: /^[a-zA-Z\s]+$/, // Only allows letters and spaces
      emailPattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/, // Standard email validation
      passwordPattern: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/, // Password must contain upper, lower, and number
    };
  },
  created() {
    if (localStorage.getItem('token')) {
      this.$router.push('/'); 
    }
  },
  methods: {
    async registerAction() {
      this.validationErrors = {}; 
      if (!this.validateInputs()) {
        this.isSubmitting = false;
        return; 
      }

      this.isSubmitting = true;

      try {
        const response = await userService.register(this.name, this.email, this.password);
        console.log('Success response:', response); // Log the successful response
        localStorage.setItem('token', response.token);
         
         this.successMessage = response.message;

         setTimeout(() => {
        this.$router.push('/'); // Redirect to login page after showing the message
        }, 2000);
       
      } catch (error) {
        this.isSubmitting = false;
        if (error.errors) {
          this.validationErrors = error.errors; // Capture validation errors from backend
        }
        console.log('Error response:', error); 
      }
    },
    validateInputs() {
      this.validationErrors = {}; 
      let isValid = true;

      if (!this.namePattern.test(this.name)) {
        this.validationErrors.name = ['Invalid name format.'];
        isValid = false;
      }
      if (!this.emailPattern.test(this.email)) {
        this.validationErrors.email = ['Invalid email format.'];
        isValid = false;
      }
      if (!this.passwordPattern.test(this.password)) {
        this.validationErrors.password = ['Password must contain at least one uppercase letter, one lowercase letter, and one number.'];
        isValid = false;
      }
      if (this.password !== this.confirmPassword) {
        this.validationErrors.confirmPassword = ['Passwords do not match.'];
        isValid = false;
      }

      console.log('Validation errors:', this.validationErrors); // Log any validation errors
      return isValid;
    },
  },
};
</script>
