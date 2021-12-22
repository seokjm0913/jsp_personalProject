<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!-- table {
	border: solid 3px black;
	border-collapse: collapse;
}

td {
	border: solid 3px black;
	padding: 1em;
}

input {
	padding: 10px 10px;
}
</style> 
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<h2>삭제하시겠습니까?</h2>


	<hr>
	<br>
		
	<%
	Class.forName("com.mysql.jdbc.Driver");

	String buyer_no = request.getParameter("buyer_no");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";
				

		conn = DriverManager.getConnection(url, dbUser, dbPassword);

		String sql = "select * from BoardInfo where buyer_no=" + buyer_no;
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		while (rs.next()) {
	%>

	<form action="#" method="post" id="delect">
		<input type="hidden" name="buyer_no" value="<%=rs.getString("buyer_no")%>">
		<table>

			<tr height="50px">
				<td><%= rs.getString("buyer_no") %></td>
				<td><%= rs.getString("detailedConsultationFields") %></td>
				<td><%= rs.getString("buyer_country") %></td>
				<td><%= rs.getString("buyer_name") %></td>
				<td><%= rs.getString("cmpName")%></td>
				<td align="center" bgcolor="#778899">비밀번호</td>
				<td><input type="password" name="pwd" id="pwd" size=42 autocomplete="off"> <input type="submit" id="btn2" value="확인"></td>
			</tr>
		</table>
		<label> </label> <br>
	</form>
	
	<script>
			$(function() {	
				$("#btn2").on("click", function() {
					var a = $("#pwd").val() == <%=rs.getString("pwd")%>;	
					if (a) {
						$("#delect").attr("action", "deleteProcess.jsp");
					} else {
						alert("비밀번호가 틀렸습니다ㅠㅠ 다시 확인해주세요");
					}
	
				});

		});
	</script>



	<%
		}
		} catch (SQLException e) {
			System.out.println("update select 실패");
		} finally {
			pstmt.close();
			conn.close();
			rs.close();
		}
	%>
	

<button onclick="location.href='../bootStrapMain.jsp'">메인으로 가기</button>

</body>




</html>