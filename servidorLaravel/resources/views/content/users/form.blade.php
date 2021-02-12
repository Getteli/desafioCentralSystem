<!-- layout onde esse conteudo sera apresentado -->
@extends('layouts.main')
<!-- titulo desta pagina -->
@section('title', 'Usuários')
<!-- conteudo -->
@section('content')
  <div class="col-md">
    <div class="container">
      <h3>adicionar um novo usuário</h3>
      <hr>
      <form action="{{ route('users.create') }}" method="POST">
        {{csrf_field()}}
        <div class="form-group">
          <label for="nomeUser">Nome</label>
          <input type="text" class="form-control" name="name" id="nomeUser" placeholder="nome do usuário" required>
        </div>
        <div class="form-group">
          <label for="emailUser">Email</label>
          <input type="email" class="form-control" name="email" id="emailUser" placeholder="seuemail@provedor.com" required>
        </div>
        <div class="form-group">
          <label for="passUser">Senha</label>
          <input type="password" class="form-control" name="password" id="passUser" ma-maxlength="8" required>
        </div>
        <div class="d-flex flex-row-reverse">
          <button type="submit" class="btn btn-primary p-2">Adicionar usuário</button>
        </div>
      </form>
    </div>
  </div>
@endsection
