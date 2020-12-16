<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>���������� ������ �Խñ� ����</title>
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
				<li><a href="mg_main.html">������ Ȩ</a></li>
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

				<hr>
				<br>
				<h2>�������� �Խñ�</h2>
					<section>
					<form name="frm" method="post" action="mg_notice_go.mo">
						<div class="row gtr-uniform">
						<div class="col-2 col-12-xsmall">
						<select name="sk">
							<option value = "title">����</option>
							<option value = "date">��¥</option>
			
						</select>
						</div>
						<div class="col-2 col-12-xsmall">
							<input type="text" name="text" id="demo-name" value=""/>
						</div>
						<div class="col-2 col-12-xsmall">
							<input type="submit" name="search" value="�˻�" onClick = "mg_notice_search.mo">
						</div>
						
					</form>
				</section>

				<br>
				
				
				
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>����</th>
								<th>����</th>
								<th>��¥</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="search" items="${searchList}">
							<tr>
								<td>${search.NOTICE_NUM}</td>
								<td>${search.NOTICE_TITLE}</td>
								<td>${search.NOTICE_CONTENT}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>

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
