<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.io.*"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content ="0;url=../Index.jsp">
<title>Insert title here</title>
</head>
<body>
     
  
   <%
   
							 try  {
								 
								 String conexion ="jdbc:mysql://localhost:3306/webcalendario";
								
								 Connection connection = null;
								 Class.forName("com.mysql.jdbc.Driver").newInstance();
								
								 connection =DriverManager.getConnection(conexion,"web","calendario");
								 
								 Statement stat = connection.createStatement();
								 stat.executeUpdate("INSERT INTO calendarios  VALUES (NULL,'" + session.getAttribute("idusuario") + "','"+request.getParameter("nombrecalendario")+"','255,200,200')");
												 
								 
								 stat.close();
								 connection.close();
								 
								// session.setAttribute("usuario",request.getAttribute("usuario"));
								 
								
							
								 
							 } catch(Exception ex ){
						
							 out.println("Ha ocurrido el siguiente error"+ ex.getMessage().toString());
							 }
	%>
   
   
  
   
</body>
</html>