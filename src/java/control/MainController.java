package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SEARCH_PRODUCT = "Search";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchController";
    private static final String ADD_TO_CART = "Add To Cart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String VIEW_CART = "View Cart";
    private static final String VIEW_CART_PAGE = "viewCart.jsp";
    private static final String UPDATE_PRD_CART = "Update";
    private static final String UPDATE_PRD_CART_CONTROLLER = "UpdateCartItemController";
    private static final String REMOVE_PRD_CART = "Remove";
    private static final String REMOVE_PRD_CART_CONTROLLER = "RemoveCartItemController";
    private static final String CREATE_ORDER = "CreateOrder";
    private static final String CREATE_ORDER_CONTROLLER = "CreateOrderController";

    private static final String DELETE_PRD = "Delete";
    private static final String DELETE_PRD_CONTROLLER = "DeleteProductController";
    private static final String UPDATE_PRD = "Update Product";
    private static final String UPDATE_PRD_CONTROLLER = "UpdateProductController";
    private static final String INSERT_PRD = "InsertProduct";
    private static final String INSERT_PRD_CONTROLLER = "InsertProductController";
    private static final String DETAIL_PRODUCT = "Detail Product";
    private static final String DETAIL_PRODUCT_CONTROLLER = "DetailProductController";
    private static final String CHECKOUT = "PROCEED TO CHECKOUT";
    private static final String CHECKOUT_CONTROLLER = "CheckOutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH_PRODUCT.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if (ADD_TO_CART.equals(action)) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (VIEW_CART.equals(action)) {
                url = VIEW_CART_PAGE;
            } else if (UPDATE_PRD_CART.equals(action)) {
                url = UPDATE_PRD_CART_CONTROLLER;
            } else if (REMOVE_PRD_CART.equals(action)) {
                url = REMOVE_PRD_CART_CONTROLLER;
            } else if (DELETE_PRD.equals(action)) {
                url = DELETE_PRD_CONTROLLER;
            } else if (UPDATE_PRD.equals(action)) {
                url = UPDATE_PRD_CONTROLLER;
            } else if (INSERT_PRD.equals(action)) {
                url = INSERT_PRD_CONTROLLER;
            } else if (CREATE_ORDER.equals(action)) {
                url = CREATE_ORDER_CONTROLLER;
            } else if (DETAIL_PRODUCT.equals(action)) {
                url = DETAIL_PRODUCT_CONTROLLER;
            } else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
