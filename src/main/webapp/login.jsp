<%@ page import="java.sql.*"%>

<%
String userName = request.getParameter("userName");
String password = request.getParameter("password");
String rememberUser = request.getParameter("RememberUser");
Cookie[] cookies = request.getCookies();
Cookie usernameCookie = new Cookie("username", null);
Cookie passwordCookie = new Cookie("password", null);
Cookie rememberCookie = new Cookie("remember", null);
int maxAge = 0;
if(rememberUser != null && rememberUser.compareTo("on") == 0){
	 for(int i = 0; i<cookies.length; i++){
		 if(cookies[i].getName().compareTo("username") == 0){
			 usernameCookie = cookies[i];
		 }
		 if(cookies[i].getName().compareTo("password") == 0){
			 passwordCookie = cookies[i];
		 }
		 if(cookies[i].getName().compareTo("remember") == 0){
			 rememberCookie = cookies[i];
		 }
	 }

	 usernameCookie.setValue(userName);
	 passwordCookie.setValue(password);
	 rememberCookie.setValue(rememberUser);
	 maxAge = 60*60*24;
 }

usernameCookie.setMaxAge(maxAge);
passwordCookie.setMaxAge(maxAge);
rememberCookie.setMaxAge(maxAge);
response.addCookie(usernameCookie);
response.addCookie(passwordCookie);
response.addCookie(rememberCookie);

Class.forName ("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logintest", "root", "root");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from USER where username='" + userName + "' and password='" + password + "'");
if (rs.next())
	{
		session.setAttribute("userid", userName);
		response.sendRedirect("success.jsp");
	}
else
	{
		System.out.println("Invalid password <a href='index.jsp'>try again</a>");
} 
%>
