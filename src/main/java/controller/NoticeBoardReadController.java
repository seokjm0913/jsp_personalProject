package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.Tool;

import model.NoticeBoardDTO;
import service.NoticeBoardDAO;


@WebServlet("/NoticeBoardReadController")
public class NoticeBoardReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String col = request.getParameter("col");
        String word = request.getParameter("word");
        NoticeBoardDAO nbdao =  new NoticeBoardDAO();
        
        try {
			List<NoticeBoardDTO> list = nbdao.searchFields(col, word);
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("/NoticeBoardList.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
