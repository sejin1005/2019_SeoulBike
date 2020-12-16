<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
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
<script type="text/javaScript">
	function linkPage(pageNo){ location.href = "./app/mybike/memberOpinion/memberOpinionList.do?currentPageNo="+pageNo+""; }
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
                <dd style="width:25%" class="on"><a href="./app/mybike/memberOpinion/memberOpinionList.do">상담내역</a></dd>
                <dd style="width:25%"><a href="./customer/opinionBoard/opinionBoardEdit.do">시민의견등록</a></dd>
                <dd style="width:25%"><a href="./app/mybike/memberInfo/memberInfoEdit.do">개인정보수정</a></dd>
                <dd style="width:25%"><a href="./app/mybike/memberInfo/memberSecede.do">회원탈퇴</a></dd>
            </dl>
        </div>

        <div class="board">
            <div class="top">
                <h3>상담내역</h3>
                <button class="back left"></button>
                <button class="close"></button>
            </div>

            <form id="frm" name="frm" action="./app/mybike/memberOpinion/memberOpinionList.do" >
            <div class="board_srch">
				<div class="input w65"><input type="text" class="w100" id="searchValue" name="searchValue" placeholder="검색어를 입력해주세요"  value=""/></div>
                <div class="btn_search" id="searchButton" style="width: 20%;"><a href="javascript:clickSearchButton();"><img src="/images/ic_search.png" alt="">검색</a></div>
            </div>
            </form>

            <div class="board_box">
            	<table>
                	<colgroup>
                        <col width="50%">
                        <col width="25%">
                        <col width="25%">
                    </colgroup>
                    <tr>
                    	<th class="center">제목</th>
                        <th class="center">답변상태</th>
                        <th class="center">날짜</th>
                    </tr>
                    <tr><td colspan="3">해당 데이터가 없습니다.</td></tr></table>
            </div>
			<div class="paging">
				<div id="pagingWeb" class="num">
					<span class="on"><a href="#"><strong>1</strong></a></span>

</div>
				<div id="pagingMobile" class="num">
					<span class="on"><a href="#"><strong>1</strong></a></span>

</div>
			</div>
        </div>
        </div>
    </div>
</div>

	<script type="text/javascript" src="/js/common_spb.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".title").click(function(){	//추가 : 비밀글 접근 제어 하기 위해_2016.04.21_by_JHN
				var i = $(".title").index(this);
				var usrSessIDCntInfo = $("#usrSessIDCnt_" + i).val();
				var secretYNInfo = $("#secretYN_" + i).val();

				if(secretYNInfo=="Y" ){
					if(usrSessIDCntInfo!=1){
						alert('비공개');
						return false;
					}
				}
			});


			var totalPageCount = '1' == '' ? 1 : Number('1');
			$("#searchButton").on("click",function(){
				var str = replaceXss($("#searchValue").val());
				$("#searchValue").val(str);

				$("#frm").submit();
			});
			$('#prevPage').on("click",function(){
				var currentPageNo = Number($('[name="currentPageNo"]').val());
				linkPage(currentPageNo-1);
			});
			$('#nextPage').on("click",function(){
				var currentPageNo = Number($('[name="currentPageNo"]').val());
				linkPage(currentPageNo+1);
			});
			$('#movePage').on("click",function(){
				var currentPageNo = Number($('[name="currentPageNo"]').val());
				var regExp = /^[1-9]?[0-9]/;
				if(!regExp.test(currentPageNo) ||(totalPageCount < currentPageNo)){
					alert('현재 페이지 값이 정상적이지 않습니다.');
				}else{
					linkPage(currentPageNo);
				}
			});
		});
		function clickSearchButton(){
			//alert($("#searchValue").val());
			//var str = replaceXss($("#searchValue").val());
			//$("#searchValue").val(str);
			//alert($("#searchValue").val());

			$("#frm").submit();
		}
	</script>

<!--footer-->
    <div class="footer_wrap">
        <div class="footer">
        	<div class="left">
            <ul>
                <!--<li><a href="">개인정보처리방침</a></li>
                <li class="line"><a href="">이메일주소무단수집거부</a></li>-->
                <li><a href="/app/use/moveUseMenuClauseInfo.do">이용약관</a></li>
                <li class="line"><a href="/app/use/moveUseMenuInsurance.do">보험안내</a></li>

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
</body>
</html>
