<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Introduce tu usuario</h1>
<form method="post" action ="acciones/hazlogin.jsp"><br>
    <input type ="text" name ="usuario"><br>
    <input type ="text" name ="password"><br>
    <input type ="submit">
  
</form>


<h1> Nuevo usuario</h1>
<form method="post" action ="acciones/nuevoLogin.jsp"><br>
    <input type ="text" name ="usuario"><br>
    <input type ="text" name ="password"><br>
    <input type ="text" name ="nombre"><br>
    <input type ="text" name ="apellidos"><br>
    <input type ="text" name ="email"><br>
    
    
    <input type ="submit">
  
</form>




</body>
</html>