package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberDAO;


@WebServlet("/IdCheckController")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mem_id = request.getParameter("mem_id");
		
		MemberDAO mdao = new MemberDAO();
		
		int result;
		try {
			result = mdao.idChecker(mem_id);
			response.getWriter().print(result);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
