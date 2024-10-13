<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task; // Assuming you have a Task model

class TaskController extends Controller
{
    // View all tasks
    public function index()
    {
        $user = auth()->user();
        $tasks = Task::where([['user_id', $user->id]])->get();
        return response()->json($tasks);
    }

    // View a single task
    public function show($id)
    {
        $user = auth()->user();
        $task = Task::where([['user_id', $user->id],['id', $id]])->first();
        if ($task) {
            return response()->json($task);
        }
        return response()->json(['message' => 'Task not found'], 404);
    }

    // Add a new task
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|string|max:255',
            'description' => 'required|string',
        ]);
        $user = auth()->user();
        $task = Task::create([
            'user_id'=>$user->id,
            'title' => $request->title,
            'description' => $request->description,
            'status' => $request->status ?? 'pending', // Default status is pending
        ]);

        return response()->json($task, 201);
    }

    // Update a task
    public function update(Request $request, $id)
    {
        $task = Task::find($id);
        if (!$task) {
            return response()->json(['message' => 'Task not found'], 404);
        }

        $this->validate($request, [
            'title' => 'sometimes|required|string|max:255',
            'description' => 'sometimes|required|string',
            'status' => 'sometimes|required|in:pending,completed',
        ]);

        $task->update($request->only(['title', 'description', 'status']));

        return response()->json($task);
    }

    // Delete a task
    public function destroy($id)
    {
        $task = Task::find($id);
        if (!$task) {
            return response()->json(['message' => 'Task not found'], 404);
        }

        $task->delete();
        return response()->json(['message' => 'Task deleted']);
    }

    public function updateStatus(Request $request, $id)
    {
        // Validate that the status is either 'pending' or 'completed'
        $validated = $request->validate([
            'status' => 'required|in:pending,completed',
        ]);

        // Find the task by its ID
        $task = Task::findOrFail($id);

        // Ensure the authenticated user owns this task
        if ($task->user_id !== auth()->id()) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        // Update the task status
        $task->status = $validated['status'];
        $task->save();

        // Return a success response with the updated task
        return response()->json([
            'message' => 'Task status updated successfully.',
            'task' => $task,
        ], 200);
    }
}
