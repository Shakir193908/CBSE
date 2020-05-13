<%-- 
    Document   : connection
    Created on : Mar 20, 2020, 7:33:15 PM
    Author     : spino
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
            //aq punya sql password 1234, korg tukar la ikut password sql korg
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cbse?zeroDateTimeBehavior=convertToNull","root", "1234");
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
<%-- 
    Document   : connection
    Created on : May 9, 2020, 1:09:59 PM
    Author     : Shakir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
