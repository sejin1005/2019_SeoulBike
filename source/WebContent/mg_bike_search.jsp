<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>���������� ������ ȸ�� ����</title>
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
				<li><a href="mg_main.mo">������ Ȩ</a></li>
				<li><a href="generic.html">�α׾ƿ�</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<div class="logo">
					<img src="images/logo.png" alt="���������� ������"></a>
				</div>
				<br>
				<br>
				<br>
				<h2>������ ����</h2>
				<section>
					<form name="frm" method="post" action="mg_bike_go.mo">
						<div class="row gtr-uniform">
						<div class="col-2 col-12-xsmall">
						<select name="sk">
							<option value = "bikenum">������ ��ȣ</option>
							<option value = "rname">�뿩�� �̸�</option>
						</select>
						</div>
						<div class="col-2 col-12-xsmall">
							<input type="text" name="text" id="demo-name" value=""/>
						</div>
						<div class="col-2 col-12-xsmall">
							<input type="submit" name="search" value="�˻�" onClick = "mg_bike_search.mo">
						</div>
						
					</form>
				</section>
				
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>������ ��ȣ</th>
								<th>��� ����</th>
								<th>�뿩�� ��ȣ</th>
								<th>�뿩�� �̸�</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="search" items="${searchList}">
							<tr>
								<td>${search.BIKENUM}</td>
								<td>${search.ABLE}</td>
								<td>${search.RNUM}</td>
								<td>${search.RNAME}</td>
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