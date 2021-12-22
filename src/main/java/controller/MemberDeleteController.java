package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberDAO;


@WebServlet("/MemberDeleteController")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberDeleteController() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mem_id = request.getParameter("mem_id");
		MemberDAO mdao = new MemberDAO();
		try {
			mdao.deleteProcess(mem_id);
			response.sendRedirect("MemberListReadController");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
