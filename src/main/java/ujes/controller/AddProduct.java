package oracle.controller;

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

import ujes.dao.ProductDAO;
import ujes.model.Product;

@MultipartConfig
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO dao;
    public AddProduct() {
        super();
        dao = new ProductDAO();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//*************
				System.out.println("In do post method of Add Image servlet");
				Part file=request.getPart("pPics");
				
				String imageFileName=file.getSubmittedFileName(); //get selected image file name
				System.out.println("Selected Image File Name: " + imageFileName);
				
				String uploadPath="C:/Users/user/eclipse-workspace/0000 UJES SYSTEM/src/main/webapp/images/"+imageFileName; //upload path where we have to upload our actual image
				System.out.println("Upload Path: " + uploadPath);
				
				//uploading our selected image into images folder
				
				try {
					FileOutputStream fos=new FileOutputStream(uploadPath);
					InputStream is=file.getInputStream();
					
					byte[] data= new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				//*************
		
		Product p = new Product();
		p.setcID(Integer.parseInt(request.getParameter("cID")));
		p.setpName(request.getParameter("pName"));
		p.setpDesc(request.getParameter("pDesc"));
		p.setpPrice(Double.parseDouble(request.getParameter("pPrice")));
		p.setpQty(Integer.parseInt(request.getParameter("pQty")));
		p.setpPics(imageFileName);
		
		dao.addProduct(p);
		dao.addBridgeProduct(p);
		
		request.setAttribute("product", ProductDAO.getAllProduct());
		RequestDispatcher view = request.getRequestDispatcher("product.jsp");
		view.forward(request, response);
	}

}
