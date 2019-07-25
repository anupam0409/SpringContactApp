<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
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
			<td height="500px"><div class="panel panel-info">
					<div class="panel-heading">
						<h3>Welcome Administrator</h3>
					</div>
				</div></td>
		</tr>
		<tr>
			<td height="30px"><jsp:include page="include/footer.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>