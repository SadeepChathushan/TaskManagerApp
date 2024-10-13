Task Manager System

A simple Task Manager application using Laravel for the backend and Vue.js for the frontend.

Features

User Authentication: Register and login.

Task Management:
           Add, edit, delete tasks.
           Mark tasks as completed or pending.
           Each user can only manage their own tasks.

Technologies

Backend: Laravel 9
Frontend: Vue.js 3
Database: MySQL 

API Endpoints

Register: POST /api/register
Login: POST /api/login
Create Task: POST /api/tasks
Update Task: PUT /api/tasks/{id}
Delete Task: DELETE /api/tasks/{id}
List Tasks: GET /api/tasks
