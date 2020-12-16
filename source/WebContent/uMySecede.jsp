<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="description=" Content="" />
<title>서울자전거 따릉이 - 무인대여시스템</title>
<link href="/css/jquery-ui.css" rel="stylesheet" type="text/css" />
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
                <a class="logout" href="uMainLoginNO.bo">로그아웃</a>
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
                <h3>회원탈퇴</h3>
                <button class="back"></button>
                <button class="close"></button>
            </div>

            <dl class="out_txt">
                <dt><span>회원탈퇴</span>를 신청합니다.</dt>
                <dd>서울자전거를 이용해 주셔서 감사합니다.</dd>
                <dd>회원탈퇴를 하실 경우 아래와 같이 회원정보가 처리됩니다.</dd>
            </dl>

            <div class="out_info">
                <ul>
                    <li>탈퇴 신청 즉시 회원탈퇴 처리되며, 해당 아이디의 회원정보 및 마일리지는 삭제처리되며, 복원할 수 없습니다.</li>
                    <li>회원탈퇴 이후 같은 아이디로는 재가입이 불가능 합니다.</li>
                    <li>이용권 기간이 남아있는 경우 즉시 탈퇴가 불가능 하오니 고객센터에 문의 바랍니다.</li>
                </ul>
            </div>

            <div class="out_box">
                <div class="btn"><a href="#" id="confirm">회원탈퇴</a></div>
            </div>
			    <form id="frm">
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
<script type="text/javascript" src="/js/common_spb.js"></script>
    <script type="text/javascript">
    $(function() {
        initBtn();
        commonAjax.getCommonCode("OUT"
  		    , function(data){
  		        if(data !== null && data.codeList !== null) {
  		        	commCdBox.makeComboBox("CC", '', data.codeList, "leaveReasonCd");
  		           //$('#leaveReasonCd').append("<option value='1'>Apples</option>");
  		        }
  		    }
  		);
    });

    var memberSecede = {};

    function initBtn() {
    	var _this = memberSecede;
    	$('#confirm').on('click', _this.exeSecede);
    }

    memberSecede.exeSecede = function(e){
		if($('#leaveReasonCd').val() == ''){
			alert('탈퇴 사유를 선택해주세요.');
			return;
		}

    	if(confirm('회원탈퇴 하시겠습니까?')){

    		if('false' == 'true'){
    			alert('이용권 기간이 남아있어 탈퇴가 불가능합니다. 고객센터로 문의바랍니다.');
    			return;
    		}

    		if('false' == 'true'){
    			alert('미사용 이용권이 남아있어 탈퇴가 불가능합니다. 고객센터로 문의바랍니다.');
    			return;
    		}

    		if('false' == 'true'){
    			alert('대여중에는 탈퇴가 불가능합니다.');
    			return;
    		}

    		if('false' == 'true'){
    			alert('미납요금이 존재합니다. 요금 완납 이후 탈퇴가 가능합니다.');
    			return;
    		}

    		if('false' == 'true'){
    			if(!confirm('블랙리스트로 등록된 상태입니다. 회원탈퇴 하시면 재가입이 불가능합니다. 회원탈퇴 하시겠습니까?')){
        			return;
        		}
    		}

    		var leaveReasonCd = $('#leaveReasonCd').val();

    		$.ajax({
				type		: 'post',
				url			: '/app/mybike/memberInfo/deleteMemberInfo.do',
				dataType	: 'json',
				data		: {leaveReasonCd:leaveReasonCd},
				async		: false,
				success		: function( data ) {
					if(data.resultMessage == 'Success'){
						alert('정상적으로 탈퇴처리가 완료되었습니다. 이용해주셔서 대단히 감사합니다.')
						var userEmail = 'abcd0134@naver.com';
						var userId = 'abcd0134';
						var parameter = {};
						parameter.email = userEmail;
						parameter.val1 = userId;
						parameter.biz_id = "seoulbikego";
						var comCd = "TPL_004";
						$.ajax({
							type		: 'post',
							url			: '/commonCode/getCommonCodeVal.do',
							dataType	: 'json',
							data		: {comCd:comCd},
							async		: false,
							success		: function( data ) {
								parameter.templateNo = data.templateNo;
								sendEmail(parameter);
						    	$("#frm").attr({method : 'post', target : '', action : '/logout.do'}).submit();
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
	    				alert('회원탈퇴에 실패하였습니다. 고객센터로 문의바랍니다.');
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
