<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Registation Form</title>
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
	height: 480px;
	width: 50%;
}

.main {
	display: flex;
	align-items: center;
	justify-content: center;
}
.reg{margin-top: 20px;}
.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown-content {
	 display: none; 
    position: absolute;
    background-color: #3b5d50;
    min-width: 200px;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    padding: 11px ;
    z-index: 10;
    /* margin-left: 0px; */
}

.dropdown {
	position: relative;
	display: inline-block;
}

</style>
<body>
<!-- Start Header/Navigation -->
		  <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

			<div class="container">
				<a class="navbar-brand" href="index.html">Furni<span>.</span></a>

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsFurni">
					<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
						<li class="nav-item ">
							<a class="nav-link" href="index.jsp">Home</a>
						</li>
						<!-- <li><a class="nav-link" href="shop.jsp">Shop</a></li> -->
						<!-- <li><a class="nav-link" href="about.html">About us</a></li> -->
						<!-- <li><a class="nav-link" href="services.html">Services</a></li> -->
						
						<div class="dropdown">
						<li><a class="nav-link" href="#">Login</a></li>
							<div class="dropdown-content">
								<ul type="none">
									<li><a href="login.jsp" style="text-decoration: none;">cust-login</a></li>
								</ul>
								<ul type="none">
									<li><a href="sell-login.jsp" style="text-decoration: none;">sell-login</a></li>
								</ul>
							</div>
					</div>
						
						
						
						<div class="dropdown">
						<li><a class="nav-link" href="#">Register</a></li>
							<div class="dropdown-content">
								<ul type="none">
									<li><a href="register.jsp" style="text-decoration: none;">cust-Register</a></li>
								</ul>
								<ul type="none">
									<li><a href="sell-register.jsp" style="text-decoration: none;">sell-Register</a></li>
								</ul>
							</div>
					</div>
						
						
						
						
						<!-- <li><a class="nav-link" href="register.jsp">register</a></li>
						<li><a class="nav-link" href="login.jsp">login</a></li> -->
					</ul>

					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<li><a class="nav-link" href="#"><img src="images/user.svg"></a></li>
						<li><a class="nav-link" href="cart.html"><img src="images/cart.svg"></a></li>
					</ul>
				</div>
			</div>
				
		</nav>
		<!-- End Header/Navigation -->
	<form action="Sellercontroller" method="post">
		<div class="main">
			<div class="contain">
				<div class="">
					<div class="">
						<h2 style="text-align: center;">Seller Registation</h2>
						<div class="form-group">
							<label class="text-black" for="fname">Name</label> <input
								type="text" class="form-control" name="name" id="fname"
								placeholder="Enter Your Name">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Email</label> <input
								type="email" class="form-control" name="email" id="lname"
								placeholder="Enter Your Email">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Contact</label> <input
								type="text" class="form-control" name="contact" id="lname"
								placeholder="Enter Your Contact">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Address</label> <input
								type="text" class="form-control" name="address" id="lname"
								placeholder="Enter Your Address">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Password</label> <input
								type="password" class="form-control" name="password" id="lname"
								placeholder="Enter Your Password">
						</div>
					</div>

					<input type="submit" class="btn btn-primary-hover-outline"
						name="action" value="Register">
						
						<h4 class="reg">Do You have Account? <a href="sell-login.jsp">Login</a></h4>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
<%@include file="footer.jsp"%>