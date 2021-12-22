package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeBoardDAO;


@WebServlet("/InsertController")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertController() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		String username = request.getParameter("username");
		String title = request.getParameter("title");
		String memo = request.getParameter("memo");
		System.out.println("===============" + username);
		System.out.println("===============" + title);
		System.out.println("===============" + memo);
		
		NoticeBoardDAO nbdao = new NoticeBoardDAO();
		try {
			nbdao.insertProcess(username, title, memo);
			response.sendRedirect("/humanwell/noticeBoardInfoRead");
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
