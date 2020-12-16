<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="description=" Content="" />
<title>서울자전거 따릉이 - 무인대여시스템</title>
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/easing/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/gibberish-aes.js"></script>
<script type="text/javascript" src="js/jquery.simpler-sidebar.min.js"></script>
<script type="text/javascript" src="js/jquery-confirm.js"></script>
<script type="text/javascript" src="js/comm.js"></script>
<script type="text/javascript" src="js/common_spb.js"></script>

<link rel="stylesheet" href="css/style_kr_v2.css" type="text/css">
<link rel="stylesheet" href="css/common.css" type="text/css">
<link rel="stylesheet" href="css/jquery-confirm.css">
<!--[if lt IE 9]>
<link href="/css/pw.css" title="ie8chn" rel="stylesheet" type="text/css" />
<script src="/js/html5.js"></script>
<script src="/js/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<div class="wrap join">

		<!--웹 : 헤더추가-->
		<div class="header_wrap">
			<div class="header">
				<div class="top">
					<div class="setting">
						<ul>
							<li class="mainTypeText" id="textBtn"><a
								href="javascript:changeMainType('text');">텍스트</a></li>
							<li class="mainTypeMap" id="mapBtn"><a
								href="javascript:changeMainType('map');">지도</a></li>
						</ul>
					</div>
					<div class="info">
						<a href="/info/infoReg.do">이용안내</a>
					</div>
					<div class="alim">
						<a href="/app/mybike/getPushHistory.do">알림</a>
					</div>
					<a class="join" href="uJoin.bo">회원가입</a> <a class="login"
						href="uLogin.bo">로그인</a>
					<div class="global" id="changeLang">
						<ul>
							<li class="en"><a
								href="https://www.bikeseoul.com:447/main.do?lang=en">ENGLISH</a></li>
							<li class="ch"><a
								href="https://www.bikeseoul.com:447/main.do?lang=zh">中國語</a></li>
							<li class="ja"><a
								href="https://www.bikeseoul.com:447/main.do?lang=ja">日本語</a></li>
						</ul>
					</div>
				</div>
				<div class="logo">
					<a href="uMainLoginNO.bo"><img src="images/logo.png"
						alt="서울자전거 따릉이"></a>
				</div>

				<!--메뉴(웹)-->
				<div class="menu_web">
					<ul>
						<li><a href="/main.do#bike_info">사업소개</a></li>
						<li><a href="/app/station/moveStationRealtimeStatus.do">대여소
								조회</a></li>
						<li><a href="/app/ticket/member/buyTicketList.do">이용권 구매</a></li>
						<li><a href="/customer/opinionBoard/opinionBoardList.do">시민의견수렴</a></li>
						<li><a href="/customer/notice/noticeList.do">공지사항</a></li>
						<li><a href="/customer/faq/faqList.do">안전수칙/FAQ</a></li>
					</ul>
				</div>
				<button id="showRight" class="menu_app"></button>
				<!--메뉴(웹)-->
			</div>
		</div>
		<!--웹 : 헤더추가-->
		<div class="container">
			<div class="content">

				<div class="join">
					<div class="top">
						<h3>회원가입</h3>


						<form name="frm" action="uJoinComplete.bo" method="post">


							<div class="id">
								<p>아이디</p>
								<input type="text" id="userId" name="ID"
									placeholder="영문, 숫자 6~12자리" />
								<button class="id_check" id="idDupChk">중복 확인</button>
							</div>

							<div class="pw">
								<p>비밀번호</p>
								<input type="password" id="mmpw" name="PWD"
									placeholder="영문, 숫자, 특수문자(!@#$%^&*?~)조합 8~12자리"
									onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" />
							</div>

							<div class="pw_check">
								<p>비밀번호 확인</p>
								<input type="password" id="mmpwok" name="PWD2"
									placeholder="비밀번호를 한번 더 입력하여 확인" onkeyup="noSpaceForm(this);"
									onchange="noSpaceForm(this);" />
							</div>
							<div class="email">
								<p>이메일</p>
								<input type="text" id="mmemail" name="EMAIL"
									placeholder="ID@naver.com 형식으로 입력해주세요." style="width: 500px"
									onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">


								<br> <br> <br> <br>
								<p>핸드폰 번호</p>
								<input name="PHONE" type="number"
									placeholder="'-' 제외하고 입력해주세요." style="width: 500px" class="vm"
									maxlength="11" min="0" max="9"
									oninput="javascript:maxLengthCheck(this)" /> <br> <br>
								<br> <br>
								<p>자전거 비밀번호</p>
								<input name="BIKE_PWD" type="number"
									placeholder="1부터 4까지의 숫자 네 자리를 입력해 주세요" style="width: 500px" />

								<select name="GENDER">
									<option name = "WOMAN" value="여자">여자</option>
									<option name = "MAN" value="남자">남자</option>
								</select>
							</div>


							<p class="info">
								단, 회원의 서비스 이용과 관련한 권리 및 의무 등에 관한 사항에 대해 변경될 경우 통지 <br>의무사항에
								따라 수신 동의 여부와 무관하게 메일이 발송될 수 있음을 참고해 주시기 바랍니다.
							</p>


							<div class="btn" onClick="check()">
								<a href="javascript:document.frm.submit()">다음</a>
							</div>
						</form>














					</div>
				</div>
			</div>
		</div>
		<!--footer-->
		<div class="footer_wrap">
			<div class="footer">
				<div class="left">
					<ul>
						<!--<li><a href="">개인정보처리방침</a></li>
                <li class="line"><a href="">이메일주소무단수집거부</a></li>-->
						<li><a href="/app/use/moveUseMenuClauseInfo.do">이용약관</a></li>
						<li class="line"><a
							href="/app/use/moveUseMenuClauseInfo.do?tabInfo=2">개인정보처리방침</a></li>
						<li class="line"><a href="/app/use/moveUseMenuInsurance.do">보험안내</a></li>
						<li class="line"><a href="/customer/donor/donorList.do">도움주신
								분</a></li>

					</ul>
					<p>서울특별시 중구 세종대로 110 서울특별시 대표자 박원순, Tel : 1599-0120 (사업자등록번호 :
						104-83-00469) 우편번호 04524</p>
					<p>COPYRIGHT ⓒ 2018 bikeseoul All RIGHTS RESERVED.</p>
				</div>
				<dl>
					<dt>sns</dt>
					<dd class="face"
						onclick="javascript:moveSnsViewPage('snsFacebook')">
						<a href="#" id="snsFacebook"> </a>
					</dd>
					<dd class="twit" onclick="javascript:moveSnsViewPage('snsTweeter')">
						<a href="#" id="snsTweeter"> </a>
					</dd>
				</dl>
			</div>
		</div>
		<!--footer-->

		<script type="text/javascript" src="js/common_spb.js"></script>
		<script>
function check() {
	  //입력되어 있는 값들을 받아와 저장
	  var id = document.getElementById("mmpw").value;            //아이디 저장
	  var pw = document.getElementById("mmpw").value;            //비밀번호 저장
	  var pw2 = document.getElementById("mmpwok").value;          //비밀번호 확인 저장
	  var mail = document.getElementById("mmemail").value;        //이메일 주소 저장
	 
	  //정규표현식 a-z, A-Z, 0-9로 이루어져 있으며 6~12자리 정의
	  var pattern_id = /^[a-zA-Z0-9]{6,12}/;
	  //정규표현식을 이용한 검사 (test 함수) - 일치 true, 불일치 false 반환
	  if(!pattern_id.test(id)) {
	    alert("아이디 형식이 잘못 되었습니다!");
	    return;
	  }
	 
	  //비밀번호와 비밀번호 확인의 유효성 검사 - 아이디와 동일한 로직이므로 아이디의 정규표현식을 그대로 사용
	  if(!pattern_id.test(pw) || !pattern_id.test(pw2)) {
	    alert("비밀번호 형식이 일치하지 않습니다!");-
	    return;
	  }
	 
	  //비밀번호와 비밀번호 확인의 일치 여부 확인
	  if(pw != pw2) {
	    alert("비밀번호가 일치하지 않습니다!");
	    return;
	  }
	 
	  //이메일 정규표현식 정의 후 검사
	  var pattern_mail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  if(!pattern_mail.test(mail)) {
	    alert("이메일 형식이 일치하지 않습니다!");
	    return;
	  }
	 
	  //중간에 return으로 인해 종료되지 않으면 모두 통과한 것이므로 성공 메시지 출력!
	  alert("회원가입이 정상적으로 완료되었습니다!");
}
</script>
</body>
</html>
