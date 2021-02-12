<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = "users";

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'actived'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $guarded = ['id', 'created_at', 'update_at'];
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // NAVIGATION
  	public function Photos()
  	{
  		return $this->hasMany('App\Models\Photos','idPhoto');
  	}

  	public function Location()
  	{
      return $this->belongsTo('App\Models\Location','idLocal');
  	}

  	public function News()
  	{
  		return $this->hasMany('App\Models\News','idNews');
  	}

    public function getAll()
    {
      return User::all()->where('actived', 1);
    }

    public function list()
    {
      try{
        $users = $this->getAll();
        return view('content.users.index',compact('users'));
  		}catch(\Exception $e){
  			// retorna ao cliente
  			return redirect()->back()->withInput();
  		}
    }

    // poderia ser criado tambem um proprio request para o usuario sobre os dados dele, mas como é apenas um desafio para exemplificar, nao precisa.
    public function createUser(Request $request)
    {
      try{
  			$dados = $request->all();

  			$user = new User();
  			$user->name = $dados['name'];
  			$user->email = $dados['email'];
        // prefiro fazer encriptacao de senha no php usando o password_hash, com o PASSWORD_BCRYPT
        // mas para facilitar e ser mais agil no exemplo, estou fazendo por md5
        $user->password = md5($dados['password']);
        $user->actived = 1;
  			$user->save();

  			return redirect('users/list');
  		}catch(\Exception $e){

  		    return redirect()->back()->withInput($request->all);
  		}
    }

    public function deleteUser(int $idUser)
    {
      if (filter_var($idUser, FILTER_VALIDATE_INT)) {
    		$idUser = intval($idUser);
    	}
      else {
        return redirect()->back();
      }

      try{
  			$user = User::find($idUser);
        $user->actived = 0;
  			$user->update();

  			return redirect('users/list');
  		}catch(\Exception $e){
  		    return redirect()->back();
  		}
    }

    public function getUser(int $idUser)
    {
      if (filter_var($idUser, FILTER_VALIDATE_INT)) {
    		$idUser = intval($idUser);
    	}
      else {
        return redirect()->back();
      }

      try{
  			$user = User::where([['id','=',$idUser],['actived','=',1]])->first();

        if ($user) {
    			return view('content.users.edit',compact('user'));
        }
        else
        {
          return redirect()->back();
        }
  		}catch(\Exception $e){
  		    return redirect()->back();
  		}
    }

    public function updateUser(Request $request, int $idUser)
    {
      if (filter_var($idUser, FILTER_VALIDATE_INT)) {
    		$idUser = intval($idUser);
    	}
      else {
        return redirect()->back();
      }

      try{
        $dados = $request->all();
  			$user = User::find($idUser);
        $user->name = $dados["name"];
  			$user->update();

  			return redirect('users/list');
  		}catch(\Exception $e){
  		    return redirect()->back();
  		}
    }
}
