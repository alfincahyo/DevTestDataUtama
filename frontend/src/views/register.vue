<script>
import axios from "axios";

export default {
  name: "RegisterPage",
  data() {
    return {
      name: "",
      email: "",
      password: "",
      password_confirmation: "",
      validationErrors: {},
      isSubmitting: false,
    };
  },
  created() {
    if (
      localStorage.getItem("token") != "" &&
      localStorage.getItem("token") != null
    ) {
      this.$router.push("/products");
    }
  },
  methods: {
    async registerAction() {
      this.isSubmitting = true;
      let payload = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.password_confirmation,
      };
      axios
        .post("/api/register", payload)
        .then((response) => {
          localStorage.setItem("token", response.data.data.token);
          this.$router.push("/products");
          return response;
        })
        .catch((error) => {
          this.isSubmitting = false;
          if (error.response.data.data != undefined) {
            this.validationErrors = error.response.data.data;
          }
          console.log(error.response.data.data);
          return error;
        });
    },
  },
};
</script>

<template>
  <div class="row justify-content-md-center mt-5">
    <div class="col-4">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title mb-4">Register</h5>
          <form>
            <div class="mb-3">
              <label htmlFor="name" class="form-label">Name </label>
              <input
                type="text"
                class="form-control"
                id="name"
                name="name"
                v-model="name"
              />
              <div v-if="validationErrors.name" class="flex flex-col">
                <small class="text-danger">{{
                  validationErrors?.name[0]
                }}</small>
              </div>
            </div>
            <div class="mb-3">
              <label htmlFor="email" class="form-label">Email address </label>
              <input
                type="email"
                class="form-control"
                id="email"
                name="email"
                v-model="email"
              />
              <div v-if="validationErrors.email" class="flex flex-col">
                <small class="text-danger">{{
                  validationErrors?.email[0]
                }}</small>
              </div>
            </div>
            <div class="mb-3">
              <label htmlFor="password" class="form-label">Password </label>
              <input
                type="password"
                class="form-control"
                id="password"
                name="password"
                v-model="password"
              />
              <div v-if="validationErrors.password" class="flex flex-col">
                <small class="text-danger">{{
                  validationErrors?.password[0]
                }}</small>
              </div>
            </div>
            <div class="mb-3">
              <label htmlFor="password_confirmation" class="form-label"
                >Confirm Password
              </label>
              <input
                v-model="password_confirmation"
                type="password"
                class="form-control"
                id="password_confirmation"
                name="password_confirmation"
              />
              <div
                v-if="validationErrors.password_confirmation"
                class="flex flex-col"
              >
                <small class="text-danger">{{
                  validationErrors?.password_confirmation[0]
                }}</small>
              </div>
            </div>
            <div class="d-grid gap-2">
              <button
                type="button"
                class="btn btn-primary btn-block"
                :disabled="isSubmitting"
                @click="registerAction()"
              >
                Register Now
              </button>
              <p class="text-center">
                Have already an account
                <router-link to="/">Login here</router-link>
              </p>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
