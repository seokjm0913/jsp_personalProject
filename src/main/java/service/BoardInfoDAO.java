package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.BoardInfoDTO;
import model.NoticeBoardDTO;

public class BoardInfoDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public String insertProcess(String detailedConsultationFields, String buyer_country, String buyer_name, String cmpName, String cmpName_website, String contact_email, String content)
			throws ClassNotFoundException, SQLException {
		conn = null;
		pstmt = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);

		String sql = "insert into Boardinfo (detailedConsultationFields, buyer_country, buyer_name, cmpName, cmpName_website, contact_email, content) values(?, ?, ?, ?, ?, ?, ?)";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, detailedConsultationFields);
		pstmt.setString(2, buyer_country);
		pstmt.setString(3, buyer_name);
		pstmt.setString(4, cmpName);
		pstmt.setString(5, cmpName_website);
		pstmt.setString(6, contact_email);
		pstmt.setString(7, content);

		pstmt.executeUpdate();

		return "insert성공";
	}
	
	
	public List<BoardInfoDTO> readAll() throws ClassNotFoundException, SQLException{
		List<BoardInfoDTO> list = new ArrayList<>();
	      
        conn = null;
		pstmt = null;
		rs = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
        String sql = "select * from BoardInfo";
        pstmt = conn.prepareStatement(sql);
		
        rs = pstmt.executeQuery();
        while (rs.next()) {
        	BoardInfoDTO dto = new BoardInfoDTO();
        	dto.setBuyer_no(rs.getInt("buyer_no"));
        	dto.setDetailedConsultationFields(rs.getString("detailedConsultationFields"));
        	dto.setBuyer_country(rs.getString("buyer_country"));
        	dto.setBuyer_name(rs.getString("buyer_name"));
        	dto.setCmpName(rs.getString("cmpName"));
        	dto.setCmpName_website(rs.getString("cmpName_website"));
        	dto.setContact_email(rs.getString("contact_email"));
        	dto.setContent(rs.getString("content"));
        	dto.setReg_date(rs.getString("reg_date"));
        	list.add(dto);
        	
        	System.out.println("======2====="+list); 
        	
        }
		return list;
        
	}
	
	
	public List<BoardInfoDTO> lookAll(String buyer_no) throws ClassNotFoundException, SQLException{
			List<BoardInfoDTO> list = new ArrayList<>();
		 	conn = null;
			pstmt = null;
			rs = null;

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
			String dbUser = "root";
			String dbPassword = "rootroot";

			conn = DriverManager.getConnection(url, dbUser, dbPassword);
	        String sql = "select * from Boardinfo where buyer_no =?";
	        pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buyer_no);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	BoardInfoDTO dto = new BoardInfoDTO();
	        	dto.setBuyer_no(rs.getInt("buyer_no"));
	        	dto.setDetailedConsultationFields(rs.getString("detailedConsultationFields"));
	        	dto.setBuyer_country(rs.getString("buyer_country"));
	        	dto.setBuyer_name(rs.getString("buyer_name"));
	        	dto.setCmpName(rs.getString("cmpName"));
	        	dto.setCmpName_website(rs.getString("cmpName_website"));
	        	dto.setContact_email(rs.getString("contact_email"));
	        	dto.setContent(rs.getString("content"));
	        	dto.setReg_date(rs.getString("reg_date"));
	        	list.add(dto);
	        }
	        
	        
	        
			return list;
	}
	
	
	public void deleteProcess(String buyer_no) throws ClassNotFoundException, SQLException {
		conn = null;
		pstmt = null;

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
		String sql = "delete from BoardInfo where buyer_no = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, buyer_no);

		pstmt.executeUpdate();
	}
	
	
	public List<BoardInfoDTO> search(String col, String word) throws ClassNotFoundException, SQLException{
		List<BoardInfoDTO> list = new ArrayList<>();
		conn = null;
		pstmt = null;
		rs = null;
		StringBuffer sql = new StringBuffer();
		
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
		if(col.equals("buyer_name")) {
			sql.append("select buyer_no, detailedConsultationFields, buyer_country, buyer_name, cmpName, cmpName_website, contact_email,  content, reg_date ");
			sql.append("from BoardInfo");
			sql.append(" where buyer_name like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}else if(col.equals("cmpName")) {
			sql.append("select buyer_no, detailedConsultationFields, buyer_country, buyer_name, cmpName, cmpName_website, contact_email,  content, reg_date ");
			sql.append("from BoardInfo");
			sql.append(" where cmpName like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}else if(col.equals("reg_date")) {
			sql.append("select buyer_no, detailedConsultationFields, buyer_country, buyer_name, cmpName, cmpName_website, contact_email,  content, reg_date ");
			sql.append("from BoardInfo");
			sql.append(" where reg_date like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + word + "%");
		}
		rs = pstmt.executeQuery();
		while(rs.next()) {
			BoardInfoDTO dto = new BoardInfoDTO();
			dto.setBuyer_no(rs.getInt("buyer_no"));
			dto.setDetailedConsultationFields(rs.getString("detailedConsultationFields"));
			dto.setBuyer_country(rs.getString("buyer_country"));
			dto.setBuyer_name(rs.getString("buyer_name"));
			dto.setCmpName(rs.getString("cmpName"));
			dto.setCmpName_website(rs.getString("cmpName_website"));
			dto.setContact_email(rs.getString("contact_email"));
			dto.setContent(rs.getString("content"));
			dto.setReg_date(rs.getString("reg_date"));
			list.add(dto);
		}
		return list;
	}
	
}
