<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use App\Models\News;
use App\Models\User;
use App\Models\Location;
use App\Models\Photo;

class NewsController extends Controller
{
  public function list()
  {
    $news = new News();

    return $news->list();
  }

  public function form()
  {
    $users = new User();
    // criei um metodo para pegar todos os usuarios e retornar, para centralizar
    $users = $users->getAll();
    return view('content.news.form',compact('users'));
  }

  public function create(Request $request)
  {
    $news = new News();

    return $news->create($request);
  }

  public function delete($id)
  {
    $news = new News();
    try{
      return $news->deleteNews($id);
    }catch(\Exception $e){
      return redirect()->back();
    }
  }

  public function getAll()
  {
    $news = new News();

    return $news->getAll();
  }

  public function getOne($id)
  {
    $news = new News();

    return $news->getOne($id);
  }

  public function edit($id)
  {
    $news = new News();
    try{
      return $news->getNews($id);
    }catch(\Exception $e){
      return redirect()->back();
    }
  }

  public function update(Request $request, $id)
  {
    $news = new News();
    try{
      return $news->updateNews($request, $id);
    }catch(\Exception $e){
      return redirect()->back();
    }
  }

  public function teste()
  {

    $array = array(
      array('id' => 1, 'uf' => 'RJ'),
      array('id' => 2, 'uf' => 'SP'),
      array('id' => 3, 'uf' => 'MG'),
      array('id' => 4, 'uf' => 'ES'),
    );

    return json_encode($array);
  }

}
