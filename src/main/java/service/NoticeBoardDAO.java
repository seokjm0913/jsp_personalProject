package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.NoticeBoardDTO;

public class NoticeBoardDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public String insertProcess(String username, String title, String memo)
			throws ClassNotFoundException, SQLException {
		conn = null;
		pstmt = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);

		String sql = "insert into noticeboard (username, title, memo) values(?,?,?)";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, username);
		pstmt.setString(2, title);
		pstmt.setString(3, memo);

		pstmt.executeUpdate();

		return "insert성공";
	}

	public List<NoticeBoardDTO> readALL() throws ClassNotFoundException, SQLException {

	      List<NoticeBoardDTO> list = new ArrayList<>();
	      
	        conn = null;
			pstmt = null;
			rs = null;

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
			String dbUser = "root";
			String dbPassword = "rootroot";

			conn = DriverManager.getConnection(url, dbUser, dbPassword);
	        String sql = "select * from noticeBoard";
	        pstmt = conn.prepareStatement(sql);
			
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	NoticeBoardDTO nbdto =  new NoticeBoardDTO();
	        	nbdto.setNum(rs.getInt("num"));
	        	nbdto.setUsername(rs.getString("username"));
	        	nbdto.setTitle(rs.getString("title"));
	        	nbdto.setMemo(rs.getString("memo"));
	        	nbdto.setReg_date(rs.getString("reg_date"));
	        	nbdto.setViewCnt(rs.getInt("viewCnt"));
	        	list.add(nbdto);
	        	
	        	
	        }
	        return list;
	         	
	}
	
	
	public void deleteProcess(String num) throws ClassNotFoundException, SQLException {
		conn = null;
		pstmt = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
		String sql = "delete from noticeBoard where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);

		pstmt.executeUpdate();
	}
	
	public List<NoticeBoardDTO> readOne(String num) throws ClassNotFoundException, SQLException{
		List<NoticeBoardDTO> list = new ArrayList<>();
		
		conn = null;
		pstmt = null;
		rs = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);

		String sql = "select * from noticeBoard where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			NoticeBoardDTO nbdto = new NoticeBoardDTO();
			
			nbdto.setNum(rs.getInt("num"));
			nbdto.setUsername(rs.getString("username"));
			nbdto.setTitle(rs.getString("title"));
			nbdto.setMemo(rs.getString("memo"));
			nbdto.setReg_date(rs.getString("reg_date"));
			list.add(nbdto);
			
			/* System.out.println("======2====="+list); */
		}
	
		return list;
	
	}
	
	public void updateProcess(String title, String memo, String num) throws ClassNotFoundException, SQLException {
		conn = null;
		pstmt = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
		String sql = "update noticeBoard set title = ?, memo = ? where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, memo);
		pstmt.setString(3, num);
		
		/*
		 * System.out.println("=====1=====" +title); System.out.println("=====2====="
		 * +memo); System.out.println("======3====" +num);
		 */
		
		pstmt.executeUpdate();
	}
	
	public List<NoticeBoardDTO> searchFields(String col, String word) throws ClassNotFoundException, SQLException{
		List<NoticeBoardDTO> list = new ArrayList<>();
		
		conn = null;
		pstmt = null;
		rs = null;
		StringBuffer sql = new StringBuffer();
		
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
		if(col.equals("username")) {
			sql.append("select num, username, title, memo, reg_date ");
			sql.append("from noticeBoard");
			sql.append(" where username like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}else if(col.equals("title")) {
			sql.append("select num, username, title, memo, reg_date ");
			sql.append("from noticeBoard");
			sql.append(" where title like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}else if(col.equals("memo")) {
			sql.append("select num, username, title, memo, reg_date ");
			sql.append("from noticeBoard");
			sql.append(" where memo like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			NoticeBoardDTO nbdto = new NoticeBoardDTO();
			
			nbdto.setNum(rs.getInt("num"));
			nbdto.setUsername(rs.getString("username"));
			nbdto.setTitle(rs.getString("title"));
			nbdto.setMemo(rs.getString("memo"));
			nbdto.setReg_date(rs.getString("reg_date"));
			list.add(nbdto);
		}
		return list;
	}
	
	
	
	
	public List<NoticeBoardDTO> bringAll(String num) throws ClassNotFoundException, SQLException {

	      List<NoticeBoardDTO> list = new ArrayList<>();
	      
	        conn = null;
			pstmt = null;
			rs = null;

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
			String dbUser = "root";
			String dbPassword = "rootroot";

			conn = DriverManager.getConnection(url, dbUser, dbPassword);
	        String sql = "select * from noticeBoard where num =?";
	        pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	NoticeBoardDTO nbdto =  new NoticeBoardDTO();
	        	nbdto.setNum(rs.getInt("num"));
	        	nbdto.setUsername(rs.getString("username"));
	        	nbdto.setTitle(rs.getString("title"));
	        	nbdto.setMemo(rs.getString("memo"));
	        	nbdto.setViewCnt(rs.getInt("viewCnt"));
	        	nbdto.setReg_date(rs.getString("reg_date"));
	        	
	        list.add(nbdto);
	        	
	        	
	        }
	        pstmt.close();
            conn.close();
            rs.close();
            
            conn = null;
			pstmt = null;
			rs = null;

			Class.forName("com.mysql.jdbc.Driver");
			String dburl = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
			String dbUser1 = "root";
			String dbPassword1 = "rootroot";

			conn = DriverManager.getConnection(dburl, dbUser1, dbPassword1);
            
			String sqlU = "update noticeBoard set viewCnt=viewCnt+1 where num=?";   
	         pstmt = conn.prepareStatement(sqlU);
	         pstmt.setString(1, num);
	         pstmt.executeUpdate();

	        
	        
	        return list;
	         	
	}
	
	
	public List<NoticeBoardDTO> searchWords(String col, String word) throws ClassNotFoundException, SQLException{
List<NoticeBoardDTO> list = new ArrayList<>();
		
		conn = null;
		pstmt = null;
		rs = null;
		StringBuffer sql = new StringBuffer();
		
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
		if(col.equals("username")) {
			sql.append("select num, username, title, memo, reg_date ");
			sql.append("from noticeBoard");
			sql.append(" where username like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}else if(col.equals("title")) {
			sql.append("select num, username, title, memo, reg_date ");
			sql.append("from noticeBoard");
			sql.append(" where title like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}else if(col.equals("memo")) {
			sql.append("select num, username, title, memo, reg_date ");
			sql.append("from noticeBoard");
			sql.append(" where memo like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			NoticeBoardDTO nbdto = new NoticeBoardDTO();
			
			nbdto.setNum(rs.getInt("num"));
			nbdto.setUsername(rs.getString("username"));
			nbdto.setTitle(rs.getString("title"));
			nbdto.setMemo(rs.getString("memo"));
			nbdto.setReg_date(rs.getString("reg_date"));
			list.add(nbdto);
		}
		return list;
	}
	
	
	
	
	
	
}