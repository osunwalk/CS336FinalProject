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
				document.getElementById("header").innerHTML = '<p id="loginText" onclick="showHide()">Log in</p><div id="loginDiv"><form action="red.jsp" method="get" target="mainFrame">Username:<br><input type="text" name="userName" id="userTXT"><br>Password:<br><input type="password" name="password" id="passTXT"><br><input type="text" name="accountType" value="user"><input type="submit"><br><a href="register.jsp">Make an account</a></form></div>'
			}
			function displayError(errorType)
			{
				if(errorType == "notFound")
				{
					document.getElementById("error").innerHTML = "Incorrect username or password";
				}
				else
				{
					if(errorType == "isFound")
					{
						document.getElementById("error").innerHTML = "Username is already taken";
					}
					else
					{
						if(errorType == "success")
						{
							document.getElementById("error").innerHTML = "";
						}
						else
						{
							document.getElementById("error").innerHTML = "Unknown error type received";
						}
					}
				}
			}
			function test()
			{
				
				<%
				String user = request.getParameter("userName");
				String pass = request.getParameter("password");
				if(user==null && pass==null){
					
				}
				else
				{
					try {
						
						//Get the database connection
	
								String url = "jdbc:mysql://gordonsdatabase.ct254jupltiy.us-east-2.rds.amazonaws.com/betterThanKayak";
								Class.forName("com.mysql.jdbc.Driver");
	
								String type;
								System.out.println("Username:" + user + "\nPassword:" + pass);
								
									
						
								Connection con = DriverManager.getConnection(url, "root", "12345678");
								
								String searchuser = "SELECT * FROM users where username = " + user + " AND password = " + pass;
								System.out.println(searchuser);
								//Run the query against the database.

								Statement stmt = con.createStatement();
								ResultSet result = stmt.executeQuery(searchuser);
								System.out.println("what");
								System.out.println(result.next());
								if(result.next() == false){
									System.out.println("dne");
									%>								
									displayError("notFound");								
									<% 
								}
								else{
									System.out.println("found it");
									String query = "SELECT designation FROM users where users.username=" +user;
									result = stmt.executeQuery(query);
									type = result.getString(2);
									%>
									document.getElementById("main").src = "red.jsp?accountType="+type;
									<%
								}	

									
							} catch (Exception e) {
								System.out.println("error");
							}
					}
					%>		
			}
		</script>
	</head>
	<body>
		<div id="header">
			<p id="loginText" onclick=showHide()>Log in</p>
			<div id="loginDiv">
			<form action="" method="get">
				Username:<br>
				<input type="text" name="userName" id="userTXT" maxlength="50"><br>
				Password:<br>
				<input type="password" name="password" id="passTXT" maxlength="50"><br>
				<input type="text" name="accountType" value="customer">
<!-- onClick=displayError("isFound")  -->				<input type="submit" onclick="javascript:test()"><br>
				<a href="register.jsp">Make an account</a>
				<p id="error"></p>
			</form>
			</div>
		</div>
		<hr>
		<iframe id="main" name="mainFrame" src="red.jsp">

		</iframe>

	</body>
</html>


