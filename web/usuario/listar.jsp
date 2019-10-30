
<%@page import="dao.UserDao"%>
<%@page import="model.User"%>


<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
    <head>
         
         
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=0.55">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

        <script src="${pageContext.request.contextPath}/js/app.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/2ae5bd8790.js" crossorigin="anonymous"></script>


        <title>Listagem de usuários cadastrados</title>
        
        
    </head>
    <body class="container-fluid">
        <%
            UserDao userDao = new UserDao();
            ArrayList <User> lista = userDao.listarTodos();
            request.setAttribute("lista", lista);
            int qtd = userDao.amountOfUsers();
            request.setAttribute("qtdUsers", qtd);
        %>
        <div class="row">
            <div class="col">
                <hr>
                <table class="table table-striped table-bordered table-hover ">
                    <tr class="text-center font-weight-bold">
                        <td>ID</td>
                        <td>CPF</td>
                        <td>USUARIO</td>
                        <td>EMAIL</td>
                        <td>NOME</td>
                        <td>EDITAR</td>
                        <td>EXCLUIR</td>

                    </tr>
                <c:forEach var="user" items="${lista}">
                <tr>
                    <td><c:out value=" ${user.id}" /></td>
                    <td><c:out value=" ${user.cpf}" /></td>
                    <td><c:out value=" ${user.username}" /> </td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.fullName}" /></td>
                    <!--<td><a href="${pageContext.request.contextPath}/produto/?action=update&id=<c:out value='${produto.id}'/>"><i class='fa fa-pencil'></i></a></td>-->
                    <td><a href="${pageContext.request.contextPath}/usuario/alterar.jsp?id=<c:out value='${user.id}'/>"><i class='fa fa-pencil'></i></a></td>
                    <td><a class="delete-user" data-toggle="modal" data-target="#myModal" href="${pageContext.request.contextPath}/usuario?action=delete&id=<c:out value='${user.id}'/>"><i class='fa fa-trash'></i></a></td>

                </tr>


                </c:forEach>
                </table>
                
                <p>Quantidade de usuários cadastrados: <b>${qtdUsers}</b></p>
                <a href="${pageContext.request.contextPath}/usuario/cadastrar.jsp" class="btn btn-primary" >Cadastrar novo usuario</a>
                
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
                                <h5 class="modal-title">EXCLUIR USUÁRIO</h5>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>O usuário será excluido. Clique em CONFIRMAR para excluir</p>
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
                $('.delete-user').on('click', function(e){
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
