package ujes.controller;

import java.io.IOException; 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException ;
import javax.servlet.annotation.WebServlet ;
import javax.servlet.http.HttpServlet ;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest ;
import ujes.dao.ReviewDAO;

@WebServlet("/viewReviewController")
public class viewReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewDAO dao;

	public viewReviewController () {
		super();
		dao = new ReviewDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("review", ReviewDAO.getAllReview());
		RequestDispatcher view = request.getRequestDispatcher("viewReview.jsp");
		view.forward(request, response);

	}

}