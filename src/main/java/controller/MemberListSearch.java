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

import model.MemberDTO;
import service.MemberDAO;


@WebServlet("/MemberListSearch")
public class MemberListSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberListSearch() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String col = request.getParameter("col");
        String word = request.getParameter("word");
        
        MemberDAO mdao = new MemberDAO();
        try {
			List<MemberDTO> list = mdao.search(col, word);
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("/memberList.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
