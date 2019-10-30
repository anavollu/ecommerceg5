<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.3.1.slim.min.js"></script>
	-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        ${product.id}
        ${product.name}
        ${product.description}
        ${product.price}
        ${product.imageUrl}
<!-- Início do menu -->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Brand</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Acesso</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Carrinho</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
<!-- Fim do menu -->

<!-- Produto -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <img src="${product.imageUrl}" alt="produto1">
                </div>
                <div class="col-md-5">
                    <h5>${product.name}</h5>
                    <p>${product.description}</p>
                    <p><span class="glyphicon glyphicon-star"></span></p>
                </div>
                <div class="col-md-3" class="align-items-center">
                    <h5>R$ ${product.price}</h5>
                    <button type="button" class="btn btn-primary">Comprar</button>
                    <button type="button" class="btn btn-danger">
                        <span class="glyphicon glyphicon-heart"></span> Amei
                    </button>
                </div>
            </div>
        </div>

<!-- Comentários -->
        <div class="container"> 
            <h3>Comentários</h3>
            <div class="list-group">
                <div class="list-group-item">
                    <h4 class="list-group-item-heading">Comentário 1</h4>
                    <p class="list-group-item-text">Comentário feito pelo usuário</p>
                </div>
                <div class="list-group-item">
                    <h4 class="list-group-item-heading">Comentário 2</h4>
                    <p class="list-group-item-text">Comentário feito pelo usuário</p>
                </div>
                <div class="list-group-item">
                    <h4 class="list-group-item-heading">Comentário 3</h4>
                    <p class="list-group-item-text">Comentário feito pelo usuário</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
