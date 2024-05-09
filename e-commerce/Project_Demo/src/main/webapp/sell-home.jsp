<%@page import="doa.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="sell-header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Home page</title>
</head>
<style>
.table {
	margin-bottom: 10rem;
}

.footer-section {
	padding: 100px 0; 
	background: #ffffff;
}
/* .mar{margin-bottom: 200px;} */
</style>
<body>
	<%
	seller sell = null;
	if (session.getAttribute("data") != null) {
		sell = (seller) request.getAttribute("data");
	} else {
		response.sendRedirect("sell-login.jsp");
	}
	%>
	<h2>
		<center>Seller product</center>
	</h2>
	<table class="table tbl mar">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Image</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Description</th>
				<th scope="col">Edit</th>
				<th scope="col">Delete</th>
			</tr>
		</thead>

		<tbody >
			<%
			List<Product> list = ProductDAO.getallproduct(s.getId());
			%>
			
			<%
			for (Product p1 : list) {
			%>
			<tr>
				<td>
					<h5><%=p1.getPname()%></h5>
				</td>
				<td>
					<div class="media">
						<div class="d-flex">
							<img src="image/<%=p1.getPimage()%>" width="50" height="50" />
						</div>
					</div>
				</td>

				<td>
					<h5> <%=p1.getPprice()%> <span>&#8377; </span></h5>
				</td>
				<td>
					<h5><%=p1.getPcategory()%></h5>
				</td>
				<td>
					<h5><%=p1.getPdesc()%></h5>
				</td>
				<td><a class="btn" href="sell-EditProduct.jsp?id=<%=p1.getPid()%>">Edit</a></td>
				<td><a class="btn" href="sell-DeleteProduct.jsp?id=<%=p1.getPid()%>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>
<%-- <%@include file="footer.jsp"%> --%>
