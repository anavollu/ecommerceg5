<!DOCTYPE html>
<html>
	<head>
            <title>Página de Acesso</title>
            <meta charset="utf-8">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/acesso.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        </head>

	<body>
		<header>
			<a href="home.html"><img class="icon-logo" src="https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/home-512.png"></a>
			<a class="trinca" href=""><img class="icon-carrinho" src="https://cdn0.iconfinder.com/data/icons/typicons-2/24/shopping-cart-512.png"></a>
			<a class="trinca text-nav" href="produtos.html">Produtos</a>
			<a class="trinca text-nav" href="acesso.html">Acesso</a>
		</header>
		
		<article class="card_login">
			<h2>Já tem cadastro?</h2>
			<form action="${pageContext.request.contextPath}/Login/" method="post">
				<div class="container">
					<label for="uname"><b>Login</b></label>
				    <input type="text" placeholder="Informe seu cpf" name="cpf" required> <br>
				    <label for="psw"><b>Senha</b></label>
				    <input type="password" placeholder="Informe senha" name="password" required>
				    <br>
				    <button class="acessar-btt" type="submit">Acessar</button><br>
				    <label>
				    	<input type="checkbox" checked="checked" name="lembrar"> Lembrar de mim
				    </label>
				</div>

				<div class="container_cancel">
				    <button type="button" class="cancelbtn">Cancelar</button>
				    <span class="psw"><a href="#">Esqueci a senha.</a></span>
				</div>
			</form>
		</article>

		<div class="vl"></div>

		<article class="card_login">
			<h2>Cadastrar-se</h2>
			<form action="${pageContext.request.contextPath}/usuario?action=register" method="post">
				<div class="container">
					<label for="uname"><b>Nome</b></label>
				    <input type="text" placeholder="Escreva nome" name="uname" required> <br>
				    <label for="psw"><b>Senha</b></label>
				    <input type="password" placeholder="Escreva senha" name="psw" required>
				    <br>
				    <label for="psw"><b>E-mail</b></label>
				    <input type="email" placeholder="Escreva e-mail" name="email" required>
				    <br>
				    <label for="psw"><b>CPF</b></label>
				    <input type="text" placeholder="Escreva CPF" name="cpf" required>
				    <br>
				    <button class="criarcontabtn" type="submit">Criar conta</button><br>
				</div>
			</form>
		</article>
	</body>
        
	<footer>
		&copy; AFF - Grupo 5 
	</footer>

</html>