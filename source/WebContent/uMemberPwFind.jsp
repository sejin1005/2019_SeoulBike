<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- Mirrored from www.bikeseoul.com/memberPwFind.do by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 21 Aug 2019 10:54:17 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=medium-dpi" name="viewport">
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
<div class="wrap login">
	<!--웹 : 헤더추가-->
    <div class="header_wrap">
        <div class="header">
            <div class="top">
            	<div class="setting">
					<ul>
						<li class="mainTypeText" id="textBtn"><a href="javascript:changeMainType('text');">텍스트</a></li>
						<li class="mainTypeMap" id="mapBtn"><a href="javascript:changeMainType('map');">지도</a></li>
					</ul>
				</div>
                <a class="join" href="uJoin.bo">회원가입</a>
						<a class="login" href="uLogin.bo">로그인</a>
					<div class="global" id="changeLang">
                    <ul>
                        <li class="en"><a href="https://www.bikeseoul.com:447/main.do?lang=en">ENGLISH</a></li>
                        <li class="ch"><a href="https://www.bikeseoul.com:447/main.do?lang=zh">中國語</a></li>
                        <li class="ja"><a href="https://www.bikeseoul.com:447/main.do?lang=ja">日本語</a></li>
                    </ul>
                </div>
            </div>
            <div class="logo"><a href="uMainLoginNO.bo"><img src="images/logo.png" alt="서울자전거 따릉이"></a></div>

            <!--메뉴(웹)-->
            <div class="menu_web">
                <ul>
                    <li><a href="main.html#bike_info">사업소개</a></li>
                    <li><a href="app/station/moveStationRealtimeStatus.html">대여소 조회</a></li>
                    <li><a href="login.html">이용권 구매</a></li>
                    <li><a href="customer/opinionBoard/opinionBoardList.html">시민의견수렴</a></li>
                    <li><a href="customer/notice/noticeList.html">공지사항</a></li>
                    <li><a href="customer/faq/faqList.html">안전수칙</a></li>
                </ul>
            </div>
            <button id="showRight" class="menu_app"></button>
            <!--메뉴(웹)-->
        </div>
    </div>
    <!--웹 : 헤더추가--><div class="container">
    	<div class="content">

        <div class="login">
            <div class="top">
                <h3>비밀번호 찾기</h3>
                <button class="close"></button>
            </div>
            <form id="searchFrm">
            <div class="id">
            	<input type="text" id="pwFindId" name="pwFindId" placeholder="아이디" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" />
            </div>

            <h2>휴대전화번호를 입력해주세요.</h2>

            <div class="phone">
                <label><input title="휴대번호 첫번째 입력" name="userMob1" id="userMob1" type="number"  style="width:50px" class="vm center" /></label> -
				<label><input title="휴대번호 두번째 입력" name="userMob2" id="userMob2" type="number"  style="width:50px" class="vm center" /></label> -
				<label><input title="휴대번호 세번째 입력" name="userMob3" id="userMob3" type="number"  style="width:50px" class="vm center" /></label>
            </div>


            <h2 id="sendMobText"></h2>


            <div class="btn" id="findPwBtn"><a href="#">비밀번호 찾기</a></div>

			<input type="hidden" name="userMob" id="userMob" value=""/>
           	<input type="hidden" name="authSmsHistSeq" id="authHistSeq" value=""/>
           	<input type="hidden" name="smsNo" value=""/>
			<input type="hidden" name="serialNo" value="0" />
			</form>
        </div>


        </div>
    </div>

    <script type="text/javascript" src="js/common_spb.js"></script>
	<script type="text/javascript">
		$(function() {
			findPw.init();
		});

		var findPw = {};
		var chkSmsNo = '';
		var timerID, doubleSubmitFlag = false;
		var authHistSeq = '';
		var chkTimeout = true;
		var chgMobNo = false;

		function doubleSubmitCheck(){
			if(doubleSubmitFlag){
				return doubleSubmitFlag;
			}else {
				doubleSubmitFlag = true;
				return false;
			}
		}

		findPw.init = function() {
			$("#memberSmsSend").on('click', this.memberSmsSend);
			$("#findPwBtn").on('click', this.findPw);

			var element = document.getElementById("countdown");
			element.innerHTML = "5 : 00";
		};

		function setSmsBtn() {
			clearTimeout(timerID);
			var element = document.getElementById("countdown");
			element.innerHTML = "5 : 00";
			doubleSubmitFlag = false;
			chgMobNo = true;
			$("#findPwBtn").prop("disabled", false);
		};

		function chgSerialNo() {
			$("#findPwBtn").prop("disabled", false);
		}

		findPw.memberSmsSend = function(){
			chgMobNo = false;
			clearTimeout(timerID);
			if(findPw.chkValidation()){
				//컨트롤러로 핸드폰번호 가지고 들어가야함
				commonAjax.postAjax("/memberSmsSendAjax.do", "json", $("#searchFrm").serialize()
						,function(data){
							var result = data.smsNo;
							if(result != ""){
								chkSmsNo = result;
								authHistSeq = data.authSmsHistSeq;
								$('[name="authSmsHistSeq"]').val(authHistSeq);
								findPw.countdown('countdown', 5); //minute base
								chkTimeout = true;
								alert('인증번호가 발송되었습니다.'); //인증번호가 발송되었습니다.
								$("#sendMobText").html("<span>"+$("#userMob").val()+"</span> 로 발송된<br>인증번호 4자리를 화면에 입력해주세요.");
								$("#sendText").text("인증번호 재발송");
							}else{
								alert('sms가 전송되지 않았습니다. 다시 시도해주세요.'); //sms가 전송되지 않았습니다. 다시 시도해주세요.
								doubleSubmitFlag = false;
								return ;
							}
				});

			}
		}

		findPw.chkValidation = function(){ //아이디, 휴대폰 정보가 입력됐는지 확인

			var pwFindId = $('[name="pwFindId"]').val();
	    	var findType = $('[name="findType"]:checked').val();

	    	var numCheck = /^[0-9]*$/;
	    	var idCheck = /^[A-za-z0-9]{6,12}$/g;
	    	if(!idCheck.test(pwFindId)){
	    		alert('아이디를 확인해주세요.');
				$('[name="pwFindId"]').focus();
	    		return;
	    	}

 	        var mobNo1 = $("#userMob1").val(); //휴대전화번호
 	        var mobNo2 = $("#userMob2").val();
 	        var mobNo3 = $("#userMob3").val();
 	      	var chkMpn = $("#userMob1").val() + $("#userMob2").val() + $("#userMob3").val();
 	        if(mobNo1 == "" || mobNo1 == null || mobNo2 == "" || mobNo2 == null || mobNo3 == "" || mobNo3 == null){
         		alert('휴대전화번호를 입력하고 조회하기 바랍니다.'); //휴대전화번호를 입력하고 조회하기 바랍니다.
         		return false;
         	}
 	       if(!isMpn(chkMpn)){
				alert('휴대전화번호를 다시 확인해주세요.'); //휴대전화번호를 다시 확인해주세요.
				return false;
			}

 	       fstNo = mobNo1.substring(0, 3);
			if(fstNo == "010"){
				if(mobNo1.length != 3 || mobNo2.length != 4 || mobNo3.length != 4){
					alert('휴대전화번호를 다시 확인해주세요.'); //휴대전화번호를 다시 확인해주세요.
					return false;
				}
			}else { //011, 016, 017 등
				if(mobNo1.length != 3 || mobNo2.length < 3 || mobNo3.length != 4){
					alert('휴대전화번호를 다시 확인해주세요.'); //휴대전화번호를 다시 확인해주세요.
					return false;
				}
			}
 	        var mob = '';
 	       	mob += $("#userMob1").val() + "-" + $("#userMob2").val() + "-" + $("#userMob3").val();
 	       	$("#userMob").val(mob);

	    	if(findType == undefined){
	    		alert('휴대전화로 받기와 이메일로 받기 중 하나를 선택 해주세요.');
	    		return;
	    	}

	        return true;
		}

		findPw.countdown = function(elementId, min){
			var element, endTime, hours, mins, msLeft, time;

			  function updateTimer(){
			    msLeft = endTime - (+new Date);
			    if ( msLeft < 0 ) {
			    	alert('인증 유효시간이 초과되었습니다. 다시 시도해주세요.'); //인증 유효시간이 초과되었습니다. 다시 시도해주세요.
			    	doubleSubmitFlag = false;
			    	chkTimeout = false;
			    } else {
			    	time = new Date( msLeft );
			    	hours = time.getUTCHours();
			    	mins = time.getUTCMinutes();
			    	element.innerHTML = (hours ? hours + ':' + ('0' + mins).slice(-2) : mins) + ':' + ('0' + time.getUTCSeconds()).slice(-2);
			    	timerID = setTimeout( updateTimer, time.getUTCMilliseconds());//특정시간 이후 함수 실행
			    }
			  }

			  element = document.getElementById( elementId );
			  endTime = (+new Date) + 1000 * min * 60;
			  updateTimer();
		}

		findPw.findPw = function(){
			var pwFindId = $('[name="pwFindId"]').val();
	    	var findType = $('[name="findType"]:checked').val();

	    	var numCheck = /^[0-9]*$/;
	    	var idCheck = /^[A-za-z0-9]{6,12}$/g;
	    	if(!idCheck.test(pwFindId)){
	    		alert('아이디를 확인해주세요.');
				$('[name="pwFindId"]').focus();
	    		return;
	    	}

			var mob = '';
			mob += $("#userMob1").val() + "-" + $("#userMob2").val() + "-" + $("#userMob3").val();
			var chkMpn = $("#userMob1").val() + $("#userMob2").val() + $("#userMob3").val();

			if ($("#userMob1").val() == "" || $("#userMob1").val() == null || $("#userMob2").val() == ""
				|| $("#userMob2").val() == null || $("#userMob3").val() == "" || $("#userMob3").val() == null) {
				alert('휴대전화번호를 입력하고 조회하기 바랍니다.'); //휴대전화번호를 입력하고 조회하기 바랍니다.
				return false;
			}

			var fstNo = $("#userMob1").val().substring(0, 2);

	    	if(fstNo != "01"){
	    		alert('휴대전화번호를 다시 확인해주세요.'); //휴대전화번호를 다시 확인해주세요.
	    		return false;
	    	}

			if(!isNumeric($("#userMob1").val()) || !isNumeric($("#userMob2").val()) || !isNumeric($("#userMob3").val())){
				alert('휴대전화번호는 숫자만 입력가능합니다.'); //휴대전화번호는 숫자만 입력가능합니다.
				return ;
			}

			if(!isMpn(chkMpn)){
				alert('휴대전화번호를 다시 확인해주세요.'); //휴대전화번호를 다시 확인해주세요.
				return ;
			}

			fstNo = $("#userMob1").val().substring(0, 3);

			if(fstNo == "010"){
				if($("#userMob1").val().length != 3 || $("#userMob2").val().length != 4 || $("#userMob3").val().length != 4){
					alert('휴대전화번호를 다시 확인해주세요.'); //휴대전화번호를 다시 확인해주세요.
					return false;
				}
			}else { //011, 016, 017 등
				if($("#userMob1").val().length != 3 || $("#userMob2").val().length < 3 || $("#userMob3").val().length != 4){
					alert('휴대전화번호를 다시 확인해주세요.'); //휴대전화번호를 다시 확인해주세요.
					return false;
				}
			}

			if(chgMobNo){
				alert("휴대전화번호가 변경되었습니다. 인증번호 발송을 다시 시도해주세요.");
				return false;
			}

			if(findType == undefined){
	    		alert('휴대전화로 받기와 이메일로 받기 중 하나를 선택 해주세요.');
	    		return;
	    	}

			if(!chkTimeout){
				alert('인증 유효시간이 초과되었습니다. 다시 시도해주세요.'); //인증 유효시간이 초과되었습니다. 다시 시도해주세요.
				return false;
			}

			//인증번호 발송 여부 확인
			var smsChk = $("#authHistSeq").val();
			if(smsChk == "" || smsChk == null){
				alert('인증번호 발송후 다시 시도해주세요.'); //인증번호를 입력하세요.
				return false;
			}

			$("#userMob").val(mob);
			//만들어진 sms 인증번호와 사용자가 입력한 인증번호가 동일한지 확인
			var inputSmsNo = $("#smsNumber").val();

			if(inputSmsNo == "" || inputSmsNo == null){
				alert('인증번호를 입력하세요.'); //인증번호를 입력하세요.
				return false;
			}

			if(inputSmsNo.length != 4){
				alert("인증번호 4자리를 입력해주세요.");
				return false;
			}

			$('[name="smsNo"]').val(inputSmsNo);
			//$('[name="authSmsHistSeq"]').val(authHistSeq);

			//입력한 sms 인증번호 확인
			var authResult = false;
			var pData = $("#searchFrm").serialize();
			$.ajax({
						type : 'post',
						url : '/memberSmsAuthAjax.do',
						dataType : 'json',
						data : pData,
						async : false,
						success : function(data) {
							if (data.result == 1) {
								//sms 인증 및 인증번호 입력 상세 정보 삽입 완료
								authResult = true;
							} else {
								authResult = false;
								return false;
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
							if (jqXHR.status === 500) {
								alert(textStatus);
							} else {
								return false;
							}
							//console.log(textStatus);
						}
					});

			if(!isNumeric(inputSmsNo)){
				alert('sms 인증번호는 숫자만 입력가능합니다.'); //sms 인증번호는 숫자만 입력가능합니다.
				return ;
			}
			if(!authResult){
				alert('인증번호가 다릅니다. 다시 시도해주세요.'); //인증번호가 다릅니다. 다시 시도해주세요.
				return ;
			}

			findPw.pwFind(mob);

		}

		findPw.pwFind = function(userMob) {


			if(doubleSubmitCheck()) return ;

			var pwFindId = $('[name="pwFindId"]').val();
			var findType = $('[name="findType"]:checked').val();

			if(findType == undefined){
	    		alert('휴대전화로 받기와 이메일로 받기 중 하나를 선택 해주세요.');
	    		return;
	    	}
			commonAjax.postAjax("/pwFindAjax.do", 'json', {pwFindId:pwFindId, userMob:userMob, findType:findType}
		    , function(data){
				if(data.resultMessage == 'Success'){
					if(findType == 'email'){
						var parameter = {};
						parameter.email = data.memberVo.userEmail;
						parameter.val1 = pwFindId
						parameter.val2 = data.memberVo.commonPw;
						parameter.biz_id = "seoulbikego";
						var comCd = "TPL_001";
						$.ajax({
							type		: 'post',
							url			: '/commonCode/getCommonCodeVal.do',
							dataType	: 'json',
							data		: {comCd:comCd},
							async		: false,
							success		: function( data ) {
								parameter.templateNo = data.templateNo;
								sendEmail(parameter);
							},
							error : function(jqXHR, textStatus,errorThrown){
								if(jqXHR.status === 500){
									alert(textStatus);
								} else {
									return false;
								}
								//console.log(textStatus);
							}
						});

					}else{
						$.ajax({
							type		: 'post',
							url			: '/sendTempPwSms.do',
							dataType	: 'json',
							data		: {userMob:data.memberVo.userMob, commonPw:data.memberVo.commonPw},
							async		: false,
							success		: function( data ) {
								if(data.resultMessage != 'Success'){
									alert('SMS 전송에 실패하였습니다.');
									return;
								}
							},
							error : function(jqXHR, textStatus,errorThrown){
								if(jqXHR.status === 500){
									alert(textStatus);
								} else {
									return false;
								}
								//console.log(textStatus);
							}
						});
					}

					$("#searchFrm").attr({method : "post", action : "/popPwFindEnd.do"}).submit();

				}else{
					alert("해당하는 정보가 없습니다.");
				}
			});


	    };


	</script>

</div>
<!--footer-->
    <div class="footer_wrap">
        <div class="footer">
        	<div class="left">
            <ul>
                <!--<li><a href="">개인정보처리방침</a></li>
                <li class="line"><a href="">이메일주소무단수집거부</a></li>-->
                <li><a href="app/use/moveUseMenuClauseInfo.html">이용약관</a></li>

                <li class="line"><a href="app/use/moveUseMenuInsurance.html">보험안내</a></li>


            </ul>
            <p>서울특별시 중구 세종대로 110 서울특별시 대표자 박원순, Tel : 1599-0120 (사업자등록번호 : 104-83-00469) 우편번호 04524</p>
            <p>COPYRIGHT ⓒ 2018 bikeseoul All RIGHTS RESERVED.</p>
            </div>
        </div>
    </div>
<!--footer-->

<script type="text/javascript">

$(function(){
	var mainType = cookieVal("mainType");

	if (mainType == 'text') {
		$(".mainTypeMap").css('display', '');
		$(".mainTypeText").css('display', 'none');
	} else if (mainType == 'map') {
		$(".mainTypeMap").css('display', 'none');
		$(".mainTypeText").css('display', '');
	} else {
		$(".mainTypeMap").css('display', 'none');
		$(".mainTypeText").css('display', '');
	}
});

$(function() {
    $(".back").on("click", goBack);
});

$(function() {
    $(".back.left").on("click", goBackLeft);
});

$(function() {
    $(".back.right").on("click", goBackRight);
});

$(function() {
    $(".pwback").on("click", goBack);
});
$(function() {
    $(".close").on("click", goHome);
});
$(function() {
    $(".logo").on("click", goHome);
});
$(function() {
    $(".alim").on("click", goAlim);
});
$(function() {
    $("#changeLang").on("click", changeLang);
});
function osInfo(pOSobj){
    var obj = JSON.parse(pOSobj);
    window.osType = obj.osInfo;

    //대여소 찿기 PDF 버튼 숨기기.
    if($("#pdfDiv") !== 'undefined') {
	    $("#pdfDiv").css("display","none");
    }
};

function goBack(e) {
	//e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
    window.osType = '';
    //alert(window.osType);
    switch(window.osType){
    case "web" :
    	window.history.go(-1);
        break;
    case "android" :
        window.android.goBack();
        break;
    case "ios" :
        window.location = 'toApp://?{"call":"goBack"}';
        break;
    case "" :
    	window.history.go(-1);
        break;
    }
}

function goBackLeft(e) {
    //e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
   /*  switch(window.osType){
    case "web" :
        window.location.href='/main.do';
        break;
    case "android" :
    	window.location.href='/main.do';
        break;
    case "ios" :
    	window.location.href='/main.do';
        break;
    case "" :
    	window.location.href='/main.do';
        break;
    } */
}

function goBackRight(e) {
    //e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
    /* switch(window.osType){
    case "web" :
        window.location.href='/main.do';
        break;
    case "android" :
    	window.location.href='/main.do';
        break;
    case "ios" :
    	window.location.href='/main.do';
        break;
    case "" :
    	window.location.href='/main.do';
        break;
    } */
	/* switch(window.osType){
    case "web" :
    	window.history.go(-1);
        break;
    case "android" :
        window.android.goBack();
        break;
    case "ios" :
        window.location = 'toApp://?{"call":"goBack"}';
        break;
    case "" :
    	window.history.go(-1);
        break;
    } */
}

function goHome(e) {
    //e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
    switch(window.osType){
    case "web" :
        window.location.href='main.html';
        break;
    case "android" :
    	window.location.href='main.html';
        break;
    case "ios" :
    	window.location.href='main.html';
        break;
    case "" :
    	window.location.href='main.html';
        break;
    }
}

function goAlim(e) {
    //e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
    switch(window.osType){
    case "web" :
        window.location.href='login.html';
        break;
    case "android" :
    	window.location.href='login.html';
        break;
    case "ios" :
    	window.location.href='login.html';
        break;
    case "" :
        window.location.href='login.html';
        break;
    }
}

function changeLang(e) {
	var lang = 'en'

	switch(window.osType){
    case "web" :
        window.location.href='/main.do?lang='+lang;
        break;
    case "android" :
    	window.location.href='/main.do?lang='+lang;
        break;
    case "ios" :
    	window.location.href='/main.do?lang='+lang;
        break;
    case "" :
        window.location.href='/main.do?lang='+lang;
        break;
    }
}

function moveSnsViewPage(flag){

	var tUrl = "";
	if(flag === 'snsFacebook') {
		tUrl = "https://www.facebook.com/seoulbike";
    } else {
    	tUrl = "https://twitter.com/seoulbike";
    }
	switch(window.osType){
	    case "web" :
	    	window.open(tUrl,"_blank");
	        break;
	    case "android" :
	        var pData = {targetUrl  :tUrl, returnFnc : "", title : "서울자전거sns" };
	        window.android.openWebviewPopup(JSON.stringify(pData));
	        break;
	    case "ios" :
	        var iosUrl = 'toApp://?{"targetUrl" : "'+tUrl+'","title" : "서울자전거sns", "returnFnc" : "", "call":"openWebviewPopup"}';
	        window.location = iosUrl;
	        break;
    }
}

</script>
</body>

<!-- Mirrored from www.bikeseoul.com/memberPwFind.do by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 21 Aug 2019 10:54:17 GMT -->
</html>
