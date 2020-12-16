<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<title>서울자전거 따릉이 이용권 구매 현황 관리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	
	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart1);
	google.setOnLoadCallback(drawChart2);
	google.charts.load('current', {
		packages : [ 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawBasic1);
	google.charts.setOnLoadCallback(drawBasic2);

	function drawChart1() {
		var data = google.visualization.arrayToDataTable([
				[ "Employee", "Rating" ], [ "일일권", 23 ], [ "정기권", 22 ] ]);
		var options = {
			title : "매출 내역",
			colors : [ "#67D5B5", "#05afed" ]
		};
		var chart = new google.visualization.PieChart(document
				.getElementById("season_ticket1"));
		chart.draw(data, options);
	}

	function drawChart2() {
		var data = google.visualization.arrayToDataTable([
				[ "Employee", "Rating" ], [ "남자", 19 ], [ "여자", 21 ] ]);
		var options = {
			title : "이용자 성별",
			colors : [ "#cbe86b", "#84B1ED" ]
		};
		var chart = new google.visualization.PieChart(document
				.getElementById("season_ticket2"));
		chart.draw(data, options);
	}

	function drawBasic1() {

		var data = google.visualization.arrayToDataTable([
				[ '이용권 종류', '1시간', ' 2시간' ], [ '일일권', 14, 9 ], ]);

		var options = {
			title : '일일권 매출 세부 내역',
			colors : [ '#f6ea8c', '#f26d5b' ],
			chartArea : {
				width : '80%'
			},
			hAxis : {
				title : '매출 내역(원)',
				maxValue : 800,
				minValue : 0
			},
			vAxis : {
				title : '이용권'
			}
		};

		var chart = new google.visualization.BarChart(document
				.getElementById('chart_div1'));
		chart.draw(data, options);
	}

	function drawBasic2() {

		var data = google.visualization.arrayToDataTable([
				[ '이용권 종류', '7일', '30일', '180일', '365일' ],
				[ '정기권 1시간', 500, 400, 200, 350 ],
				[ '정기권 2시간', 600, 50, 700, 200 ],

		]);

		var options = {
			title : '정기권 매출 세부 내역',
			colors : [ '#67D5B5', '#EE7785', '#C89EC4', '#84B1ED' ],
			chartArea : {
				width : '55%'
			},
			hAxis : {
				title : '매출 내역(원)',
				maxValue : 800,
				minValue : 0
			},
			vAxis : {
				title : '이용권'
			}
		};

		var chart = new google.visualization.BarChart(document
				.getElementById('chart_div2'));
		chart.draw(data, options);
	}
</script>
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
				<li><a href="uMainLoginNO">로그아웃</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<div class="logo">
					<img src="images/logo.png" alt="서울자전거 따릉이"></a>
				</div>
				<br> <br> <br>
				<h2>데이터 통계</h2>
				<br>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;일일권/정기권
									통합</th>
								<th>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;일일권/정기권
									세부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div id="season_ticket1"
										style="width: 520px; height: 570px; float: center"></div>
									
								</td>
								<td>
									<div id="chart_div1"
										style="width: 750px; height: 285px; float: center"></div>
									<div id="chart_div2"
										style="width: 750px; height: 285px; float: center"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				
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
