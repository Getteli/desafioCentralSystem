<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Photo;

class PhotoController extends Controller
{
    //
    public function sendPhoto(Request $request, $id)
    {
      $photo = new Photo();
      return $photo->savePhoto($request, $id);
    }
}
