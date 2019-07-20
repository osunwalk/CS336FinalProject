<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Make an account</title>
	</head>
	<body>
		<form action="" method="post">
			<h2>Register</h2>
			Username:<br>
			<input type="text" name="userName" id="userTXT" maxlength="50"><br>
			Password:<br>
			<input type="text" name="password" id="passTXT" maxlength="50"><br>
			<input type="submit">
			<p id="error"></p>
		</form>
	</body>
</html>

