<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\PhotoController;
use App\Http\Controllers\LocationController;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// pegar todos os detalhes da noticia
Route::middleware('auth:api')->get('/news/list/', function (Request $request) {
    $result = $request->all();
    $newController = new NewsController();
    return $newController->getOne($result["id"]);
});

// pegar todas as noticias
Route::middleware('auth:api')->get('/news/list/all', function (Request $request) {
    $newController = new NewsController();
    return $newController->getAll();
});

// postar a cada 1 minuto no banco a localizacao
Route::middleware('auth:api')->post('/location/post', function (Request $request) {
  $locationController = new LocationController();
  return $locationController->setLocation($request, auth()->user()->id);
});

// postar a foto no servidor
Route::middleware('auth:api')->post('/photo/post', function (Request $request) {
  $photoController = new PhotoController();
  return $photoController->sendPhoto($request, auth()->user()->id);
});
