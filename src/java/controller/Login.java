/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author JSRJ
 */

//
//    <servlet>
//        <servlet-name>Login</servlet-name>
//        <servlet-class>controller.Login</servlet-class>
//    </servlet>
//    <servlet-mapping>
//        <servlet-name>Login</servlet-name>
//        <url-pattern>/Login</url-pattern>
//    </servlet-mapping>


@WebServlet(name = "Login", urlPatterns = {"/Login/"})
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        HttpSession sessao = request.getSession();
        String cpf = request.getParameter("cpf");
        String pass = request.getParameter("password");
        
        UserDao uDao = new UserDao();
        User user = uDao.getByUserCpf(cpf);
        user.setRole(user.getRole());
        out.println(" - Usuario na sessão: "+user);
        out.println(" - cheguei aqui 1");
        if (user != null){
            if (user.getPassword().equals(pass)){
                sessao.setAttribute("usuario_logado", "1");
                sessao.setAttribute("username", user.getUsername());
                sessao.setAttribute("userRole", user);
                sessao.setAttribute("message", "Bem vindo, " + user.getUsername() + " !");
                response.sendRedirect(getServletContext().getInitParameter("contextProject"));
            }else{
                request.setAttribute("message", "erro, falha ao logar!");
                sessao.setAttribute("usuario_logado", "0");
                response.sendRedirect(getServletContext().getInitParameter("contextProject"));
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
