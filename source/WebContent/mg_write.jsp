<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>서울자전거 따릉이 관리자 글작성</title>
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
							<li><a href="mg_main.html">관리자 홈</a></li>
							<li><a href="generic.html">로그아웃</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">
						<div class="inner">
						<div class="logo"><img src="images/logo.png" alt="서울자전거 따릉이"></a></div>
							<br><br><br>
							<h2> 관리자 게시글 작성 </h2>
							<div class="table-wrapper">
								<form id="tx_editor_form" name="tx_editor_form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="consentYn"/>
				<input type="hidden" name="secretYN" value="" /> <!-- 추가 : 비밀글 정보 저장_2016.04.22_by_JHN -->
				<input type="hidden" name="cateCD" value="" /> <!-- 추가 : 구분 카테고리 변경시 해당 값 저장_2016.05.30_by_JHN -->
				<input type="hidden" id="usrQnaSeq" name="usrQnaSeq" value="0" />
				<input type="hidden" id="mode" name="mode" value="insert" />
				<input type="hidden" id="bbsClsCD" name="bbsClsCD" value="CTM_003" />
				<input type="hidden" id="currentPageName" name="currentPageName" value="opinionboard" />
				<input type="hidden" id="wMode" name="wMode" value="" />

            <div>
                <table>
                	<tr>
                    	<th class="first">구분</th>
                        <td class="first">
                            <select id="cateCDList" name="cateCDList">
                              <option value="">선택</option>
															<option value="OPI_006">시민 의견 답변</option>
															<option value="OPI_007">공지 사항</option>
														</select>
                            <script>$("select").styledSelect();</script>
                        </td>
                    </tr>
                    <tr>
                    	<th >아이디</th>
                        <td><input type="text" class="w100" id="qestnTitle" name="qestnTitle" value=""></div></td>
                    </tr>
                    <tr>
                    	<th >제목</th>
                        <td><input type="text" class="w100" id="qestnTitle" name="qestnTitle" value=""></div></td>
                    </tr>
                    <tr>
                    	<th>내용</th>
                        <td><textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea></td>
                </table>
            </div>
 				</form>

							</div>
							<br>
							<section>
														<ul class="actions fit">
														<li><a href="#" class="button primary">등록</a></li>
														<li><a href="#" class="button primary">취소</a></li>
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
    