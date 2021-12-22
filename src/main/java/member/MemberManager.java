package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberManager {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public boolean admin_login(String admin_id, String admin_pw) throws ClassNotFoundException {
		boolean b = false;
		conn = null;
		pstmt = null;
		rs = null;
		
		 Class.forName("com.mysql.jdbc.Driver");
		 String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		 String dbUser = "root";
		 String dbPassword = "rootroot";
		
		 try {
			 conn = DriverManager.getConnection(url, dbUser, dbPassword);			 					 
			String sql = "select * from admin where admin_id = ? and admin_pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin_id);
			pstmt.setString(2, admin_pw);
			rs = pstmt.executeQuery();
			b=rs.next();

		} catch (Exception e) {
			System.out.println("admin_login err : " + e);
		} finally {
			try {
				rs.close();
		        pstmt.close();
		        conn.close();
			} catch (Exception e2) {
				e2.getStackTrace();
			}

		}
		return b;

	}




		

}
