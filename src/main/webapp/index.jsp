<%@ page import="javax.swing.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title> Java Simple Login Web App</title> </head>

<%
	Cookie[] cookies = request.getCookies();
	Cookie username = new Cookie("username", "");
	Cookie password = new Cookie("password", "");
	Cookie remember = new Cookie("remember", null);
	String rememberValue = null;
	for(int i = 0; i<cookies.length; i++){
		if(cookies[i].getName().compareTo("username") == 0){
			username = cookies[i];
		}
		if(cookies[i].getName().compareTo("password") == 0){
			password = cookies[i];
		}
		if(cookies[i].getName().compareTo("remember") == 0){
			remember = cookies[i];
			if(remember.getValue().compareTo("on") == 0){
				rememberValue = "on";
			}else {
				rememberValue = "off";
			}
		}
	}

%>

<body bgcolor="#aaaaaa">

<form method="post" action="login.jsp"> 
<center> 
	<table border="0" width="30%" cellpadding="3">
	<thead> <tr> <th colspan="2">Login Page</th> </tr> </thead> 
	<tbody>
	<tr> <td>Username</td><td><input type="text" name="userName" value="<%=username.getValue()%>" /></td> </tr>
	<tr> <td>Password</td> <td><input type="password" name="password" value="<%=password.getValue()%>" /></td></tr>
	<tr> <td><input type="checkbox" name="RememberUser" value="on"> Remember Me </td> </tr>
	<tr> <td><input type="submit" value="Login" /></td><td><input type="reset" value="Reset" /></td> </tr>
	<tr> <td colspan="2">New User <a href="register.jsp">Register Here</a></td> </tr> 
	</tbody> 
	</table> 
</center> 
</form>
</body> 
