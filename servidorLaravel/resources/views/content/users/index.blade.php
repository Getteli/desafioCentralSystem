<!-- layout onde esse conteudo sera apresentado -->
@extends('layouts.main')
<!-- titulo desta pagina -->
@section('title', 'Usuários')
<!-- conteudo -->
@section('content')
  <h1>listar usuarios</h1>
  <table id="tableUser" class="table table-striped table-bordered" style="width:100%">
  <thead>
    <tr>
      <th>Nome</th>
      <th>Email</th>
      <th>Ações</th>
    </tr>
  </thead>
  <tbody>
    @foreach($users as $user)
    <tr>
      <td>{{ $user->name }}</td>
      <td>{{ $user->email }}</td>
      <td>
        <a href="{{ route('users.edit',$user->id) }}"><i class="bi bi-pencil-square"></i></a>
        &nbsp;<strong>|</strong>&nbsp;
        <a href="{{ route('users.delete',$user->id) }}"><i class="bi bi-trash" style="color: red;"></i></a>
      </td>
    </tr>
    @endforeach
  </tbody>
</table>
@endsection
