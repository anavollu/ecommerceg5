package controller;

import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import model.Product;


public class Pagina extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        ProductDao productDao = new ProductDao();
        int pagina = Integer.parseInt(request.getParameter("pagina"));
        List<Product> listProducts = productDao.getAll(5, (pagina - 1));
        request.setAttribute("lista", listProducts);
        
        HttpSession sessao = request.getSession();
        final int size = productDao.getSize();
        request.setAttribute("pagina", request.getParameter("pagina"));
        request.setAttribute("tamanhoTotal", size);
        request.setAttribute("qtdeDePaginas", (size % 5 != 0? size / 5 + 1 : size/5));
        
        RequestDispatcher despachante = getServletContext().getRequestDispatcher("/index2.jsp");
        despachante.forward(request, response);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println(produtos.get(0).getDescription());
        }
    }
    protected String displayProducts (){
        
        return "";
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
