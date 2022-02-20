package ujes.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ujes.dao.AdminDAO;
import ujes.model.Admin;


@WebServlet("/AddAdmin")
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private AdminDAO dao;
    public AddAdmin() {
        super();
        dao = new AdminDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Admin d = new Admin();
		d.setAName(request.getParameter("aName"));
		d.setPassw(request.getParameter("aPassw"));
		dao.addAdmin(d);
		System.out.println(d.getAName() + d.getPassw());
		//request.setAttribute("admin", AdminDAO.getAllAdmin());
		RequestDispatcher view = request.getRequestDispatcher("adminList.jsp");
		view.forward(request, response);
    }

}
