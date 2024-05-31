<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	response.setHeader("Access-Control-Allow-Origin","*");

	String userEmail = request.getParameter("useremail");
	String userId = request.getParameter("userId");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String userCallname = request.getParameter("userName");
	System.out.println(userEmail);
	System.out.println(userId);
	System.out.println(userPassword);
	System.out.println(userName);
	System.out.println(userCallname);

	String DRIVER_CLASS_NAME = "org.mariadb.jdbc.Driver";
	String URL = "jdbc:mariadb://localhost:3306/project";
	String USERNAME = "root";
	String PASSWORD = "4321";

	Class.forName(DRIVER_CLASS_NAME);
	Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

	String sql = "insert into joinup (id, userEmail, userId, userPassword, userName, userCallname) values (null, ?, ?, ?, ?, ?)";

	PreparedStatement stmt = con.prepareStatement(sql);;
	stmt.setString(1, userEmail);
	stmt.setString(2, userId);
	stmt.setString(3, userPassword);
	stmt.setString(4, userName);
	stmt.setString(5, userCallname);
	int result = stmt.executeUpdate();
	
	stmt.close();
	con.close();
	
	
	out.println("{\"msg\": \"가입완료\", \"code\": 200}");
%>
















