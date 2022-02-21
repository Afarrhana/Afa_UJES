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

@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO dao;
    public AddProduct() {
        super();
        dao = new ProductDAO();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Product p = new Product();
		p.setcID(Integer.parseInt(request.getParameter("cID")));
		p.setpName(request.getParameter("pName"));
		p.setpDesc(request.getParameter("pDesc"));
		p.setpPrice(Double.parseDouble(request.getParameter("pPrice")));
		p.setpQty(Integer.parseInt(request.getParameter("pQty")));
		p.setpPics(request.getParameter("pPics"));
		
		dao.addProduct(p);
		//dao.addBridgeProduct(p);
		
		request.setAttribute("product", ProductDAO.getAllProduct());
		RequestDispatcher view = request.getRequestDispatcher("product.jsp");
		view.forward(request, response);
	}

}
