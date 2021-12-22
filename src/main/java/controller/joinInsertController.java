package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberDAO;

@WebServlet("/joinInsertController")
public class joinInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * String mem_id = request.getParameter("mem_id"); String mem_password =
		 * request.getParameter("mem_password"); String name =
		 * request.getParameter("name"); String email = request.getParameter("email");
		 * System.out.println("===============" + mem_id);
		 * System.out.println("===============" + mem_password);
		 * System.out.println("===============" + name);
		 * System.out.println("===============" + email); MemberDAO mdao = new
		 * MemberDAO(); try { mdao.insertProcess(mem_id, mem_password, name, email);
		 * response.sendRedirect("/humanwell/mainHome.jsp"); } catch
		 * (ClassNotFoundException e) { e.printStackTrace(); } catch (SQLException e) {
		 * e.printStackTrace(); }
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("mem_id");
		String mem_password = request.getParameter("mem_password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println("===============" + mem_id);
		System.out.println("===============" + mem_password);
		System.out.println("===============" + name);
		System.out.println("===============" + email);

		MemberDAO mdao = new MemberDAO();
		try {
			mdao.insertProcess(mem_id, mem_password, name, email);
			response.sendRedirect("/humanwell/mainHome.jsp");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
