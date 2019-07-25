<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Our Services</title>
<s:url var="url_css" value="static/css/style.css"></s:url>

<link href="${url_css}" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
.card {
	/* Add shadows to create the "card" effect */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	margin: 10px;
	padding: 20px;
	text-align: center;
}
/* On mouse-over, add a deeper shadow */
.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

input:invalid {
	border: 1px solid red;
}

textarea:invalid {
	border: 1px solid red;
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
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3>Our Services</h3>
					</div>
					<div class="panel-body">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#courses">Available
									Courses</a></li>
							<li><a data-toggle="tab" href="#exam">Exam Portal</a></li>
							<li><a data-toggle="tab" href="#training">Training
									Center</a></li>
							<li><a data-toggle="tab" href="#blog">Blogs</a></li>
						</ul>

						<div class="tab-content">
							<div id="courses" class="tab-pane fade in active">
								<h3 align="center">We Welcomes You</h3>
								<div class="container">
									<div class="row">
										<div class="col-md-4">
											<a href="#" style="text-decoration: none; color: black;">
												<div class="card" style="background-color: #75abc4">
													<h5>
														Paper 1:<br>Object Oriented Programming using Java
													</h5>
												</div>
											</a>
										</div>
										<div class="col-md-4">
											<a href="#" style="text-decoration: none; color: black;">
												<div class="card" style="background-color: #75abc4">
													<h5>
														Paper 2: <br>Client Server Programming using Java
													</h5>
												</div>
											</a>
										</div>
										<div class="col-md-4">
											<a href="#" style="text-decoration: none; color: black;">
												<div class="card" style="background-color: #75abc4">
													<h4>Web Component Developer</h4>
												</div>
											</a>
										</div>
										</a>
									</div>
									<div class="row">

										<div class="col-md-4">
											<a href="#" style="text-decoration: none; color: black;">
												<div class="card" style="background-color: #75abc4">
													<h5>Responsive Web Designing Paper 1</h5>
												</div>
											</a>
										</div>
										<div class="col-md-4">
											<a href="#" style="text-decoration: none; color: black;">
												<div class="card" style="background-color: #75abc4">
													<h5>Responsive Web Designing Paper 2</h5>
												</div>
											</a>
										</div>
										<div class="col-md-4">
											<a href="#" style="text-decoration: none; color: black;">
												<div class="card" style="background-color: #75abc4">
													<h4>PHP</h4>
												</div>
											</a>
										</div>
									</div>
									<div class="row">
										<a href="#" style="text-decoration: none; color: black;">
											<div class="col-md-3">
												<div class="card" style="background-color: #75abc4">
													<h4>Spring and Hibernate</h4>
												</div>
										</a>
									</div>
									<div class="col-md-3">
										<a href="#" style="text-decoration: none; color: black;">
											<div class="card" style="background-color: #75abc4">
												<h4>Android</h4>
											</div>
										</a>
									</div>
									<div class="col-md-3">
										<a href="#" style="text-decoration: none; color: black;">
											<div class="card" style="background-color: #75abc4">
												<h4>Manual Testing</h4>
											</div>
										</a>
									</div>
									<div class="col-md-3">
										<a href="#" style="text-decoration: none; color: black;">
											<div class="card" style="background-color: #75abc4">
												<h4>Selenium Webdriver</h4>
											</div>
										</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<a href="#" style="text-decoration: none; color: black;">
											<div class="card" style="background-color: #75abc4">
												<h4>SQL</h4>
											</div>
										</a>
									</div>
									<div class="col-md-6">
										<a href="#" style="text-decoration: none; color: black;">

											<div class="card" style="background-color: #75abc4">
												<h4>C Programming</h4>
											</div>
										</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<a href="#" style="text-decoration: none; color: black;">
											<div class="card" style="background-color: #75abc4">
												<h4>Aptitude Test</h4>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div id="exam" class="tab-pane fade">
							<h3>Welcome to our Technology</h3>
							<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
								laboris nisi ut aliquip ex ea commodo consequat.</p>
						</div>
						<div id="training" class="tab-pane fade">
							<h3>Becomes our Member</h3>
							<p>Sed ut perspiciatis unde omnis iste natus error sit
								voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
						</div>
						<div id="blog" class="tab-pane fade">
							<h3>Blogs</h3>
							<h5 align="right">
								<a href="/SpringContactAp/bloglist"><span
									class="label label-primary">VIEW BLOG</span></a>
							</h5>
							<c:forEach var="b" items="${blogList}">
								<div class="card" style="width: 50rem;">
									<div class="card-body">
										<h5 align="left" class="card-title">${b.log_title}</h5>
										<h6 align="left" class="card-subtitle mb-2 text-muted">Blog
											Number:${b.log_id}</h6>
										<p align="left" class="card-text">
											<i>${b.log_desc}</i>
										</p>
										<h2 align="left">
											<a href="#" class="card-link"><i
												class="glyphicon glyphicon-thumbs-up"></i></a>
										</h2>
									</div>
								</div>
							</c:forEach>
							<div class="panel panel-info">
								<!--<div class="panel heading"></div>-->
								<div class="panel-body">
									<h4>Express your Ideas</h4>
									<form method="post" action="/SpringContactAp/savelog"
										modelAttribute="command">
										<div class="container">
											<table>
												<tr>
													<div class="form-group">
														<td>Title</td>
														<td><input type="text" name="log_title"
															class="form-control" placeholder="Title here" required /></td>
													</div>
												</tr>
												<tr>
													<div class="form-group">
														<td>Description</td>
														<td><textarea name="log_desc" rows="4"
																class="form-control" placeholder="Descrie your Idea"
																required></textarea></td>
													</div>
												</tr>
												<tr>
													<td colspan="2"><button class="btn btn-primary">Add</button>
														<br>
													<br> <c:if test="${param.act eq 'svb'}">
															<p class="success">
																<i>Your Response is Submitted...</i>
															</p>
														</c:if></td>
												</tr>
											</table>
										</div>
									</form>
								</div>
							</div>
						</div>
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