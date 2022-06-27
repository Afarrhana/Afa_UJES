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

import ujes.dao.ProductDAO;
import ujes.model.Product;

@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO dao;
    public UpdateProduct() {
        super();
        dao = new ProductDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("pID"));
    	request.setAttribute("p", ProductDAO.getProductById(id));
		RequestDispatcher view = request.getRequestDispatcher("product-form.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product p = new Product();
		p.setpID(Integer.parseInt(request.getParameter("pID")));
		p.setpName(request.getParameter("pName"));
		p.setpDesc(request.getParameter("pDesc"));
		p.setpPrice(Double.parseDouble(request.getParameter("pPrice")));
		p.setpQty(Integer.parseInt(request.getParameter("pQty")));
		p.setpPics(request.getParameter("pPics"));
		p.setcID(Integer.parseInt(request.getParameter("cID")));
		p.setsID(Integer.parseInt(request.getParameter("sID")));

		dao.updateProduct(p);
		
		request.setAttribute("product", ProductDAO.getAllProduct());
		RequestDispatcher view = request.getRequestDispatcher("product.jsp");
		view.forward(request, response);
	}
}
