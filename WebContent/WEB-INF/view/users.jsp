<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
<s:url var="url_css" value="static/css/style.css"></s:url>
<link href="${url_css}" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js" />
<script src="${url_jqlib}"></script>
<script>
            function changeStatus(uid, lstatus){
                //alert(userId+", "+loginStatus);
                $.ajax({
                    url:'admin_change_status',
                    data:{userId:uid, loginStatus:lstatus} ,
                    success: function (data) {  
                        alert(data);
                    }
                });
            }
        </script>
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
						<h3>Users List</h3>

					</div>
				</div> <input class="form-control" id="myInput" type="text"
				placeholder="Search to Filter Records..."> <br> <script>
						$(document).ready(function(){
 							 $("#myInput").on("keyup", function() {
 							   var value = $(this).val().toLowerCase();
  								  $("#myTable tr").filter(function() {
  							    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
  									  });
  								});
							});
			    </script>

				<table class="table table-bordered table-striped">
					<tr>
						<th>SR</th>
						<th>USER ID</th>
						<th>NAME</th>
						<th>PHONE</th>
						<th>EMAIL</th>
						<th>ADDRESS</th>
						<th>USERNAME</th>
						<th>STATUS</th>
					</tr>
					<c:forEach var="u" items="${userList}" varStatus="st">
						<tbody id="myTable">
							<tr>
								<td>${st.count}</td>
								<td>${u.userId}</td>
								<td>${u.name}</td>
								<td>${u.phone}</td>
								<td>${u.email}</td>
								<td>${u.address}</td>
								<td>${u.loginName}</td>
								<td><select id="id_${u.userId}"
									onchange="changeStatus(${u.userId},$(this).val())">
										<option value="1">Active</option>
										<option value="2">Block</option>
								</select> <script>
                                    $('#id_${u.userId}').val("${u.loginStatus}");
                                    </script> <%-- ${u.loginStatus} --%></td>
							</tr>
						</tbody>
					</c:forEach>
				</table></td>
		</tr>
		<tr>
			<td height="30px"><jsp:include page="include/footer.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>