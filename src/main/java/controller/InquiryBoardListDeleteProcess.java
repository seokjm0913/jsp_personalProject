package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardInfoDAO;


@WebServlet("/InquiryBoardListDeleteProcess")
public class InquiryBoardListDeleteProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InquiryBoardListDeleteProcess() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String buyer_no = request.getParameter("buyer_no");
		BoardInfoDAO dao = new BoardInfoDAO();
		try {
			dao.deleteProcess(buyer_no);
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
