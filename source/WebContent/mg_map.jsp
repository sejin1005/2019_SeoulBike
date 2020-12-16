<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>서울자전거 따릉이 대여소 관리</title>
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
				<h2>대여소 정보</h2>
				
				<section>
					<form name="frm" method="post" action="mg_map_go.mo">
						<div class="row gtr-uniform">
						<div class="col-2 col-12-xsmall">
						<select name="sk">
							<option value = "region">지역</option>
							<option value = "rnum">대여소 번호</option>
							<option value = "rname">대여소 이름</option>
						</select>
						</div>
						<div class="col-2 col-12-xsmall">
							<input type="text" name="text" id="demo-name" value=""/>
						</div>
						<div class="col-2 col-12-xsmall">
							<input type="submit" name="search" value="검색" onClick = "mg_map_search.mo">
						</div>
						
					</form>
				</section>

				<section>
					<ul class="actions fit">
						<li><a href="mg_map_add.mo" class="button fit">추가</a></li>
						<li><a href="mg_map_delete.mo" class="button fit">삭제</a></li>
					</ul>
				</section>


				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>지역</th>
								<th>대여소 번호</th>
								<th>대여소 이름</th>
								<th>거치대 수</th>
								<th>위도</th>
								<th>경도</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach var="map" items="${maplist}">
								<tr>

									<td>${map.REGION}</td>
									<td>${map.RNUM}</td>
									<td>${map.RNAME}</td>
									<td>${map.STAND}</td>
									<td>${map.LAT}</td>
									<td>${map.LNG}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>



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
