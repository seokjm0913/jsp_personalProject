package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardInfoDAO;


@WebServlet("/BoardInfoInsertController")
public class BoardInfoInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	
		
		
		String detailedConsultationFields = request.getParameter("detailedConsultationFields");
		String buyer_country = request.getParameter("buyer_country");
		String buyer_name = request.getParameter("buyer_name");
		String cmpName = request.getParameter("cmpName");
		String cmpName_website = request.getParameter("cmpName_website");
		String contact_email = request.getParameter("contact_email");
		String content = request.getParameter("content");
		
	
		System.out.println("===============" + detailedConsultationFields);
		System.out.println("===============" + buyer_country);
		System.out.println("===============" + buyer_name);
		System.out.println("===============" + cmpName);
		System.out.println("===============" + cmpName_website);
		System.out.println("===============" + contact_email);
		System.out.println("===============" + content);
		
		BoardInfoDAO dao = new BoardInfoDAO();
		try {
			dao.insertProcess(detailedConsultationFields, buyer_country, buyer_name, cmpName, cmpName_website, contact_email, content);
			response.sendRedirect("/humanwell/mainHome.jsp");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
