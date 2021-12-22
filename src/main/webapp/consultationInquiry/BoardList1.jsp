<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 내용</title>
<style type="text/css">
h1{
	text-align: center;

}

</style>
</head>
<body>
   <br>
   <h1>Consultation Inquiry Notice board</h1> <br>
	   
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
	  <form class="form-inline" action="/buyerConsultation/search/searchProcess1.jsp" method="get">
	    <input class="form-control mr-sm-2" type="text" name="searchkeyboard" placeholder="업체명으로 검색" required="required" >
	    <input class="btn btn-success" type="submit" value="검색" >
	  </form>	  
	</nav>
      	
   <table class="table table-hover">

      <tr >
        <td>문의번호</td>
		<td>세부상담분야</td>
		<td>국가</td>
		<td>바이어명</td>
		<td>업체명</td>
		<td>업체주소</td>
		<td>Email</td>
		<td>문의내용</td>
		<td>작성일</td>			
		<td>삭제</td>	
		<td>수정</td>	
      </tr>
   
   <%
   
      //1.JDBC 드라이버 로딩
      Class.forName("com.mysql.jdbc.Driver");
   
   
      Connection conn = null;
      PreparedStatement pstmt = null; /* 준비물정도로 이해하고 있자.sql문 쓸 수 있게 해주는 것 */
      ResultSet rs = null;   /* 셀렉트를 했다면 값이 다시 오겠지 sql로 호출한 명령을 불러오는 행위 */
      
      try{
         String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";/* 내 mySQL의 주소 포트번호뒤에는 테이블이름이아닌 데이터베이스명을 적는다. */
         String dbUser = "root";
         String dbPassword = "rootroot";
         
         //2. 데이터베이스 커넥션 생성
         conn = DriverManager.getConnection(url, dbUser, dbPassword);
         
         String sql = "select * from  BoardInfo order by buyer_no desc";
         
         
         pstmt = conn.prepareStatement(sql);/* 저기 괄호안에 sql문을 써도 되지만 보기좋게하기위해 이렇게 했다. */
         
         rs = pstmt.executeQuery();/* 쿼리문에서 호출한 값을 담아올 공간. */
         
         while(rs.next()){/* 한개의 값이 아닐 수 있으니까 반복문해서 다 뽑아낸다. */
            %><!-- rs의 다음값을 출력하다가 다음값이 없으면 빠져나감. -->
               <tr>
                  	<td><%= rs.getString("buyer_no") %></td>
					<td><%= rs.getString("detailedConsultationFields") %></td>
					<td><%= rs.getString("buyer_country") %></td>
					<td><%= rs.getString("buyer_name") %></td>
					<td><%= rs.getString("cmpName")%></td>
					<td><%= rs.getString("cmpName_website") %></td>
					<td><%= rs.getString("contact_email") %></td>
					<td><%= rs.getString("content") %></td>
					<td><%= rs.getString("reg_date") %></td>
					<td><button type="button" class="btn btn-danger" onclick="location.href='/buyerConsultation/delete/deletePwForm.jsp?buyer_no=<%= rs.getString("buyer_no")%>'">삭제</button></td> 
					<td><button type="button" class="btn btn-success" onclick="location.href='/buyerConsultation/update/updatePwForm.jsp?buyer_no=<%= rs.getString("buyer_no")%>'">수정</button></td>
               </tr>
               
            <%
         }
      }catch(SQLException ex){
         System.out.println("select 실패");
      }finally{
         rs.close();
         pstmt.close();
         conn.close();
      }
      
   %>
   
   </table>
   
   
</body>
</html>