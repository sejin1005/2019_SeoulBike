<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<title>서울자전거 따릉이 자전거 관리</title>
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
				<li><a href="mg_main.html">관리자 홈</a></li>
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
				<h2>자전거 정보</h2>

				<br>
				<br>
				<section>
					<form name="frm" method="post" action="mg_bike_delete2.mo">
						<div class="row gtr-uniform">
							<div class="col-3 col-12-xsmall">
								<input type="text" name="bikenum" id="demo-name" value=""
									placeholder="자전거 번호" />
							
					</form>
				</section>
				<br>
				<section>
					<ul class="actions fit">
						<li><a href="mg_bike.mo" class="button fit"
							onClick="javascript:document.frm.submit()">삭제</a></li>
					</ul>
				</section>

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
