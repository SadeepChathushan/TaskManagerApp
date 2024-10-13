<h1><b>Task Manager System</b></h1>

<p>A simple Task Manager application using Laravel for the backend and Vue.js for the frontend.</p>

<h2>Features</h2>
<ul>
  <li><strong>User Authentication:</strong> Register and login.</li>
  <li><strong>Task Management:</strong>
    <ul>
      <li>Add, edit, delete tasks.</li>
      <li>Mark tasks as completed or pending.</li>
      <li>Each user can only manage their own tasks.</li>
    </ul>
  </li>
</ul>

<h2>Technologies</h2>
<ul>
  <li><strong>Backend:</strong> Laravel 9</li>
  <li><strong>Frontend:</strong> Vue.js 3</li>
  <li><strong>Database:</strong> MySQL</li>
</ul>

<h2>API Endpoints</h2>
<ul>
  <li><strong>Register:</strong> POST /api/register</li>
  <li><strong>Login:</strong> POST /api/login</li>
  <li><strong>Create Task:</strong> POST /api/tasks</li>
  <li><strong>Update Task:</strong> PUT /api/tasks/{id}</li>
  <li><strong>Delete Task:</strong> DELETE /api/tasks/{id}</li>
  <li><strong>List Tasks:</strong> GET /api/tasks</li>
</ul>

