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

import model.BoardInfoDTO;
import service.BoardInfoDAO;


@WebServlet("/InquiryBoardSearch")
public class InquiryBoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InquiryBoardSearch() {

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String col = request.getParameter("col");
        String word = request.getParameter("word");
        BoardInfoDAO dao = new BoardInfoDAO();
        try {
			List<BoardInfoDTO> list = dao.search(col, word);
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("/inquiryBoardList.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
