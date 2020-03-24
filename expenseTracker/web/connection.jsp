<%-- 
    Document   : connection
    Created on : Mar 20, 2020, 7:33:15 PM
    Author     : spino
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cbse?zeroDateTimeBehavior=convertToNull","root", "");
            Statement st = conn.createStatement();
        %>
        <p> Connected Succesfully </p>
        <%
        } catch (Exception e) {
        %>
            <p> Unsuccesfull connection </p>
        <%
            out.println("The error is " + e);
        }
        %>
    </body>
</html>
