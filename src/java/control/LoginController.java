package control;

import dao.LoginDAO;
import dao.VerifyRecaptcha;
import dto.UserDTO;
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
public class LoginController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String ADMIN_PAGE = "MainController?action=Search&search=&index=1";
    private static final String USER_PAGE = "MainController?action=Search&search=&index=1";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {

            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
            LoginDAO dao = new LoginDAO();
            HttpSession session = request.getSession();
            session.invalidate();
            session = request.getSession();
            UserDTO loginUser = dao.checkLogin(userID, password);

            int count = Integer.parseInt(request.getParameter("count"));
            if (loginUser == null) {
                count++;
                request.setAttribute("COUNT", count);
                request.setAttribute("ERROR_MESSAGE", "Incorrect userID or password!");
            } else {
                if (verify || count < 3) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    String roleID = loginUser.getRoleID();
                    String status = loginUser.getStatus();
                    if (("AD").equals(roleID) && ("Approve").equals(status)) {
                        url = ADMIN_PAGE;
                    } else if (("US").equals(roleID) && ("Approve").equals(status)) {
                        url = USER_PAGE;
                    } else if (!("Approve").equals(status)) {
                        request.setAttribute("ERROR_MESSAGE", "Account is not acctive yet");
                    } else {
                        request.setAttribute("ERROR_MESSAGE", "Your role is not support!");
                    }
                } else {
                    count++;
                    request.setAttribute("COUNT", count);
                    request.setAttribute("ERROR_MESSAGE", "reCAPTCHA Invavlid");
                }
            }
        } catch (Exception e) {
            log("Error at LoginController" + e.toString());
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
