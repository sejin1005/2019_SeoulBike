<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=medium-dpi" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description=" Content="" />
<script src="js/repond.min.js"></script>
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
<script src="./js/repond.min.js"></script>
<script src="./js/accordion/jquery-2.1.0.min.js"></script>
<script src="./js/accordion/jquery.responsiveTabs.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
    var $tabs = $('#horizontalTab');
    $tabs.responsiveTabs({
        rotate: false,
        startCollapsed: 'accordion',
        collapsible: 'accordion',
        setHash: true,
        disabled: [8,9],
        click: function(e, tab) {
            $('.info').html('Tab <strong>' + tab.id + '</strong> clicked!');
        },
        activate: function(e, tab) {
            $('.info').html('Tab <strong>' + tab.id + '</strong> activated!');
        },
        activateState: function(e, state) {
            //console.log(state);
            $('.info').html('Switched from <strong>' + state.oldState + '</strong> state to <strong>' + state.newState + '</strong> state!');
        }
    });

    $('#start-rotation').on('click', function() {
        $tabs.responsiveTabs('startRotation', 1000);
    });
    $('#stop-rotation').on('click', function() {
        $tabs.responsiveTabs('stopRotation');
    });
    $('#start-rotation').on('click', function() {
        $tabs.responsiveTabs('active');
    });
    $('#enable-tab').on('click', function() {
        $tabs.responsiveTabs('enable', 3);
    });
    $('#disable-tab').on('click', function() {
        $tabs.responsiveTabs('disable', 3);
    });
    $('.select-tab').on('click', function() {
        $tabs.responsiveTabs('activate', $(this).val());
    });

     $('ul.tabs li').click(function(){
var tab_id = $(this).attr('data-tab');
var tab_idx = tab_id.substring(4);

$('ul.tabs li').removeClass('current');
$('.tab-content').removeClass('current');

$(this).addClass('current');
$("#"+tab_id).addClass('current');

//다른 항목에 있는 current 까지 삭제 한거 복구
if(tab_idx.length == 2) {
$("#tab-"+tab_id.substring(1)).addClass('current');
} else if(tab_idx.length == 1) {
$("#tab-"+tab_idx+tab_idx).addClass('current');
}

})


});

</script>
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
                    <li><a href="./customer/faq/faqList.do">안전수칙/a></li>
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
                    <li class="tab-2 on"><a href="uBuyList.bo">결제 관리</a></li>
                    <li class="tab-3"><a href="uUseList.bo">이용정보 관리</a></li>
                </ul>
            </div>
        </div>

    	<div class="content">
        <div class="category_tab">
        </div>

	        <!--나의공간 > 이용권내역-->
	        <div class="my">
	            <div class="top">
	                <h3>이용권 내역</h3>
	                <button class="back"></button>
	                <button class="close"></button>
	            </div>

	             <!--이용권 현황-->
	            <div id="tab-1" class="tab-content current">
	                <div class="my_box list">
	                <table>
	                	<colgroup>
	                        <col width="25%">
	                        <col width="25%">
	                        <col width="50%">
	                    </colgroup>
	                	<tr>
	                    	<th class="first" style="text-align: center;">이용권</th>
	                        <th class="first" style="text-align: center;">등록일자</th>
	                        <th class="first" style="text-align: center;">사용</th>
	                    </tr>
	                    </table>
	                </div>
	            </div>

	            <!--받은이용권-->
	            <div id="tab-2" class="tab-content">
	            	<div class="my_box list">
	                <table>
	                	<colgroup>
	                        <col width="20%">
	                        <col width="15%">
	                        <col width="45%">
	                        <col width="20%">
	                    </colgroup>
	                	<tr>
	                    	<th class="first" style="text-align: center;">이용권</th>
	                        <th class="first" style="text-align: center;">등록일자</th>
	                        <th class="first" style="text-align: center;">사용</th>
	                        <th class="first" style="text-align: center;">발신자</th>
	                    </tr>
	                    </table>
	                </div>
	            </div>

	            <!--보낸이용권-->
	            <div id="tab-3" class="tab-content">
	            	<div class="my_box list">
	                <table>
	                	<colgroup>
	                        <col width="25%">
	                        <col width="25%">
	                        <col width="50%">
	                    </colgroup>
	                	<tr>
	                    	<th class="first" style="text-align: center;">이용권</th>
	                        <th class="first" style="text-align: center;">발송일</th>
	                        <th class="first" style="text-align: center;">수신</th>
	                    </tr>
	                    </table>
	                </div>
	            </div>

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
        window.location.href='./app/mybike/getPushHistory.do';
        break;
    case "android" :
    	window.location.href='./app/mybike/getPushHistory.do';
        break;
    case "ios" :
    	window.location.href='./app/mybike/getPushHistory.do';
        break;
    case "" :
        window.location.href='./app/mybike/getPushHistory.do';
        break;
    }
}

function changeLang(e) {
	var lang = 'en'

	switch(window.osType){
    case "web" :
        window.location.href='./main.do?lang='+lang;
        break;
    case "android" :
    	window.location.href='./main.do?lang='+lang;
        break;
    case "ios" :
    	window.location.href='./main.do?lang='+lang;
        break;
    case "" :
        window.location.href='./main.do?lang='+lang;
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
        /*/images/inc/stationIocnBlue.png */
    });

    var couponList = {};

    function initBtn() {
    	var _this =  couponList;
        $('[name="useCoupon"]').on("click", _this.useCoupon)
    }
    couponList.useCoupon = function(e){
    	e.preventDefault();
    	var couponNo = $(this).parent().next().text();

    	if(confirm("이용권을 사용하시겠습니까?")){
    		//commonAjax.postAjax("/app/mybike/coupon/validChkVoucherAjax.do", 'json', {couponNo:couponNo}
	       	//	, function(data){
		$.ajax({//추가 : 중복 호출(삽입) 방지(async 옵션)_2016.12.02_by_JHN
	    				type		: 'post',
	    				url			: './app/mybike/coupon/validChkVoucherAjax.do',
	    				dataType	: 'json',
	    				data		: {couponNo:couponNo},
	    				async		: false,
	    				success		: function( data ) {

	    			if(data.resultMessage == 'Y1'){
	    				alert('사용중인 이용권이 존재합니다.');
	    			}else if(data.resultMessage == 'Y2'){
	    				alert('미사용 이용권이 존재합니다.');
	    			}else{
	    				alert('이용권이 사용 등록 되었습니다.');
	    				$("#frm").attr({method : 'post', action : './app/mybike/coupon/couponList.do'}).submit();
	    			}
			}
		}//ajax
	        );
    	}
    }

    </script>
</body>
</html>
