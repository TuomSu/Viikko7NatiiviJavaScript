<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<%
	String etunimi = request.getParameter("etunimi");
	String sukunimi = request.getParameter("sukunimi");
	String sahkoposti = request.getParameter("sahkoposti");
	String puhelin = request.getParameter("puhelin");
	String syntymavuosi = request.getParameter("syntymavuosi");
	int sVuosi = Integer.parseInt(syntymavuosi);
	Calendar cal = Calendar.getInstance();
	int vuosi = cal.get(Calendar.YEAR);
	int ika = vuosi - sVuosi;
	if(ika>=18){
		out.print("Etunimi: " + etunimi + " Sukunimi: " + sukunimi + "<br> S�hk�posti: " + sahkoposti
				+ "<br> Puhelin: "+ puhelin + "<br> Ik�: " + ika);	

	}else{
		out.print("Alaik�inen");
	}
	
%>
<script>
setTimeout("location.href = 'kysy.jsp';",5000);

$(document).ready(function(){
	var etunimi = requestURLParam("etunimi");
	var sukunimi = requestURLParam("sukunimi");
	var sahkoposti = requestURLParam("sahkoposti");
	var puhelin = requestURLParam("puhelin");
	var syntymavuosi = requestURLParam("syntymavuosi");
	
});
</script>
</body>
</html>