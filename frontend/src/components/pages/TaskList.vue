<template>
  <layout-div>
    <div class="container mt-5">
      <h2>Welcome, {{ userData.name }}</h2>
      <p>Your email: {{ userData.email }}</p>

      <!-- Task Management Section -->
      <div class="mt-4">
        <h3>Your Tasks</h3>

        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">

<!-- Add New Task Button -->
<button 
  @click="showAddTaskModal = true" 
  class="btn btn-primary" 
  style="padding: 10px 20px; margin-bottom: 0;">
  Add New Task
</button>

<!-- Logout Button -->
<button 
  @click="logout" 
  class="btn btn-danger" 
  style="padding: 10px 20px; border-radius: 5px; margin-bottom: 0;">
  Logout
</button>

</div>

        <!-- Task List -->
        <ul class="list-group">
          <li
            v-for="task in tasks"
            :key="task.id"
            class="list-group-item d-flex justify-content-between align-items-center"
          >
            <div>
              <h5>{{ task.title }}</h5>
              <p>{{ task.description }}</p>
              <span
                class="badge"
                :class="{
                  'bg-success': task.status === 'completed',
                  'bg-warning': task.status === 'pending',
                }"
              >
                {{ task.status }}
              </span>
            </div>

            <!-- Task Actions -->
            <div class="btn-group">
              <button
                @click="toggleStatus(task)"
                class="btn btn-sm"
                :class="{
                  'btn-success': task.status === 'pending',
                  'btn-warning': task.status === 'completed',
                }"
              >
                {{
                  task.status === "pending"
                    ? "Mark as Completed"
                    : "Mark as Pending"
                }}
              </button>
              <button @click="editTask(task)" class="btn btn-sm btn-info">
                Edit
              </button>
              <button
                @click="deleteTask(task.id)"
                class="btn btn-sm btn-danger"
              >
                Delete
              </button>
            </div>
          </li>
        </ul>
      </div>

      <!-- Add Task Modal -->
      <div
        v-if="showAddTaskModal"
        class="modal"
        tabindex="-1"
        style="display: block; background-color: rgba(0, 0, 0, 0.5)"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Add New Task</h5>
              <button
                type="button"
                class="btn-close"
                @click="showAddTaskModal = false"
              ></button>
            </div>
            <div class="modal-body">
              <form @submit.prevent="addTask">
                <div class="mb-3">
                  <label for="newTaskTitle" class="form-label"
                    >Task Title</label
                  >
                  <input
                    v-model="newTask.title"
                    type="text"
                    class="form-control"
                    id="newTaskTitle"
                    placeholder="Enter task title"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="newTaskDescription" class="form-label"
                    >Task Description</label
                  >
                  <textarea
                    v-model="newTask.description"
                    class="form-control"
                    id="newTaskDescription"
                    rows="3"
                    placeholder="Enter task description (optional)"
                  ></textarea>
                </div>
                <button type="submit" class="btn btn-success">Add Task</button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- Edit Task Modal -->
      <div
        v-if="editingTask"
        class="modal"
        tabindex="-1"
        style="display: block; background-color: rgba(0, 0, 0, 0.5)"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Edit Task</h5>
              <button
                type="button"
                class="btn-close"
                @click="editingTask = null"
              ></button>
            </div>
            <div class="modal-body">
              <form @submit.prevent="updateTask">
                <div class="mb-3">
                  <label for="editTaskTitle" class="form-label"
                    >Task Title</label
                  >
                  <input
                    v-model="editingTask.title"
                    type="text"
                    class="form-control"
                    id="editTaskTitle"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="editTaskDescription" class="form-label"
                    >Task Description</label
                  >
                  <textarea
                    v-model="editingTask.description"
                    class="form-control"
                    id="editTaskDescription"
                    rows="3"
                  ></textarea>
                </div>
                <button type="submit" class="btn btn-primary">
                  Update Task
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- <button @click="logout" class="btn btn-danger mt-5">Logout</button> -->


    </div>
  </layout-div>
</template>

<script>
import { userService } from "../../services/userService";
import LayoutDiv from "../LayoutDiv.vue";
import axios from "axios";

export default {
  name: "TaskList",
  components: {
    LayoutDiv,
  },
  data() {
    return {
      userData: {},
      tasks: [],
      newTask: {
        title: "",
        description: "",
      },
      editingTask: null,
      showAddTaskModal: false, // Controls the visibility of the add task modal
    };
  },
  created() {
    this.fetchUserData();
    this.fetchTasks();
  },
  methods: {
    async fetchUserData() {
      try {
        this.userData = await userService.getUserData();
      } catch (error) {
        console.error("Error fetching user data:", error);
        this.$router.push("/");
      }
    },
    async fetchTasks() {
      try {
        const response = await axios.get("/tasks", {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        });
        this.tasks = response.data;
      } catch (error) {
        console.error("Error fetching tasks:", error);
      }
    },
    async addTask() {
      try {
        const response = await axios.post(
          "/tasks",
          {
            title: this.newTask.title,
            description: this.newTask.description,
            status: "pending",
          },
          {
            headers: {
              Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
          }
        );
        this.tasks.push(response.data); // Add the new task to the list
        this.newTask.title = "";
        this.newTask.description = "";
        this.showAddTaskModal = false; // Close the modal after adding task
      } catch (error) {
        console.error("Error adding task:", error);
      }
    },
    async toggleStatus(task) {
      try {
        const updatedStatus =
          task.status === "pending" ? "completed" : "pending";
        const response = await axios.put(
          `/tasks/status/${task.id}`,
          { status: updatedStatus },
          {
            headers: {
              Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
          }
        );
        task.status = response.data.status; // Update the task's status locally
      } catch (error) {
        console.error("Error updating task status:", error);
      }
    },
    async deleteTask(taskId) {
      try {
        await axios.delete(`tasks/${taskId}`, {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        });
        this.tasks = this.tasks.filter((task) => task.id !== taskId); // Remove task from list
      } catch (error) {
        console.error("Error deleting task:", error);
      }
    },
    editTask(task) {
      this.editingTask = { ...task }; // Make a copy of the task to edit
    },
    async updateTask() {
      try {
        const response = await axios.put(
          `/tasks/${this.editingTask.id}`,
          {
            title: this.editingTask.title,
            description: this.editingTask.description,
          },
          {
            headers: {
              Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
          }
        );
        const index = this.tasks.findIndex((t) => t.id === this.editingTask.id);
        if (index !== -1) {
          this.tasks[index] = response.data; // Update the task in the list
        }
        this.editingTask = null; // Close the edit modal
      } catch (error) {
        console.error("Error updating task:", error);
      }
    },
    async logout() {
      try {
        await userService.logout();
        this.$router.push("/");
      } catch (error) {
        console.error("Error during logout:", error);
      }
    },
  },
};
</script>

<style scoped>
.container {
  max-width: 800px;
  margin: auto;
}
.card {
  margin-bottom: 20px;
}
.list-group-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.modal {
  z-index: 1050;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  outline: 0;
  background-color: rgba(0, 0, 0, 0.5);
}
</style>
