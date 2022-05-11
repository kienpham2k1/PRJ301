package control;

import dto.UserDTO;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import untils.GoogleUtils;

public class LoginGoogleServlet extends HttpServlet {

    private static final String USER_PAGE = "MainController?action=Search&search=&index=1";
    private static final long serialVersionUID = 1L;

    public LoginGoogleServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            boolean conn = GoogleUtils.getConnectionGoogle(code);
            if (conn) {
                UserDTO loginUser = new UserDTO("Google Account", "Google Account", null, "US", null, null, 0, null, "Approve");
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                RequestDispatcher dis = request.getRequestDispatcher(USER_PAGE);
                dis.forward(request, response);
            }

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
