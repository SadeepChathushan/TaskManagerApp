<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\TaskController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('register',[AuthController::class,'register']);
Route::post('login',[AuthController::class,'login']);


Route::middleware('auth:sanctum')->group(function () {
    Route::get('user', [AuthController::class, 'user']);
    Route::post('logout', [AuthController::class, 'logout']);

    Route::get('tasks', [TaskController::class, 'index']);    // View all tasks
    Route::get('tasks/{id}', [TaskController::class, 'show']); // View single task
    Route::post('tasks', [TaskController::class, 'store']);    // Add new task
    Route::put('tasks/{id}', [TaskController::class, 'update']); // Edit task
    Route::delete('tasks/{id}', [TaskController::class, 'destroy']); // Delete task
    Route::put('tasks/status/{id}', [TaskController::class, 'updateStatus']);
});