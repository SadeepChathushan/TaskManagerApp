<template>
  <layout-div>
    <div class="row justify-content-center">
      <div class="col-12">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
          <div class="container-fluid">
            <a class="navbar-brand" href="#">Dashboard</a>
            <div class="d-flex">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a @click.prevent="logoutAction" class="nav-link text-primary" href="#">Logout</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>

        <!-- Welcome message -->
        <h2 class="text-center mt-5 text-primary">Welcome, {{ user.name || 'User' }}</h2>

        <!-- Add New Task Button -->
        <div class="text-right my-3">
          <b-button @click="showModal = true" variant="primary" class="btn-large btn-bordered shadow">+ Add New Task</b-button>
        </div>

        <!-- Task Cards -->
        <div class="task-cards">
          <b-card
            v-for="(task, index) in tasks"
            :key="task.id"
            :title="task.title"
            class="task-card shadow-sm"
          >
            <div class="d-flex justify-content-between align-items-center">
              <div class="task-details">
                <b-card-text>
                  <p class="text-muted">{{ task.description || 'No Description' }}</p>
                </b-card-text>
              </div>
              <div class="task-meta text-right">
                <p class="due-date text-info">{{ formatDate(task.dueDate) }}</p>
                <b-badge :variant="task.status === 'completed' ? 'success' : 'warning'">
                  {{ task.status }}
                </b-badge>
              </div>
            </div>

            <div class="d-flex justify-content-end mt-2">
              <!-- Show Description Button -->
              <b-button @click="toggleDescription(task)" variant="light" class="btn-bordered btn-small mr-2">
                {{ task.showDescription ? 'Hide Description' : 'Show Description' }}
              </b-button>
              <!-- Edit Button -->
              <b-button @click="editTask(task, index)" variant="info" class="btn-bordered btn-small mr-2">Edit</b-button>
              <!-- Delete Button -->
              <b-button @click="deleteTask(index)" variant="danger" class="btn-bordered btn-small mr-2">Delete</b-button>
              <!-- Pending/Completed Button -->
              <b-button
                @click="toggleStatus(task, index)"
                :variant="task.status === 'pending' ? 'warning' : 'success'"
                class="btn-bordered btn-small"
              >
                {{ task.status === 'pending' ? 'Pending' : 'Completed' }}
              </b-button>
            </div>

            <!-- Task Description (toggleable) -->
            <div v-if="task.showDescription" class="task-description mt-3">
              <p>{{ task.description || 'No Description Available' }}</p>
            </div>
          </b-card>
        </div>

        <!-- Task Modal -->
        <b-modal v-model="showModal" title="Add/Edit Task" @hide="clearForm" centered>
          <b-form @submit.prevent="submitTask">
            <b-form-group label="Task Title" label-for="task-title">
              <b-form-input
                id="task-title"
                v-model="formTask.title"
                required
                placeholder="Enter task title"
              ></b-form-input>
            </b-form-group>

            <b-form-group label="Task Description" label-for="task-description">
              <b-form-textarea
                id="task-description"
                v-model="formTask.description"
                placeholder="Enter task description (optional)"
              ></b-form-textarea>
            </b-form-group>

            <b-form-group label="Due Date" label-for="task-due-date">
              <b-form-input
                type="date"
                id="task-due-date"
                v-model="formTask.dueDate"
                required
              ></b-form-input>
            </b-form-group>

            <b-button type="submit" variant="primary">Save Task</b-button>
          </b-form>
        </b-modal>
      </div>
    </div>
  </layout-div>
</template>

<script>
import { userService } from '../../services/userService';
import LayoutDiv from '../LayoutDiv.vue';

export default {
  name: 'DashboardPage',
  components: {
    LayoutDiv,
  },
  data() {
    return {
      user: {},
      tasks: [
        { id: 1, title: 'Task 1', description: 'Complete the report', dueDate: '2024-10-15', status: 'pending', showDescription: false },
        { id: 2, title: 'Task 2', description: 'Prepare presentation slides', dueDate: '2024-10-18', status: 'pending', showDescription: false },
      ],
      showModal: false,
      formTask: { id: null, title: '', description: '', dueDate: '', status: 'pending' },
      editIndex: null,
    };
  },
  created() {
    const token = localStorage.getItem('token');
    if (!token) {
      this.$router.push('/login');
    } else {
      this.getUser();
    }
  },
  methods: {
    async getUser() {
      try {
        const response = await userService.getUserData();
        this.user = response.data;
      } catch (error) {
        console.error('Error fetching user data:', error);
      }
    },
    formatDate(date) {
      return new Date(date).toLocaleDateString();
    },
    addTask() {
      this.showModal = true;
    },
    editTask(task, index) {
      this.formTask = { ...task };
      this.editIndex = index;
      this.showModal = true;
    },
    deleteTask(index) {
      this.tasks.splice(index, 1);
    },
    toggleStatus(task, index) {
      task.status = task.status === 'pending' ? 'completed' : 'pending';
      this.$set(this.tasks, index, task);
    },
    toggleDescription(task) {
      task.showDescription = !task.showDescription;
    },
    submitTask() {
      if (this.editIndex === null) {
        this.tasks.push({
          ...this.formTask,
          id: Date.now(),
          showDescription: false,
        });
      } else {
        this.$set(this.tasks, this.editIndex, this.formTask);
      }
      this.clearForm();
    },
    clearForm() {
      this.formTask = { id: null, title: '', description: '', dueDate: '', status: 'pending' };
      this.editIndex = null;
      this.showModal = false;
    },
  },
};
</script>

<style scoped>
/* Task Cards */
.task-cards {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.task-card {
  border-radius: 10px;
  border: 2px solid #ddd;
  transition: box-shadow 0.3s ease, border-color 0.3s ease;
  background-color: #f9f9f9;
  padding: 1.5rem;
}

.task-card:hover {
  border-color: #007bff;
  box-shadow: 0px 4px 15px rgba(0, 123, 255, 0.2);
}

.due-date {
  font-size: 0.85rem;
  color: #17a2b8;
}

/* Button Styles */
.btn-bordered {
  border: 2px solid;
  border-radius: 8px;
  padding: 0.5rem 1.2rem;
  font-size: 1rem;
  font-weight: bold;
  transition: background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease;
}

/* Large Buttons */
.btn-large {
  padding: 0.75rem 1.5rem;
  font-size: 1.2rem;
}

/* Small Buttons */
.btn-small {
  padding: 0.3rem 0.8rem;
  font-size: 0.9rem;
}

/* Hover Effects */
.btn-bordered:hover {
  background-color: #007bff;
  border-color: #0056b3;
  color: white;
}

/* Card Animations */
.task-card {
  animation: slideIn 0.4s ease-out;
}

@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
