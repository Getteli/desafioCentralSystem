<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class Photo extends Model
{
    use HasFactory;

    protected $table = "photos";
  	protected $primaryKey = 'idPhoto';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'pathPhoto',
        'subtitle',
        'user_id',
        'actived'
    ];


    protected $guarded = ['idPhoto', 'created_at', 'update_at'];


    // NAVIGATION
    public function User()
  	{
  		return $this->belongsTo('App\Models\User','id');
  	}

    public function savePhoto(Request $request, $id)
    {
      try{
        $dados = $request->all();

        // converte o base64 em imagem e salva na pasta fotos em public
        $data = $dados["data"];
        $name = $dados["name"] . md5(rand(0,999).time());
        $type = $dados["type"];
        $path = "fotos/".$name.".".$type;
        $pathSaveDb = $name.".".$type;

        // cria a imagem
        $fp = fopen( $path , "wb");

        // salva na imagem
        fwrite($fp, base64_decode($data) );

        fclose($fp);

        // salva no banco
        // ps; tem que configurar o timezone, mas achei desnecessario para o momento
        $foto = new Photo();
        $foto->pathPhoto = $pathSaveDb ?? "";
        $foto->subtitle = 'Foto tirada pelo celular - ' . time();
        $foto->user_id = $id;
        $foto->actived = 1;
        $foto->save();

        return true;
      }catch(\Exception $e){
          return false;
      }
    }
}
