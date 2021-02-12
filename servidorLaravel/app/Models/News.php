<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    use HasFactory;

    protected $table = "news";
  	protected $primaryKey = 'idNews';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'content',
        'actived',
        'user_id'
    ];

    protected $guarded = ['idNews', 'created_at', 'update_at'];

    // NAVIGATION
    public function user()
  	{
  		return $this->belongsTo('App\Models\User','user_id');
  	}

    public function list()
    {
      try{
        $newses = News::all()->where("actived", 1);

        return view('content.news.index',compact('newses'));
  		}catch(\Exception $e){
  			// retorna ao cliente
  			return redirect()->back()->withInput();
  		}
    }

    public function create(Request $request)
    {
      try{
  			$dados = $request->all();

  			// entao cria o cliente
  			$news = new News();
  			$news->title = $dados['title'];
  			$news->content = $dados['content'];
        $news->user_id = $dados['user'];
        $news->actived = 1;
  			$news->save();

  			return redirect('news/list');
  		}catch(\Exception $e){

  		    return redirect()->back()->withInput($request->all);
  		}
    }

    public function deleteNews(int $idNews)
    {
      if (filter_var($idNews, FILTER_VALIDATE_INT)) {
    		$idNews = intval($idNews);
    	}
      else {
        return redirect()->back();
      }

      try{
  			$news = News::find($idNews);
        $news->actived = 0;
  			$news->update();

  			return redirect('news/list');
  		}catch(\Exception $e){
  		    return redirect()->back();
  		}
    }

    public function getNews(int $idNews)
    {
      if (filter_var($idNews, FILTER_VALIDATE_INT)) {
    		$idNews = intval($idNews);
    	}
      else {
        return redirect()->back();
      }

      try{
  			$news = News::where([['idNews','=',$idNews],['actived','=',1]])->first();

        if ($news) {
    			return view('content.news.edit',compact('news'));
        }
        else
        {
          return redirect()->back();
        }
  		}catch(\Exception $e){
  		    return redirect()->back();
  		}
    }

    public function updateNews(Request $request, int $idNews)
    {
      if (filter_var($idNews, FILTER_VALIDATE_INT)) {
    		$idNews = intval($idNews);
    	}
      else {
        return redirect()->back();
      }

      try{
        $dados = $request->all();

  			$news = News::find($idNews);
        $news->title = $dados["title"];
        $news->content = $dados["content"];
  			$news->update();

  			return redirect('news/list');
  		}catch(\Exception $e){
  		    return redirect()->back();
  		}
    }

    public function getAll()
    {
      return News::all()->where("actived", 1);
    }

    public function getOne($id)
    {
      // return $id;
      return News::where('idNews', '=',$id)->first();
    }
}
