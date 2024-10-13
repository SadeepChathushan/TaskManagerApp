import { createApp } from 'vue';
import App from './App.vue';
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.css';
import { createRouter, createWebHistory } from 'vue-router';
import LoginPage from './components/pages/LoginPage';
import RegisterPage from './components/pages/RegisterPage';
import DashboardPage from './components/pages/DashboardPage';

// Set the base URL for your API and API key directly here
axios.defaults.baseURL = 'http://127.0.0.1:8000/api'; // Direct API base URL
axios.interceptors.request.use(function (config) {
  const token = localStorage.getItem('token'); // Get token from localStorage
  if (token) {
    config.headers['Authorization'] = `Bearer ${token}`; // Attach token in Authorization header
  }
  config.headers['X-Binarybox-Api-Key'] = 'http://127.0.0.1:8000/api'; // Add your direct API key if needed
  return config;
}, function (error) {
  return Promise.reject(error);
});

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: LoginPage },
    { path: '/register', component: RegisterPage },
    { path: '/dashboard', component: DashboardPage },
  ],
});

createApp(App).use(router).mount('#app');
