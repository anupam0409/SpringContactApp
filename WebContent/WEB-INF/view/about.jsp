<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
<s:url var="url_css" value="static/css/style.css"></s:url>

<link href="${url_css}" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.fa {
  padding: 15px;
  font-size: 10px;
  width: 25px;
  text-align: center;
  text-decoration: none;
  margin: 10px 4px;
  border-radius: 50%;
}

.fa:hover {
    opacity: 0.7;
}

.fa-facebook {
  background: #3B5998;
  color: white;
}

.fa-twitter {
  background: #55ACEE;
  color: white;
}

.fa-google {
  background: #dd4b39;
  color: white;
}
</style>	
</head>
<s:url var="url_bg" value="static/images/bgImage.png"></s:url>
<body background="${url_bg}">
	<table border="1" align="center" width="80%">
		<tr>
			<td height="90px"><jsp:include page="include/header.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td><jsp:include page="include/menu.jsp"></jsp:include></td>
		</tr>
		<tr>
			<td height="500px">
				<div class="jumbotron text-center">
					<h2>About | Contact</h2>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-sm-4">
							<h3>Get In touch</h3>
							<form action="#">
							<h6 style="color: silver;">Provide your Email</h6>
							<input type="text">
							<button class="btn btn-primary">Subscribe</button>
							</form>
						</div>
						<div class="col-sm-4">
							<h3>Follw Us On!!</h3>
							<a href="#" class="fa fa-facebook"></a>
							<a href="#" class="fa fa-twitter"></a>
							<a href="#" class="fa fa-google"></a>
						</div>
						<div class="col-sm-4">
							<h3>Ping Me</h3>
							<h5><i class="glyphicon glyphicon-earphone"></i>  +917208943875</h5>
							<h5><i class="glyphicon glyphicon-envelope"></i>  anupamv20@gmail.com</h5>
							<h5><i class="glyphicon glyphicon-phone-alt"></i>  022-85858588</h5>
							
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td height="30px"><jsp:include page="include/footer.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>