<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.io.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <%
  
  String usuario = request.getParameter("usuario");
  String password = request.getParameter("password");
  int logeado =0;
 
	 try  {
		 
		 

		 
		 
		 String conexion ="jdbc:mysql://localhost:3306/webcalendario";
		
		 Connection connection = null;
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		 connection =DriverManager.getConnection(conexion,"web","calendario");
		 
		 Statement stat = connection.createStatement();
		 ResultSet rset;
		 
		 String peticion ="SELECT * FROM usuarios WHERE usuario ='" +usuario  + "' AND contrasena = '" + password +"'";
		 rset = stat.executeQuery(peticion);
		 
		 while(rset.next()){
			    logeado =1;
			    session.setAttribute("idusuario", rset.getInt("idusuarios"));
			    
			   }	  
		 				 
		 stat.close();
		 connection.close();
		
		 
	 } catch(Exception ex ){

	 out.println("Ha ocurrido el siguiente error"+ ex.getMessage().toString());
	 }
	
	
  if(logeado ==1){
	  session.setAttribute("usuario", usuario);
	  out.println("<meta http-equiv='refresh' content ='0;url=../Index.jsp'>");
  }
  else{
	  out.println("<meta http-equiv='refresh' content ='0;url=../login.jsp'>");
  }
	  
  
  %>
  

</body>
</html>