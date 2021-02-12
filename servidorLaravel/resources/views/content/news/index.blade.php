<!-- layout onde esse conteudo sera apresentado -->
@extends('layouts.main')
<!-- titulo desta pagina -->
@section('title', 'Notícias')
<!-- conteudo -->
@section('content')
  <h1>listar noticias</h1>
  <table id="tableNews" class="table table-striped table-bordered" style="width:100%">
  <thead>
    <tr>
      <th>Titulo</th>
      <th>Editor</th>
      <th>Ações</th>
    </tr>
  </thead>
  <tbody>
    @foreach($newses as $news)
    <tr>
      <td>{{ $news->title }}</td>
      <td>{{ $news->user->name }}</td>
      <td>
        <a href="{{ route('news.edit',$news->idNews) }}"><i class="bi bi-pencil-square"></i></a>
        &nbsp;<strong>|</strong>&nbsp;
        <a href="{{ route('news.delete',$news->idNews) }}"><i class="bi bi-trash" style="color: red;"></i></a>
      </td>
    </tr>
    @endforeach
  </tbody>
</table>
@endsection
