import { createApp } from "vue";
import App from "./App.vue";
import axios from "axios";
import "bootstrap/dist/css/bootstrap.css";
import { createRouter, createWebHistory } from "vue-router";
import LoginPage from "./components/pages/LoginPage";
import RegisterPage from "./components/pages/RegisterPage";
//import DashboardPage from "./components/pages/DashboardPage";
import TaskList from "./components/pages/TaskList";

axios.defaults.baseURL = "http://127.0.0.1:8000/api";
axios.interceptors.request.use(function (config) {
  config.headers["X-Binarybox-Api-Key"] = process.env.VUE_APP_API_KEY;
  return config;
});

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: "/", component: LoginPage },
    { path: "/register", component: RegisterPage },
    { path: "/task-list", component: TaskList },
  ],
});

createApp(App).use(router).mount("#app");
