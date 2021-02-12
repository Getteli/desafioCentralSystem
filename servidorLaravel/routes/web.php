<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\NewsController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

// rotas para usuarios
Route::get('/users/list',[UserController::class, 'list'])->name('users.list');
Route::get('/users/create',['as'=>'users.create', function () {
  return view('content.users.form');
}]);
Route::post('/users/create',[UserController::class, 'create'])->name('users.create');
Route::get('/users/delete/{id}',[UserController::class, 'delete'])->name('users.delete');
Route::get('/users/edit/{id}',[UserController::class, 'edit'])->name('users.edit');
Route::post('/users/update/{id}',[UserController::class, 'update'])->name('users.update');

// rotas para as noticias
Route::get('/news/list',[NewsController::class, 'list'])->name("news.list");
// passo pelo controller pois pego a listagem de usuarios possiveis para linkar a noticia
Route::get('/news/create',[NewsController::class, 'form'])->name('news.create');
Route::post('/news/create', [NewsController::class, 'create'])->name('news.create');
Route::get('/news/delete/{id}',[NewsController::class, 'delete'])->name('news.delete');
Route::get('/news/edit/{id}',[NewsController::class, 'edit'])->name('news.edit');
Route::post('/news/update/{id}',[NewsController::class, 'update'])->name('news.update');

// rotas only AUTH TRUE, somente logado
Route::group(['middleware'=>'auth'], function(){
  Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
});
