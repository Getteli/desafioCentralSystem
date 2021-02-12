<!-- layout onde esse conteudo sera apresentado -->
@extends('layouts.main')
<!-- titulo desta pagina -->
@section('title', 'Usuários')
<!-- conteudo -->
@section('content')
  <div class="col-md">
    <div class="container">
      <h3>{{ $user->name }}</h3>
      <hr>
      <form action="{{ route('users.update', $user->id) }}" method="POST">
        {{csrf_field()}}
        <div class="form-group">
          <label for="nomeUser">Nome</label>
          <input type="text" class="form-control" name="name" id="nomeUser" placeholder="nome do usuário" required value="{{ $user->name ?? '' }}">
        </div>
        <div class="form-group">
          <label for="emailUser">Email</label>
          <input type="email" class="form-control" name="email" id="emailUser" placeholder="seuemail@provedor.com" readonly value="{{ $user->email ?? '' }}">
        </div>
        <div class="d-flex flex-row-reverse">
          <button type="submit" class="btn btn-primary p-2">Salvar</button>
        </div>
      </form>
    </div>
  </div>
@endsection
