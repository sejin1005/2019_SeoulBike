<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" name="viewport">

<!-- , target-densityDpi=medium-dpi android만 가능 -->

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
<script src="./js/select/jquery.styled-select-box_main.js"></script>

<script type="text/javascript" src="./transkey_mobile/transkey.js"></script>
<link rel="stylesheet" type="text/css" href="./transkey_mobile/transkey.css" />

</head>
<body class="mainWrap">

<div class="wrap">

	<!--header-->
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
						<a class="logout" href="mg_main.mo"> <%= session.getAttribute("userID") %>님 반갑습니다.&nbsp;&nbsp;&nbsp;관리자 페이지</a>
					<div class="global"  id="changeLang">
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
                    <li><a href="uTicketList.bo">이용권 구매</a></li>
                    <li><a href="./customer/opinionBoard/opinionBoardList.do">시민의견수렴</a></li>
                    <li><a href="./customer/notice/noticeList.do">공지사항</a></li>
                    <li><a href="./customer/faq/faqList.do">안전수칙</a></li>
                </ul>
            </div>
            <button id="showRight" class="menu_app"></button>
            <!--메뉴(웹)-->
        </div>
    </div>
    <!--웹 : 헤더추가--><script type="text/javascript">

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
</div>
	<form id="frm"></form>
	<!--검색-->

    <form  class="search" id="search" role="search">
     	<select id="searchParameter" name="searchParameter" value="stationNo">
            <option value="GU">지역구</option>
            <option value="stationNo" selected >대여소번호</option>
            <option value="stationName" >대여소명</option>
        </select>

        <fieldset class="fld_sch">
        <legend class="screen_out">검색어 입력폼</legend>
            <div class="box_search">
                <input type="text" id="searchValue" value="" name="searchValue" title="검색어 입력" placeholder="원하시는 지역이 어디신가요?" onkeypress="ssss">
                <!-- 2019.02.20
                	<button id="searchBtn" ><span class="noview">검색</span></button>
                 -->
            </div>
        </fieldset>
        <input type="hidden" name="searchType" id="searchType">
     </form>
        <script>$("select").styledSelect();
        </script>
     <!--검색-->

     <!--범례-->
     <div class="ex">
     	<ul>
        	<li class="ex_01"><span>0대</span></li>
            <li class="ex_02"><span>1~3대</span></li>
            <li class="ex_03"><span>4~6대</span></li>
            <li class="ex_04"><span>7대 이상</span></li>
            <li class="ex_05"><span>임시폐쇄</span></li>
        </ul>
     </div>
     <!--범례-->

		<!-- 웹 메인 -->
	    <div class="container" id="main">
	    	<div class="map" id="mapDiv" style="width:100%; height:600px;">
	    	<!-- 2019.02.20 id추가 -->
	    		<div class="guide_box" id="guide_box"  style="z-index: 1004" >
	    		<p>대여 비밀번호 등록 후 편리하게 이용하세요.&nbsp;&nbsp;<a href="/app/mybike/moveRentPasswordChangeView.do">대여비밀번호 설정</a></p>
									</div>
	        </div>
	    	<div class="main_image">
	            <div class="content">
	            	</div>
	        </div>

			<div class="main_tab">
				<ul>
					<li class="mt_1"><a href="./app/use/moveUseMenuRentCpn.do">대여방법</a></li>
					<li class="mt_2"><a href="./info/infoDuty.do">반납방법</a></li>
					<li class="mt_3"><a href="./app/station/moveStationRealtimeStatus.do">대여소현황</a></li>
					<li class="mt_4"><a href="./app/mybike/favoriteStation.do">대여하기</a></li>
				</ul>
			</div>

	        <div class="main" id="bike_info">
	            	<h1><img src="./images/ko/bikeseoul_web.png" alt="자전거와 함께하는 건강한 도시, 세계적인 자전거 도시 서울"></h1>

	            <div class="bikeseoul_bn">
	            	<ul>
	                	<li class="bn_1">
	                    	<div class="txt">
	                        <p>건강한 자전거 도시</p>
	                        <span>자전거 이용의 생활화를 통한<br>시민건강 증진 실현</span>
	                        </div>
	                    </li>
	                    <li class="bn_2"></li>
	                    <li class="bn_4"></li>
	                    <li class="bn_3">
	                    	<div class="txt">
	                        <p>깨끗한 자전거의 도시</p>
	                        <span>자전거 교통수단 분담률을 향상시켜<br>CO2 발생 감소실현</span>
	                        </div>
	                    </li>
	                    <li class="bn_5">
	                    	<div class="txt">
	                        <p>녹색 성장 선도 도시</p>
	                        <span>국가 비전인 “저탄소 녹색성장” 실현 </span>
	                        </div>
	                    </li>
	                    <li class="bn_6"></li>
	                </ul>
	            </div>

	            <div class="rental_guide">
	            	<h2>대여소 안내</h2>
	            	<ul>
	                	<li class="guide_1">
	                    	<div class="img"></div>
	                        <p>대여소는 <strong>지하철 출입구, <br> 버스정류장, 주택단지, 관공서, <br> 학교, 은행 등 생활내 통행장소</strong>를 <br> 중심으로 설치되어  <br> 운영중에 있습니다.</p>
	                    </li>
	                    <li class="guide_2">
	                    	<div class="img"></div>
	                        <p>서울자전거의 대여와 반납이 <br> 무인으로  이루어지는 <br>  정류장 형태의 공간</strong>을  <br> 대여소라고 합니다.</p>
	                    </li>
	                    <li class="guide_3">
	                    	<div class="img"></div>
	                        <p>대여소는 <strong>주변 생활시설에 <br>  접근 및 시민들의  이용이 편리한  <br> 장소를 중심으로 설치</strong>되어 <br> 운영 중에 있습니다.</p>
	                    </li>
	                    <li class="guide_4">
	                    	<div class="img"></div>
	                        <p>서울자전거 이용자는 <br> 장소에 구애받지 않고  <br><strong>대여소가 설치된 곳이면 <br> 어디에서나 자전거를 대여하고  <br> 반납</strong>할 수 있습니다.</p>
	                    </li>
	                </ul>
	            </div>

	            <div class="rental_info">
	            	<h2>대여소 구성요소</h2>
	                <div class="info_box_1">
	                	<p><img src="./images/bikeseoul_bg1.png" alt=""></p>
	                    <dl>
	                    	<dt>서울자전거</dt>
	                    	<dd>여성, 노약자 누구나 편하게 이용할 수 있는 자전거로, 가볍고 내구성이 강한 소재를 사용하여 주행 안정성과 편의성을 최우선으로 제작하였습니다.</dd>
	                        <dd class="left">서울자전거에서 이용하신 후 운행정보(주행거리, 시간), 운동량(소모 열량)을 나의공간>이용내역에서 확인 할 수 있습니다.</dd>
	                    </dl>
	                </div>
	                <div class="info_box_2">
	                	<p><img src="./images/bikeseoul_bg2.png" alt=""></p>
	                    <dl>
	                    	<dt>거치대</dt>
	                    	<dd>거치대는 자전거를 거치하기 위한 시설이며, 반납 시 자전거를 결속해 묶을 수 있는 자전거 잠금장치가 부착되어 있습니다.</dd>
	                        <dd class="right">자전거 대여시에는 거치대와 연결되어 있는 잠금장치를 자전거 단말기에서 분리한 후 이용하시면 됩니다.</dd>
	                    </dl>
	                </div>
	            </div>
	        </div>
	    </div>

<!-- <script src="/js/accordion/jquery-2.1.0.min.js"></script> -->
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

<!--하단바-->
    <div class="bottom">
        <dl>
            <dd class="my">
            	<button id="showLeft" class="my" style="display: none"></button>
            	<a href="/leftPage.do"></a>

            </dd>
            <dd class="bookmark"><a href="./app/mybike/favoriteStation.do"></a></dd>
            <dt class="guide"><a href="./info/infoReg.do"></a></dt>
            <dd class="qr"><a href="javascript:goQrRent();" id="qr"></a></dd>
            <dd class="ticket"><a href="./app/ticket/member/buyTicketList.do"></a></dd>
        </dl>

    </div>
    <!--하단바--><!--footer-->
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
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=4brj1w2qf8&submodules=geocoder"></script>
<!-- <script type="text/javascript" src="/js/stationViewEn.js"></script>
    <script type="text/javascript" src="/js/stationCommonMapvEn.js"></script> -->

    <script type="text/javascript" src="./js/newStation.js"></script>
	<!-- <script type="text/javascript" src="/js/MarkerClustering.js"></script> -->
<!--
		2019.02.20 newStation 으로 대체
		<script type="text/javascript" src="/js/stationView.js"></script>
	    <script type="text/javascript" src="/js/stationCommonMapv.js"></script>
	 -->
	<script type="text/javascript" src="./js/newStation.js"></script>

<script type="text/javascript" src="./js/common_spb.js"></script>
<!--
	2019.02.20
	<script type="text/javascript" src="/js/stationView.js"></script>
	-->
    <script type="text/javascript">
/*
    2019.02.20
    var sigugun = '';
    var centerGu;
    var centerGuNo;
    */
    // 2019.02.20
    var langClsCd = 'LAG_001';

    var deviceType = '';	// TODO 미사용 함수
    var appOsType = '';
    var positionBtnHtml = "<div class='position_re'><a href='#'>&nbsp;&nbsp;</a></div>";	// TODO 미사용 함수

    // 2019.02.20 <div style='padding:10px'> 변경
    var locationBtnHtml = "<div style='padding:10px'><img src='/images/location_re.png'></div>";	// GPS 위치 아이콘

    var loginYn				= 'Y';
    var rentClsCd			= '';
    var isChkRent			= 'false';												// Timer관련
    var moveCount			= 0;
    var urlParam			= getUrlParams();												// TODO 자동로그인 관련 Trigger체크
    var doubleSubmitFlag	= false;														// TODO 대여 중복 체크용

    // 2019.02.20 조회 결과값 가져오는 변수 설정
    var autocompleteStationName = new Array();

    $(function(){

		 idCheck();

		if($('#logchk').is(':checked')){
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


    	if('true' == 'true' && 'false' == 'false'){
			$.ajax({
				type		: 'post',
				url			: '/checkReconsentAjax.do',
				dataType	: 'json',
				data		: {},
				async		: false,
				success		: function(data){
		 			if(data.resultMessage == 'Success'){
						location.href = "/memberReconsent.do";
					}
				},
				error : function(jqXHR, textStatus,errorThrown){
					if(jqXHR.status === 500){
						alert(textStatus);
					} else {
						return false;
					}

				}
			});
		}

    	// TODO 회원정보 수집 재동의 기준인지 확인필요
    	if('' == 'Y'){
    		location.href = "/main.do";
    	}

    	// TODO m_index 미존재
		history.pushState(null, null, location.href);
		window.onpopstate = function(event) {history.go(1)};

		var mainType = cookieVal("mainType");

		/* 2019.02.20 m_index와 동일하게 변경
		$(".mainTypeMap").css('display', 'none');
		$(".mainTypeText").css('display', 'none');
		*/
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


		$(".mainTypeText").on("click", changeMainText);
		$(".mainTypeMap").on("click", changeMainMap);

		// 2019.02.20 TODO 중복 설정
		//var appOsType =  '';

    	$("#loginBtn").on("click", this.loginFnc);

    	// 사용중 타이머 앱에서만 표출할지 고민 필요
    	if (loginYn === 'Y'&& isChkRent == 'true' && rentClsCd !== '') {
			var returnTime = mysqlTimeStampToDate('');
			var now = new Date();
			var countTime = Math.floor((returnTime - now) / 60  / 1000);
			$("#countdown").text(countTime);
			countdown('countdown', countTime);
		} else {

			if ("text" != mainType ) {

		    	resizeMap();

		    	window.osType = '';

		    	// 2019.02.20
		    	// nMap.viewType = "";
		    	nMap.setMap();
		    	// 2019.02.20
		    	// nMap.searchText = "";

		        var locationCustomControl = new naver.maps.CustomControl(locationBtnHtml, {
		        	position: naver.maps.Position.RIGHT_CENTER
		        });

		        locationCustomControl.setMap(nMap.map);

		        findLocation();

		        var domEventListener = naver.maps.Event.addDOMListener(locationCustomControl.getElement(), 'click', function() {
		        	// 2019.02.20 parameter추가
		        	findLocation("location");
		        });

		    	// 2019.02.20
		    	$("#searchValue").on("click" , searhText);

				// 2019.02.20
		        naver.maps.Event.addListener(nMap.map, 'dragend', function() {
		        	nMap.updateMarkers();
		        });

		        naver.maps.Event.addListener(nMap.map, 'zoom_changed', function() {
		    		nMap.changeMarker();
		    	});

		        initSearchtext();
			}
		}


    });

    /**
     * 문자열이 빈 문자열인지 체크하여 결과값을 리턴한다.
     * @param str       : 체크할 문자열
     */
    function isEmpty(str){

        if(typeof str == "undefined" || str == null || str == "")
            return true;
        else
            return false ;
    };


    // 2019.02.20 this 지시자 추가 TODO 자동로그인 기능 체크 필요
    this.loginFnc = function(e) {

		e.preventDefault();		// TODO m_index는 미존재
		e.stopPropagation();	// TODO m_index는 미존재

		var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		var usrId = $("[name='j_username']").val();
		var usrType = "01";
		var urlParam = getUrlParams();

		// TODO m_index 미존재
		if(usrId.substring(0,3) == "010"){
			if(usrType == "01"){
				alert('회원 아이디를 입력해주세요.');
				$("[name='j_username']").val("");
				$("[name='j_password']").val("");
				$("[name='j_username']").focus();

				return false;
	    	}
		}

		// TODO isEmpty 함수로 변경

		if( isEmpty ( $("[name='j_username']").val()) ){
			alert('로그인 아이디를 입력해주세요.');
			$("[name='j_username']").focus();
			return false;

		} else if(isEmpty ( ("[name='j_password']").val() )){

		} else if($("[name='j_password']").val() == ""){
			alert('로그인 비밀번호를 입력해주세요.');
			$("[name='j_password']").focus();

			return false;

		} else {

			//로그인 유지 체크
			var usrId = $("[name='j_username']").val();
			var usrPassword = $("[name='j_password']").val();
			var encodePassword = AES_Encode(usrPassword);
			var reEncodePassword = encodePassword.replace(/[\r|\n]/g, "");
			var jsonData = null;
			var loginInfo = null;
			var expdate = new Date();
			expDate = new Date(parseInt(expdate.getTime()));

			if($("#logchk").hasClass("on")){
				jsonData = {"id" : usrId, "pw" : reEncodePassword, "auto" : "Y", "call" : "setLogin"};
				loginInfo = JSON.stringify(jsonData);

				if(urlParam["appOsType"] == "android"){
					window.android.setLogin(loginInfo);
				} else if(urlParam["appOsType"] == "ios"){
					window.location = "toApp://?" + loginInfo;
				} else {
					expDate.setFullYear(expDate.getFullYear() + 3);
					SetCookie("SPBcookieSaveid", loginForm.memid.value, expDate);
					SetCookie("SPBcookieSavepw", AES_Encode(loginForm.mempw.value), expDate);
					loginSubmit();
				}
			} else {
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

	function loginResultInfo(json) {
		var radioValue = "01";
		var deJson = decodeURIComponent(json);
		var loginInfo = $.parseJSON(deJson.toString());
		//push 메세지용 사용자 디바이스 Id,osType
	    var deviceId = loginInfo.token;
	    var deviceOsType = loginInfo.osType;

	    $("#usrDeviceId").val(deviceId);
	    $("#ostype").val(deviceOsType);

	    if(radioValue == "01"){
	    	if(loginInfo.id !== "" && loginInfo.auto === "Y"){
				$("[name='j_username']").val(loginInfo.id);
				$("[name='j_password']").val(AES_Decode(loginInfo.pw));
				$("#loginCheck").addClass("on");
				$("#loginchk").addClass("on");
				$("#loginCheck").attr('checked', true);
				$("#logchk").attr('checked', true);
				//자동로그인
				var urlParam = getUrlParams();
				if(urlParam["logout"] != "true"){
					$("#loginBtn").trigger("click");
				}
			}
		}

	};

	function loginSetSuccess(json){
		var deJson = decodeURIComponent(json);
		var saveLoginInfo = $.parseJSON(deJson.toString());
		loginSubmit();
	};


	function loginSubmit(){

		//1.자동로그인 체크
		 if ($("[name='loginchk']").prop("checked") || $('#logchk').is(':checked') )
		{
			var pwde = AES_Encode($("#mempw").val());
			$("#mempw").val(pwde);
		}else{
			//transkey
			mtk.fillEncData();
		}

		$("[name='loginForm']").attr("action", "/j_spring_security_check");

		setcookie(); // cookie  생성하도록 추가

	};

	function setcookie() {

		//로그인 유지 체크
		var usrId = $("[name='j_username']").val();
		var usrPassword = $("[name='j_password']").val();
		var encodePassword = AES_Encode(usrPassword);
		var reEncodePassword = encodePassword.replace(/[\r|\n]/g, "");
		var jsonData = null;
		var loginInfo = null;
		var expdate = new Date();
		expDate = new Date(parseInt(expdate.getTime()));

		if($('#logchk').is(':checked')){
			jsonData = {"id" : usrId, "pw" : reEncodePassword, "auto" : "Y", "call" : "setLogin"};
			loginInfo = JSON.stringify(jsonData);

			if(urlParam["appOsType"] == "android"){
				window.android.setLogin(loginInfo);
			} else if(urlParam["appOsType"] == "ios"){
				window.location = "toApp://?" + loginInfo;
			} else {
				expDate.setFullYear(expDate.getFullYear() + 3);
				SetCookie("SPBcookieSaveid", usrId, expDate);
				SetCookie("SPBcookieSavepw", usrPassword, expDate);  //  이미 암호화되어 있음.
			}
		} else {
			jsonData = {"id" : "", "pw" : "", "auto" : "N", "call" : "setLogin"};
    		loginInfo = JSON.stringify(jsonData);

    		if(urlParam["appOsType"] == "android"){
				window.android.setLogin(loginInfo);
			} else if(urlParam["appOsType"] == "ios"){
				window.location = "toApp://?" + loginInfo;
			} else {
				expDate.setDate(expDate.getDate() -1);//cookie delete
				SetCookie("SPBcookieSaveid", usrId, expDate);
				SetCookie("SPBcookieSavepw", usrPassword, expDate);
			}
		}


	};

	function idCheck(){
		var loginid = cookieVal("SPBcookieSaveid");
		var loginpw = cookieVal("SPBcookieSavepw");
		if(loginid != "" && loginid != null
			&&	loginpw != "" && loginpw != null
		){
			$("#loginCheck").addClass("on");
			$("#logchk").attr('checked', true);
			$("[name='j_username']").val(loginid);
			$("[name='j_password']").val(AES_Decode(loginpw));
			$("[name='j_username']").focus();
			$("[name='j_password']").focus();

			//자동로그인
			var urlParam = getUrlParams();

			if( ["logout"] != "true"){

				$("#loginBtn").trigger("click");
			}
		}
	};

	// TODO cookie위해서 처음 로딩시 맵으로 변경 필요
	function changeMainText() {
    	changeMainType('text');
    };

    function changeMainMap() {
    	changeMainType('map');
    };

    // TODO Cookie 설정 체크 필요
    function changeMainType(mainType) {
    	var expdate = new Date();
		var expDate = new Date(parseInt(expdate.getTime()));
		expDate.setFullYear(expDate.getFullYear() + 3);
		SetCookie("mainType", mainType, expDate);

		goMain();
    };

    function goMain() {
    	location.href="/main.do";
    };

    // Timer 표출용
	function mysqlTimeStampToDate(timestamp) {
		var regex=/^([0-9]{2,4})-([0-1][0-9])-([0-3][0-9]) (?:([0-2][0-9]):([0-5][0-9]):([0-5][0-9]))?$/;
		var parts=timestamp.replace(regex,"$1 $2 $3 $4 $5 $6").split(' ');
		return new Date(parts[0],parts[1]-1,parts[2],parts[3],parts[4],parts[5]);
	};

	// var deviceName = '';
    // 2019.02.20 초기화한 이유는 ???
	// var appOsType = '';


    function checkDevice() {
		//디바이스 체크 fnc
		var mobileKeyWords = new Array('iPhone','iPad', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');
		var deviceName = "";
		for (var word in mobileKeyWords){
			if (navigator.userAgent.match(mobileKeyWords[word]) != null){
				deviceName = mobileKeyWords[word];
				break;
			}
		}
		return deviceName;
	};


	function getUsrGpsInfo() {

		if ( appOsType === undefined || appOsType === "web" || appOsType === "") { //웹, 모바일웹의 경우
				if (navigator.geolocation) {
					var options = {
						enableHighAccuracy : true,
						timeout : 10000,
						//timeout : 100,
						maximumAge : 6000
					};

					// navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation, options);
					if ( realStationList == null || realStationList.length == 0 ) {
						navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation, options);
					} else {
						navigator.geolocation.getCurrentPosition(onSuccessGeolocation1, onErrorGeolocation1, options);
					}

				} else {
					alert("이 브라우저는 Geolocation를 지원하지 않습니다.");
					location.replace(returnSta.replaceUrl);
				}

		} else { //앱으로 접속할 경우
			if (appOsType === 'android' || appOsType === "Android") {
				window.android.gpsStart();
			}
			if (appOsType === 'iPhone' || appOsType === "iPad" || appOsType === 'ios') {
				window.location = 'toApp://?{"call":"gpsStart"}';
			}

			// 2019.02.20
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
			} else {
				onErrorGeolocation();
			}

		}
    };

    function findLocation( param ) {
    	// 2019.09.20 미사용
    	deviceName = checkDevice();

    	if ( param == null && deviceName !=="" && confirm("내 위치 찾기를 하시겠습니까? \r\n 확인시 내위치 찾기 , 취소시 미확인")) {
			getUsrGpsInfo();
    	} else {
    		onErrorGeolocation();
    	}

	     if ( param != null ) {
	    	 getUsrGpsInfo();
	     }
	};

    function goBikeRent(infoData) {
    	if(!doubleSubmitCheck()){
	       var rentType ='RCC_001';
	       var voucherSeq = '0';
	       var partyVoucherSeq = '0';
	       var inputAr = null;
	       if (loginYn == 'Y') {
	    	   if(partyVoucherSeq !='0' && partyVoucherSeq != '' && voucherSeq !='0' && voucherSeq != '') {
	    		   $.confirm({
	    			   title: '단체권 사용 여부',
	    			   content: '단체권을 사용하시겠습니까?',
	    			   buttons: {
	    				   단체권사용 : function () {
	    			    	   rentType ='RCC_004';
	    		                  voucherSeq = '0';

	    		                  inputAr = [$('<input>', {type : 'hidden', name : "stationId"}).val(infoData.stationId)
	    		                                 ,$('<input>', {type : 'hidden', name : "stationName"}).val(infoData.stationName)
	    		                                 ,$('<input>', {type : 'hidden', name : "rentType"}).val(rentType)
	    		                                 ,$('<input>', {type : 'hidden', name : "voucherSeq"}).val(voucherSeq)];
	    		                  $("#frm").append(inputAr).attr({action : "/app/rent/"+rentType+"/moveRentalStationList.do", method : 'post'}).submit();
	    			       },
	    			       회원권사용 : function () {
	    			    	   rentType ='RCC_001';
	    		                  inputAr = [$('<input>', {type : 'hidden', name : "stationId"}).val(infoData.stationId)
	    		                                 ,$('<input>', {type : 'hidden', name : "stationName"}).val(infoData.stationName)
	    		                                 ,$('<input>', {type : 'hidden', name : "rentType"}).val(rentType)
	    		                                 ,$('<input>', {type : 'hidden', name : "voucherSeq"}).val(voucherSeq)];
	    		                  $("#frm").append(inputAr).attr({action : "/app/rent/"+rentType+"/moveRentalStationList.do", method : 'post'}).submit();
	    			        }
	    			    }
	    			});

	            } else if (partyVoucherSeq !='0' && partyVoucherSeq != ''){
	               rentType ='RCC_004';
	              voucherSeq = '0';
	              inputAr = [$('<input>', {type : 'hidden', name : "stationId"}).val(infoData.stationId)
	                             ,$('<input>', {type : 'hidden', name : "stationName"}).val(infoData.stationName)
	                             ,$('<input>', {type : 'hidden', name : "rentType"}).val(rentType)
	                             ,$('<input>', {type : 'hidden', name : "voucherSeq"}).val(voucherSeq)];
	              $("#frm").append(inputAr).attr({action : "/app/rent/"+rentType+"/moveRentalStationList.do", method : 'post'}).submit();
	            } else if (voucherSeq !='0' && voucherSeq != ''){
	               rentType ='RCC_001';
	               inputAr = [$('<input>', {type : 'hidden', name : "stationId"}).val(infoData.stationId)
	                              ,$('<input>', {type : 'hidden', name : "stationName"}).val(infoData.stationName)
	                              ,$('<input>', {type : 'hidden', name : "rentType"}).val(rentType)
	                              ,$('<input>', {type : 'hidden', name : "voucherSeq"}).val(voucherSeq)];
	               $("#frm").append(inputAr).attr({action : "/app/rent/"+rentType+"/moveRentalStationList.do", method : 'post'}).submit();
	            } else {
	               //alert("이용권이 없습니다.");
	           		// 2019.02.20 영어 추가
	               alert( ( langClsCd == 'en' ? 'Do Not Have a Voucher' : '이용권이 없습니다.' ));

	               return false;
	            }
	       } else {
	    	    // 2019.02.20 영어 추가
				alert( ( langClsCd == 'en' ? 'Available After Login' : '로그인 후 대여가 가능합니다.' ));
				doubleSubmitFlag = false;		// 2019.02.20 대여실패 시 추가
	    	    return false;
	       }
    	}

    }

    function doubleSubmitCheck(){
        if(doubleSubmitFlag){
           return doubleSubmitFlag;
        }else {
           doubleSubmitFlag = true;
           return false;
        }
     }

    function goFavoriteStation(infoData) {

    	if (loginYn == 'Y') {
    		var usrSeq = '2427766';

            var inputAr = [$('<input>', {type : 'hidden', name : "stationId"}).val(infoData.stationId)
                           ,$('<input>', {type : 'hidden', name : "usrSeq"}).val(usrSeq)];

            commonAjax.postAjax("/app/station/addFavoriteStationProc.do", "json", {usrSeq:usrSeq, stationId:infoData.stationId}
                    ,function(data){
                        if(data.checkResult > 0) {
                            alert(data.resultMessage);

                        } else {
                            alert(data.resultMessage);
                            return false;
                        }
            });
    	} else {
    		alert("로그인 후 즐겨 찾기가 가능합니다.");
            return false;
    	}

    }

    function initSearchtext(){
    	// 2019.02.20 추가
		if ( autocompleteStationName.length == 0 ) {
			for( var i in realStationList ) {
				autocompleteStationName.push(
						{
							label : realStationList[i].stationName,
							stationLatitude : realStationList[i].stationLatitude,
							stationLongitude : realStationList[i].stationLongitude
						}
				);

			}

			$("#searchValue").autocomplete({
	        	 source : autocompleteStationName
	        	,matchContains: true
		        ,selectFirst: false
		        ,minLength: 2
		        ,autoFocus:true

		        , select : function(e, ui, data ){
		        	  nMap.map.setCenter(  new naver.maps.LatLng(ui.item.stationLatitude, ui.item.stationLongitude ) )
		        	  nMap.updateMarkers();
		        	  // 2019.02.20 추가
		        	  $("#guide_box").css('display', "inline");

		        	  $("#guide_box").attr("tabindex", -1).focus();
		        }
		    });
		}
    }

    function searhText(e) {
    	// e.preventDefault();
    	// e.stopPropagation();

    	if (e.type == "click") {
    		$("#guide_box").css('display', "none");
    	}

    	initSearchtext();
    }

    // 2019.02.20 지도 찾기 이벤트로 대체
	function searchStation(e){
    }

    // 2019.02.20 TODO 사용여부 체크 확인 필요
    var infoWindowAddr = new naver.maps.InfoWindow({
        anchorSkew: true
    });


    function onSuccessGeolocation(position) {
    	nMap.setGPSLoc( position.coords.latitude, position.coords.longitude );
    }

    function onErrorGeolocation() {
    	nMap.searchCoordinateToAddress(new naver.maps.LatLng(nMap.defaultLatitude , nMap.defaultLongitude));
    }

    // 기존 위치 정보 찾은 경우는 조회 안함
    function onSuccessGeolocation1(position) {
    	nMap.map.setCenter(  new naver.maps.LatLng( position.coords.latitude, position.coords.longitude )  );
  	  	nMap.updateMarkers();
    }

 	// 기존 위치 정보 찾은 경우는 조회 안함
    function onErrorGeolocation1() {
    	this.alert("위치정보 실패하였습니다.");
    }


    function countdown(elementId, min) {
    	var element, endTime, hours, mins, msLeft, time,timer;
    	var timeTerm = 4;
        if(rentClsCd =='RCC_005' || rentClsCd =='RCC_006'){
        	timeTerm = 2;
        }
        var timeTermImg='nomal';
        var timeTermImgTmp= 0;

		  function updateTimer(){
		    msLeft = endTime - (+new Date);
		    checkRentStatus();
		    if ( Math.floor( (msLeft / 60) / 1000) < 0 ) {
		    	$("#timerImg").css({"background": "url('/images/timeline_late.png')", "background-position-x":"center", "background-repeat":"no-repeat", "position":"relative", "background-size":"100%"});
		    	alert('기본 대여시간이 초과 되었습니다.'); //기본 대여 시간이 초과되었습니다. 다시 시도해주세요.
		    	clearTimeout(timerID);
		    	doubleSubmitFlag = false;
		    	chkTimeout = false;
		    } else {
		    	time = new Date( msLeft );
		    	hours = time.getUTCHours();
		    	mins = time.getUTCMinutes();
		    	element.innerHTML = ( (Math.floor(msLeft / 60 ) / 1000));
		    	timerID = setTimeout( updateTimer, 60 * 1000);//특정시간 이후 함수 실행
		    	timerImg = Math.floor(25 - (Math.floor(Math.floor(msLeft / 60 / 1000)) * timeTerm / 10)) ;
		    	if (timerImg < 10) {
		    		timerImg = "0" + timerImg;
		    	}
		    	$("#timerImg").css({"background": "url('/images/timeline_"+timerImg+".png')", "background-position-x":"center", "background-repeat":"no-repeat", "position":"relative", "background-size":"100%"});
		    }
		  }

		  function checkRentStatus() {

		        var usrSeq = '2427766';
		        var rentType = '';

		        commonAjax.postAjax("/app/rent/isChkRentStatus.do", "json", {usrSeq:usrSeq, rentType:rentType}
		                ,function(data){
		                    if(data.isRent) {
		                        //alert('대여중');
		                    } else {
		                    	//alert('반납');
		                    	location.href="/main.do";
		                        return false;
		                    }
		        });
		    }

		  element = document.getElementById( elementId );
		  endTime = (+new Date) + 1000 * min * 60;
		  updateTimer();
    }

	 function checkRent() {

    	var rentType = 'RCC_001';

        var usrSeq = '2427766';

        commonAjax.postAjax("/app/rent/isChkRentStatus.do", "json", {usrSeq:usrSeq, rentType:rentType}
                ,function(data){
                    if(data.isRent) {
                        //alert('대여 완료');
                    	location.href="/main.do";
                    	return;
                    } else {
                        return;
                    }
        });
	 }

    function goQrRent() {
		if(window.osType !== 'web') {

		var rentType ='RCC_001';
		var voucherSeq = '0';
		var partyVoucherSeq = '0';

		if(partyVoucherSeq !='0' && partyVoucherSeq != '' && voucherSeq !='0' && voucherSeq != '') {
			if(confirm("단체권을 사용하시겠습니까?")){
				rentType ='RCC_004';
				voucherSeq = '0';
			} else {
				rentType ='RCC_001';
				voucherSeq = '0';

			}

		 } else if (partyVoucherSeq !='0' && partyVoucherSeq != ''){
	           rentType ='RCC_004';
		          voucherSeq = '0';
			} else if (voucherSeq !='0' && voucherSeq != ''){
				rentType ='RCC_001';
				voucherSeq = '0';
			}

		app.voucherSeq = voucherSeq;

        commonAjax.getAjax("/app/rent/chkUserSataus.do", "json", {}
            ,function(data){
                if(data){
                	if(data.resultMessage !== '') {
		                alert(data.resultMessage);
		                return false;
                	}
	                if(data.checkResult) {
                        //QR코드 대여,안드로이드 경우
                         app.rentType = rentType;
		                 app.deviceType = window.osType;
		                 app.targetUrl = '/app/rent/'+rentType+'/getQRCodeDataInfo.do';
		                 app.QRscanStart();
	                } else {
	                	alert("QR 코드 대여는 앱에서만 가능합니다.");
	                	return false;
	                }
                }
            });
		}

    }
</script>

<script src="/js/classie.js"></script>
<script>

			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				menuRight = document.getElementById( 'cbp-spmenu-s2' ),
				body = document.body;

			showLeft.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeft' );
				$("#cbp-spmenu-s1").css('visibility', "visible");
			};

			showRight.onclick = function() {
				location.href="/rightPage.do";
			};

			function disableOther( button ) {
				if( button !== 'showLeft' ) {
					classie.toggle( showLeft, 'disabled' );
				}
				if( button !== 'showRight' ) {
					classie.toggle( showRight, 'disabled' );
				}
			}

			function closeMenu() {
				$("#cbp-spmenu-s1").css('visibility', "hidden");
				$("#cbp-spmenu-s2").css('visibility', "hidden");
			}

			$(window).resize(function(){ //브라우저 창 사이즈가 변경될때마다
			     resizeMap();
			});

			function resizeMap() {
				var h = $(window).height() - 180; //브라우저 창의 높이값을 가져와
			    $('#mapDiv').css("height",h) //div#map 에게 높이값을 부여함
			}

			//자동로그인 체크하면
		 	$("#logchk").change(
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

</script>
</body>
</html>
