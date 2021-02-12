<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Location;

class LocationController extends Controller
{
    //
    public function setLocation(Request $request, $id)
    {
      $location = new Location();
      return $location->create($request, $id);
    }
}
