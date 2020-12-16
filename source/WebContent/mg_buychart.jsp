<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<title>���������� ������ �̿�� ���� ��Ȳ ����</title>
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
				[ "Employee", "Rating" ], [ "���ϱ�", 23 ], [ "�����", 22 ] ]);
		var options = {
			title : "���� ����",
			colors : [ "#67D5B5", "#05afed" ]
		};
		var chart = new google.visualization.PieChart(document
				.getElementById("season_ticket1"));
		chart.draw(data, options);
	}

	function drawChart2() {
		var data = google.visualization.arrayToDataTable([
				[ "Employee", "Rating" ], [ "����", 19 ], [ "����", 21 ] ]);
		var options = {
			title : "�̿��� ����",
			colors : [ "#cbe86b", "#84B1ED" ]
		};
		var chart = new google.visualization.PieChart(document
				.getElementById("season_ticket2"));
		chart.draw(data, options);
	}

	function drawBasic1() {

		var data = google.visualization.arrayToDataTable([
				[ '�̿�� ����', '1�ð�', ' 2�ð�' ], [ '���ϱ�', 14, 9 ], ]);

		var options = {
			title : '���ϱ� ���� ���� ����',
			colors : [ '#f6ea8c', '#f26d5b' ],
			chartArea : {
				width : '80%'
			},
			hAxis : {
				title : '���� ����(��)',
				maxValue : 800,
				minValue : 0
			},
			vAxis : {
				title : '�̿��'
			}
		};

		var chart = new google.visualization.BarChart(document
				.getElementById('chart_div1'));
		chart.draw(data, options);
	}

	function drawBasic2() {

		var data = google.visualization.arrayToDataTable([
				[ '�̿�� ����', '7��', '30��', '180��', '365��' ],
				[ '����� 1�ð�', 500, 400, 200, 350 ],
				[ '����� 2�ð�', 600, 50, 700, 200 ],

		]);

		var options = {
			title : '����� ���� ���� ����',
			colors : [ '#67D5B5', '#EE7785', '#C89EC4', '#84B1ED' ],
			chartArea : {
				width : '55%'
			},
			hAxis : {
				title : '���� ����(��)',
				maxValue : 800,
				minValue : 0
			},
			vAxis : {
				title : '�̿��'
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
				<li><a href="mg_main.mo">������ Ȩ</a></li>
				<li><a href="uMainLoginNO">�α׾ƿ�</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<div class="logo">
					<img src="images/logo.png" alt="���������� ������"></a>
				</div>
				<br> <br> <br>
				<h2>������ ���</h2>
				<br>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;���ϱ�/�����
									����</th>
								<th>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;���ϱ�/�����
									����</th>
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
