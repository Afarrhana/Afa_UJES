package oracle.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ujes.dao.CategoryDAO;

/**
 * Servlet implementation class DeleteCategory
 */
@WebServlet("/DeleteCategory")
public class DeleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO dao;
    
    public DeleteCategory() {
        super();
        dao = new CategoryDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cID = Integer.parseInt(request.getParameter("cID"));
		dao.deleteCategory(cID);

        request.setAttribute("category", CategoryDAO.getAllCategory());
		RequestDispatcher view = request.getRequestDispatcher("category.jsp");
		view.forward(request, response);
	}
}
