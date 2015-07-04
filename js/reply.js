function submitMessage() {
    	var statementDoc=document.getElementById('message');
	var strInput = statementDoc.value;	
	var xmlhttp=null;
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else{
		// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlhttp!==null){
		xmlhttp.onreadystatechange=function(){
                     if (xmlhttp.readyState===4 && xmlhttp.status===200){					
			window.location.reload();
                     }
                };
		strInput="submitMessage.jsp?words="+strInput;
		strInput=encodeURI(strInput);		
                strInput=encodeURI(strInput);		
		xmlhttp.open("GET",strInput,true);
		xmlhttp.send();		
	} // end if clause
} // end function submitMessage

function mainLogin() {
	var username = document.getElementByName('username').value;
	var password = document.getElementByName('password').value;
	var xmlhttp=null;
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else{
		// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlhttp!==null){
		xmlhttp.onreadystatechange=function(){
                     if (xmlhttp.readyState===4 && xmlhttp.status===200){					
			window.location.href="main.jsp"; 
                     }
                };
		url = "loginResponse.jsp?username=" + username + "&password=" + password;
		xmlhttp.open("POST", url, true);
		xmlhttp.send();		
	} // end if clause
} // end function submitMessage


