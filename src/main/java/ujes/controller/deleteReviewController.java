package ujes.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ujes.dao.ReviewDAO;

/**
 * Servlet implementation class DeleteCategory
 */
@WebServlet("/deleteReview")
public class deleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewDAO dao;

    public deleteReview() {
        super();
        dao = new reviewDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fID = Integer.parseInt(request.getParameter("fID"));
		dao.deleteReview(fID);

        request.setAttribute("review", ReviewDAO.getAllReview());
		RequestDispatcher view = request.getRequestDispatcher("deleteReview.jsp");
		view.forward(request, response);
	}
}
