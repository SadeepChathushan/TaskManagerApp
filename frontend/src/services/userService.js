import axios from "axios";


const baseURL = "http://127.0.0.1:8000/api"; // Correct backend API URL

const axiosInstance = axios.create({
  baseURL: baseURL,
  headers: {
    "Content-Type": "application/json",
  },
});

// Global response interceptor to handle errors
axiosInstance.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response) {
      
      console.log("Error response:", error.response);
      return Promise.reject(error.response.data); // Return the server's error response
    } else if (error.request) {
      // Request was made but no response was received
      console.log("No response received:", error.request);
      return Promise.reject(new Error("No response received from the server."));
    } else {
      // Something else caused an error in setting up the request
      console.log("Error setting up request:", error.message);
      return Promise.reject(error);
    }
  }
);

export const userService = {
  // Register function
  async register(name, email, password) {
    try {
      const response = await axiosInstance.post("/register", {
        name,
        email,
        password,
      });
      // console.log("Registration success:", response.data);
      return response.data;
    } catch (error) {
      console.log("Registration error:", error);
      throw error;
    }
  },

  // Login function
  async login(email, password) {
    try {
      const response = await axiosInstance.post("/login", { email, password });
      const token = response.data.JWt; // Assuming the correct token key is Jwt
      // console.log(token);
      //const token = response.JWt;
      if (!token) {
        throw new Error("No token found in the login response");
      }
      localStorage.setItem("token", token); // Store token in localStorage
      console.log(
        "Token in localStorage after storing:",
        localStorage.getItem("token")
      ); // Verify token storage
      return response.data;
    } catch (error) {
      console.log("Login error:", error);
      throw error;
    }
  },

  // Get user data function
  async getUserData() {
    try {
      console.log("Full localStorage:", localStorage); // Debugging: Check what's in localStorage

      let token = localStorage.getItem("token");
      // console.log("Retrieved token is:", token); // Check if token is retrieved correctly

      if (!token || token === "undefined") {
        throw new Error("Token is undefined or missing");
      }

      // Make the API call with the token
      const response = await axiosInstance.get("/user", {
        headers: { Authorization: `Bearer ${token}` }, // Attach token correctly in the Authorization header
      });
      // console.log("User data retrieved:", response.data);
      return response.data;
    } catch (error) {
      console.log("Error fetching user data:", error);
      throw error;
    }
  },
  async logout() {
    try {
      const token = localStorage.getItem("token");
      const response = await axiosInstance.post(
        "/logout",
        {},
        {
          headers: { Authorization: `Bearer ${token}` }, // Pass token in logout as well
        }
      );
      localStorage.removeItem("token"); 
      // console.log("Logout success:", response.data);
      return response.data;
    } catch (error) {
      console.log("Logout error:", error);
      throw error;
    }
  },
};
