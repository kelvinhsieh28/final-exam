<%@page pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.* "%>
<%@ page import = "java.sql.*"%>
<%
    if(session.getAttribute("Account") != null){            
        session.removeAttribute("Account");
        response.sendRedirect("index.jsp") ;
    }
    else{
        out.println("登出失敗") ;
    }
%>