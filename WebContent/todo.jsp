<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*"%> 
    
    <%
          Connection conn = null;
          Statement stmt=null;
          ResultSet rs=null;
          Class.forName("com.mysql.jdbc.Driver");
          String url = "jdbc:mysql://localhost/todos?serverTimezone=UTC";
          conn=DriverManager.getConnection(url ,"root","wnstn0424!");
          
          
             stmt=conn.createStatement();
             if(stmt.execute("select * from todo")){
                rs=stmt.getResultSet();
             }
       
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h1>Ranshu's todos</h1>
<hr>

<%
   while(rs.next()){
      out.println(rs.getInt("id")+":"+rs.getString("item")+"<br>");
   }

rs.close(); 
stmt.close();
conn.close();
%>
<hr>



<form name="todosForm" method="post" action="write.jsp">
<input type="text" name="todo-item" size="20" placeholder="아무거나 적으세요"></input>
<input type="submit"></input>
</form>
</div>
</body>
</html>