package ujes.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ujes.dao.OrderProductDAO;

@WebServlet("/DeleteOrderForPayment")
public class DeleteOrderForPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private OrderProductDAO dao;
    public DeleteOrderForPayment() {
        super();
        dao = new OrderProductDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oID = Integer.parseInt(request.getParameter("oID"));
		dao.deleteOrder(oID);

        request.setAttribute("orderproduct", OrderProductDAO.getAllOrderProduct());
		RequestDispatcher view = request.getRequestDispatcher("payment.jsp");
		view.forward(request, response);
	}
}
