package control;

import dao.SearchProductDAO;
import dto.ProductDTO;
import dto.UserDTO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author phamt
 */
public class SearchController extends HttpServlet {

    private static final String ERROR = "./login.jsp";
    private static final String SUCCESS_USER = "./shop-grid.jsp";
    private static final String SUCCESS_ADMIN = "./edit-product.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            int index = Integer.parseInt(request.getParameter("index"));
            String srtAdminDate = "0001-1-1";
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date adminDate = formatter.parse(srtAdminDate);
            Date userDate = new Date();
            SearchProductDAO dao = new SearchProductDAO();
            int count = 0;
            List<ProductDTO> listProductDTO = new ArrayList();
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (("AD").equals(loginUser.getRoleID())) {
                url = SUCCESS_ADMIN;
                listProductDTO = dao.getListProduct(search, adminDate, Integer.MIN_VALUE, "", index);
                count = dao.getCountPage(search, Integer.MIN_VALUE, adminDate, "");
            } else {
                url = SUCCESS_USER;
                listProductDTO = dao.getListProduct(search, userDate, 0, "Approve", index);
                count = dao.getCountPage(search, 0, userDate, "Approve");
            }
            int size = 6;
            int endPage = count / size;
            if (count % size != 0) {
                endPage++;
            }

            request.setAttribute("index", index);
            request.setAttribute("search", search);
            request.setAttribute("COUNT", count);
            request.setAttribute("endPage", endPage);
            request.setAttribute("LIST_PRODUCT", listProductDTO);
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
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
