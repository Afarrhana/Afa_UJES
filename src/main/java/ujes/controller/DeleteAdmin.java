package ujes.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ujes.dao.AdminDAO;

@WebServlet("/DeleteAdmin")
public class DeleteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private AdminDAO dao;
    public DeleteAdmin() {
        super();
        dao = new AdminDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int aID = Integer.parseInt(request.getParameter("aID"));
		dao.deleteAdmin(aID);

        request.setAttribute("admin", AdminDAO.getAllAdmin());
		RequestDispatcher view = request.getRequestDispatcher("adminList.jsp");
		view.forward(request, response);
	}
}
