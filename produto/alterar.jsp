<%@page import="model.Product"%>
<%@page import="dao.ProductDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<%= getServletContext().getInitParameter("contextProject") %>css/bootstrap.min.css">
        <script src="<%= getServletContext().getInitParameter("contextProject") %>js/bootstrap.min.js"></script>
        <title>Update Product</title>
    </head>
    <body>
        <div class="container">
            <c:if test="${error != null}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>                
            </c:if>
            <%
                ProductDao produtoDao = new ProductDao();
                Product prod  = produtoDao.getByProductId(Integer.parseInt(request.getParameter("id")));
                //out.println(prod.getDescription());
               request.setAttribute("produto", prod);
            
            %>
            
          
            <div class="row justify-content-center mt-3">
                <div class="col col-4">
                    <form action="${pageContext.request.contextPath}/produto/?action=update" method="post">
                        <div class="form-group">
                            <label for="product-id-input">CÓDIGO</label>
                            <input required type="text" readonly class="form-control" name="id" id="product-id-input" value="${produto.id}">
                        </div>
                        <div class="form-group">
                            <label for="product-name-input">Nome do produto</label>
                            <input required type="text" class="form-control" name="name" id="product-name-input" value="${produto.name}" placeholder="Nome do produto" >
                        </div>
                        <div class="form-group">
                            <label for="product-description-input">Descrição do produto</label>
                            <input required type="text" class="form-control" name="description" id="product-description-input" value="${produto.description}" placeholder="Informações detalhadas sobre o produto">
                        </div>
                        <div class="form-group">
                            <label for="product-price-input">Preço</label>
                            <input required type="number" min="1" step="0.01" class="form-control" name="price" id="product-price-input" value="${produto.price}" placeholder="19,99">
                        </div>
                        <div class="form-group">
                            <label for="product-imageUrl-input">Imagem do produto</label>
                            <input  type="text" class="form-control" name="imageUrl" id="product-imageUrl-input" value="${produto.imageUrl}" placeholder="http://enderecoDaImagem.com">
                        </div>
                        <center>
                            <button type="submit" class="btn btn-primary">Concluir</button>
                            <a href="${pageContext.request.contextPath}/produto/listar.jsp"  class="btn btn-link">Voltar</button>
                        </center>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
