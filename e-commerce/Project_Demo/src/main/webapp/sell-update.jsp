<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="sell-header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell update</title>
</head>
<style>
.update {
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
</style>
<body>
	<form action="Sellercontroller" method="post">
		<div class="main">
			<div class="contain">
				<div class="">
					<div class="">
						<h2 style="text-align: center;">Update Form</h2>
						<div class="form-group">
						<input type="hidden" name="id" value="<%=s.getId()%>">
							<label class="text-black" for="fname">Name</label> <input
								type="text" class="form-control" name="name" id="fname"
								value="<%=s.getName()%>">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Email</label> <input
								type="email" class="form-control" name="email" id="lname"
								value="<%=s.getEmail()%>">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Contact</label> <input
								type="text" class="form-control" name="contact" id="lname"
								value="<%=s.getContact()%>">
						</div>
					</div>
					<div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Address</label> <input
								type="text" class="form-control" name="address" id="lname"
								value="<%=s.getAddress() %>">
						</div>
					</div>
					<%-- <div class="">
						<div class="form-group">
							<label class="text-black" for="lname">Password</label> <input
								type="password" class="form-control" name="password" id="lname"
								<%=c.getPassword() %>>
						</div>
					</div> --%>

					<input type="submit" class="update btn btn-primary-hover-outline"
						name="action" value="update">
				</div>
			</div>
		</div>
	</form>
</body>
</html>
<%@include file="footer.jsp"%>