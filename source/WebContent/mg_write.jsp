<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>���������� ������ ������ ���ۼ�</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
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
						<div class="logo"><img src="images/logo.png" alt="���������� ������"></a></div>
							<br><br><br>
							<h2> ������ �Խñ� �ۼ� </h2>
							<div class="table-wrapper">
								<form id="tx_editor_form" name="tx_editor_form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="consentYn"/>
				<input type="hidden" name="secretYN" value="" /> <!-- �߰� : ��б� ���� ����_2016.04.22_by_JHN -->
				<input type="hidden" name="cateCD" value="" /> <!-- �߰� : ���� ī�װ� ����� �ش� �� ����_2016.05.30_by_JHN -->
				<input type="hidden" id="usrQnaSeq" name="usrQnaSeq" value="0" />
				<input type="hidden" id="mode" name="mode" value="insert" />
				<input type="hidden" id="bbsClsCD" name="bbsClsCD" value="CTM_003" />
				<input type="hidden" id="currentPageName" name="currentPageName" value="opinionboard" />
				<input type="hidden" id="wMode" name="wMode" value="" />

            <div>
                <table>
                	<tr>
                    	<th class="first">����</th>
                        <td class="first">
                            <select id="cateCDList" name="cateCDList">
                              <option value="">����</option>
															<option value="OPI_006">�ù� �ǰ� �亯</option>
															<option value="OPI_007">���� ����</option>
														</select>
                            <script>$("select").styledSelect();</script>
                        </td>
                    </tr>
                    <tr>
                    	<th >���̵�</th>
                        <td><input type="text" class="w100" id="qestnTitle" name="qestnTitle" value=""></div></td>
                    </tr>
                    <tr>
                    	<th >����</th>
                        <td><input type="text" class="w100" id="qestnTitle" name="qestnTitle" value=""></div></td>
                    </tr>
                    <tr>
                    	<th>����</th>
                        <td><textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea></td>
                </table>
            </div>
 				</form>

							</div>
							<br>
							<section>
														<ul class="actions fit">
														<li><a href="#" class="button primary">���</a></li>
														<li><a href="#" class="button primary">���</a></li>
													</ul>
							</section>

						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">

					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
    