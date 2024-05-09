<%@page import="model.Product"%>
<%@page import="model.seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<link href="css/tiny-slider.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

<!-- Popper.js -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>

<!-- Bootstrap JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

<title></title>
<style>
.tblset {
	overflow-x: scroll;
	font: -webkit-control;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #3b5d50;
	min-width: max-content; /* 200px; */
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
	<script type="text/javascript">
		$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').trigger('focus');
		});
	</script>
	<%
	seller s = null;
	if (session.getAttribute("data") != null) {
		s = (seller) session.getAttribute("data");
	} else {
		response.sendRedirect("sell-login.jsp");
	}
	%>
	<%-- <%
	Product p = null;
	if (session.getAttribute("data") != null) {
		p = (Product) session.getAttribute("data");
	} else {
		response.sendRedirect("sell-login.jsp");
	}
	%>
 --%>

	<!-- Start Header/Navigation -->
	<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark"
		arial-label="Furni navigation bar">

		<div class="container">
			<a class="navbar-brand" href="sell-home.jsp">Furni<span>.</span></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
				aria-controls="navbarsFurni" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsFurni">
				<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link" href="sell-home.jsp">Home</a></li>
					<!-- <li><a href="#">Register <i class="fas fa-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="seller-registration.jsp">As Seller</a></li>
											<li><a href="customer-registration.jsp">As Customer</a></li>
										</ul></li> -->
					<div class="dropdown">
						<li><a class="nav-link" href="#">Product</a></li>
						<div class="dropdown-content">
							<ul type="none">
								<li><a href="sell-uploadproduct.jsp" style="text-decoration: none;">Upload Product</a></li>
							</ul>
							<ul type="none">
								<li><a href="#" style="text-decoration: none;">product</a></li>
							</ul>
						</div>
					</div>

					<li><a class="nav-link" href="#">About us</a></li>
					<!-- <div class="dropdown">
						<li><a class="nav-link" href="about.html">other</a>
							<div class="dropdown-content">
								<ul type="none">
									<li style="margin-left: 0px;"><a href="#" style="text-decoration: none;">cust-login</a></li>
								</ul>
								<ul type="none">
									<li style="margin-left: 0px;"><a href="#"
										style="text-decoration: none;">sell-login</a></li>
								</ul>
							</div></li>
					</div> -->
					<!-- <li><a class="nav-link" href="services.html">Services</a></li> -->
					<%-- <%
					if (c == null) {
					%>
					<li><a class="nav-link" href="login.jsp">Login</a></li>
					<li><a class="nav-link" href="register.jsp">Register</a></li>
					<%
					} else {
					%> --%>

					<%-- <li><a class="nav-link" href="#">Welcome : <%=c.getName()%></a></li> --%>
					<li><a class="nav-link" href="sell-logout.jsp">Logout</a></li>
					<%-- <%
					}
					%> --%>
				</ul>

				<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
					<%-- <%
					if (c == null) {
						response.sendRedirect("login.jsp");
					%>

					<%
					} else {
					%> --%>
					<li><a class="nav-link" data-toggle="modal"
						data-target="#exampleModal" href="#"><img
							src="images/user.svg"></a>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">
											Welcome :
											<%=s.getName()%>
										</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body tblset">
										<table class="table">
											<thead>
												<tr>
													<th scope="col">Id</th>
													<th scope="col">Name</th>
													<th scope="col">Email</th>
													<th scope="col">Contact</th>
													<th scope="col">Address</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<!-- <th scope="row">1</th> -->
													<td><%=s.getId()%></td>
													<td><%=s.getName()%></td>
													<td><%=s.getEmail()%></td>
													<td><%=s.getContact()%></td>
													<td><%=s.getAddress()%></td>
												</tr>
											</tbody>
										</table>

									</div>
									<div class="modal-footer">
										<div class="">
											<div class="btn btn-secondary">
												<a href="sell-changepassword.jsp"
													style="text-decoration: none;">Change password</a>
											</div>
										</div>
										<form action="Customercontroller" method="post">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<a href="sell-update.jsp" class="btn btn-primary">Edit</a>
										</form>
									</div>
								</div>
							</div>
						</div></li>
					<%-- <%
					}
					%> --%>
					<li><a class="nav-link" href="cart.html"><img
							src="images/cart.svg"></a></li>
				</ul>
			</div>
		</div>

	</nav>
	<!-- End Header/Navigation -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/tiny-slider.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>