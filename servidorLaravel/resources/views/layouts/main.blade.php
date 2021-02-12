<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
	<head>
		<!-- metas -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">

		<!-- CSRF Token -->
		<meta name="csrf-token" content="{{ csrf_token() }}">

		<!-- titulo -->
		<title>@yield('title')</title>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
	</head>
	<body>
    <!-- menu -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="{{ route('home') }}">DESAFIO</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="{{ route('home') }}"><i class="bi bi-house-fill"></i>&nbsp;Home</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownUsu" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="bi bi-person-fill"></i>&nbsp;Usuários
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownUsu">
              <a class="dropdown-item" href="{{ route('users.list') }}"><i class="bi bi-journal-text"></i>&nbsp;Listar</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="{{ route('users.create') }}"><i class="bi bi-journal-plus"></i>&nbsp;Criar</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownNews" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="bi bi-newspaper"></i>&nbsp;Notícias
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownNews">
              <a class="dropdown-item" href="{{ route('news.list') }}"><i class="bi bi-journal-text"></i>&nbsp;Listar</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="{{ route('news.create') }}"><i class="bi bi-journal-plus"></i>&nbsp;Criar</a>
            </div>
          </li>
					<li class="nav-item active">
            <a class="nav-link" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="bi bi-door-open-fill"></i>&nbsp;{{ __('Logout') }}</a>
						<form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
								@csrf
						</form>
          </li>
        </ul>
      </div>
    </nav>

    <!-- conteudo -->
		<div class="container">
				@yield('content')
		</div>

    <!-- scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.bundle.min.js"></script>

    <script src="{{ asset('js/app.js') }}"></script>
