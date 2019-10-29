
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html >
    <head>
        <%@ include file="../include.jsp" %>
        
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=0.55">

        <title>Listagem de produtos</title>
        
        
    </head>
    <body class="container-fluid" >
        <%
            ProductDao produtoDao = new ProductDao();
            ArrayList <Product> lista = produtoDao.listarTodos();
            request.setAttribute("lista", lista);
            int qtd = produtoDao.amountOfProducts();
            request.setAttribute("qtdProducts", qtd);
        %>
        <div class="row">
            <div class="col">
                <hr>
                <table class="table table-striped table-bordered table-hover  table-dark">
                    <thead>
                        <tr class="text-center font-weight-bold">
                            <td scope="col">#</td>
                            <td scope="col">CÓDIGO</td>
                            <td scope="col">PRODUTO</td>
                            <td scope="col">DESCRICAO</td>
                            <td scope="col">PREÇO</td>
                            <td scope="col">ALTERAR</td>
                            <td scope="col">EXCLUIR</td>

                        </tr>
                    </thead>   
                    <tbody>
                        <c:forEach var="produto" items="${lista}" varStatus="numberItem">
                    
                        <tr>
                            <th scope="row">${numberItem.count}</th>
                            <td><c:out value=" ${produto.id}" /></td>
                            <td><c:out value=" ${produto.name}" /></td>
                            <td><c:out value=" ${produto.description}" /> </td>
                            <td><c:out value="R$${produto.price}" /></td>
                            <!--<td><a href="${pageContext.request.contextPath}/produto/?action=update&id=<c:out value='${produto.id}'/>"><i class='fa fa-pencil'></i></a></td>-->
                            <td><a href="${pageContext.request.contextPath}/produto/alterar.jsp?id=<c:out value='${produto.id}'/>"><i class='fa fa-pencil'></i></a></td>
                            <td><a class="delete-product" data-toggle="modal" data-target="#myModal" href="${pageContext.request.contextPath}/produto/?action=delete&id=<c:out value='${produto.id}'/>"><i class='fa fa-trash'></i></a></td>

                        </tr>
                    


                </c:forEach>
                    </tbody>
                </table>
                
                <p>Quantidade de produtos cadastrados: <b>${qtdProducts}</b></p>
                <a href="${pageContext.request.contextPath}/produto/cadastrar.jsp" class="btn btn-primary" >Cadastrar novo produto</a>
                
                <!-- Modal -->
                
                <!-- The Modal -->
                   
                
                
            </div>      
        </div>  
                
        <div class="row">
            <div class="bs-example">
                <div id="myModal" class="modal fade" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">EXCLUIR PRODUTO</h5>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>O produto será excluido. Clique em CONFIRMAR para excluir</p>
                                <!--<p class="text-secondary"><small>If you don't save, your changes will be lost.</small></p>-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="delete" class="btn btn-danger">CONFIRMAR</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
            
            <script>
                $('.delete-product').on('click', function(e){
                    let location = ($(this).attr('href'));
                    e.preventDefault();
                    $('#myModal').modal({
                        backdrop: 'static',
                        keyboard: false
                    })
                    .on('click', '#delete', function(e) {
                       window.location.href = location;
                      });
                });
                
            </script>
    </body>
</html>
