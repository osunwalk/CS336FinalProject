<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title></title>
	</head>
	<body>
		<div id="body"></div>
	</body>
	<script>
		var URL = window.location.href;
		
		var userName = getData(URL, "userName");
		var password = getData(URL, "password");
		var accountType = getData(URL, "accountType");

		if(accountType == "customer")
		{
			displayCustomer();
		}
		else
		{
			if(accountType == "employee")
			{
				displayEmployee();
			}
			else
			{
				if(accountType == "admin")
				{
					displayAdmin();
				}
				else
				{
					displayGuest();
				}
			}
		}
		
		if(userName != "NULL")
		{
			document.getElementById("body").innerHTML += "User Name: " + userName + "<br>";
		}
		if(password != "NULL")
		{
			document.getElementById("body").innerHTML += "Password: " + password + "<br>";
		}
		if(accountType != "NULL")
		{
			document.getElementById("body").innerHTML += "Account type: " + accountType;
		}

		function displayCustomer()
		{
			document.getElementById("body").innerHTML = "<h1>Customer View</h1>";
		}
		function displayEmployee()
		{
			document.getElementById("body").innerHTML = "<h1>Employee View</h1>";
		}
		function displayAdmin()
		{
			document.getElementById("body").innerHTML = "<h1>Admin View</h1>";
		}
		function displayGuest()
		{
			document.getElementById("body").innerHTML = "<h1>Guest View</h1>";
		}
		function getData(URL, name)
		{
			var start = URL.indexOf(name);

			if(start != -1)
			{
				start += name.length + 1;
			}

			var end = URL.indexOf("&", start);

			if(start == -1)
			{
				return "NULL";
			}

			if(end == -1)
			{
				return URL.slice(start);
			}
			else
			{
				return URL.slice(start, end);
			}
		}
	</script>
</html>
