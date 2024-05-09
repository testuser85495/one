<%@page import="doa.ProductDAO"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>.mt{margin-top:10px; ;}
.pt{padding: 10px;}
</style>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("pid"));
	Product p = ProductDAO.GetProductById(id);
	%>

	<div class="services-area2 pt-50">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="row">
						<div class="col-xl-12">

							<div class="single-services d-flex align-items-center mb-9 mt ">
								<div class="features-img pt">
									<img src="image/<%=p.getPimage()%>" height=" 250px;" width="250px;">
								</div>
								<table class="table table-success table-striped">
									<thead>
										<tr>
											<th scope="col">Product Name</th>
											<td><%=p.getPname()%></td>
										</tr>
										<tr>
											<th scope="col">Product Price</th>
											<td><%=p.getPprice()%> <span>&#8377;</span></td>
										</tr>
										<tr>
											<th scope="col">Product Description</th>
											<td><%=p.getPdesc()%></td>
										</tr>
										<tr>
											<th scope="col">Product Category</th>
											<td><%=p.getPcategory()%></td>
										</tr>
										<tr>
											<th scope="col"></th>
											<td><a href="#" class="btn btn primary">Add to Cart</a></td>
										</tr>
									</thead>

								</table>
								
							</div>
						</div>

					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@include file="footer.jsp"%>