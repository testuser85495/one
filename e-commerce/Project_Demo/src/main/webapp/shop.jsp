<%@page import="doa.Customerdoa"%>
<%@page import="doa.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<link href="css/tiny-slider.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<title>Shopping</title>
</head>

</head>
<style>


.pt {
	float: right;
}
</style>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable a").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script> -->
<body>
	<%
	List<Product> list = ProductDAO.AllProductlist();
	%>
	<!-- Start Hero Section -->
	<div class="hero">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-5">
					<div class="intro-excerpt">
						<h1>Shop</h1>
					</div>
				</div>
				<div class="col-lg-7"></div>
			</div>
		</div>
	</div>
	<!-- End Hero Section -->



	<div class="untree_co-section product-section before-footer-section">
		<div class="container">
			<div class=" row">
			<!-- <input id="myInput" type="text" placeholder="Search.."> -->
				<%
				for (Product p1 : list) {
				%>

				<!-- Start Column 1 -->
				<div class="col-12 col-md-4 col-lg-3 mb-5" id="myTable">
					<a class="product-item"
						href="product-detail.jsp?pid=<%=p1.getPid()%>"> 
						<img src="image/<%=p1.getPimage()%>" class="img-fluid product-thumbnail">
						<h3 class="product-title"><%=p1.getPname()%></h3> 
						<strong class="product-price"><%=p1.getPprice()%> &#8377;</strong>
					</a> 
						<span> 
						<%Boolean flag = WishLIstDAO.checkWishItem(p1.getPid(), c.getId()); %>
						<%if(flag == false){ %>
						   <a href="WishListController?action=addtowishlist&cusid=<%=c.getId()%>&pid=<%=p1.getPid()%>"><i class="fa-regular fa-heart fa-2xl"></i></a>
					    <%} %>
					    </span> 
					    <%Boolean flag1 = Cartdoa.checkCartItem(p1.getPid(), c.getId()); %>
					    <%if(flag1 == false){ %>
					    <span class="pt"> 
					       <a href="CartController?action=addtocart&cid=<%=c.getId()%>&pid=<%=p1.getPid()%>"><i class="fa-solid fa-cart-plus fa-2xl"></i></a>
					    </span>
					    <%} %>
				</div>
				<!-- End Column 1 -->
				<%
				}
				%>


			</div>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/tiny-slider.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>
<%@include file="footer.jsp"%>