<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Form Page</title>
<s:url var="url_css" value="static/css/style.css"></s:url>
<link href="${url_css}" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
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
						<h3 align="center">Members filling Form</h3>
					</div>
					<div class="panel-body">
						<c:if test="${err!=null}">
							<p class="error">${err}</p>
						</c:if>
						<s:url var="url_csave" value="/usave_contact"></s:url>
						<f:form action="${url_csave}" modelAttribute="command">
							<div class="container">
								<table align="center">
									<tr>
										<div class="form-group">
											<td>Name</td>
											<td><f:input class="form-control" path="name" required="required"/></td>
										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td>Phone</td>
											<td><f:input class="form-control" path="phone" required="required"/></td>
										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td>Email</td>
											<td><f:input class="form-control" path="email" required="required"/></td>
										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td>Address</td>
											<td><f:textarea class="form-control" path="address" required="required"/></td>
										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td>Remarks</td>
											<td><f:textarea class="form-control" rows="4"
													path="remark" required="required"/></td>
										</div>
									</tr>
									<tr>
										<td colspan="2"><button class="btn btn-primary">Save</button></td>
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