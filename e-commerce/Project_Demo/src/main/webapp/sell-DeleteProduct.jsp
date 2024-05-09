<%@page import="doa.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Product</title>
</head>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	ProductDAO.Deleteproduct(id);
	response.sendRedirect("sell-home.jsp");
	%>
</body>
</html>