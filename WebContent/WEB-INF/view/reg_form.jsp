<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration Page</title>
<s:url var="url_css" value="static/css/style.css"></s:url>


<link href="${url_css}" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="<s:url value="static/js/reg_validation.js"></s:url>"></script>
<style type="text/css">
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
						<h3 align="center">User Registration Form</h3>
					</div>
					<div class="panel-body">

						<c:if test="${err!=null}">
							<p class="error">${err}</p>
						</c:if>
						<s:url var="url_reg" value="/register"></s:url>
						<f:form action="${url_reg}" method="post" modelAttribute="command">
							<div class="container">
								<table align="center">
									<tr>
										<div class="form-group">
											<td>Name</td>
											<td><f:input class="form-control" path="user.name"
													required="required" /></td>
											<td><f:errors path="user.name" cssClass="error" /></td>

										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td>Phone</td>
											<td><f:input class="form-control" path="user.phone"
													required="required" /></td>
											<td><f:errors path="user.phone" cssClass="error" /></td>

										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td>Email</td>
											<td><f:input class="form-control" path="user.email"
													required="required" /></td>
											<td><f:errors path="user.email" cssClass="error" /></td>

										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td>Address</td>
											<td><f:textarea class="form-control" rows="3"
													path="user.address" name="address" required="required" /></td>
											<td><f:errors path="user.address" cssClass="error" /></td>

										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td>Username</td>
											<td><f:input class="form-control" path="user.loginName"
													name="username" required="required" /></td>
											<td><f:errors path="user.loginName" cssClass="error" /></td>

										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td>Password</td>
											<td><f:password class="form-control"
													path="user.password" name="passid" required="required" /></td>
											<td><f:errors path="user.password" cssClass="error" /></td>

										</div>
									</tr>
									<tr>
										<td colspan="2"><button type="submit"
												class="btn btn-primary">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="reset" class="btn btn-warning">Reset</button></td>
									</tr>
									</div>
								</table>
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