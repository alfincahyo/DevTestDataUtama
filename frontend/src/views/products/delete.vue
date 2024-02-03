<script>
import LayoutDiv from "../../components/LayoutDiv.vue";
import axios from "axios";

export default {
  name: "deleteProduct",
  components: {
    LayoutDiv,
  },
  created() {
    if (
      localStorage.getItem("token") == "" &&
      localStorage.getItem("token") == null
    ) {
      this.$router.push("/");
    }

    axios
      .delete(`api/products/${this.$route.params.id}`)
      .then((response) => {
        this.$router.push("/products");
      })
      .catch((error) => {
        console.log(error);
        return error;
      });
  },
};
</script>

<template>
  <LayoutDiv>
    <div class="container mt-5 mb-5">
      <div class="row">
        <div class="col-md-12">
          <div class="card border-0 rounded shadow">
            <div class="card-body">
              <p>Deleting product..</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </LayoutDiv>
</template>
