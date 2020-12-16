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
<style type="text/css">
.nodata {height: 35px;text-align: center; border-bottom: 1px solid #d2d2d2;margin-top: 12px;};
</style>
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
            <div class="logo"><a href="uMainLoginOK.bo"><img src="./images/logo.png" alt="서울자전거 따릉이"></a></div>

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

        <div class="my">
            <div class="top">
                <h3>결제내역</h3>
                <button class="back left"></button>
                <button class="close"></button>
            </div>
            <form id="searchFrm">
	        	<input type="hidden" name="startPaymentDttm">
	            <input type="hidden" name="endPaymentDttm">
	            <input type="hidden" name="currentPageNo" value="1">
	            <input type="hidden" name="paymentMethodCd">
	            <input type="hidden" name="paymentSeq">

            </form>
            <div class="payment_box">
            	<p class="caption">Total : <span> 0</span>건 / <span>0</span>원</p>
            	<table>
                	<tr>
                    	<th class="center">결제상품</th>
                       <th class="center">금액</th>
                        <th class="center">결제방법</th>
                        <th class="center">이용권개시일</th>
                        <th class="center">환불예정액</th>
                        <th class="center">환불 / 취소</th>
                    </tr>
                    <tr>
							<td colspan="5">
								<span >no data</span>
							</td>
						</tr>
					</table>
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


			<table class="psboard3 mt10">
                <caption>
                    <details>
                        <summary>환불규정</summary>
                        <p>구분, 365일권 / 180일권, 사용 시, 미사용 시</p>
                    </details>
                </caption>
                <colgroup>
                    <col style="width:10%">
                    <col style="width:15%">
                    <col style="width:30%">
                    <col style="width:30%">
                    <col style="width:15%">

                </colgroup>
                <thead>
                    <tr>
                        <th rowspan="2" colspan="2" scope="rowgroup">구분</th>
                        <th colspan="2" scope="colgroup">사용시 </th>
                        <th rowspan="2" scope="rowgroup">미사용시</th>
                    </tr>
                    <tr>
                        <th scope="col" style="border-left:1px solid #d2d2d2;">이용개시일로부터<br>7일이내</th>
                        <th scope="col">이용개시일로부터<br>7일초과</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td rowspan="4" scope="rowgroup">정기권</td>
                        <td>365일권</td>
                        <td rowspan="3" scope="rowgroup">7일권 이용요금 공제</td>
                        <td rowspan="2" scope="rowgroup">환불 요청일까지의 월별 이용요금 공제(사용월수 x 30일권 이용요금)</td>
                        <td rowspan="5" scope="rowgroup">전액 환불</td>
                    </tr>
                    <tr>
                        <td style="border-left:1px solid #d2d2d2;">180일권</td>
                    </tr>
                    <tr>
                        <td style="border-left:1px solid #d2d2d2;">30일권</td>
                        <td rowspan="2" scope="rowgroup">환불 불가</td>
                    </tr>
                    <tr>
                        <td style="border-left:1px solid #d2d2d2;">7일권</td>
                        <td>이용개시일로부터  2일이내 일일권 이용요금 공제</td>
                    </tr>
                    <tr>
                        <td colspan="2">일일권</td>
                        <td colspan="2">환불 불가</td>
                    </tr>
                    <tr>
                    	<td colspan="5">
                    		<font color="red">※ 이용권 사용한 경우(이용권 개시일 기준)<br/>
                    		1일권 : 환불불가 , 7일권 : 2일이내, 30일권 : 7일이내, 180일권 : 60일이내, 365일권은 150일이내 신청해야만 환불이 가능합니다.</font>
                    	</td>
                    </tr>
                </tbody>
                </table>


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
		ownBuy.initView();
		ownBuy.initBtn();
	});

	var ownBuy = {};
	ownBuy.sortType = '';
	ownBuy.searchStartDate = '';
	ownBuy.searchEndDate = '';
	ownBuy.paymentMethodCd = '';
	ownBuy.initView =  function(){

		$("#deliveryDate").datepicker({
			regional: 'ko',
			changeMonth: true,
			changeYear: true,
			dateFormat: 'yyyy-mm-dd',
			showOn: "button",
			buttonImage: "/images/bn_calendar.gif",
			buttonImageOnly: true
		});

		if(ownBuy.searchStartDate === '') {
			ownBuy.searchStartDate = DateUtil.getBeforeAnyMonthDate(1);
			ownBuy.searchEndDate = DateUtil.dateFmt(new Date());
		}
		$(".datepicker").eq(0).val(ownBuy.searchStartDate);
	    $(".datepicker").eq(1).val(ownBuy.searchEndDate);

	    if(ownBuy.paymentMethodCd === ''){
	    	$("#radio1").attr("checked", true);
	    	$("#radio2").removeAttr("checked");
	    	$("#radio3").removeAttr("checked");
	    	$("#span1").addClass("on");
	    } else if(ownBuy.paymentMethodCd === 'BIM_009'){
	    	$("#radio2").attr("checked", true);
	    	$("#radio1").removeAttr("checked");
	    	$("#radio3").removeAttr("checked");
	    	$("#span2").addClass("on");
	    } else if(ownBuy.paymentMethodCd === 'BIM_008'){
	    	$("#radio3").attr("checked", true);
	    	$("#radio1").removeAttr("checked");
	    	$("#radio2").removeAttr("checked");
	    	$("#span3").addClass("on");
	    }
	};

	ownBuy.initBtn = function() {
		$("#searchBtn").on("click", this.searchList);
		$("#todayBtn").on("click", {type : '1w'}, this.setSearchBoundaryDate);
		$("#weekBtn").on("click", {type : '1m'}, this.setSearchBoundaryDate);
		$("#oneMBtn").on("click", {type : '3m'}, this.setSearchBoundaryDate);
		$("#threeMBtn").on("click", {type : '6m'}, this.setSearchBoundaryDate);
		$(".psboard1 tbody tr").find('a').on('click', this.giftPopup);
	};

	ownBuy.searchList = function(e) {
		e.preventDefault();
		if(DateUtil.checkDateTerm($(".datepicker").eq(0).val(), $(".datepicker").eq(1).val()) !=='ok'){
			alert("종료일자는 시작일자보다 과거일 수 없습니다.");
			return false;
		}

		/* var chkDay = DateUtil.diffDays($(".datepicker").eq(0).val(), DateUtil.dateFmt(new Date()), '-');
		if(chkDay > 180) {
			alert("일별검색 기간은 180일을 초과할 수 없습니다.");
			return false;
		}
		 */
		$("[name='startPaymentDttm']").val($(".datepicker").eq(0).val());
	    $("[name='endPaymentDttm']").val($(".datepicker").eq(1).val());
	    $("[name='paymentMethodCd']").val($(':radio[name="radioPayMethod"]:checked').val());

	    ownBuy.exeUpdateList(1);
	};

	ownBuy.setSearchBoundaryDate = function(e) {
		e.preventDefault();
		var sDate ='',eDate='';
		switch(e.data.type){
	    	case '1w' :
	    		sDate = DateUtil.getBeforeAnyWeekDate(1);
	    		break;
	    	case '1m' :
	    		sDate =DateUtil.getBeforeAnyMonthDate(1);
	    		break;
	    	case '3m' :
	    		sDate =DateUtil.getBeforeAnyMonthDate(3);
	    		break;
	    	case '6m' :
	    		sDate =DateUtil.getBeforeAnyMonthDate(6);
	    		break;
		}
		eDate = DateUtil.dateFmt(new Date());
		$("[name='startPaymentDttm']").val(sDate);
		$("[name='endPaymentDttm']").val(eDate);
		$("[name='paymentMethodCd']").val($(':radio[name="radioPayMethod"]:checked').val());
		ownBuy.exeUpdateList(1);
	};

	ownBuy.exeUpdateList = function(pCPage){
		$("[name='currentPageNo']").val(pCPage);
		$("#searchFrm").attr({action: "/app/mybike/payhistory/getPayHistory.do",  method : "post"}).submit();

	};

	ownBuy.pageSelect = function(pageNo) {
		$("[name='startPaymentDttm']").val($(".datepicker").eq(0).val());
	    $("[name='endPaymentDttm']").val($(".datepicker").eq(1).val());
	    $("[name='paymentMethodCd']").val($(':radio[name="radioPayMethod"]:checked').val());

		ownBuy.exeUpdateList(pageNo);
	};

	ownBuy.giftPopup = function(e){
		var paymentSeq = e.currentTarget.id;

		$("body").append("<div class='popmask'></div>");
		$(".popmask").css("display", "block");
		$(".popmask").css({"width":$(window).width()+"px","height":$(window).height()+"px"});

		//$("body").append('<div id="giftPopup" style="width:250px; background-color:white;"><h1 class="popTt">선물내역</h1><div class="popcntbox"><p class="pop_text1">다른 회원에게 선물한 내역입니다.</p><table class="psboard1 mt10"><caption><details><summary>선물내역</summary><p>선물내역 조회 결과 표로 전화번호가 표시됩니다. </p></details></caption><colgroup><col style="width:100%"></colgroup><thead><tr><th scope="col">전화번호</th></tr></thead><tbody><tr><td class="tc">010-1234-5678</td></tr></tbody></table></div><a href="javascript:ownBuy.giftPopupClose()" class="popclose"><img src="/images/inc/popClose.gif" alt="팝업닫기" /></a><div>');
		$("body").append('<div id="giftPopup" style="width:300px; background-color:white;"><h1 class="popTt">선물내역</h1><div class="popcntbox"><p class="pop_text1">다른 회원에게 선물한 내역입니다.</p><table class="psboard1 mt10"><caption><details><summary>선물내역</summary><p>선물내역 조회 결과 표로 전화번호가 표시됩니다. </p></details></caption><colgroup><col style="width:50%"><col style="width:50%"></colgroup><thead><tr><th scope="col">아이디</th><th scope="col">전화번호</th></tr></thead><tbody id="giftList"></tbody></table></div><a href="javascript:ownBuy.giftPopupClose()" class="popclose"><img src="/images/inc/popClose.gif" alt="팝업닫기" /></a><div>');

		$("[name='paymentSeq']").val(paymentSeq);
		var pData = $("#searchFrm").serialize();
		commonAjax.postAjax("/app/mybike/payhistory/getGiftList.do", "json", pData
    		,function(data){
    			if(data) {
    				if(data.giftList.length > 0){
		    		    var sSize = data.giftList.length;
		    		    for(var i=0; i< sSize; i +=1) {
		    			    var item = data.giftList[i];
		    			    $("#giftList").append("<tr><td class='tc'>" + item.mbId.substring(0,item.mbId.length - 3) + "***" + "</td><td class='tc'>" + item.recvMpnNo.substring(0,item.recvMpnNo.length - 4) + "****" + "</td></tr>");
		    			    var top = ($(window).height() -  $("#giftPopup").outerHeight())/ 2;
		    		        var left = ($(window).width() - $("#giftPopup").width())/2;
		    		        $("#giftPopup").css("z-index","99999999999");
		    		        $("#giftPopup").css("display", "block");
		    		        $("#giftPopup").css({position:'absolute', margin:0, top: (top > 0 ? top : 0)+'px', left: (left > 0 ? left : 0)+'px'});
		    			}
		    		}
					return true;
    		    } else {
    		    	alert(data.resultMessage);
    		    	ownBuy.giftPopupClose();
    		    	return false;
    		    }
    		}
    	);

		//$("#giftPopup").center(-150, 0);
	};

	ownBuy.giftPopupClose = function(){
		$(document.body).find(".popmask").remove();
    	$(document.body).find("#giftPopup").remove();
	};

	/* ownBuy.moveUseHistoryDetail = function(e){
		e.preventDefault();
		$("[name='rentHistSeq']").val(e.target.id);
		$("#searchFrm").attr({action: "/app/mybike/moveUseHistoryDetailView.do",  method : "post"}).submit();

	}; */

	ownBuy.refundChk = function(paymentSeq){
		$("[name='paymentSeq']").val(paymentSeq);
		$("#searchFrm").attr({action: "/app/mybike/refund/refundForm.do",  method : "post"}).submit();
	}

	ownBuy.cancelChk = function(paymentSeq) {
		$("[name='paymentSeq']").val(paymentSeq);
		var result = confirm('이용권 구매를 취소 하시겠습니까?');
    	if(result){
    		$.ajax({
    			type		: 'post',
    			url			: '/app/mybike/payhistory/cancelPayment.do',
    			dataType	: 'json',
    			data		: $('#searchFrm').serialize(),
    			async		: false,
    			success		: function( data ) {
    				if(data.result == true){
        				alert("결제 취소가 완료되었습니다.");
        				location.href = "/app/mybike/payhistory/getPayHistory.do";
        			}else{
        				alert("결제 취소를 실패하였습니다.");
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
	ownBuy.gateChk = function(paymentSeq){
		alert("결제 및 환불이 불가한 상품입니다. \n 고객센터에 문의하세요");
		return false;
	}
</script>

</body>
</html>
