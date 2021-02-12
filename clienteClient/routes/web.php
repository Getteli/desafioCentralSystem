<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
// fazendo aqui mesmo para teste, mas o melhor é fazer no model e passar pelo controller
use App\Models\User;

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

Route::get('prepare-to-login', function (Request $request) {
  // passe o email para salvar no banco o novo cliente
  // POR QUE TIVE PROBLEMAS COM O DEEP LINK LOCALMENTE
  // vai simular um cliente autorizando o client a acessar os seus dados:
  // guarda uma chave que vai confirmar a transacao
  $state = Str::random(40);
  // dd($request->all());
  $result = $request->all();

  if (!isset($result["email"])) {
    return false;
  }

  // guarda o codigo state para verificar depois
  session([
    'state' => $state,
    'email' => $result["email"]
  ]);

  // cria uma query
  $query = http_build_query([
    'client_id' => env('CLIENT_ID'), // o id do client no nosso servidor
    'redirect_url' => env('REDIRECT_URL'), // a url q vai voltar
    'response_type' => 'code', // o tipo
    'scope' => '', // scope
    'state' => $state, // a chave da transacao
    'email' => $result["email"],
  ]);
  // return env('URL_API')."/oauth/authorize?".$query;
  // vai redirecionar para a url de login pelo oauth, criado pelo passport
  return redirect(env('URL_API')."/oauth/authorize?".$query);

})->name("prepare.login");

Route::get('callback', function (Request $request) {
  // ve o retorno do callback
  // dd($request->all());
  // faz a logica de retorno para autorizar o client a pegar os dados do usuario, agora com a chave Authorization Code

  // faz o acesso a url da api no caminho oauth/token, q é o caminho para pegar o access token
  $response = Http::post(env('URL_API')."/oauth/token", [
    'grant_type' => 'authorization_code',
    'client_id' => env('CLIENT_ID'),
    'client_secret' => env('CLIENT_SECRET'),
    'redirect_url' => env('REDIRECT_URL'),
    'code' => $request->code,
  ]);

  // ve o retorno depois de pedir a API, agora com o access token
  // dd($response->json());
  // agora pega o access token q veio pelo response.
  // vamos fazer algo apenas para agilizar e pelo teste, vou salvar no banco um novo usuario
  // com esse access_token e o email que o cliente passou, salva no banco
  // FAZENDO DESSA FORMA POIS TIVE PROBLEMAS COM O DEEP LINK LOCALMENTE
  $result = $response->json();
  // return $result["access_token"]
  // return "email: " . session('email');
  $user = User::where([['email','=',session('email') ]])->first();

  if (!$user) {
    $newuser = new User();
    $newuser->name = session('email');
    $newuser->email = session('email');
    $newuser->type = 0;
    $newuser->access_token = $result["access_token"];
    // poderia salvar tambem o refresh_token, o token_type o expires_in..
    $newuser->save();
  }

  return "
  <h1 style='font-size: 80px!important'>Conectado a API com sucesso. Feche esta aba e volte para o aplicativo. Faça login com o mesmo email</h1>
  ";
});

Route::get('login-via-app', function (Request $request) {
  $result = $request->all();
  // faz o tratamento aqui, nao estou fazendo apenas pelo teste
  if (!isset($result["email"])) {
    return false;
  }

  $user = User::where([['email','=',$result["email"] ]])->first();

  if ($user) {
    $return = array(
      'email' => $user->email,
      'access_token' => $user->access_token
    );
    return json_encode($return);
  }
  else
  {
    return false;
  }
});
