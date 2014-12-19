<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import ="java.sql.*"%>
<%@ page import ="java.io.*"%>    
<% 

if(session.getAttribute("usuario") == null) {
	out.println("<meta http-equiv='refresh' content ='0;url=login.jsp'>");
}

if(session.getAttribute("anio") == null) {session.setAttribute("anio", 2014);}
if( session.getAttribute("mes") == null)   {session.setAttribute("mes",9);}
int mesnumero = (Integer)(session.getAttribute("mes"));
if (request.getParameter("mes") !=null) if (request.getParameter("mes").contains("anterior")){session.setAttribute("mes", mesnumero-1);}
if (request.getParameter("mes") !=null) if (request.getParameter("mes").contains("posterior")){session.setAttribute("mes", mesnumero+1);}
%>


    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			Septiembre2014 ---++++++------ <%out.println(session.getAttribute("mes"));  %>		
		</title>	
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
			
		<script src="./lib/jquery-1.10.1.min.js"></script>
		<script src="./lib/jquery-ui.js"></script>
		<script src="./js/codigo.js">
		
		</script>
		<link rel="stylesheet" type="text/css" href="./css/estilo.css">
		<link rel="stylesheet" type="text/css" href="./css/header.css">
	</head>
	<body>
	<div id="tituloprint">www.webcalendario.com</div>
	<header>
		<div id="logo">
			
				<h1>webcalendario.com</h1>
				<h2>Tu calendario en la nube</h2>
			</div>
			<nav>
				<ul>
					<li>
						Inicio
					</li>
					<li>
						FAQ
					</li>
					<li id="botonlogin">
						Inicia sesionñ
					</li>
					<li id="botonsignin">
						Regístrate
					</li>
					<li id="contacto">
						Contacto
					</li>
					<li id="contacto">
						<a href="">Cerrar Sesion</a>
					</li>
				</ul>
			</nav>
	</header>
	<table width="100%">
	<tbody><tr>
	<td id="aniotitulo">
		<h2><%out.println(session.getAttribute("mes"));%></h2><h1><%out.println(session.getAttribute("anio")); %></h1></td>
		<td id="botones">
			<a href="?mes=anterior"><button> &lt;&lt; </button></a>
			<a href="?mes=posterior"><button> &gt;&gt; </button></a>
		</td>
		<td>
			<div id="calendarios">
			
				
				
			<%
			 try  {
				 
				 
		
				 
				 
				 String conexion ="jdbc:mysql://localhost:3306/webcalendario";
				
				 Connection connection = null;
				 Class.forName("com.mysql.jdbc.Driver").newInstance();
				
				 connection =DriverManager.getConnection(conexion,"web","calendario");
				 
				 Statement stat = connection.createStatement();
				 ResultSet rset;
				 
				 String peticion ="SELECT * FROM calendarios WHERE usuario =" + session.getAttribute("idusuario") + ";";
				 rset = stat.executeQuery(peticion);
				 
				 out.println(peticion);
				  
				 while(rset.next()){
					 
					  out.println("<span class='calendariocol' idcalendario='1' style='width:80px;background:rgb("+ rset.getString("color") +");'>" +rset.getString("nombre")+ " - <a href='acciones/eliminarCalendario.jsp?idcalendario=" + rset.getInt("idcalendario")   +" class='cierracalendarioX'>X</a>  </span>");
				 }	  
				 				 
				 stat.close();
				 connection.close();
				
				 
			 } catch(Exception ex ){
		
			 out.println("Ha ocurrido el siguiente error"+ ex.getMessage().toString());
			 }
			%>
			
			
			<button id="botonanadircalendario">Añadir calendario</button>
			</div>
			<span class="calendariocol" style="background:grey;" id="ocultacalendarios"> &gt; </span>
			</td>
		</tr>
		</tbody></table>
		<div style="clear:both;"></div>
		<div id="calendario">
		
		<% 	 try  {
				 
			
				 int desfase =0;
				 if  (session.getAttribute("mes").toString().equals("1")) {desfase =2;}
				 if  (session.getAttribute("mes").toString().equals("2")) {desfase =5;}
				 if  (session.getAttribute("mes").toString().equals("3")) {desfase =5;}
				 if  (session.getAttribute("mes").toString().equals("4")) {desfase =1;}
				 if  (session.getAttribute("mes").toString().equals("5")) {desfase =3;}
				 if  (session.getAttribute("mes").toString().equals("6")) {desfase =6;}
				 if  (session.getAttribute("mes").toString().equals("7")) {desfase =1;}
				 if  (session.getAttribute("mes").toString().equals("8")) {desfase =4;}
				 if  (session.getAttribute("mes").toString().equals("9")) {desfase =0;}
				 if  (session.getAttribute("mes").toString().equals("10")) {desfase =2;}
				 if  (session.getAttribute("mes").toString().equals("11")) {desfase =5;}
				 if  (session.getAttribute("mes").toString().equals("12")) {desfase =0;}
			
			
				 String conexion ="jdbc:mysql://localhost:3306/webcalendario";
				
				 Connection connection = null;
				 Class.forName("com.mysql.jdbc.Driver").newInstance();
				
				 connection =DriverManager.getConnection(conexion,"web","calendario");
				 
				 Statement stat = connection.createStatement();
				 ResultSet rset;
				 
				 
				 
				 
				 for(int diavacio =1;diavacio <=desfase;diavacio++){ 
					 out.println("<div class='dia ui-droppable' dia ='' style='position:relative;'><div class='numerodia'><b></b></div>");
					 out.println("</div>");
					  
				} 
				 
				 
					
				 for(int dia =1;dia <=31;dia++){ 
				 String peticion ="select ev.idevento, ev.nombre as nombre, anio,mes,hora,minuto,segundo,duracion,color from eventos  ev,calendarios ca where ev.calendario = ca.idcalendario and   anio='2014' and mes= "+session.getAttribute("mes")+" and dia = "+dia+ " and usuario =" + session.getAttribute("idusuario") + ";";
				 rset = stat.executeQuery(peticion);
				 
				 
				 out.println("<div class='dia ui-droppable' dia ='"+dia+"' style='position:relative;'><div class='numerodia'><b>"+dia+"</b></div>");
				 
				 while(rset.next()){
					 
				 out.println("<div idevento = '"+rset.getString("idevento")+"'  idcaldia='7' anio ='2014' mes='9'  dia ='13' hora='9' nombre='' class='evento ui-draggable' style ='background:rgb("+rset.getString("color")+");width:90%;height:" +rset.getInt("duracion")*0.1+"%;position:absolute;top:"+((rset.getInt("hora")*4)+12)+"%;'>"+rset.getInt("hora")+ "<pan class='motivoevento'>-" +rset.getString("Nombre")+"</span><div class='eliminar'><a style='color=#d7d7d7:'href ='acciones/eliminarEvento.jsp?idevento="+ rset.getInt("idevento") + "'>X</a></div></div>");                                                 
	 							 
				 }	 
				 
				 out.println("</div>");
				  
				  } 
				 				 
				 stat.close();
				 connection.close();
				
					 
			 } catch(Exception ex ){
		
			 out.println("Ha ocurrido el siguiente error"+ ex.getMessage().toString());
			 }
			%>
		
			
			</div>
			
			
			
			<div id="nuevoevento" style="display: none;">
				<div id="contieneform">
					<div id="cerrarnuevoevento">X</div>
					<form action="http://localhost:8080/WebCalendario/acciones/nuevoEvento.jsp" method="POST">
					<input type="hidden" name="anio" value="2014">
						<input type="hidden" name="mes" value="9">
						<h3>Nuevo evento</h3>
					<table width="100%" id="tablanuevoevento" cellpadding="0" cellspacing="0">
						<tbody><tr>
							<td>
								Año:
							</td>
							<td>
								2014							</td>
						</tr>
						<tr>
							<td>
							Mes:	
							</td>
							<td>
								Sep							</td>
						</tr>
						<tr>
							<td>
								Dia:
							</td>
							<td>
								<input type="text" name="dia" id="dimedia">
							</td>
						</tr>
						<tr>
							<td>
								Calendario:
							</td>
							<td>
								<select name="calendario">
								
								
						    <%
							 try  {
								 
								 String conexion ="jdbc:mysql://localhost:3306/webcalendario";
								
								 Connection connection = null;
								 Class.forName("com.mysql.jdbc.Driver").newInstance();
								
								 connection =DriverManager.getConnection(conexion,"web","calendario");
								 
								 Statement stat = connection.createStatement();
								 ResultSet rset;
								 
								 String peticion ="SELECT * FROM calendarios";
								 rset = stat.executeQuery(peticion);
								 
								 while(rset.next()){
									 
									  out.println("<option value='"+ rset.getInt("idcalendario") +"'>"+ rset.getString("nombre")+"</option>") ;
								 }	  
								 				 
								 stat.close();
								 connection.close();
								
								 
							 } catch(Exception ex ){
						
							 out.println("Ha ocurrido el siguiente error"+ ex.getMessage().toString());
							 }
							%>
								
								
								
								</select>
							</td>
						</tr>
						<tr>
							<td>
								Hora de inicio:
							</td>
							<td>
								<select name="hora">
								<%
								for (int hora=1;hora<=24;hora++){
									
									out.println("<option value='"+hora+"'>"+hora+"</option>");
								}
								
								%>
								
						     <!-- <option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option>:-->				
						      </select>
						
						
						<select name="minuto">
						     <%
								for (int minuto=0;minuto<=60;minuto+=5){
									
									out.println("<option value='"+minuto+"'>"+minuto+"</option>");
								}
								
								%>
						
						
						     <!--<option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option>	-->
						</select>
							</td>
						</tr>
						<tr>
							<td>
								Duración:
							</td>
							<td>
								<select name="duracion">
						<option value="0">0</option><option value="30">0:30</option><option value="60">1</option><option value="90">1:30</option><option value="120">2</option><option value="150">2:30</option><option value="180">3</option><option value="210">3:30</option><option value="240">4</option><option value="270">4:30</option><option value="300">5</option><option value="330">5:30</option><option value="360">6</option><option value="390">6:30</option><option value="420">7</option><option value="450">7:30</option><option value="480">8</option><option value="510">8:30</option><option value="540">9</option><option value="570">9:30</option><option value="600">10</option><option value="630">10:30</option><option value="660">11</option><option value="690">11:30</option><option value="720">12</option><option value="750">12:30</option><option value="780">13</option><option value="810">13:30</option><option value="840">14</option><option value="870">14:30</option><option value="900">15</option><option value="930">15:30</option><option value="960">16</option><option value="990">16:30</option><option value="1020">17</option><option value="1050">17:30</option><option value="1080">18</option><option value="1110">18:30</option><option value="1140">19</option><option value="1170">19:30</option><option value="1200">20</option><option value="1230">20:30</option><option value="1260">21</option><option value="1290">21:30</option><option value="1320">22</option><option value="1350">22:30</option><option value="1380">23</option><option value="1410">23:30</option>						</select>
							</td>
						</tr>
						<tr>
							<td>
								Nombre del evento:
							</td>
							<td>
								<input type="text" name="nombre" placeholder="nombre">
							</td>
						</tr>
						<tr>
							<td>
								
							</td>
							<td>
								<input type="submit">
							</td>
						</tr>
						
					</tbody></table>	
				</form>
			</div>
		</div>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		
		<div id="nuevocalendarioforma" style="display: none;">
				<div id="contieneform">
					<div id="cerrarnuevocalendario">X</div>
					<form action="http://localhost:8080/WebCalendario/acciones/nuevoCalendario.jsp" method="POST">
					<input type="hidden" name="anio" value="2014">
						<input type="hidden" name="mes" value="9">
				
							   <input type="text"   name ="nombrecalendario"> 
							
							   <input type ="submit"> 						
							
				</form>
			</div>
		</div>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		
		<div id="ajax"></div>
	
</body></html>
