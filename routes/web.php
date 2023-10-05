<?php

use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\OAuthController;

use App\Http\Controllers\CreateRecordController;
use App\Http\Controllers\GetRecordsController;
use App\Http\Controllers\EditRecordController;
use App\Http\Controllers\DeleteRecordsController;

use App\Http\Controllers\GetUsersController;
use App\Http\Controllers\CreateUserController;
use App\Http\Controllers\DeleteUserRecordsController;

Route::get('/', function () 
{
    if (Auth::guard()->guest()) 
    {
        return redirect('/login');
    }

    return redirect('/records');

});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
    
])->group(function () 
{
    Route::get('/records', GetRecordsController::class)->name('records');

    Route::post('/createRecord', CreateRecordController::class)->name('createRecord');

    Route::post('/deleteRecord', DeleteRecordsController::class)->name('deleteRecord');

    Route::post('/editRecord', EditRecordController::class)->name('editRecord');

    Route::get('/help', function () { return view('frontend/help'); });

    Route::get('/detail', function () { return view('frontend/detail'); });

    Route::middleware([
        'role:admin',
        
        ])->group(function () 
        {
            Route::get('/admin', GetUsersController::class)->name('getUsers');

            Route::post('/createUser', CreateUserController::class)->name('createUser');

            Route::post('/deleteUser', DeleteUserRecordsController::class)->name('deleteUser');

            Route::prefix('monitor')->group(function () { Route::queueMonitor(); });
        });
});
        
Route::get('/login/microsoft', [OAuthController::class, 'login'])->name('login');
Route::get('/login/microsoft/callback', [OAuthController::class, 'redirect']);
Route::get('/logout', [OAuthController::class, 'logout']);

Route::get('/login', function () { return view('frontend/login'); });

