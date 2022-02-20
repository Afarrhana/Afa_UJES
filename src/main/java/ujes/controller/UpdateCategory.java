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

import ujes.dao.CategoryDAO;
import ujes.model.Category;

@MultipartConfig
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
		//*************
				System.out.println("In do post method of Add Image servlet");
				Part file=request.getPart("cPics");
				
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
		
		Category d = new Category();
		d.setcID(Integer.parseInt(request.getParameter("cID")));
		d.setcName(request.getParameter("cName"));
		d.setcPics(imageFileName);
		System.out.println(d.getcID() + d.getcName() + d.getcPics());
		
		dao.updateCategory(d);
		request.setAttribute("category", CategoryDAO.getAllCategory());
		RequestDispatcher view = request.getRequestDispatcher("category.jsp");
		view.forward(request, response);
	}
}
