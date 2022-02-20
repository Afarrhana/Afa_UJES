package oracle.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ujes.dao.ProductDAO;

/**
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO dao;
    public DeleteProduct() {
        super();
        dao = new ProductDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pID = Integer.parseInt(request.getParameter("pID"));
		dao.deleteProduct(pID);

        request.setAttribute("product", ProductDAO.getAllProduct());
		RequestDispatcher view = request.getRequestDispatcher("product.jsp");
		view.forward(request, response);
	}
}
