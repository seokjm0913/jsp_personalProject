package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NoticeBoardDTO;
import service.NoticeBoardDAO;


@WebServlet("/updateReadController")
public class updateReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* System.out.println("updateReadController 성공"); */
		
		String num = request.getParameter("num");		
		/* System.out.println("=========1=======" + num); */
		
		NoticeBoardDAO nbdao = new NoticeBoardDAO();
		try {
			List<NoticeBoardDTO> list = nbdao.readOne(num);
			
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher("/updateForm.jsp");
			rd.forward(request, response);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		/* System.out.println("updateRead 성공"); */
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
