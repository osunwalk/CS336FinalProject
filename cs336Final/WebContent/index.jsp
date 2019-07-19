<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Company Name</title>
		<style>
			#loginDiv
			{
				text-align: center;
				width: 20%;
				border: solid black 1px;
				visibility: hidden;
			}
			.link
			{
				width: 20%;
				display: inline;
			}
			iframe
			{
				width: 100%;
				height: 60%;
			}
			#loginText:hover
			{
				text-decoration: underline;
			}
		</style>
	</head>
	<body>
		<div id="header">
			<p id="loginText" onclick="showHide()">Log in</p>
			<div id="loginDiv">
			<form action="red.jsp" method="get" target="mainFrame">
				Username:<br>
				<input type="text" name="userName" id="userTXT" maxlength="50"><br>
				Password:<br>
				<input type="password" name="password" id="passTXT" maxlength="50"><br>
				<input type="text" name="accountType" value="customer">
				<input type="submit"><br>
				<a href="register.jsp">Make an account</a>
			</form>
			</div>
		</div>
		<hr>
		<iframe id="main" name="mainFrame" src="red.jsp">

		</iframe>
	</body>
	<script>
			function showHide()
			{
				var CurrentVisibility = document.getElementById("loginDiv").style.visibility;
				if (CurrentVisibility == "visible")
				{
					document.getElementById("loginDiv").style.visibility="hidden";
				}
				else
				{
					document.getElementById("loginDiv").style.visibility="visible";
				}
			}
			function logout()
			{
				document.getElementById("main").src = "red.jsp";
				changeToLogin();
			}
			function changeToLogout()
			{
				document.getElementById("header").innerHTML = '<p id="loginText" onclick="logout()">Log out</p>';
			}
			function changeToLogin()
			{
				document.getElementById("header").innerHTML = '<p id="loginText" onclick="showHide()">Log in</p><div id="loginDiv"><form 

action="red.jsp" method="get" target="mainFrame">Username:<br><input type="text" name="userName" id="userTXT"><br>Password:<br><input type="password" 

name="password" id="passTXT"><br><input type="text" name="accountType" value="user"><input type="submit"><br><a href="register.jsp">Make an 

account</a></form></div>'
			}
		</script>
</html>

