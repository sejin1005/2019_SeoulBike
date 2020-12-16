<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���������� ������ �뿩�� ����</title>
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
				<li><a href="mg_main.do">������ Ȩ</a></li>
				<li><a href="generic.html">�α׾ƿ�</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<div class="logo">
					<img src="images/logo.png" alt="���������� ������"></a>
				</div>
				<br> <br> <br>
				<h2>�뿩�� ����</h2>


				<section>
					<form name="frm" method="post" action="mg_map_delete2.mo">
						<div class="row gtr-uniform">
							<div class="col-2 col-12-xsmall">
								<div class="col-2 col-12-xsmall">
									<input type="text" name="rNum" id="demo-name" value=""
										placeholder="�뿩�� ��ȣ" />
								</div>
							</div>
					</form>
				</section>
				<br>
				<section>
					<ul class="actions fit">

						<li><a href="mg_map_write.mo" class="button fit"
							onClick="javascript:document.frm.submit()">����</a></li>

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
