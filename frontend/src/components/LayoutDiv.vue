<template>
  <nav
    class="navbar navbar-expand-lg bg-body-tertiary rounded"
    aria-label="Thirteenth navbar example"
  >
    <div class="container-fluid">
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarsExample11"
        aria-controls="navbarsExample11"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse d-lg-flex" id="navbarsExample11">
        <a class="navbar-brand col-lg-3 me-0" href="#">DATA UTAMA</a>
        <ul class="navbar-nav col-lg-6 justify-content-lg-center">
          <li class="nav-item">
            <router-link :to="{ name: 'products.index' }" class="nav-link">
              Product
            </router-link>
          </li>
          <li class="nav-item">
            <router-link :to="{ name: 'transactions.index' }" class="nav-link">
              Transaction
            </router-link>
          </li>
        </ul>
        <div class="d-lg-flex col-lg-3 justify-content-lg-end">
          <button class="btn btn-primary" @click="logoutAction()">
            Logout
          </button>
        </div>
      </div>
    </div>
  </nav>
  <slot></slot>
</template>

<script>
import axios from "axios";

export default {
  name: "LayoutDiv",
  methods: {
    logoutAction() {
      axios
        .post("/api/logout", {})
        .then((r) => {
          localStorage.removeItem("token");
          axios.defaults.headers.common["Authorization"] = "Bearer";
          this.$router.push("/");
          return r;
        })
        .catch((e) => {
          return e;
        });
    },
  },
};
</script>
