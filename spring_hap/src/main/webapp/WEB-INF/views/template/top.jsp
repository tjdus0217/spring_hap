<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>

<c:choose>
	<c:when test="${not empty sessionScope.member_id && sessionScope.member_grade== 'H'}">
		<c:set var="str">관리자페이지입니다.</c:set>
	</c:when>
	<c:when test="${not empty sessionScope.member_id && sessionScope.member_grade!= 'H'}">
		<c:set var="str">안녕하세요. ${sessionScope.member_id }님!</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">기본페이지</c:set>
	</c:otherwise>

</c:choose>


<!DOCTYPE HTML>

<html>
<head>
<title>HAP Team project</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${root}/assets/css/main.css" />

<script src="${root}/assets/js/jquery.min.js"></script>
<script src="${root}/assets/js/skel.min.js"></script>
<script src="${root}/assets/js/util.js"></script>
<script src="${root}/assets/js/main.js"></script>

</head>
<body class="landing">

	<!-- Header -->
	<header id="header" class="alt">
		<h1>
			<strong><a href="index.jsp">HAP</a></strong> Team project
		</h1>
		<nav id="nav">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="">Board</a></li>
				<li><a href="">Reservation</a></li>
				<li><a href="">Notice</a></li>
				
				<c:choose>
				<c:when test="${empty sessionScope.member_id }">

					<li><a href="${root}/member_hap/login">Sign-in</a></li>
				    <li><a href="${root}/member_hap/agree">Join</a></li>

				</c:when>

				<c:otherwise>
					
					<li><a href="${root}/member_hap/member_read">Profile</a></li>
					<li><a href="${root}/member_hap/member_update">Update</a></li>
					<li><a href="${root}/member_hap/logout">Sign-out</a></li>
				</c:otherwise>
			</c:choose>
				

			</ul>
		</nav>
	</header>

	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Banner -->
	<section id="banner">
		<h2>Logo</h2>
		<p>
			Logo자리 <br /> 간단 사이트 설명?
		</p>
		<ul class="actions">
			<li><a href="#" class="button special big">지역검색</a></li>
		</ul>
	</section>
	

</body>
</html>