/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.CheckQuantityProductDAO;
import dao.CreateOrderDAO;
import dto.CartDTO;
import dto.ProductDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author phamt
 */
public class CreateOrderController extends HttpServlet {

    private static final String SUCCESS = "checkout.jsp";
    private static final String ERROR = "checkout.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession(true);
            CartDTO cart = (CartDTO) session.getAttribute("CHECKOUT");
            String userID = request.getParameter("userID");
            double total = Double.parseDouble(request.getParameter("total"));
            boolean check = false;
            CreateOrderDAO dao = new CreateOrderDAO();
            CheckQuantityProductDAO qa = new CheckQuantityProductDAO();
            for (ProductDTO prod : cart.getList()) {
                check = qa.checkQuantity(prod.getProductID(), prod.getQuantity());
                if (!check) {
                    int stock = qa.getStockQuantity(prod.getProductID());
                    request.setAttribute("MESSAGE_ERROR", "Quantity is not enough");
                    ProductDTO iti = new ProductDTO(prod.getProductID(), prod.getProductName(), prod.getImage(), prod.getPrice(), stock, prod.getCatagoryID(), prod.getImportDate(), prod.getUsingDate(), prod.getStatus());
                    cart.update(prod.getProductID(), iti);
                    request.setAttribute("CHECKOUT", cart);
                }
            }
            if (check) {
                boolean checkInsert = dao.createOrder2(userID, total, cart);
                if (checkInsert) {
                    url = SUCCESS;
                    request.setAttribute("MESSAGE_SUCCESS", "ORDER SUCCESFULLY");
                    cart.getCart().clear();
                    session.setAttribute("CHECKOUT", cart);
                } else {
                    request.setAttribute("MESSAGE_ERROR", "UNKNOW ERROR");
                }
            }

        } catch (Exception e) {
            log("Error at CreateOrderController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
