import { createApp } from "vue";
import "./style.css";
import App from "./App.vue";
import router from "./router";
import axios from "axios";

axios.defaults.baseURL = import.meta.env.VITE_APP_API_URL;
axios.defaults.headers.common["Authorization"] = `Bearer ${localStorage.getItem(
  "token"
)}`;

createApp(App).use(router).mount("#app");
