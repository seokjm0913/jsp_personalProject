package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.BoardInfoDTO;
import model.MemberDTO;
import model.NoticeBoardDTO;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public String insertProcess(String mem_id, String mem_password, String name, String email) throws ClassNotFoundException, SQLException {
		conn = null;
		pstmt = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);

		String sql = "insert into boardMember (mem_id, mem_password, name, email) values(?, ?, ?, ?)";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, mem_id);
		pstmt.setString(2, mem_password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);

		pstmt.executeUpdate();
		System.out.println("회원가입 성공");
		return "insert성공";
	}
	
	


	public int idChecker(String mem_id) throws ClassNotFoundException, SQLException {
		 conn = null;
		 pstmt = null;
		 rs=null;
		
		 Class.forName("com.mysql.jdbc.Driver");
		 String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		 String dbUser = "root";
		 String dbPassword = "rootroot";
		try {
			conn = DriverManager.getConnection(url, dbUser, dbPassword);
			String sql = "select * from boardMember where mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
         
			if(rs.next()) {
				return 1;
			}else if(mem_id.equals("")) {
             return 2;
			}else {
             return 0;
			}
		} catch (Exception e) {
			System.out.println("아이디가 일치하지 않습니다");
		}finally {
			rs.close();
	        pstmt.close();
	        conn.close();
		}
		
		return -1;
		
	}
	
	public int userCheck(String mem_id, String mem_password) throws ClassNotFoundException, SQLException {
		int result = -1;
		conn = null;
		pstmt = null;
		rs=null;
		
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";
//		if(mem_id.equals(rs.getString("mem_id"))
		try {
			conn = DriverManager.getConnection(url, dbUser, dbPassword);
			String sql = "select * from boardMember where mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			 if(rs.next()) {
			      if(mem_id.equals(rs.getString("mem_id"))){
			       if(mem_password.equals(rs.getString("mem_password"))) {
			          result = 1;
			           System.out.println("정상 로그인");
			           
			          }else{
			             result = 0;
			             System.out.println("비밀번호가 틀렸습니다.");
			          }  
			         }else {
			             result = -1;
			             System.out.println("아이디가 틀렸습니다..");
			         }
			      }
			
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			rs.close();
	        pstmt.close();
	        conn.close();
		}
		return result;
		
	}
	
	public List<MemberDTO> readALL() throws ClassNotFoundException, SQLException{
		List<MemberDTO> list = new ArrayList<>();
	      
        conn = null;
		pstmt = null;
		rs = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
        String sql = "select * from boardMember";
        pstmt = conn.prepareStatement(sql);
		
        rs = pstmt.executeQuery();
        while (rs.next()) {
        	MemberDTO mdto = new MemberDTO();
        	mdto.setMem_id(rs.getString("mem_id"));
        	mdto.setMem_password(rs.getString("mem_password"));
        	mdto.setName(rs.getString("name"));
        	mdto.setEmail(rs.getString("email"));
        	mdto.setReg_date(rs.getString("reg_date"));
        	list.add(mdto);
        }
		return list;
	}
	



	public void deleteProcess(String mem_id) throws ClassNotFoundException, SQLException {
		conn = null;
		pstmt = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
		String sql = "delete from boardMember where mem_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mem_id);

		pstmt.executeUpdate();
		
	}
	
	
	public List<MemberDTO> search(String col, String word) throws ClassNotFoundException, SQLException{
		List<MemberDTO> list = new ArrayList<>();
	      
        conn = null;
		pstmt = null;
		rs = null;
		StringBuffer sql = new StringBuffer();

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
		if(col.equals("mem_id")) {
			sql.append("select mem_id, mem_password, name, email, reg_date ");
			sql.append("from boardMember");
			sql.append(" where mem_id like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}else if(col.equals("name")) {
			sql.append("select mem_id, mem_password, name, email, reg_date ");
			sql.append("from boardMember");
			sql.append(" where name like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}else if(col.equals("email")) {
			sql.append("select mem_id, mem_password, name, email, reg_date ");
			sql.append("from boardMember");
			sql.append(" where email like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}
		rs = pstmt.executeQuery();
		while(rs.next()) {
			MemberDTO mdto = new MemberDTO();
        	mdto.setMem_id(rs.getString("mem_id"));
        	mdto.setMem_password(rs.getString("mem_password"));
        	mdto.setName(rs.getString("name"));
        	mdto.setEmail(rs.getString("email"));
        	mdto.setReg_date(rs.getString("reg_date"));
        	list.add(mdto);
		}
		
		
		
		return list;
		
      
	}




	
	
}
