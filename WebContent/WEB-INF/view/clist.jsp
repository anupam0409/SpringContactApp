<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Members List</title>
<s:url var="url_css" value="static/css/style.css"></s:url>
<link href="${url_css}" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js" />
<script src="${url_jqlib}"></script>
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
						<h3>Members List</h3>
					</div>
				</div> <c:if test="${param.act eq 'sv' }">
					<p class="success">Saved Successfully</p>
				</c:if><c:if test="${param.act eq 'del' }">
					<p class="success">Deleted Successfully</p>
				</c:if> 
				<c:if test="${param.act eq 'ed' }">
					<p class="success">Record Updated Successfully</p>
				</c:if><%-- <form align="right" action="<s:url value="/contact_search"></s:url>">
				<input text="text" name="freeText" value="${param.freeText}" placeholder="search here">
				<button>Search</button>
				</form> --%> <%-- <form action="<s:url value="/ubulk_del"></s:url>">
				<button>Delete Selected Record</button>
				<br> --%> <input class="form-control" id="myInput" type="text"
				placeholder="Search to Filter Records..."> <script>
				$(document).ready(function(){
  					$("#myInput").on("keyup", function() {
   						 var value = $(this).val().toLowerCase();
   							 $("#myTable tr").filter(function() {
    							  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    						});
  						});
					});
					</script> <br> <br>
				<table class="table table-bordered table-striped">
					<tr>
						<th>SR NO</th>
						<th>CID</th>
						<th>NAME</th>
						<th>PHONE</th>
						<th>EMAIL</th>
						<th>ADDRESS</th>
						<th>REMARK</th>
						<th>ACTION</th>
					</tr>
					<c:if test="${empty contactList}">
						<tr>
							<td align="center" colspan="8" class="error">NO RECORDS</td>
						</tr>
					</c:if>
					<c:forEach var="c" items="${contactList}" varStatus="st">
						<tbody id="myTable">
							<tr>
								<td><input type="checkbox" name="cid" value="${contactId}" />	| ${st.count}</td>
								<td>${c.contactId}</td>
								<td>${c.name}</td>
								<td>${c.phone}</td>
								<td>${c.email}</td>
								<td>${c.address}</td>
								<td>${c.remark}</td>
								<s:url var="url_edit" value="/uedit_contact">
									<s:param name="cid" value="${c.contactId}"></s:param>
								</s:url>
								<s:url var="url_del" value="/udel_contact">
									<s:param name="cid" value="${c.contactId}"></s:param>
								</s:url>
								<td><a href="${url_edit}"><i title="edit" class="glyphicon glyphicon-edit"></i></a> | <a href="${url_del}"><i title="delete" class="glyphicon glyphicon-trash"></i></a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table> <!-- </form> -->
			</td>
		</tr>
		<tr>
			<td height="30px"><jsp:include page="include/footer.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>