<!-- layout onde esse conteudo sera apresentado -->
@extends('layouts.main')
<!-- titulo desta pagina -->
@section('title', 'Notícias')
<!-- conteudo -->
@section('content')
  <div class="col-md">
    <div class="container">
      <h3>{{ $news->title ?? ''}}</h3>
      <hr>
      <form action="{{ route('news.update',$news->idNews) }}" method="POST">
        {{csrf_field()}}
        <div class="form-group">
          <label for="titlenews">Título da notícia</label>
          <input type="text" class="form-control" name="title" id="titlenews" aria-describedby="titleexp" placeholder="título da noticia aqui" maxlength="40" required value="{{ $news->title ?? ''}}">
          <small id="titleexp" class="form-text text-muted">O título da sua notícia deve possuir 40 caracteres no máximo.</small>
        </div>
        <div class="form-group">
          <label for="contentnews">Notícia</label>
          <textarea class="form-control" name="content" id="contentnews" placeholder="Notícia" maxlength="9000" rows="10" cols="50" required>{{ $news->content ?? ''}}</textarea>
        </div>
        <div class="d-flex flex-row-reverse">
          <button type="submit" class="btn btn-primary p-2">Salvar</button>
        </div>
      </form>
    </div>
  </div>
@endsection
