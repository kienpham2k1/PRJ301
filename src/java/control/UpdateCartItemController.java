package control;

import dao.CheckQuantityProductDAO;
import dto.CartDTO;
import dto.ProductDTO;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author phamt
 */
public class UpdateCartItemController extends HttpServlet {

    private static final String SUCCESS = "shoping-cart.jsp";
    private static final String ERROR = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            ProductDTO prd = null;
            for (ProductDTO dto : cart.getCart().values()) {
                if (dto.getProductID().equals(productID)) {
                    String productName = dto.getProductName();
                    double price = dto.getPrice();
                    int category = dto.getCatagoryID();
                    Date importDate = dto.getImportDate();
                    Date usingDate = dto.getUsingDate();
                    String image = dto.getImage();
                    String status = dto.getStatus();
                    prd = new ProductDTO(productID, productName, image, price, newQuantity, category, importDate, usingDate, status);
                    break;
                }
            }
            CheckQuantityProductDAO dao = new CheckQuantityProductDAO();
            if (newQuantity <= 0) {
                request.setAttribute("ERROR_MESSAGE", "Quantity invalid input");
            } else if (!dao.checkQuantity(productID, newQuantity)) {
                request.setAttribute("ERROR_MESSAGE", "Not enough stock in stock");
            }
            cart.update(productID, prd);
            session.setAttribute("CART", cart);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at UpdateCartController: " + e.toString());
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
