/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.UpdateProductDAO;
import dto.ProductDTO;
import dto.ProductErrorDTO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phamt
 */
public class UpdateProductController extends HttpServlet {

    private String prodID;
    private static final String ERROR = "MainController?action=Detail Product&productID=";
    private static final String SUCCESS = "MainController?action=Detail Product&productID=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductErrorDTO prdError = new ProductErrorDTO();
        try {

            boolean check = true;
            String productID = request.getParameter("productID");
            prodID = productID;
            String productName = request.getParameter("productName");
            if (productName.isEmpty() || productName.length() < 5 || productName.length() > 50) {
                prdError.setProductNameError("Name leght must [5; 50]");
                check = false;
            }
            double price = Double.parseDouble(request.getParameter("price"));
            if (price <= 0) {
                prdError.setPriceError("Price must > 0");
                check = false;
            }
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            if (quantity <= 0) {
                prdError.setQuantityError("Quantity must > 0");
                check = false;
            }
            int catagoryID = Integer.parseInt(request.getParameter("catagoryID"));
            String strImportDate = request.getParameter("importDate");
            String strUsingDate = request.getParameter("usingDate");
            String image = request.getParameter("image");
            if (image.isEmpty() || image.isBlank()) {
                prdError.setQuantityError("Image invalid");
                check = false;
            }
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date importDate = formatter.parse(strImportDate);
            Date usingDate = formatter.parse(strUsingDate);
            Date localDate = new Date();
            if (usingDate.before(importDate) || usingDate.before(localDate)) {
                prdError.setUsingDateError("Invalid input date, must after import date and " + localDate);
                check = false;
            }
            request.setAttribute("PRODUCT_ERROR", prdError);
            if (check) {
                UpdateProductDAO dao = new UpdateProductDAO();
                ProductDTO prd = new ProductDTO(productID, productName, image, price, quantity, catagoryID, importDate, usingDate, "");
                check = dao.updateProduct(prd);
                if (check) {
                    url = SUCCESS + productID;
                }
            } else {
                url = ERROR + productID;
            }
        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
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
