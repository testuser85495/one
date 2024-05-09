<%@page import="java.util.List"%>
<%@page import="doa.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="sell-header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
</head>
<style>
.btn {
	margin-top: 20px;
	width: 100%;
}

.form-control {
	height: 35px;
	border-radius: 10px;
	font-family: "Inter", sans-serif;
}

.contain {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 500px;
	width: 50%;
}

.main {
	display: flex;
	align-items: center;
	justify-content: center;
}

.reg {
	margin-top: 20px;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #3b5d50;
	min-width: 200px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 11px;
	z-index: 10;
	/* margin-left: 0px; */
}

.dropdown {
	position: relative;
	display: inline-block;
}
</style>
<body>
<%int id = Integer.parseInt(request.getParameter("id")); %>
<%Product  p = ProductDAO.GetProductById(id); %>
	<form action="Productcontroller" method="post"
		enctype="multipart/form-data">
		<div class="main">
			<div class="contain">
				<div class="">
					<div class="">
						<h2 style="text-align: center;">Update Product</h2>
						<input type="hidden" name="sid" value="<%=p.getPid()%>">
						<div class="form-group">
						<img src="image/<%=p.getPimage()%>" height="200" width="200">
							<label class="text-black" for="fname">Image</label> <input
								type="file" class="form-control" name="image" id="fname"<%-- value="image/<%=pro.getPimage()%>" --%>>
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Name</label> <input
								type="text" class="form-control" name="name" id="lname" value="<%=p.getPname()%>"/>
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Price</label> <input
								type="text" class="form-control" name="price" id="lname" value="<%=p.getPprice()%>" >
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Category</label> <input
								type="text" class="form-control" name="category" id="lname" value="<%=p.getPcategory()%>" >
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Description</label> <input
								type="text" class="form-control" name="desc" id="lname" value="<%=p.getPdesc()%>" >
						</div>
					</div>

					<input type="submit" class="btn btn-primary-hover-outline"
						name="action" value="update product">

				</div>
			</div>
		</div>
	</form>
</body>
</html>