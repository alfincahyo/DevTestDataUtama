<script>
import LayoutDiv from "../../components/LayoutDiv.vue";
import axios from "axios";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";

export default {
  name: "CreateTransaction",
  components: {
    LayoutDiv,
    vSelect,
  },
  data() {
    return {
      products: [],
      product_id: "",
      price: "",
      quantity: "",
      payment_amount: "",
      validationErrors: {},
      isSubmitting: false,
      options: ["foo", "bar", "baz"],
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
  mounted() {
    //get data from api
    axios.get("/api/products/all").then((response) => {
      let data = response.data.data;
      //looping into array
      data.forEach((item) => {
        this.products.push({
          label: item.name,
          code: item.id,
          price: item.price,
        });
      });
    });
  },
  methods: {
    async storeAction() {
      this.isSubmitting = true;
      let payload = {
        product_id: this.product_id,
        price: this.price,
        quantity: this.quantity,
        payment_amount: this.payment_amount,
      };
      axios
        .post("/api/transactions", payload)
        .then((response) => {
          this.$router.push("/transactions");
          return response;
        })
        .catch((error) => {
          this.isSubmitting = false;
          console.log(error.data);
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
                  <h3>Add Transactions</h3>
                </div>
                <div
                  class="col-4 d-flex justify-content-end align-items-center"
                >
                  <router-link
                    to="/transactions"
                    class="btn btn-sm btn-outline-success"
                  >
                    Back
                  </router-link>
                </div>
              </div>
            </div>
            <form>
              <div class="card-body">
                <div class="mb-3">
                  <label htmlFor="product_id" class="form-label"
                    >Product
                  </label>
                  <vSelect
                    :options="products"
                    :reduce="(label) => label.code"
                    @option:selected="(data) => (this.price = data.price)"
                    label="label"
                    v-model="product_id"
                  ></vSelect>
                  <div v-if="validationErrors.product_id" class="flex flex-col">
                    <small class="text-danger">{{
                      validationErrors?.product_id[0]
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
                    readonly
                  />
                  <div v-if="validationErrors.price" class="flex flex-col">
                    <small class="text-danger">{{
                      validationErrors?.price[0]
                    }}</small>
                  </div>
                </div>
                <div class="mb-3">
                  <label htmlFor="name" class="form-label">quantity </label>
                  <input
                    type="text"
                    class="form-control"
                    id="quantity"
                    name="quantity"
                    v-model="quantity"
                  />
                  <div v-if="validationErrors.quantity" class="flex flex-col">
                    <small class="text-danger">{{
                      validationErrors?.quantity[0]
                    }}</small>
                  </div>
                </div>
                <div class="mb-3">
                  <label htmlFor="payment_amount" class="form-label"
                    >Payment Amount
                  </label>
                  <input
                    type="text"
                    class="form-control"
                    id="payment_amount"
                    name="payment_amount"
                    v-model="payment_amount"
                  />
                  <div
                    v-if="validationErrors.payment_amount"
                    class="flex flex-col"
                  >
                    <small class="text-danger">{{
                      validationErrors?.payment_amount[0]
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
