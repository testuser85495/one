<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Change password</title>
</head>
<style>

 .cp {
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
	height: 480px;
	width: 50%;
}

.main {
	display: flex;
	align-items: center;
	justify-content: center;
}

.scriptlet{
	color: red;
	font-size: 12px;
}
</style>
<body>
<!-- Start Header/Navigation -->
		 <!--  <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

			<div class="container">
				<a class="navbar-brand" href="index.html">Furni<span>.</span></a>

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsFurni">
					<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
						<li class="nav-item active">
							<a class="nav-link" href="index.jsp">Home</a>
						</li>
						<li><a class="nav-link" href="shop.jsp">Shop</a></li>
						<li><a class="nav-link" href="about.html">About us</a></li>
						<li><a class="nav-link" href="services.html">Services</a></li>
						<li><a class="nav-link" href="register.jsp">register</a></li>
						<li><a class="nav-link" href="login.jsp">login</a></li>
					</ul>

					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<li><a class="nav-link" href="#"><img src="images/user.svg"></a></li>
						<li><a class="nav-link" href="cart.html"><img src="images/cart.svg"></a></li>
					</ul>
				</div>
			</div>
				
		</nav> -->
		<!-- End Header/Navigation -->
<form action="Customercontroller" method="post">
		<div class="main">
			<div class="contain">
				<div class="">
					<div class="">
						<h2 style="text-align: center;">Change password</h2>
						<h5 class="scriptlet">
							<%
							
							String msg = (String) request.getAttribute("msg");
							String msg1 = (String) request.getAttribute("msg1");
							
							if (msg1 != null) {
								out.print(msg1);
							}
							%>
							<%
							if (msg != null) {
								out.print(msg);
							%>
							<%
							}
							%>
						</h5>
					</div>
					<div class="">
						<div class="form-group">
						 <input type="hidden" name="id" value="<%=c.getId()%>"> 
							<label class="text-black" for="lname">Old Password</label> <input
								type="text" class="form-control" name="op" id="lname"
								placeholder="Enter Old Password">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">New Password</label> <input
								type="password" class="form-control" name="np" id="lname"
								placeholder="Enter New Password">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Confirm Password</label> <input
								type="password" class="form-control" name="cp" id="lname"
								placeholder="Enter Confirm Password">
						</div>
					</div>
					<button type="submit" class="cp btn btn-primary-hover-outline"
						name="action" value="cp">Change Password</button>
					
				</div>
			</div>
		</div>
	</form>
</body>
</html>
<%@include file="footer.jsp"%>