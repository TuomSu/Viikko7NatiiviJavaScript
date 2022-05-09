<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Insert title here</title>
</head>
<body onkeydown="tutkiKey(event)">
<form id="tiedot">
<table>
<thead>
<tr>			
				<th colspan="3" id="ilmo"></th>
				<th colspan="2" class="oikealle"><a href="ListaaAsiakkaat.jsp" id="takaisin">Takaisin listaukseen</a></th>
			</tr>
<tr>
<th>Etunimi</th>
<th>Sukunimi</th>
<th>Puhelin</th>
<th>Sposti</th>
<th></th>
</tr>
</thead>
<tbody>
<tr> 
<td> <input type="text" name="Etunimi" id="Etunimi"> </td>
<td> <input type="text" name="Sukunimi" id="Sukunimi"> </td>
<td> <input type="text" name="Puhelin" id="Puhelin"> </td>
<td> <input type="text" name="Sposti" id="Sposti"> </td>
<td><input type="button" name="nappi" id="tallenna" value="Lis��" onclick="lisaaTiedot()"></td>
</tr>
</tbody>

</table>

</form>
<span id="ilmo"> </span>
</body>
<script>
function tutkiKey(event){
	if(event.keyCode==13){//Enter
		lisaaTiedot();
	}
	
}
document.getElementById("Etunimi").focus();

function lisaaTiedot(){	
	var ilmo="";
	if(document.getElementById("Etunimi").value.length<2){
		ilmo="Liian lyhyt";		
	}else if(document.getElementById("Sukunimi").value.length<2){
		ilmo="Liian lyhyt";		
	}else if(document.getElementById("Puhelin").value*1!=document.getElementById("Puhelin").value){
		ilmo="Puhelin ei ole luku";		
	}else if(document.getElementById("Sposti").value.length<5){
		ilmo="Liian lyhyt";		
	}
	if(ilmo!=""){
		document.getElementById("ilmo").innerHTML=ilmo;
		setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 3000);
		return;
	}function siivoa(teksti){
		teksti=teksti.replace("<","");
		teksti=teksti.replace(";","");
		teksti=teksti.replace("'","''");
		return teksti;
	}
	document.getElementById("Etunimi").value=siivoa(document.getElementById("Etunimi").value);
	document.getElementById("Sukunimi").value=siivoa(document.getElementById("Sukunimi").value);
	document.getElementById("Puhelin").value=siivoa(document.getElementById("Puhelin").value);
	document.getElementById("Sposti").value=siivoa(document.getElementById("Sposti").value);	

	var formJsonStr=formDataJsonStr(document.getElementById("tiedot"));
	
	fetch("asiakkaat",{
	      method: 'POST',
	      body:formJsonStr
	    })
	.then( function (response) {		
		return response.json()
	})
	.then( function (responseJson) {
		var vastaus = responseJson.response;		
		if(vastaus==0){
			document.getElementById("ilmo").innerHTML= "Asiakkaan lis��minen ep�onnistui";
    	}else if(vastaus==1){	        	
    		document.getElementById("ilmo").innerHTML= "Asiakkaan lis��minen onnistui";			      	
		}
		setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 5000);
	});	
	document.getElementById("tiedot").reset(); 
}
</script>


</html>