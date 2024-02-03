<script>
import LayoutDiv from "../../components/LayoutDiv.vue";
import axios from "axios";
import $ from "jquery";
import "datatables.net-bs5";

const deleteProduct = async (id) => {
  axios
    .delete(`/products/${id}`)
    .then((response) => {
      fetchProduct();
    })
    .catch((error) => {
      console.log(error);
      return error;
    });
};

const fetchProduct = async () => {
  $("#myTable").DataTable({
    serverSide: true,
    processing: true,
    ajax: {
      url: import.meta.env.VITE_APP_API_URL + "api/products",
      beforeSend: function (request) {
        request.setRequestHeader(
          "Authorization",
          "Bearer " + localStorage.getItem("token")
        );
      },
    },
    columns: [
      { data: "id" },
      { data: "name" },
      { data: "price" },
      { data: "stock" },
      { data: "description" },
      {
        data: "id",
        width: "10px",
        render: function (data, type, row, meta) {
          return `<div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                          Action
                        </button>
                        <ul class="dropdown-menu">
                          <li><a href="/products/edit/${data}" type="button" class="dropdown-item">Edit</a></li>
                          <li><a href="/products/delete/${data}" class="dropdown-item btn-delete-action" data-bs-id="${data}">Delete</a></li>
                        </ul>
                      </div>`;
        },
      },
    ],
    rowCallback: function (row, data) {
      let api = this.api();
      console.log("halo");
      // $(row)
      //   .find(".btn-delete-action")
      //   .click(function () {
      //     deleteProduct(data.id);
      //   });
    },
  });
};

export default {
  components: {
    LayoutDiv,
  },
  data() {
    return {
      product_id: "",
    };
  },
  mounted() {
    if (
      localStorage.getItem("token") == "" ||
      localStorage.getItem("token") == null
    ) {
      this.$router.push("/");
    } else {
      fetchProduct();
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
                  <h3>Products List</h3>
                </div>
                <div
                  class="col-4 d-flex justify-content-end align-items-center"
                >
                  <router-link
                    to="/products/create"
                    class="btn btn-sm btn-outline-success"
                  >
                    Add Product
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
                    <th>Nama</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Description</th>
                    <th>Action</th>
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
