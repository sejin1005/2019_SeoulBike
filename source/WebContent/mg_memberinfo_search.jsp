<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>서울자전거 따릉이 회원 관리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header">
			<div class="inner">

				<!-- Nav -->
				<nav>
					<ul>
						<li><a href="#menu">Menu</a></li>
					</ul>
				</nav>

			</div>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<h2>Menu</h2>
			<ul>
				<li><a href="mg_main.mo">관리자 홈</a></li>
				<li><a href="generic.html">로그아웃</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<div class="logo">
					<img src="images/logo.png" alt="서울자전거 따릉이"></a>
				</div>
				<br>
				<br>
				<br>
				<h2>회원 정보</h2>
				<section>
					<form name="frm" method="post" action="mg_memberinfo_go.mo">
						<div class="row gtr-uniform">
						<div class="col-2 col-12-xsmall">
						<select name="sk">
							<option value = "id"  >아이디</option>
							<option value = "phone"  >휴대폰 번호</option>
						</select>
						</div>
						<div class="col-2 col-12-xsmall">
							<input type="text" name="text" id="demo-name" value=""/>
						</div>
						<div class="col-2 col-12-xsmall">
							<input type="submit" name="search" value="검색" onClick = "mg_memberinfo_search.mo">
						</div>
						
					</form>
				</section>
				
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>ID</th>
								<th>PWD</th>
								<th>PHONE</th>
								<th>EMAIL</th>
								<th>BIKE_PWD</th>
								<th>GENDER</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="search" items="${searchList}">
							<tr>
								<td>${search.ID}</td>
								<td>${search.PWD}</td>
								<td>${search.PHONE}</td>
								<td>${search.EMAIL}</td>
								<td>${search.BIKE_PWD}</td>
								<td>${search.GENDER}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<br>
				<br> <br>
				

			</div>
		</div>

		<!-- Footer -->
		<footer id="footer"> </footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>
