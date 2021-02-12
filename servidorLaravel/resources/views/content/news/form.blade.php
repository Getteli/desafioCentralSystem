<!-- layout onde esse conteudo sera apresentado -->
@extends('layouts.main')
<!-- titulo desta pagina -->
@section('title', 'Notícias')
<!-- conteudo -->
@section('content')
  <div class="col-md">
    <div class="container">
      <h3>crie sua notícia</h3>
      <hr>
      <form action="{{ route('news.create') }}" method="POST">
        {{csrf_field()}}
        <div class="form-group">
          <label for="titlenews">Título da notícia</label>
          <input type="text" class="form-control" name="title" id="titlenews" aria-describedby="titleexp" placeholder="título da noticia aqui" maxlength="40" required>
          <small id="titleexp" class="form-text text-muted">O título da sua notícia deve possuir 40 caracteres no máximo.</small>
        </div>
        <div class="form-group">
          <label for="selectUser">Usuário</label>
          <select class="form-control" name="user" id="selectUser" required>
            <option>Selecionar usuário</option>
            @foreach($users as $user)
            <option value="{{ $user->id }}">{{ $user->name }}</option>
            @endforeach
          </select>
        </div>
        <div class="form-group">
          <label for="contentnews">Notícia</label>
          <textarea class="form-control" name="content" id="contentnews" placeholder="Notícia" maxlength="9000" rows="10" cols="50" required></textarea>
        </div>
        <div class="d-flex flex-row-reverse">
          <button type="submit" class="btn btn-primary p-2">Criar notícia</button>
        </div>
      </form>
    </div>
  </div>
@endsection
