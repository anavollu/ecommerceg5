<%@page import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="javax.servlet.http.*"%>

<!DOCTYPE html>
<html>
<head>
    <%@include  file="/include.jsp" %>
    
    
	<title>Home - Seja Bem vindo</title>
        
        <style>
            .carousel-inner img{
                height: 50%;
            }
            .grid-container {
                display: grid;
                grid-template-columns:  auto auto 2000px;
                padding: 10px;
            }
            
            .grid-item {
                background-color: rgba(255, 255, 255, 0.8);
                border: 1px solid rgba(0, 0, 0, 0.8);
                padding: 20px;
                font-size: 30px;
                text-align: center;
                
            }
            .grid-item img{
               
            }
        </style>
	
        <style>
            
.navbar-new-top{
    background: #0433FF;
    
};
.navbar-brand{
    font-weight: 600;
}
.navbar-brand img{
    width: 22%;
}
.navbar-new-top ul{
    margin-right: 9%;
}
.navbar-new-top ul li{
    margin-right: 8%;
}
.navbar-nav .nav-item a {
    color: white;
    font-size: 14px;
    font-weight: 600;
    transition: 1s ease;
}
.navbar-nav .nav-item a:hover{
    color: silver;
}
.navbar-new-bottom{
    background-color: #fff;
    box-shadow: 0 5px 6px -2px rgba(0,0,0,.3);
    border-top: 1px solid #e0e0e0;
    margin-top: 4%;
    height: 40px;
}
.navbar-new-bottom ul li{
    margin-left: 2%;
    margin-right: 2%;
    color: black
}
.navbar-new-bottom .nav-item a {
    color: #000;
    font-size: 14px;
    font-weight: 600;
    transition: .2 ease;
}
.btn-add-to-cart{
    background-color: #3DADF2;
    color: white !important;
    
}
</style>
        
    <style>
    .grid { 
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        grid-gap: 20px;
        align-items: stretch;
      }
    .grid > article {
        border: 1px solid #ccc;
        transition: .5s ease
    }
    .grid > article:hover{
        box-shadow: 0 0 20px #888;
    }
    .grid > article img {
        max-width: 100%;
    }
    .text {
        padding: 0 20px 40px;
    }
    
      
    .label-cart{
      font-size: 14px;
      background: #ff0000;
      color: #fff;
      padding: 3px 7px 3px 7px;
      vertical-align: top;
    }
    article{
        display: table;
        text-align: center;
    }  
      
    article.btn-add-to-cart{
        display: table-cell; 
        vertical-align: bottom
    }

</style>
	
</head>

<body class="container">
    
    <%
        HttpSession sessao = request.getSession();
        if(!(sessao.isNew() || (sessao.getAttribute("usuario_logado") == null) || sessao.getAttribute("usuario_logado") == "" )){
            User user = (User) sessao.getAttribute("userRole");
            
        }
        
        
        //sessao.invalidate();
        //out.println(sessao.getAttribute("usuario_logado"));
        //sessao.setAttribute("Usuario_logado", "1");
        //sessao.removeAttribute("Usuario_logado");
       // if (sessao.getAttribute("usuario_logado").equals("1")) {
          //  out.println("<script>alert('"+ sessao.getAttribute("message")+"')</script>");
       // }else{
        //    out.println("<script>alert('Usuario não logado')</script>");
       // }
        
    %>         
    <nav class="container navbar fixed-top navbar-expand-md flex-nowrap navbar-new-top">
        <a href="${pageContext.request.contextPath}" class="navbar-brand" title="Seu ecommerce"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""/></a>
        <ul class="nav navbar-nav mr-auto"></ul>
        <ul class="navbar-nav flex-row">

                <%
                    
                    if ((sessao.isNew() || (sessao.getAttribute("usuario_logado") == null) || sessao.getAttribute("usuario_logado") == "" )){
                %>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/acesso.jsp" class="nav-link px-2" title="Acesse sua conta"><i class="far fa-2x fa-user-circle"></i></a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/create-user.jsp" class="nav-link px-2" title="Cadastre-se"><i class=" fas fa-2x fa-user-plus"></i></a>
                    </li>
                <% }else{ %>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/account/profile.jsp" class="nav-link px-2" title="Olá, ${sessionScope.username}"><i class="far fa-2x fa-user-circle"></i></a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/logout/" class="nav-link px-2" title="Sair"><i class="fas fa-2x fa-sign-out-alt"></i></a>
                    </li>
                <%}%>
            <li class="nav-item">
                <a class="nav-link px-2"></a>
            </li>
            <li class="nav-item">
                <a class="nav-link px-2"></a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/carrinho/" class="btn btn-cart"> <i class="fas fa-2x fa-shopping-cart" aria-hidden="true"><span class="label-cart">${991}</span></i></a>
            </li>
        </ul>
        <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbar2">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
<br /><br /> <br /> 
    <nav class="navbar navbar-expand-md navbar-new-bottom">
            <div class="navbar-collapse collapse pt-2 pt-md-0" id="navbar2">

                <ul class="navbar-nav w-100 justify-content-center px-3">
                    <li class="nav-item active">
                        <a href="${pageContext.request.contextPath}" class="nav-link">Home <i class="fas fa-2x fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Baixe o APP <i class="fas fa-2x fa-mobile-alt"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">OfertasWOW <i class="far fa-2x fa-surprise"></i>  </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Peça seu cartão <i class="far fa-2x fa-credit-card"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Contato <i class="fas fa-2x fa-phone-square-alt"></i></a>
                    </li>
                    
                </ul>
            </div>
        </nav>
        
		
<br /> <br /><br /><br /> <br /><br />
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                      <div class="item active">
                        <img src="${pageContext.request.contextPath}/img/produto/banner/xiaomi.jpg" alt="...">
                        <div class="carousel-caption">
                          Notebook 1
                        </div>
                      </div>
                      <div class="item">
                        <img src="${pageContext.request.contextPath}/img/produto/banner/hp_omen_15.jpg" alt="...">
                        <div class="carousel-caption">
                          Notebook 2
                        </div>
                      </div>
                      <div class="item">
                        <img src="${pageContext.request.contextPath}/img/produto/banner/notebook-2am-positivo.jpg" alt="...">
                        <div class="carousel-caption">
                          Notebook 2
                        </div>
                      </div>
                      
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
                        
                        <hr>
                     <%
                        int pg ;
                        int qtdItemPerPage = 5; // define a quantidade de produtos por pagina
                        if (request.getParameter("pg") == "" || request.getParameter("pg") == null) {
                            pg = 1;
                        }else{
                            pg = Integer.parseInt(request.getParameter("pg"));
                        }
                        ProductDao produtoDao = new ProductDao();
                        //ArrayList <Product> listProducts = produtoDao.listarTodos();
                        ArrayList <Product> listProducts = produtoDao.listarPaginacao(pg, qtdItemPerPage);
                        request.setAttribute("lista", listProducts);
                        int qtd = produtoDao.amountOfProducts();
                        pageContext.setAttribute("qtdProducts", qtd);
                    %>
               
                            <section class="grid">
                                <c:forEach var="produto" items="${lista}" varStatus="numberItem" >
                                    <article>
                                        
                                            <img src="${initParam.imageFolder}produto${numberItem.count}.jpg" alt="S${produto.name}">
                                            <div class="text">
                                            <h3 class="card-title">${produto.name}</h3>
                                            <h4>${produto.description}</h4>
                                            <h4 class="product-price"><b>R$${produto.price}</b></h4>    

                                            <a href="${pageContext.request.contextPath}/carrinho/meucarrinho.jsp?p=${produto.id}" class="btn btn-add-to-cart">COMPRAR</a>
                                      </div>
                                        
                                    </article>
                                </c:forEach>
                            </section>
                    
                    <style>
                        .paginacao{
                            text-align: center;
                            text-align:center; 
                            max-width: 100%;
                            
                        }
                        .paginacao div{
                            margin:  auto;
                        }
                        .paginacao .btn{
                            width: 50px;
                            margin-right: 10px
                        }
                        
                        
                    </style>
                    <hr>
                    <div class="paginacao">
                        <div >
                            <%
                                // faz o calculo de quantos botões deverão ser impressos na tela.
                                // Foi necessário o artificio "(double) qtdItemPerPage" para que o arrendodamento para cima funcionasse.
                                // Se temos 6 produtos, dividido por 5 itens por pagina, resulta em 1.2, e o ath.ceil, que deveria arredondar para 2 não funcionou, pois
                                // a divisão de dois inteiros estava retornando um inteiro.
                                // Então explicitamente convertir um dos valores para double e funcionou
                                int qtdBotoesPaginacao = (int)Math.ceil((qtd / (double) qtdItemPerPage)) ; 
                                pageContext.setAttribute("qtdBotoesPaginacao", qtdBotoesPaginacao);
                                
;                            %>
                            <c:forEach var="i"  begin="1" end="${qtdBotoesPaginacao}" varStatus="pag">
                                <a href="${pageContext.request.contextPath}/?pg=${i}" class="btn btn-info">${i}</a>
                            
                            </c:forEach>
                        </div>
                    </div>        
                    <hr>


</body>
</html>