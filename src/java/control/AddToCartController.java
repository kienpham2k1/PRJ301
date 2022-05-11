package control;

import dao.CheckQuantityProductDAO;
import dto.CartDTO;
import dto.ProductDTO;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
public class AddToCartController extends HttpServlet {

    private static final String SUCCESS = "MainController?action=Search&search=";
    private static final String ERROR = "MainController?action=Search&search=&index=1";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            int index = Integer.parseInt(request.getParameter("index"));
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int catagoryID = Integer.parseInt(request.getParameter("catagoryID"));
            String strImportDate = request.getParameter("importDate");
            String strUsingDate = request.getParameter("usingDate");
            Date importDate = new SimpleDateFormat("yyyy-MM-dd").parse(strImportDate);
            Date usingDate = new SimpleDateFormat("yyyy-MM-dd").parse(strUsingDate);
            String status = request.getParameter("Approve");
            CheckQuantityProductDAO dao = new CheckQuantityProductDAO();
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");

            if (dao.checkQuantity(productID, quantity) && quantity > 0) {
                ProductDTO prod = new ProductDTO(productID, productName, image, price, quantity, catagoryID, importDate, usingDate, status);
                if (cart == null) {
                    cart = new CartDTO();
                }
                int t = quantity + cart.getQuantityProduct(productID);
                if (dao.checkQuantity(productID, t)) {
                    cart.add(prod);
                    session.setAttribute("CART", cart);
                    url = SUCCESS + search + "&index=" + index;
                    String massage = "Successful item selection: " + productName + "!";
                    request.setAttribute("SHOPPING_MESSAGE", massage);
                } else {
                    request.setAttribute("ERROR_MESSAGE", "Quantity invalid");
                }
            } else {
                request.setAttribute("ERROR_MESSAGE", "Quantity invalid");
            }
        } catch (Exception e) {
            log("Error at AddToCartController: " + e.toString());
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
