<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
	label {
		display: block;
		width: 6em;
		float: left; 
	}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="nayta.jsp">L�het�</a>
<form action="nayta.jsp" method="POST">
	<label> Etunimi:  </label>  <input type="text" name="etunimi" size="10"><br>
	<label> Sukunimi: </label>  <input type="text" name="sukunimi" size="10"><br>
	<label> S�hk�posti: </label> <input type="text" name="sahkoposti" size="10"><br>
	<label> Puhelin: </label>   <input type="text" name="puhelin" size="10"><br>
	<label> Syntym�vuosi: </label> <input type="text" name="syntymavuosi" size="10"><br>
	<input type="submit" value="L�het�">
</form>
</body>
</html>