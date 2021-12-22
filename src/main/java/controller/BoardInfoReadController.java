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

import model.BoardInfoDTO;
import service.BoardInfoDAO;


@WebServlet("/boardInfoReadController")
public class BoardInfoReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BoardInfoReadController() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInfoDAO dao = new BoardInfoDAO();
		
		try {
			List<BoardInfoDTO> list = dao.readAll();
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("/inquiryBoardList.jsp");
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
