package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.websocket.Session;

import service.MemberDAO;


@WebServlet("/loginCheckController")
public class LoginCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginCheckController() {

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String mem_id = request.getParameter("mem_id");
		String mem_password = request.getParameter("mem_password");
		
		MemberDAO mdao = new MemberDAO();
		
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		int result;
		try {
			result = mdao.userCheck(mem_id, mem_password);
			
			RequestDispatcher rd = request.getRequestDispatcher("/mainHome.jsp");
			if(result == -1) {
				out.println("<script>alert('아이디가 일치하지 않습니다.')</script>");
				out.println("<script>window.location.href='/humanwell/loginJoinForm.jsp';</script>");
		        
		            
			}else if(result == 1) {
				System.out.println("정상 로그인");
				session.setAttribute("mem_id", mem_id);
				
				rd.forward(request, response);
			}else if(result == 0) {
//				System.out.println("비밀번호가 틀렸습니다.");
				out.println("<script>alert('비밀번호가 일치하지 않습니다.')</script>");
				out.println("<script>window.location.href='/humanwell/loginJoinForm.jsp';</script>");
//	            response.sendRedirect("/humanwell/loginJoinForm.jsp");
			}
			
	   
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	

	
	
	

	} 
}