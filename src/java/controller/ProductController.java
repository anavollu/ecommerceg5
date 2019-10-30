/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Celestino
 */
@WebServlet(name = "ProductController", urlPatterns = {"/produto/"})
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        req.getRequestDispatcher("create-user.jsp").forward(req, res);
    }

    private Product createProduct(HttpServletRequest req) {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        DecimalFormat fmt = new DecimalFormat("0.00");
        String string = fmt.format(price);
        String[] part = string.split("[,]");
        String string2 = part[0] + "." + part[1];
        price = Double.parseDouble(string2);
        //price = Double.parseDouble(String.format(Locale.US, "%.2f", price));

        String imgUrl = req.getParameter("imageUrl");

        Product prod = new Product(name, description, price, imgUrl);
        return prod;
    }

    private void deleteProduct(Long productId, HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        ProductDao prodDao = new ProductDao();
        prodDao.deleteByProductId(productId);
        res.sendRedirect(getServletContext().getInitParameter("contextProject") + "produto/listar.jsp");

    }

    private void updateProduct(Long prod, HttpServletRequest req, HttpServletResponse res) throws IOException {
        ProductDao prodDao = new ProductDao();
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String imageUrl = req.getParameter("imageUrl");
        String price = req.getParameter("price");
        Product product = new Product(name, description, Double.parseDouble(price), imageUrl);
        product.setId(1L);
        prodDao.update(product);
        res.sendRedirect(getServletContext().getInitParameter("contextProject") + "produto/listar.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Long productId = null;
        String action = req.getParameter("action");
        PrintWriter out = res.getWriter();
        if (req.getParameter("id") != null) {

            if ("".equals(req.getParameter("id"))) {
                res.sendRedirect(getServletContext().getInitParameter("contextProject") + "produto/listar.jsp");

            } else {
                productId = Long.parseLong(req.getParameter("id"));
            }
        }
        
        switch (action) {
            case "register":
                out.print("Entrou no case");
                Product prod = createProduct(req);
                ProductDao prodDao = new ProductDao();
                Product productSaved = prodDao.save(prod);
                createProductHandler(productSaved, req, res);
                break;

            case "delete":
                deleteProduct(productId, req, res);
                break;

            case "update":
                out.print("Alterando dados do produto - " + req.getParameter("name"));
                //productId = Integer.parseInt(req.getParameter("id")) ;

                updateProduct(productId, req, res);

                break;

            case "list":
                out.print("Exibindo produto");
                break;

            case "listAll":
                out.print("Listando todos os produtos");

                break;

            default:
                res.sendRedirect(req.getContextPath() + "/create-product.jsp");
                break;
        }

    }

    public void createProductHandler(Product prod, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if (prod == null) {
            req.setAttribute("error", "Produto não cadastrado");
            req.getRequestDispatcher("/ecommerce/produto/cadastrar.jsp").forward(req, res);
        } else {
            req.setAttribute("prod", prod);
            //req.getRequestDispatcher("product-page.jsp").forward(req, res);
            // res.sendRedirect(req.getContextPath() + "/user-page.jsp");
            res.sendRedirect(req.getContextPath() + "/produto/listar.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
