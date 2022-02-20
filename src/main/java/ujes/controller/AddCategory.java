package ujes.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ujes.dao.CategoryDAO;
import ujes.model.Category;

@MultipartConfig
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryDAO dao;
    
	 public AddCategory() {
	     super();
	     dao = new CategoryDAO();
	 }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Category d = new Category();
		d.setcName(request.getParameter("cName"));
		d.setcPics(request.getParameter("cPics"));
		System.out.println("MASUK SERVLET"+d.getcName()+d.getcPics());
		dao.addCategory(d);
		
		request.setAttribute("category", CategoryDAO.getAllCategory());
		RequestDispatcher view = request.getRequestDispatcher("category.jsp");
		view.forward(request, response);
	}
}
