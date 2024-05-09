<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller logout</title>
</head>
<body>
<%
session.removeAttribute("data");
session.invalidate();
response.sendRedirect("sell-login.jsp");
%>
</body>
</html>