<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class Location extends Model
{
    use HasFactory;

    protected $table = "locations";
  	protected $primaryKey = 'idLocal';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'latitude',
        'longitude',
        'user_id',
    ];


    protected $guarded = ['idLocal', 'created_at', 'update_at'];


    // NAVIGATION
  	public function User()
  	{
  		return $this->belongsTo('App\Models\User','user_id');
  	}

    public function create(Request $request, $id)
    {
      try{
        $dados = $request->all();
        // verifica se já existe
        $hasLocation = Location::where([['user_id','=',$id]])->first();

        if (!$hasLocation) {
          $location = new Location();
          $location->latitude = $dados['latitude'] ?? '';
          $location->longitude = $dados['longitude'] ?? '';
          $location->user_id = $id;
          $location->save();
          // return "nao tem";
        }
        else
        {
          $location = Location::where([['user_id','=',$id]])->first();
          $location->latitude = $dados['latitude'] ?? '';
          $location->longitude = $dados['longitude'] ?? '';
          $location->update();
          // return "tem";
        }

        return true;
      }catch(\Exception $e){
        return $e->getMessage();
        return false;
      }
    }
}
