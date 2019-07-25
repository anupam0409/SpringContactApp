<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Merchant Page</title>
<s:url var="url_css" value="static/css/style.css"></s:url>
<link href="${url_css}" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>	
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
						<h3 align="center">Login!! If Already Registered</h3>
					</div>
					<div class="panel-body">
						<c:if test="${err!=null}">
							<p style="font-size:18px;" class="error">${err}</p>
						</c:if>
						<c:if test="${param.act eq 'lo'}">
							<p style="font-size:18px;" class="success">Logout Successfully !! Must Visit Again   <i class="far fa-smile"></i></p>
						</c:if>
						<c:if test="${param.act eq 'reg'}">
							<p style="font-size:18px;" class="success">Registered Successfully !! Please Login..</p>
						</c:if>
						<s:url var="url_login" value="/login"></s:url>
						<f:form action="${url_login}" modelAttribute="command">
							<div class="container">
								<table align="center">
									<tr>
										<div class="form-group">
											<td>Username</td>
											<td><f:input path="loginName" class="form-control" required="required"/></td>
										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td>Password</td>
											<td><f:password path="password" class="form-control" required="required"/></td>
										</div>
									</tr>
									<tr>
										<td colspan="2"><button class="btn btn-primary">Login</button>
											<a href="<s:url value="/reg_form"></s:url>
											">New User Register?</a></td>
									</tr>
								</table>
							</div>
						</f:form>
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