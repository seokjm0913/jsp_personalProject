package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeBoardDAO;


@WebServlet("/updateController")
public class updateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* System.out.println("updateController  성공"); */
		String num = request.getParameter("num");
		String username = request.getParameter("username");
		String title = request.getParameter("title");
		String memo = request.getParameter("memo");
		
		/*
		 * System.out.println("num===============================" +num);
		 * System.out.println("usernmae====================" + username);
		 * System.out.println("title===============================" +title);
		 * System.out.println("content===============================" +memo);
		 */
		
		
		NoticeBoardDAO nbdao = new NoticeBoardDAO();
		try {
			nbdao.updateProcess(title, memo, num);
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
