<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=medium-dpi" name="viewport">
<meta name="description=" Content="" />
<title>서울자전거 따릉이 - 무인대여시스템</title>
<link href="./css/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="./js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript" src="./js/easing/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="./js/gibberish-aes.js"></script>
<script type="text/javascript" src="./js/jquery.simpler-sidebar.min.js"></script>
<script type="text/javascript" src="./js/jquery-confirm.js"></script>
<script type="text/javascript" src="./js/comm.js"></script>
<script type="text/javascript" src="./js/common_spb.js"></script>

<link rel="stylesheet" href="./css/style_kr_v2.css" type="text/css">
<link rel="stylesheet" href="./css/common.css" type="text/css">
<link rel="stylesheet" href="./css/jquery-confirm.css">
<!--[if lt IE 9]>
<link href="/css/pw.css" title="ie8chn" rel="stylesheet" type="text/css" />
<script src="/js/html5.js"></script>
<script src="/js/respond.min.js"></script>
<![endif]-->
</head>
<body>

	<div class="wrap my">

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
                <a class="logout" href="uMainLoginNO.do">로그아웃</a>
						<a class="logout" href="uMyUseList.bo"> <%= session.getAttribute("userID") %>님 반갑습니다.&nbsp;&nbsp;&nbsp;나의 공간</a>
					<div class="global" id="changeLang">
                    <ul>
                        <li class="en"><a href="https://www.bikeseoul.com:447/main.do?lang=en">ENGLISH</a></li>
                        <li class="ch"><a href="https://www.bikeseoul.com:447/main.do?lang=zh">中國語</a></li>
                        <li class="ja"><a href="https://www.bikeseoul.com:447/main.do?lang=ja">日本語</a></li>
                    </ul>
                </div>
            </div>
            <div class="logo"><a href="uMainLoginOK.bo"><img src="images/logo.png" alt="서울자전거 따릉이"></a></div>

            <!--메뉴(웹)-->
            <div class="menu_web">
                <ul>
                    <li><a href="./main.do#bike_info">사업소개</a></li>
                    <li><a href="./app/station/moveStationRealtimeStatus.do">대여소 조회</a></li>
                    <li><a href="./app/ticket/member/buyTicketList.do">이용권 구매</a></li>
                    <li><a href="./customer/opinionBoard/opinionBoardList.do">시민의견수렴</a></li>
                    <li><a href="./customer/notice/noticeList.do">공지사항</a></li>
                    <li><a href="./customer/faq/faqList.do">안전수칙</a></li>
                </ul>
            </div>
            <button id="showRight" class="menu_app"></button>
            <!--메뉴(웹)-->
        </div>
    </div>
    <!--웹 : 헤더추가--><div class="container">

    	<div class="my_navi">

            <div class="tabs">
                <ul>
                    <li class="tab-1"><a href="uMyInfoEdit.bo">회원정보 관리</a></li>
                    <li class="tab-2 on"><a href="uMyBuyList.bo">결제 관리</a></li>
                    <li class="tab-3"><a href="uMyUseList.bo">이용정보 관리</a></li>
                </ul>
            </div>
        </div>

    	<div class="content">
        <div class="category_tab">
            <dl>
                <dd style="width:25%"><a href="uMyCounseling.bo">상담내역</a></dd>
                <dd style="width:25%"><a href="uMyOpinionBoardWrite.bo">시민의견등록</a></dd>
                <dd style="width:25%" class="on"><a href="uMyInfoEdit.bo">개인정보수정</a></dd>
                <dd style="width:25%"><a href="uMySecede.bo">회원탈퇴</a></dd>
            </dl>
        </div>

        <div class="my">
            <div class="top">
                <h3>개인정보수정</h3>
                <button class="back"></button>
                <button class="close"></button>
            </div>

            <p class="caption"><img src="./images/ic_needs.gif" alt="">표시는 필수입력 사항입니다.</p>
            <form id="frm">
				<input type="hidden" name="sReserved1" value="" />
				<input type="hidden" name="sReserved2" value="" />
				<input type="hidden" name="sReserved3" value="" />
				<input type="hidden" name="mobAgency" />
				<input type="hidden" name="userMob1" />
				<input type="hidden" name="userMob2" />
				<input type="hidden" name="userMob3" />
				<input type="hidden" name="emailRecvYn" />
            <div class="my_box">
            	<table>
            		<colgroup>
            			<col width="25%">
            			<col width="75%">
            		</colgroup>
                	<tr>
                    	<th class="first">아이디</th>
                        <td class="first"><span>abcd0134</span></td>
                    </tr>
                    <tr>
                    	<th>비밀번호</th>
                        <td><button type="submit" formaction="./app/mybike/memberInfo/passwordChange.do">비밀번호 변경</button></td>
                    </tr>
                    <tr>
                    	<th>이메일주소<img src="./images/ic_needs.gif" alt=""></th>
                        <td>
                        <div class="pay_input w25"><input title="이메일주소 첫번재 입력" type="text" class="w100" id="mmemail" name="userEmail1" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"></div>
                        <span>@</span>
                        <div class="pay_input w25"><input title="이메일주소 두번째 입력" type="text" class="w100" id="" name="userEmail2" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"></div>
                        <select name="userEmailSlt" style="width: 30%">
                            <option value="">직접입력</option>
                            <option value="daum.net">daum.net</option>
                            <option value="empal.com">empal.com</option>
                            <option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                    	<th>휴대전화번호<img src="./images/ic_needs.gif" alt=""></th>
                        <td>
                        <span id="mobInfo">010-5567-0651&nbsp;</span><br>
                        <button type="button" id="mobNoUpdate" style="margin-top: 5px;">휴대 전화번호 변경 </button>
                        <button type="button" id="mobLostReport">휴대폰 분실 신청 </button>
							</td>
                    </tr>
                    <tr>
                    	<th>체중</th>
                        <td>
                        <div class="pay_input w30"><input type="text" class="w100" id="memkg" name="userWeight" placeholder="65" maxlength="3" oninput="maxLengthCheck(this)" style="width:35px" value="46" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/></div>
                        kg
                        <p>운동량 계산을 위해 필요한 정보입니다.<br>미기재시 65kg으로 계산됩니다.</p>
                        </td>
                    </tr>
                </table>
                </div>
                <div class="btn"><a href="#" id="modify">수정</a></div>
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
                <li><a href="./app/use/moveUseMenuClauseInfo.do">이용약관</a></li>
                <li class="line"><a href="./app/use/moveUseMenuInsurance.do">보험안내</a></li>

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
    }
}

function goAlim(e) {
    //e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
    switch(window.osType){
    case "web" :
        window.location.href='/app/mybike/getPushHistory.do';
        break;
    case "android" :
    	window.location.href='/app/mybike/getPushHistory.do';
        break;
    case "ios" :
    	window.location.href='/app/mybike/getPushHistory.do';
        break;
    case "" :
        window.location.href='/app/mybike/getPushHistory.do';
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
<script type="text/javascript" src="./js/common_spb.js"></script>
    <script type="text/javascript">
    $(function() {
        initBtn();
        window.osType = '' == '' ? 'web' : '';
        if(window.osType == 'android' || window.osType == 'ios'){
        	$('#mobLost').hide();
        }

        var userEmail1 = 'abcd0134@naver.com'.split('@')[0];
        var userEmail2 = 'abcd0134@naver.com'.split('@')[1];
        $('[name="userEmail1"]').val(userEmail1);
        $('[name="userEmail2"]').val(userEmail2);

        var userTel1 = ''.split('-')[0];
        var userTel2 = ''.split('-')[1];
        var userTel3 = ''.split('-')[2];

        $('[name="userTel1"]').val(userTel1);
        $('[name="userTel2"]').val(userTel2);
        $('[name="userTel3"]').val(userTel3);
        $('[name="userEmailSlt"]').on("change", changeEmail);

        if('N'=='N'){
        	$('[name="emailDenyYn"]').prop('checked', true);
        }
    });

    var memberInfo = {};

  //길이 체크
	function maxLengthCheck(obj) {
		if(obj.value.length > obj.maxLength){
			obj.value = obj.value.slice(0, obj.maxLength);
		}
	}

    function pageRefresh(pData){
    	$("#frm").attr({method : 'post', action : './app/mybike/memberInfo/memberInfoEdit.do'}).submit();
    }

    function initBtn() {
    	var _this = memberInfo;
    	$('#modify').on("click", _this.exeMemberInfo);
    	$('[name="cancel"]').on("click", _this.cancelMemberInfo);
		$('#jusoFind').on("click", showJusoFind);
		$('#mobNoUpdate').on("click", _this.phoneCertify);
		$('#mobLostReport').on("click", _this.mobLostReport);
		$('#mobLostCancel').on("click", _this.mobLostCancel);
    }

    memberInfo.mobLostReport = function(e){
        var osType = window.osType;
    	//var tUrl = '<=request.getScheme()%>://<=request.getLocalAddr()%>:<=request.getLocalPort()%>/app/mybike/memberInfo/mobLostReport.do';
    	//var tUrl = '<= domainName2%>' + 'app/mybike/memberInfo/mobLostReport.do';

    	var tUrl = "https://www.bikeseoul.com/app/mybike/memberInfo/mobLostReport.do";
        var title = "휴대폰 분실 신고" ;
        switch(osType){
            case "web" :
            	window.open(tUrl, 'mobLost', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=yes');
                break;
            case "android" :
                var pData = {targetUrl  :tUrl, returnFnc : "", title : title };
                window.android.openWebviewPopup(JSON.stringify(pData));
                break;
            case "ios" :
                var iosUrl = 'toApp://?{"targetUrl" : "'+tUrl+'","title" : "'+title+'", "returnFnc" : "", "call":"openWebviewPopup"}';
                window.location = iosUrl;
                break;
        }
    }

    memberInfo.mobLostCancel = function(e){
    	var osType = window.osType;
    	//var tUrl = '<=request.getScheme()%>://<=request.getLocalAddr()%>:<=request.getLocalPort()%>/app/mybike/memberInfo/mobLostCancel.do';
    	//var tUrl = '<= domainName2%>' + 'app/mybike/memberInfo/mobLostCancel.do';
    	var tUrl = 'https://www.bikeseoul.com/app/mybike/memberInfo/mobLostCancel.do';
        var title = "휴대폰 분실 신고해지" ;
        switch(osType){
            case "web" :
            	window.open(tUrl, 'mobLost', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=yes');
                break;
            case "android" :
                var pData = {targetUrl  :tUrl, returnFnc : "", title : title };
                window.android.openWebviewPopup(JSON.stringify(pData));
                break;
            case "ios" :
                var iosUrl = 'toApp://?{"targetUrl" : "'+tUrl+'","title" : "'+title+'", "returnFnc" : "", "call":"openWebviewPopup"}';
                window.location = iosUrl;
                break;
        }
    }

    memberInfo.exeMemberInfo = function(e){
    	e.preventDefault();
		var numCheck = /^[0-9]*$/;
		var emailCheck = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;


    	if($('[name="userEmail1"]').val() == ''){
			alert('이메일주소를 확인해주세요.');
			$('[name="userEmail1"]').focus();
			return false;
		}

		if(!emailCheck.test($('[name="userEmail2"]').val())){
    		alert('이메일주소를 확인 해주세요.');
    		$('[name="userEmail2"]').focus();
    		return;
    	}

		if($('[name="userEmail2"]').val() == ''){
			alert('이메일주소를 확인해주세요.');
			$('[name="userEmail2"]').focus();
			return false;
		}

		if(!numCheck.test($('[name="userWeight"]').val())){
			alert('체중은 숫자만 입력 가능합니다.');
			$('[name="userWeight"]').focus();
			return false;
		}

		if($('[name="userWeight"]').val() > 200){
			alert('체중은 200kg 이하만 가능합니다.');
			return false;
		}

		if($('[name="emailDenyYn"]').is(':checked')){
			$('[name="emailRecvYn"]').val('N');
		}else{
			$('[name="emailRecvYn"]').val('Y');
		}

    	var result = confirm('개인정보를 수정하시겠습니까?');
    	if(result){
    		if($('[name="userWeight"]').val() == ''){
    			$('[name="userWeight"]').val('65');
    		}
    		$('[name="userEmail1"]').val($.trim($('[name="userEmail1"]').val()));
    		$.ajax({
    			type		: 'post',
    			url			: './app/mybike/memberInfo/updateMemberInfo.do',
    			dataType	: 'json',
    			data		: $('#frm').serialize(),
    			async		: false,
    			success		: function( data ) {
    				if(data.resultMessage == 'Success'){
        				alert("개인정보 수정이 완료되었습니다.");
        			}else{
        				alert("개인정보 수정에 실패하였습니다.");
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

    }

    memberInfo.phoneCertify = function(e){
    	e.preventDefault();
    	var sReserved1 = "";
		var	sReserved2 = window.osType;
		var	sReserved3 = 2427766;

        $('[name="sReserved1"]').val(sReserved1);
        $('[name="sReserved2"]').val(sReserved2);
        $('[name="sReserved3"]').val(sReserved3);

		//var tUrl = '<=request.getScheme()%>://<=request.getLocalAddr()%>:<=request.getLocalPort()%>/niceIdCertifyRequest.do?sReserved1='+sReserved1+'&sReserved2='+sReserved2+'&sReserved3='+sReserved3;
		//var tUrl = '<= domainName2%>' + 'niceIdCertifyRequest.do?sReserved1='+sReserved1+'&sReserved2='+sReserved2+'&sReserved3='+sReserved3;

		//var tUrl = '<=request.getScheme()%>://<=request.getLocalAddr()%>:<=request.getLocalPort()%>/niceIdCertifyRequest.do?sReserved1='+sReserved1+'&sReserved2='+sReserved2+'&sReserved3='+sReserved3;
		var tUrl = 'https://www.bikeseoul.com/app/mybike/memberInfo/mobChangeCertify.do';
		var title = "본인인증" ;

       	switch(window.osType){
           	case "web" :
           		window.open(tUrl, 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
               	break;
           	case "android" :
               	var pData = {targetUrl  :tUrl, returnFnc : "certifySuccess", title : title };
               	window.android.openWebviewPopup(JSON.stringify(pData));
               	break;
           	case "ios" :
               	var iosUrl = 'toApp://?{"targetUrl" : "'+tUrl+'","title" : "'+title+'", "returnFnc" : "certifySuccess", "call":"openWebviewPopup"}';
               	window.location = iosUrl;
               	break;
       	}
    }

    function changeEmail(e){
    	e.preventDefault();
		$('[name="userEmail2"]').val($('[name="userEmailSlt"]').val());
	}

    function showJusoFind(e){
		var osType = window.osType;
		//var tUrl = '<=request.getScheme()%>://<=request.getLocalAddr()%>:<=request.getLocalPort()%>/juso.do?appOsType='+osType;
		var tUrl ='https://www.bikeseoul.com:446/' + 'juso.do?appOsType='+osType;
        var title = "주소찾기" ;
        switch(osType){
            case "web" :
            	window.open(tUrl, 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=yes');
                break;
            case "android" :
                var pData = {targetUrl  :tUrl, returnFnc : "jusoCallBack", title : title };
                window.android.openWebviewPopup(JSON.stringify(pData));
                break;
            case "ios" :
                var iosUrl = 'toApp://?{"targetUrl" : "'+tUrl+'","title" : "'+title+'", "returnFnc" : "jusoCallBack", "call":"openWebviewPopup"}';
                window.location = iosUrl;
                break;
        }
	}

    function certifySuccess(pData){
    	var resultData;
		if(window.osType != 'web'){
			pData = pData.replace('"{', '{');
			pData = pData.replace('}"', '}');
			resultData = JSON.parse(pData);
		}else{
			resultData = JSON.parse(pData);
		}

    	var sMobileCo = resultData.data.sMobileCo;
    	var sMobileNo = resultData.data.sMobileNo;
    	var sDupInfo = resultData.data.sDupInfo;

    	var userMob1 = "";
    	var userMob2 = "";
    	var userMob3 = "";

    	if(sMobileNo.length == 10){
    		userMob1 = sMobileNo.substring(0, 3);
    		userMob2 = sMobileNo.substring(3, 6);
    		userMob3 = sMobileNo.substring(6, 10);
		}else if(sMobileNo.length == 11){
			userMob1 = sMobileNo.substring(0, 3);
			userMob2 = sMobileNo.substring(3, 7);
			userMob3 = sMobileNo.substring(7, 11);
		}
    	var result = confirm('휴대전화 번호를 '+userMob1+'-'+userMob2+'-'+userMob3+''+'(으)로 변경하시겠습니까?');
    	if(result){
    		$.ajax({
    			type		: 'post',
    			url			: '/app/mybike/memberInfo/updateMobNoAjax.do',
    			dataType	: 'json',
    			data		: {userMob1:userMob1, userMob2:userMob2, userMob3:userMob3},
    			async		: false,
    			success		: function( data ) {
    				if(data.resultMessage == 'Success'){
        				alert("휴대전화번호 변경이 완료되었습니다.");
        				$('#mobInfo').text(userMob1+'-'+userMob2+'-'+userMob3+' ');
        			}else if(data.resultMessage == 'Invalid'){
        				alert("본인 명의의 휴대전화번호가 아닙니다.");
        			}else{
        				alert("휴대전화번호 변경에 실패하였습니다.");
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
    }
    </script>
</body>
</html>
