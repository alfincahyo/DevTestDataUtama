//import vue router
import { createRouter, createWebHistory } from "vue-router";
//define a routes
const routes = [
  {
    path: "/",
    name: "login",
    component: () => import("../views/login.vue"),
  },
  {
    path: "/register",
    name: "register",
    component: () => import("../views/register.vue"),
  },
  {
    path: "/products",
    name: "products.index",
    component: () => import("../views/products/index.vue"),
  },
  {
    path: "/products/create",
    name: "products.create",
    component: () => import("../views/products/create.vue"),
  },
  {
    path: "/products/edit/:id",
    name: "products.edit",
    component: () => import("../views/products/edit.vue"),
  },
  {
    path: "/products/delete/:id",
    name: "products.delete",
    component: () => import("../views/products/delete.vue"),
  },
  {
    path: "/transactions",
    name: "transactions.index",
    component: () => import("../views/transactions/index.vue"),
  },
  {
    path: "/transactions",
    name: "transactions.index",
    component: () => import("../views/transactions/index.vue"),
  },
  {
    path: "/transactions/create",
    name: "transactions.create",
    component: () => import("../views/transactions/create.vue"),
  },
];

//create router
const router = createRouter({
  history: createWebHistory(),
  routes, // <-- routes,
});

export default router;
