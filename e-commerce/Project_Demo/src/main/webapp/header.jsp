<%@page import="doa.Cartdoa"%>
<%@page import="model.cart"%>
<%@page import="model.WishList"%>
<%@page import="doa.WishLIstDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Customer"%>
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

sup {
	color: white;
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
	Customer c = null;
	if (session.getAttribute("data") != null) {
		c = (Customer) session.getAttribute("data");
	} else {
		response.sendRedirect("login.jsp");
	}
	%>


	<!-- Start Header/Navigation -->
	<nav
		class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark"
		arial-label="Furni navigation bar">

		<div class="container">
			<a class="navbar-brand" href="index.jsp">Furni<span>.</span></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
				aria-controls="navbarsFurni" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsFurni">
				<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
					<!-- <li><a href="#">Register <i class="fas fa-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="seller-registration.jsp">As Seller</a></li>
											<li><a href="customer-registration.jsp">As Customer</a></li>
										</ul></li> -->
					<li><a class="nav-link" href="shop.jsp">Shop</a></li>
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
					<li><a class="nav-link" href="logout.jsp">Logout</a></li>
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
											<%=c.getName()%>
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
													<td><%=c.getId()%></td>
													<td><%=c.getName()%></td>
													<td><%=c.getEmail()%></td>
													<td><%=c.getContact()%></td>
													<td><%=c.getAddress()%></td>
												</tr>
											</tbody>
										</table>

									</div>
									<div class="modal-footer">
										<div class="">
											<div class="btn btn-secondary">
												<a href="changepassword.jsp" style="text-decoration: none;">Change
													password</a>
											</div>
										</div>
										<form action="Customercontroller" method="post">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<a href="update.jsp" class="btn btn-primary">Edit</a>
										</form>
									</div>
								</div>
							</div>
						</div></li>
					<%-- <%
					}
					%> --%>
					<%
					List<WishList> wlist = WishLIstDAO.getWishListByCusId(c.getId());
					%>
					<li><a class="nav-link" href="wishlist.jsp"><i class="fa-regular fa-heart fa-xl" style="color: #ffffff;"></i><sup>
								<%
								out.print(wlist.size());
								%>
						</sup></a></li>
					<%List<cart> clist = Cartdoa.getCartBycustId(c.getId());%>
						
					<li><a class="nav-link" href="cart.jsp"><img src="images/cart.svg"><sup>
								<%
								out.print(clist.size());
								%>
						</sup></a></li>

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