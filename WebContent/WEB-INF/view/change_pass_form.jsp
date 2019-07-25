<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change your Password</title>
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
						<h3 align="center">Change Password</h3>
					</div>
					<div class="panel-body">
					<c:if test="${err!=null}">
							<p class="error">${err}</p>
						</c:if>
						<s:url var="url_psave" value="/savepass"></s:url>
						<f:form action="${url_psave}" modelAttribute="command">
						<div class="container">
							<table align="center">
								<tr>
									<div class="form-group">
										<td>Old Password</td>
										<td><f:input class="form-control" id="oldpass"
												name="oldpassword" type="password" path="password"
												required="required" /></td>
									</div>
								</tr>
								<tr>
									<div class="form-group">
										<td>New Password</td>
										<td><f:input class="form-control" id="pass"
												name="password" type="password" path="password"
												required="required" /></td>
									</div>
								</tr>
								<tr>
									<div class="form-group">
										<td>Confirm Password</td>
										<td><f:input class="form-control" id="passConfirm"
												type="password" path="password" required="required" /><span
											id="error" style="display: none">Password mismatch</span></td>
									</div>
								</tr>
								<tr>
									<td colspan="2"><button type="submit" onclick="savePass()"
											class="btn btn-primary">Change</button>
								</tr>
								</div>
							</table>
						</div>
						</f:form>
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