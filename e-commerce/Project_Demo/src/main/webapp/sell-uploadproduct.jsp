<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="sell-header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller upload product</title>
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
</head>

<body>
	<form action="Productcontroller" method="post"
		enctype="multipart/form-data">
		<div class="main">
			<div class="contain">
				<div class="">
					<div class="">
						<h2 style="text-align: center;">upload Product</h2>
						<input type="hidden" name="sid" value="<%=s.getId()%>">
						<div class="form-group">
							<label class="text-black" for="fname">Image</label> <input
								type="file" class="form-control" name="image" id="fname">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Name</label> <input
								type="text" class="form-control" name="name" id="lname"
								placeholder="Enter product name">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Price</label> <input
								type="text" class="form-control" name="price" id="lname"
								placeholder="Enter Product Price">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Category</label> <input
								type="text" class="form-control" name="category" id="lname"
								placeholder="Enter Category">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Description</label> <input
								type="text" class="form-control" name="desc" id="lname"
								placeholder="Enter description">
						</div>
					</div>

					<input type="submit" class="btn btn-primary-hover-outline"
						name="action" value="upload product">

				</div>
			</div>
		</div>
	</form>
</body>
</html>