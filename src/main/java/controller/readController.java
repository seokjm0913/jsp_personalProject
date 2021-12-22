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


@WebServlet("/readController")
public class readController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		NoticeBoardDAO nbdao =  new NoticeBoardDAO();
		
		try {
			List<NoticeBoardDTO> list = nbdao.readALL();
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("NoticeBoardList.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}




}
