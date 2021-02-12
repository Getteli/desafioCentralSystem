<!-- layout onde esse conteudo sera apresentado -->
@extends('layouts.main')
<!-- titulo desta pagina -->
@section('title', 'Inicio')
<!-- conteudo -->
@section('content')
	<div>
		<div>
			<div>
        <h5>Desafio</h5>
        <sub>Desafio Laravel/React para a Central System</sub>
				<p>
          Esta aplicação em <strong>laravel</strong> é tambem um <strong>webservice</strong> para que a aplicação em <strong>React native</strong> possa consumir.
        </p>
        <p>
          O banco de dados foi gerado usando o migrate do proprio Laravel. Porém existe o backup para verificação em uma pasta separada no <strong>github</strong>.
        </p>
        <p>
          Todo o CRUD e a criação do projeto segue a estrutura em MVC. O Login é gerido pelo passport do laravel e feito c/ OAuth 2.
          <strong>PS</strong>: A conexão está sendo feita toda localmente.
        </p>
			</div>
		</div>
	</div>
@endsection
