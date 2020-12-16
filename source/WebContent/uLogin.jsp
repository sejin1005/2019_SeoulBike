<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- Mirrored from www.bikeseoul.com/login.do by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 21 Aug 2019 10:54:03 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="description=" Content="" />
<script type="text/javascript" src="transkey_mobile/transkey.js"></script>
<link rel="stylesheet" type="text/css" href="transkey_mobile/transkey.css" />
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
<div class="wrap">

    <div class="container">
    	<div class="content">

        <div class="login">
        	<div id="layerPopup"
				style="position: absolute; z-index: 999; background-color: gray; width: 100%; height: 100px; top: 100px; display: none;">
			</div>

        	<!--웹 : class="top"에"logo" 스타일추가 -->
            <div class="top logo">
            	<!--웹 : 로고이미지추가 -->
                <h3>로그인<img src="images/logo.png" alt="서울자전거 따릉이"></h3>
                <button class="back"></button>
                <button class="close"></button>
            </div>





        	<form name="frm" action="uLoginComplete.bo" method="post">

            <div class="id">
            	<input type="text" id="userId" name="userId"  placeholder="아이디" />
            </div>

            <div class="pw">
            	<input type="password" id="userPw" name="userPw"  placeholder="비밀번호"
           		data-tk-kbdType="qwerty" data-tk-useinput="true" data-tk-dataType="aA@" onclick="mtk.onKeyboard(this);" onfocus="mtk.onKeyboard(this);"
            	>
            </div>


            <div class="login_auto">
            	<input type="checkbox" id="loginCheck" />
            	<label for="loginCheck" id="logchktext"><br></label>
            </div>


            <div class="login_btns"><a href="javascript:document.frm.submit()">로그인</a></div>

            
           
            </form>








            <ul class="idpw">
            	<li class="srch_id">
            	<a href="uJoin.bo" id="memberReg">회원가입</a>
					</li>
            	<li class="srch_id"><a href="uMemberIdFind.bo" id="findIdId">아이디 찾기</a></li>
                <li class="srch_pw"><a href="uMemberPwFind.bo" id="findIdPw">비밀번호 찾기</a></li>
            </ul>
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
        window.location.href='uMainLoginNO.bo';
        break;
    case "android" :
    	window.location.href='uMainLoginNO.bo';
        break;
    case "ios" :
    	window.location.href='uMainLoginNO.bo';
        break;
    case "" :
    	window.location.href='uMainLoginNO.bo';
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
<script type="text/javascript" src="js/common_spb.js"></script>
<script type="text/javascript">
	$(function(e){

			if($('#loginCheck').is(':checked')){
	        	$("#mempw").removeAttr("onfocus", "mtk.onKeyboard(this);");
	        	$("#mempw").removeAttr("onclick", "mtk.onKeyboard(this);");
				$("#mempw").removeAttr("data-tk-kbdType", "qwerty");
	        	$("#mempw").removeAttr("data-tk-useinput", "true");
	        	$("#mempw").removeAttr("data-tk-dataType", "aA@");
			}else{
				$("#mempw").attr("data-tk-kbdType", "qwerty");
	        	$("#mempw").attr("data-tk-useinput", "true");
	        	$("#mempw").attr("data-tk-dataType", "aA@");
	        	$("#mempw").attr("onclick", "mtk.onKeyboard(this);");
	        	$("#mempw").attr("onfocus", "mtk.onKeyboard(this);");
	        	initmTranskey();
			}

		login.initBtn();
		//url 값이 온걸 decoding 해주는 함수
		var expDate = new Date();
		var urlParam = getUrlParams();
		if ( urlParam["logout"] === "true"){

			jsonData = {"id" : "", "pw" : "", "auto" : "N", "call" : "setLogin"};
			loginInfo = JSON.stringify(jsonData);

			if(urlParam["appOsType"] == "android"){
				window.android.setLogin(loginInfo);
			} else if(urlParam["appOsType"] == "ios"){
				window.location = "toApp://?" + loginInfo;
			} else {
				expDate.setDate(expDate.getDate() -1);//cookie delete
				SetCookie("SPBcookieSaveid", loginForm.memid.value, expDate);
				SetCookie("SPBcookieSavepw", AES_Encode(loginForm.mempw.value), expDate);

			}
		}
		//fail이 오면 if 조건 충족
		if(urlParam["fail"] == "true"){
			window.osType = '';
			alert('아이디 또는 비밀번호를 다시 확인하세요.');
			$("[name='j_username']").focus();
			return false;
		}
		//member 가 오면 조건 충족
		if(urlParam["member"] == "true"){
			alert('회원으로 로그인 하세요.');
			$("[name='j_username']").focus();
			return false;
		}
		//lost 가  오면 충족
		if(urlParam["lost"] == "true"){
			alert('핸드폰 분실 신청된 회원입니다.');
			$("[name='j_username']").focus();
			return false;
		}
		window.osType = '';
		//appostype를 받아 해당하는거에 맞는부분에 걸리면 조건 충족
		if(urlParam["appOsType"] == "android" || window.osType == "android"){
			window.android.getLogin();
		} else if(urlParam["appOsType"] == "ios" || window.osType == "ios"){
			jsonData = {"call" : "getLogin"};
			window.location = "toApp://?" + JSON.stringify(jsonData);
			$("#ostype").val(urlParam["appOsType"]);
		} else {

		}

	});

	var login = {};
	login.initBtn = function () {
		$("#loginBtn").on("click", this.loginFnc);
	};


	login.loginFnc = function(e) {

		e.preventDefault();
		e.stopPropagation();

		var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		var usrId = $("[name='j_username']").val();
		var usrType = "01";
		var urlParam = getUrlParams();
		//?
		if(usrId.substring(0,3) == "010"){
			if(usrType == "01"){
				alert('회원 아이디를 입력해주세요.');
				$("[name='j_username']").val("");
				$("[name='j_password']").val("");
				$("[name='j_username']").focus();

				return false;
	    	}
		}

		if($("[name='j_username']").val() == ""){
			alert('로그인 아이디를 입력해주세요.');
			$("[name='j_username']").focus();

			return false;
		}else if($("[name='j_password']").val() == ""){
			alert('로그인 비밀번호를 입력해주세요.');
			$("[name='j_password']").focus();

			return false;
		}else{
			//로그인 유지 체크
			var usrId = $("[name='j_username']").val();
			var usrPassword = $("[name='j_password']").val();
			var encodePassword = AES_Encode(usrPassword);
			var reEncodePassword = encodePassword.replace(/[\r|\n]/g, "");
			var jsonData = null;
			var loginInfo = null;
			var expdate = new Date();
			expDate = new Date(parseInt(expdate.getTime()));
			//자동로그인 체크시 조건 충족
			if($("#loginCheck").is(':checked') ){
				jsonData = {"id" : usrId, "pw" : reEncodePassword, "auto" : "Y", "call" : "setLogin"};
				loginInfo = JSON.stringify(jsonData);

				if(urlParam["appOsType"] == "android"){
					window.android.setLogin(loginInfo);
				} else if(urlParam["appOsType"] == "ios"){
					window.location = "toApp://?" + loginInfo;
				} else {
					//PC
					expDate.setFullYear(expDate.getFullYear() + 3);
					SetCookie("SPBcookieSaveid", loginForm.memid.value, expDate);
					SetCookie("SPBcookieSavepw", AES_Encode(loginForm.mempw.value), expDate);
					loginSubmit();
				}
			} else {
				//자동로그인 미체크시
				jsonData = {"id" : "", "pw" : "", "auto" : "N", "call" : "setLogin"};
	    		loginInfo = JSON.stringify(jsonData);

	    		if(urlParam["appOsType"] == "android"){
					window.android.setLogin(loginInfo);
				} else if(urlParam["appOsType"] == "ios"){
					window.location = "toApp://?" + loginInfo;
				} else {
					expDate.setDate(expDate.getDate() -1);//cookie delete
					SetCookie("SPBcookieSaveid", loginForm.memid.value, expDate);
					SetCookie("SPBcookieSavepw", AES_Encode(loginForm.mempw.value), expDate);
					loginSubmit();
				}
			}
		}
	};
	//로그인정보
	function loginResultInfo(json) {
		var radioValue = "01";
		var deJson = decodeURIComponent(json);
		var loginInfo = $.parseJSON(deJson.toString());
		//push 메세지용 사용자 디바이스 Id,osType
	    var deviceId = loginInfo.token;
	    var deviceOsType = loginInfo.osType;

	    $("#usrDeviceId").val(deviceId);
	    $("#ostype").val(deviceOsType);
	    // 앱에 저장했던 값
    	if(loginInfo.id !== "" && loginInfo.auto === "Y"){
			$("[name='j_username']").val(loginInfo.id);
			$("[name='j_password']").val(AES_Decode(loginInfo.pw));
			$("#loginCheck").attr('checked', true);
			$("#loginchk").attr('checked', true);
			$("[name='loginchk']").prop("checked")
			$("#loginCheck").val("on");
   			$("#loginchk").val("on");
			//자동로그인
			var urlParam = getUrlParams();
			if(urlParam["logout"] !== "true"){
				$("#loginBtn").trigger("click");
			}
		}

	};

	 //json 값을 받아 uri 디코드해서 json 형태로 로그인데이터를 넘김
	function loginSetSuccess(json){
		var deJson = decodeURIComponent(json);
		var saveLoginInfo = $.parseJSON(deJson.toString());
		loginSubmit();
	};

	//loginform 데이터를 j_spring_security_check로 넘김
	function loginSubmit(){  //com_login.jsp

		//1.자동로그인 체크
		 if ($('#loginCheck').is(':checked'))
		 {
			var pwde = AES_Encode($("#mempw").val());
			 $("#mempw").val(pwde);
		}else{
		//transkey
			mtk.fillEncData();
		}

		$("[name='loginForm']").attr("action", "/j_spring_security_check");
		$("[name='loginForm']").submit();
	}

	//자동로그인
	function idCheck(){
		var loginid = cookieVal("SPBcookieSaveid");
		var loginpw = cookieVal("SPBcookieSavepw");
		if(loginid != ""){
			$("#loginCheck").attr('checked', true);
			$("[name='j_username']").val(loginid);
			$("[name='j_password']").val(AES_Decode(loginpw));
			$("[name='j_username']").focus();
			$("[name='j_password']").focus();

			//자동로그인
			var urlParam = getUrlParams();
			if(urlParam["logout"] !== "true"){
				$("#loginBtn").trigger("click");
			}
		}
	}
	//자동로그인 체크하면
 	$("#loginCheck").change(
			function(){
				if ($(this).is(':checked')) {
					$("#mempw").removeAttr("data-tk-kbdType", "qwerty");
		        	$("#mempw").removeAttr("data-tk-useinput", "true");
		        	$("#mempw").removeAttr("data-tk-dataType", "aA@");
		        	$("#mempw").removeAttr("onclick", "mtk.onKeyboard(this);");
		        	$("#mempw").removeAttr("onfocus", "mtk.onKeyboard(this);");
		        	$("#mempw").val("");
		        }else{
		        	$("#mempw").attr("data-tk-kbdType", "qwerty");
		        	$("#mempw").attr("data-tk-useinput", "true");
		        	$("#mempw").attr("data-tk-dataType", "aA@");
		        	$("#mempw").attr("onclick", "mtk.onKeyboard(this);");
		        	$("#mempw").attr("onfocus", "mtk.onKeyboard(this);");
		        	initmTranskey();
		        }
			});

 	$(document).ready(
 		function() {
			console.log($("#loginCheck").val());
			console.log( $('#loginCheck').prop('checked') );
		});


</script>

</body>

<!-- Mirrored from www.bikeseoul.com/login.do by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 21 Aug 2019 10:54:04 GMT -->
</html>
