/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dao.CartDao;
import dao.UserDao;
import model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Celestino
 */
@WebServlet(name = "UserController", urlPatterns = {"/usuario"})
public class UserController extends HttpServlet {
    private int userId = 0;

    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        req.getRequestDispatcher("create-user.jsp").forward(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    private User createUser(HttpServletRequest req) {
        User user = new User();
        user.setCpf(req.getParameter("cpf"));
        user.setEmail(req.getParameter("email"));
        user.setFullName(req.getParameter("fullName"));
        user.setUsername(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));
        user.setRole("user");
        return user;
    }
    
    protected void createUserHandler(User user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        if (user == null){
            req.setAttribute("error", "Usuário não cadastrado");
            req.getRequestDispatcher("create-user.jsp").forward(req, res);
        } else {
            UserDao userDao = new UserDao();
            User userid = userDao.save(user);
            
            CartDao cartDao = new CartDao();
            cartDao.createCart(userid.getId());
            
            res.sendRedirect(req.getContextPath() + "/");
        }
    }

    private void deleteUser(int user_id, HttpServletRequest req ,HttpServletResponse res) 
            
            throws ServletException, IOException {
           
        UserDao userDao = new UserDao();
        
        userDao.deleteByUserId(user_id);
        res.sendRedirect(getServletContext().getInitParameter("contextProject") + "usuario/listar.jsp");
        
        
    }
    
    private void updateUser(int user_id, HttpServletRequest req, HttpServletResponse res) throws IOException{
        
    }
    
    
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        String action = req.getParameter("action");
        
        PrintWriter out = res.getWriter();
        switch(action){
            case "register":
                createUserHandler(createUser(req), req, res);
                break;
                
            case "delete":
                userId = Integer.parseInt(req.getParameter("id")) ;
                deleteUser(userId, req, res);
                break;
                
            case "update":
                
                break;
                
            default:
                out.println("Entrou no default");
                
    
        }
        
       /* User user = createUser(req);
        UserDao userDao = new UserDao();
        User userSaved =  userDao.save(user);
        createUserHandler(userSaved, req, res);*/
    }

    
    
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
