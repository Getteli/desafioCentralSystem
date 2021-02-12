<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function list()
    {
      $user = new User();

      return $user->list();
    }

    public function create(Request $request)
    {
      $user = new User();

      return $user->createUser($request);
    }

    public function delete($id)
    {
      $user = new User();
      try{
        return $user->deleteUser($id);
      }catch(\Exception $e){
        return redirect()->back();
      }
    }

    public function edit($id)
    {
      $user = new User();
      try{
        return $user->getUser($id);
      }catch(\Exception $e){
        return redirect()->back();
      }
    }

    public function update(Request $request, $id)
    {
      $user = new User();
      try{
        return $user->updateUser($request, $id);
      }catch(\Exception $e){
        return redirect()->back();
      }
    }
}
