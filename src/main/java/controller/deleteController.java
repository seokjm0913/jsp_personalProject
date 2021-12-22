package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeBoardDAO;


@WebServlet("/deleteController")
public class deleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("deleteController 호출");
		
		String num = request.getParameter("num");
		System.out.println("============" + num);
		
		NoticeBoardDAO nbdao = new NoticeBoardDAO();
		try {
			nbdao.deleteProcess(num);
			response.sendRedirect("/humanwell/admin_index.jsp");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
