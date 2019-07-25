<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Merchant PORTAL</a>
		</div>
		<c:if test="${sessionScope.userId == null}">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<s:url value="/index"></s:url>"><span
						class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="<s:url value="/about"></s:url>">About</a></li>
				<li><a href="<s:url value="/service"></s:url>">Services</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<s:url value="/reg_form"></s:url>"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="<s:url value="/index"></s:url>"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</c:if>
		<c:if test="${sessionScope.userId != null && sessionScope.role == 1}">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="<s:url value="/admin_dashboard"></s:url>"><span
						class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="<s:url value="/admin_users"></s:url>">User
						List</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<s:url value="/reg_form"></s:url>"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown">Hii ${sessionScope.loginName} <span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li class="dropdown-item"><a
							href="<s:url value="/changepass"></s:url>"><span
								class="glyphicon glyphicon-lock"></span> Change Password</a></li>
						<li class="dropdown-item"><a
							href="<s:url value="/logout"></s:url>"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</ul></li>
			</ul>
		</c:if>
		<c:if test="${sessionScope.userId != null && sessionScope.role == 2}">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="<s:url value="/user_dashboard"></s:url>"><span
						class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="<s:url value="/user_contact_form"></s:url>">Add
						Member</a></li>
				<li><a href="<s:url value="/clist"></s:url>">Members List</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<s:url value="/reg_form"></s:url>"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown">Hii ${sessionScope.loginName} <span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li class="dropdown-item"><a
							href="<s:url value="/changepass"></s:url>"><span
								class="glyphicon glyphicon-lock"></span> Change Password</a></li>
						<li class="dropdown-item"><a
							href="<s:url value="/logout"></s:url>"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</ul></li>
			</ul>
		</c:if>

	</div>
</nav>
