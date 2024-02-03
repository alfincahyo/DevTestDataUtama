<script>
import LayoutDiv from "../../components/LayoutDiv.vue";
import axios from "axios";
import $ from "jquery";
import "datatables.net-bs5";

const fetchTransactions = async () => {
  $("#myTable").DataTable({
    serverSide: true,
    processing: true,
    ajax: {
      url: import.meta.env.VITE_APP_API_URL + "api/transactions",
      beforeSend: function (request) {
        request.setRequestHeader(
          "Authorization",
          "Bearer " + localStorage.getItem("token")
        );
      },
    },
    columns: [
      { data: "id" },
      { data: "reference_no" },
      { data: "product.name" },
      { data: "quantity" },
      { data: "price" },
      { data: "payment_amount" },
    ],
  });
};

export default {
  components: {
    LayoutDiv,
  },
  mounted() {
    if (
      localStorage.getItem("token") == "" ||
      localStorage.getItem("token") == null
    ) {
      this.$router.push("/");
    } else {
      fetchTransactions();
    }
  },
  methods: {},
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
                  <h3>Transactions List</h3>
                </div>
                <div
                  class="col-4 d-flex justify-content-end align-items-center"
                >
                  <router-link
                    to="/transactions/create"
                    class="btn btn-sm btn-outline-success"
                  >
                    Add Transactions
                  </router-link>
                </div>
              </div>
            </div>
            <div class="card-body">
              <table
                id="myTable"
                class="table table-striped table-bordered"
                style="width: 100%"
              >
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Reference Number</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Payment Amount</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </LayoutDiv>
</template>
