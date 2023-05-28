<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\InitiativeController;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Rotas públicas
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

 // Initiative
 Route::post('/initiative', [InitiativeController::class, 'initiative']); 
 Route::get('/initiative/{card}', [InitiativeController::class, 'getInitiative']);
 Route::put('/initiative/{card}', [InitiativeController::class, 'update']);




// Rotas Protegida
Route::group(['middleware' => ['auth:sanctum']], function () {

    // Usuário
    Route::get('/user', [AuthController::class, 'user']);
    Route::put('/user', [AuthController::class, 'update']);
    Route::post('/logout', [AuthController::class, 'logout']);

   
});

