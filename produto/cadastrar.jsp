<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
       <%@ include file="/include.jsp" %>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <title>Create Product</title>
    </head>
    <body>
        <div class="container">
            <c:if test="${error != null}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>                
            </c:if>

            <div class="row justify-content-center mt-3">
                <div class="col col-5">
                    <form action="${pageContext.request.contextPath}/produto/?action=register" method="POST">
                        <div class="form-group">
                            <label for="name-input">Nome do produto</label>
                            <input required type="text" class="form-control" name="name" id="product-name-input" placeholder="Nome do produto">
                        </div>
                        <div class="form-group">
                            <label for="description-input">Descrição do produto</label>
                            <input required type="text" class="form-control" name="description" id="product-description-input" placeholder="Informações detalhadas sobre o produto">
                        </div>
                        <div class="form-group">
                            <label for="price-input">Preço</label>
                            <input required type="number" min="1" step="0.01" class="form-control" name="price" id="product-price-input" placeholder="19,99">
                        </div>
                        <div class="form-group">
                            <label for="imageUrl-input">Imagem do produto</label>
                            <input  type="text" class="form-control" name="imageUrl" id="product-imageUrl-input" placeholder="http://enderecoDaImagem.com">
                        </div>
                        <center>
                            <button type="submit" class="btn btn-primary">Cadastrar produto</button>
                        </center>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>