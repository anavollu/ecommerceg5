<%-- 
    Document   : meucarrinho.jsp
    Created on : 30/10/2019, 10:43:02
    Author     : Celestino
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Product"%>
<%@page import="dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meu carrinho de compra</title>
    </head>
    <body>
        <div class="container">
            
            <%
                // Fazendo a busca pelo dados do produto, com base no atributo p(id do produto) da requisição GET
                    ProductDao produtoDao = new ProductDao();
                    Product product = new Product();
                    product = produtoDao.getByProductId(Integer.parseInt(request.getParameter("p")));
                    request.setAttribute("product", product);
                %>
            <div class="products-detail">
                <h2>Dados do produto: </h2>
                <c:out value="${product.id} - ${product.name} - ${product.price} "/>

            </div>
            
        </div>
        <hr>
        <div class="address-info">
            <h2>Dado para entrega</h2>
            
        </div>
        <hr>
        <div class="payment-info">
            <h2>Meio de pagamento</h2>
        </div>
    </body>
</html>
