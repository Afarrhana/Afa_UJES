package ujes.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ujes.dao.CategoryDAO;
import ujes.model.Category;

@WebServlet("/UpdateCategory")
public class UpdateCategory extends HttpServlet {
	private CategoryDAO dao;
    public UpdateCategory() {
        super();
        dao = new CategoryDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("cID"));
    	request.setAttribute("c", CategoryDAO.getCategoryById(id));
		RequestDispatcher view = request.getRequestDispatcher("category-form.jsp");
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Category d = new Category();
		d.setcID(Integer.parseInt(request.getParameter("cID")));
		d.setcName(request.getParameter("cName"));
		d.setcPics(request.getParameter("cPics"));
		System.out.println(d.getcID() + d.getcName() + d.getcPics());
		
		dao.updateCategory(d);
		request.setAttribute("category", CategoryDAO.getAllCategory());
		RequestDispatcher view = request.getRequestDispatcher("category.jsp");
		view.forward(request, response);
	}
}
