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
<!-- <style>
	table {
		border: solid 3px black;
		border-collapse : collapse;
		
	}

	td{
		border: solid 3px black;
		padding: 1em;
	}
	input {
		padding: 10px 10px;
	}
	
	
</style> -->
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
		
	<h2>문의 글 수정하기</h2>
	<button onclick="location.href='../bootStrapMain.jsp'">메인으로 가기</button>		
	
	<hr>
	<br>
	
	<%
			Class.forName("com.mysql.jdbc.Driver");
	
			
			String buyer_no = request.getParameter("buyer_no");	
	
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			
			try{
				Context init = new InitialContext();
				DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
				conn = ds.getConnection();
				
				String sql = "select * from BoardInfo where buyer_no=" + buyer_no;
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
		%>

				
				<form action="#" method="post" id="update">
                  <input type="hidden" name="buyer_no" value="<%= rs.getString("buyer_no") %>">
                   <%-- 번호 : <input type="text" name="buyer_no" value="<%=buyer_no %>" readonly="readonly"> <br>
						제목 : <input type="text" name="title" value="<%=rs.getString("title") %>" > <br>
						바이어명 : <input type="text" name="buyer_name" value="<%=rs.getString("buyer_name") %>" > <br>
						업체명 : <input type="text" name="buyer_cmpName" value="<%=rs.getString("buyer_cmpName") %>" > <br>
						E-mail : <input type="text" name="contact_email" value="<%=rs.getString("contact_email") %>"> <br>
						상담문의 : <input type="text" name="content" value="<%=rs.getString("content") %>"> <br> --%>
						
						
						<fieldset>
							<legend>상담문의 수정</legend>
								<ul style="list-style: none;">			
									<li>
										<label class="reg" for="buyer_no"><b>문의번호: </b></label>
										<input type="text" name="buyer_no" value="<%=buyer_no %>" readonly="readonly">
									</li>										
									
									<li>
										<label for="pwd"><b>비밀번호: </b></label>
										<input type="password" name="pwd" id="pwd" size=42 autocomplete="off" placeholder="비밀번호 입력하세요" required="required">
									</li>
									
									<li>					
										<b>세부상담분야: </b>						
										<label class="reg"></label>
										<input type="text" name="detailedConsultationFields" value="<%=rs.getString("detailedConsultationFields") %>" list="choices">
										<datalist id="choices">
												<option value="수출문의" label="Export"></option>
												<option value="수입문의" label="Import"></option>
												<option value="견적" label="quotation"></option>
												<option value="상품문의" label="product Inquiry"></option>
												<option value="서류요청" label="Request documents"></option>									
										</datalist>
									</li>
				
									<li>
										<label class="reg" for="buyer_country"><b>국가: </b></label>
										<input type="text" name="buyer_country" value="<%=rs.getString("buyer_country") %>" required="required">
									</li>			
									<li>
										<label class="reg" for="buyer_name"><b>바이어명: </b></label>
										<input type="text" name="buyer_name" value="<%=rs.getString("buyer_name") %>" required="required">
									</li>			
									<li>
										<label class="reg" for="cmpName"><b>업체명: </b></label>
										<input type="text" name="cmpName" value="<%=rs.getString("cmpName") %>" required="required">
									</li>			
									<li>
										<label class="reg" for="cmpName_website"><b>업체주소: </b></label>
										<input type="text" name="cmpName_website" value="<%=rs.getString("cmpName_website") %>" required="required">
									</li>			
									<li>
										<label class="reg" for="contact_email"><b>Email: </b></label>
										<input type="text" name="contact_email" value="<%=rs.getString("contact_email") %>" required="required">
									</li>			
								</ul>
								<br>
								<label class="reg"><b>문의내용</b></label> <br>
								<textarea name="content" rows="10" cols="60"><%=rs.getString("content") %></textarea>
								
													
						</fieldset>
																		
						<input type="submit" id="btn1" value="수정하기"><input type="reset" value="다시작성">
					</form>
				
				
			<script>
				$(function() {
					
					$("#btn1").on("click", function(){
						var a = $("#pwd").val() == <%= rs.getString("pwd") %>;
						/* alert(a); */
						
						if(a) {
							$("#update").attr("action", "updateProcess.jsp");
						}else {
							alert("비밀번호가 틀렸습니다ㅠㅠ 다시 확인해주세요");
						}
					});
				});
				
			</script>
		<%
			
			
				}
			}catch(SQLException e){
				System.out.println("update select 실패");
			}finally{
				pstmt.close();
				conn.close();
				rs.close();
			}
			
		%>
	
	
</body>
</html>
