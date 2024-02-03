<script>
import LayoutDiv from "../../components/LayoutDiv.vue";
import axios from "axios";

export default {
  name: "CreateProduct",
  components: {
    LayoutDiv,
  },
  data() {
    return {
      name: "",
      price: "",
      stock: "",
      description: "",
      validationErrors: {},
      isSubmitting: false,
    };
  },
  created() {
    if (
      localStorage.getItem("token") == "" &&
      localStorage.getItem("token") == null
    ) {
      this.$router.push("/");
    }
  },
  methods: {
    async storeAction() {
      this.isSubmitting = true;
      let payload = {
        name: this.name,
        price: this.price,
        stock: this.stock,
        description: this.description,
      };
      axios
        .post("/api/products", payload)
        .then((response) => {
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
  <LayoutDiv>
    <div class="container mt-5 mb-5">
      <div class="row">
        <div class="col-md-12">
          <div class="card border-0 rounded shadow">
            <div class="card-header">
              <div
                class="row flex-nowrap justify-content-between align-items-center"
              >
                <div class="col-4 pt-1">
                  <h3>Add Product</h3>
                </div>
                <div
                  class="col-4 d-flex justify-content-end align-items-center"
                >
                  <!-- <router-link
                    to="/products/create"
                    class="btn btn-sm btn-outline-success"
                  >
                    Add Product
                  </router-link> -->
                </div>
              </div>
            </div>
            <form>
              <div class="card-body">
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
                  <label htmlFor="name" class="form-label">Price </label>
                  <input
                    type="text"
                    class="form-control"
                    id="price"
                    name="price"
                    v-model="price"
                  />
                  <div v-if="validationErrors.price" class="flex flex-col">
                    <small class="text-danger">{{
                      validationErrors?.price[0]
                    }}</small>
                  </div>
                </div>
                <div class="mb-3">
                  <label htmlFor="name" class="form-label">Stock </label>
                  <input
                    type="text"
                    class="form-control"
                    id="stock"
                    name="stock"
                    v-model="stock"
                  />
                  <div v-if="validationErrors.stock" class="flex flex-col">
                    <small class="text-danger">{{
                      validationErrors?.stock[0]
                    }}</small>
                  </div>
                </div>
                <div class="mb-3">
                  <label htmlFor="name" class="form-label">description </label>
                  <input
                    type="text"
                    class="form-control"
                    id="description"
                    name="description"
                    v-model="description"
                  />
                  <div
                    v-if="validationErrors.description"
                    class="flex flex-col"
                  >
                    <small class="text-danger">{{
                      validationErrors?.description[0]
                    }}</small>
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <div class="d-grid gap-2">
                  <button
                    type="button"
                    class="btn btn-primary btn-block"
                    :disabled="isSubmitting"
                    @click="storeAction()"
                  >
                    Save
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </LayoutDiv>
</template>
