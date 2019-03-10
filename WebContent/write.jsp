<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="java.sql.*"%>
    <%
     request.setCharacterEncoding("utf-8");
    %>
    <%
       Connection conn = null;
       Statement stmt=null;
       ResultSet rs=null;
       Class.forName("com.mysql.jdbc.Driver");
       String url = "jdbc:mysql://localhost/todos?serverTimezone=UTC";
       conn=DriverManager.getConnection(url ,"root","wnstn0424!");
       
       String item=request.getParameter("todo-item");
       String sql="insert into todo(item) values ('"+item+"')";
       stmt=conn.createStatement();
       stmt.executeUpdate(sql);
       response.sendRedirect("todo.jsp");
       
       
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
   <%
      String todo=request.getParameter("todo-item");
      
   
   %>
   <%= todo %>
</body>
</html>