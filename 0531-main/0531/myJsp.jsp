<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    response.setHeader("Access-Control-Allow-Origin","*");

    String selectedSeatInfo = request.getParameter("selectedSeatInfo");
    String totalPrice = request.getParameter("totalPrice");
    


    System.out.println(selectedSeatInfo);
    System.out.println(totalPrice);
    

    String DRIVER_CLASS_NAME = "org.mariadb.jdbc.Driver";
    String URL = "jdbc:mariadb://localhost:3306/vgc";
    String USERNAME = "root";
    String PASSWORD = "4321";

    Class.forName(DRIVER_CLASS_NAME);
    Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

    String sql = "INSERT INTO ticketing (ticketingId, seat, price) VALUES (null, ?, ?)";

    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setString(1, selectedSeatInfo);
    stmt.setString(2, totalPrice);

    int result = stmt.executeUpdate();
    
    stmt.close();
    con.close();
    
    ObjectMapper om = new ObjectMapper();
    Map<String, Object> map = new HashMap<>();
    map.put("code", 200);
    map.put("msg", "성공");
    List<String> list = new ArrayList<>();
    list.add("A");
    
    map.put("list", list);
    
    out.println(om.writeValueAsString(map));
    
//     out.println("{\"code\": 200, \"msg\": \"성공\"}");
    
%>






















