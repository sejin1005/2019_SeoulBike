<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=medium-dpi" name="viewport">
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
</head>

<body>
<div class="wrap pay">

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
    <!--웹 : 헤더추가--><div class="container bg2">
    	<div class="content">

    	<!--웹 : 타이틀/이용권메뉴 추가-->
        <h3 class="ticket_title">이용권 구매</h3>
        <div class="ticket_subtit">※기존의 일반권이 1시간권, 프리미엄권이 2시간권으로 변경되었습니다.</div>
        <!--웹 : 타이틀/이용권메뉴 추가-->

        <div class="pay">
        	<div class="pc_top">
            <div class="top">
                <h3>일일권</h3>
                <p><strong>1시간권, 2시간권을 선택하실 수 있습니다.</p>
                <button class="close" style="top:5px"></button>
            </div>

            <div class="pay_info">
            <ul>
            	<li><strong>1회 1매씩</strong> 구매가 가능합니다.</li>
                <li>기본대여시간은 <span>1시간권(60분), 2시간권(120분)</span>입니다.</li>
                <li>초과시 5분마다 <strong>추가요금</strong>(200원)과금됩니다.<br>
                	<span>예시) 기본 초과 1분 ~ 5분 : 200원, 6분 ~ 10분 : 400원 </span>
                </li>
                <li>추가요금은 이용권 결제수단으로 자동결제됩니다.</li>
                <li>1회당 대여시간은 1시간권 60분, 2시간권 120분입니다.</li>
            </ul>
            <form id="searchFrm">
				<input type="hidden" name="paymentClsCd" value="" />
				<input type="hidden" name="paymentClsCdNm" value="" />
				<input type="hidden" name="paymentMethodCd" value="" />
				<input type="hidden" name="paymentMethod" value="" />
				<input type="hidden" name="paymentConfmNo" value="" />
				<input type="hidden" name="totAmt" value="0" />
			    <input type="hidden" name="mileagePaymentAmt" value="0" />
			    <input type="hidden" name="rentOverFeeSum" value="0" />
			    <input type="hidden" name="partyUseCnt" value="1" />
				<input type="hidden" name="errCd" value="" />
				<input type="hidden" name="errMsg" value="" />
				<input type="hidden" name="authDiVal" value="" />
				<input type="hidden" name="giftYn" value="N" />
				<input type="hidden" name="mpnNo" value="" />
				<input type="hidden" name="order_id" value="" />
				<input type="hidden" name="cardNo" value="" />
				<input type="hidden" name="billingKey" value="" />
				<input type="hidden" name="mbSerialNo" value="" />
				<input type="hidden" name="mb_serial_no" value="" />

				<input type="hidden" name="LGD_MID" value="" />
				<input type="hidden" name="LGD_OID" value="" />
				<input type="hidden" name="LGD_AMOUNT" value="" />
				<input type="hidden" name="LGD_TIMESTAMP" value="" />
				<input type="hidden" name="LGD_MERTKEY" value="" />
				<input type="hidden" name="order_url" id="order_num" value="" />
				<input type="hidden" name="order_url" id="order_url" value="" />
				<input type="hidden" name="result" id="result" value="" />
				<input type="hidden" name="result" id="resultMessage" value="" />

				<input type="hidden" name="productInfo" value="정기권" />

			</form>
			<form method="post" name="LGD_PAYINFO" id="LGD_PAYINFO" action="">
			<input type='hidden' name='LGD_CUSTOM_PROCESSTYPE' id='LGD_CUSTOM_PROCESSTYPE' value='TWOTR'>
<input type='hidden' name='LGD_MID' id='LGD_MID' value='bikeSeoul'>
<input type='hidden' name='LGD_WINDOW_VER' id='LGD_WINDOW_VER' value='2.5'>
<input type='hidden' name='CST_PLATFORM' id='CST_PLATFORM' value='service'>
<input type='hidden' name='LGD_MONEPAYAPPYN' id='LGD_MONEPAYAPPYN' value='N'>
<input type='hidden' name='LGD_BUYER' id='LGD_BUYER' value='abcd0134'>
<input type='hidden' name='LGD_CUSTOM_SKIN' id='LGD_CUSTOM_SKIN' value='SMART_XPAY2'>
<input type='hidden' name='CST_MID' id='CST_MID' value='bikeSeoul'>
<input type='hidden' name='LGD_WINDOW_TYPE' id='LGD_WINDOW_TYPE' value='iframe'>
<input type='hidden' name='LGD_OID' id='LGD_OID' value='null'>
<input type='hidden' name='LGD_VERSION' id='LGD_VERSION' value='JSP_Non-ActiveX_SmartXPay'>
<input type='hidden' name='LGD_PCVIEWYN' id='LGD_PCVIEWYN' value='null'>
<input type='hidden' name='LGD_CHECKSSNYN' id='LGD_CHECKSSNYN' value='N'>
<input type='hidden' name='LGD_CUSTOM_SWITCHINGTYPE ' id='LGD_CUSTOM_SWITCHINGTYPE ' value='IFRAME'>
<input type='hidden' name='LGD_TIMESTAMP' id='LGD_TIMESTAMP' value='1234567890'>
<input type='hidden' name='CST_WINDOW_TYPE' id='CST_WINDOW_TYPE' value='submit'>
<input type='hidden' name='LGD_RETURNURL' id='LGD_RETURNURL' value='https://www.bikeseoul.com:446/app/ticket/guest/addTicketPayRes.do'>
<input type='hidden' name='LGD_PAYKEY' id='LGD_PAYKEY' value=''>
<input type='hidden' name='paymentMethodCd' id='paymentMethodCd' value='BIM_008'>
<input type='hidden' name='LGD_AMOUNT' id='LGD_AMOUNT' value='1004'>
<input type='hidden' name='LGD_BUYERSSN' id='LGD_BUYERSSN' value=''>
<input type='hidden' name='LGD_PROVIDE_TERM' id='LGD_PROVIDE_TERM' value='1'>
<input type='hidden' name='LGD_RESPMSG' id='LGD_RESPMSG' value=''>
<input type='hidden' name='LGD_CUSTOM_FIRSTPAY' id='LGD_CUSTOM_FIRSTPAY' value='SC0060'>
<input type='hidden' name='LGD_MPILOTTEAPPCARDWAPURL' id='LGD_MPILOTTEAPPCARDWAPURL' value=''>
<input type='hidden' name='LGD_CUSTOM_USABLEPAY' id='LGD_CUSTOM_USABLEPAY' value='SC0060'>
<input type='hidden' name='LGD_PRODUCTINFO' id='LGD_PRODUCTINFO' value='정기권'>
<input type='hidden' name='LGD_EASYPAY_ONLY' id='LGD_EASYPAY_ONLY' value='PAYNOW'>
<input type='hidden' name='LGD_HASHDATA' id='LGD_HASHDATA' value=''>
<input type='hidden' name='LGD_OSTYPE_CHECK' id='LGD_OSTYPE_CHECK' value='P'>
<input type='hidden' name='LGD_RESPCODE' id='LGD_RESPCODE' value=''>
<input type='hidden' name='LGD_ENCODING' id='LGD_ENCODING' value='UTF-8'>
<input type='hidden' name='LGD_ENCODING_RETURNURL' id='LGD_ENCODING_RETURNURL' value='UTF-8'>
<input type='hidden' name='LGD_PAYWINDOWTYPE' id='LGD_PAYWINDOWTYPE' value='CardBillingAuth_smartphone'>
</form>
         	</div>
         	</div>

         	<div class="h70"></div>

            <div class="pc_bottom">
            <div class="pay_box ml20i line">
            	<p>정기권종류선택</p>
                   <select id="comPaymentClsCd" name="comPaymentClsCd" class="fl" style="width: 55%;">
						<option id="selectDefaltGen" value="">선택</option>
					</select>
          <br>
            	<div class="pay_input w40"><input type="text" class="w80" id="TICKET_PRICE" name="TICKET_PRICE" value="0" readonly="readonly"><span>원</span></div>
            </div>

            <div class="pay_box ml20i line">
            	<p>결제금액</p>
                <div class="radio w25"><input type="radio" id="radio2" name="radioPayMethod" value="SC0010" onclick="seasonTicket.radioChk(2)"><label for="radio2"><span></span>신용/체크카드</label></div>
                <div class="radio"><input type="radio" id="radio1" name="radioPayMethod" value="SC0060" onclick="seasonTicket.radioChk(1)"><label for="radio1"><span></span>휴대폰결제</label></div>

                <!--payco-->
                    <div id="paycoInfo" class="payco_box" style="display: none;">
                        <ul>
                            <li>PAYCO는 온/오프라인 쇼핑은 물론 송금, 멤버십 적립까지 가능한 통합 서비스입니다.</li>
							<li>휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다.</li>
							<li>지원카드 : 모든 신용/체크카드 결제 가능</li>
							<li><font color="red">기간 : 2019년 5월 1일(목) ~ 10월 31일(목)</font></li>
							<li><font color="red">혜택 : PAYCO로 생애 첫 결제 시 1,000포인트 지급 (단, 2,000원 이상 결제 시) </font></li>
							<li>※ 참고사항</li>
							<li>프로모션 기준 금액은 최초 이용권 구매 금액 기준 입니다.</li>
							<li>대상자에게는 결제일 익 영업일 09:00부터 순차 지급 예정 입니다.</li>
							<li>지급되는 PAYCO 포인트는 NHN PAYCO는 온,오프라인 제휴가맹점에서 사용 가능 합니다.</li>
                        </ul>
					</div>
				<!--payco-->
				<!--kakao-->
                    <div id="kakaoInfo" class="payco_box" style="display: none;">
                        <ul>
                            <li>카카오톡에서 신용/체크카드 연결하고, 결제도 지문으로 쉽고 편리하게 이용하세요!</li>
                            <li>본인명의 스마트폰에서 본인명의 카드 등록 후 사용 가능</li>
                            <li>(카드등록 : 카카오톡 > 더보기 > 카카오페이 > 카드)</li>
                            <li>30만원 이상 결제, ARS 추가 인증 필요</li>
                            <li>이용가능 카드사 : 모든 국내 신용/체크카드</li>
                            <li>카카오페이는 무이자할부 및 제휴카드 혜택 내용과 관계가 없으며, 자세한 사항은 카카오페이 공지사항에서 확인하실 수 있습니다.</li>
                        </ul>
					</div>

            </div>
            <!-- 미납요금창 항상 보이도록 변경 -->
            <div class="pay_box ml20i line">
	            	<p>미납</p>
	                <div class="pay_input w100">
	                <span>미납금액</span><span class="result w30">0원</span>
	                <span>/초과이용</span><span class="result w30">0건</span>
	                </div>
	            </div>
            <div class="pay_box total">
            	<p>결제금액</p><input type="text" class="w80" id="TOT_AMOUNT" name="TOT_AMOUNT" value="0" readonly="readonly"><span>원</span>
            </div>

            <!--웹 : 결제정보 추가-->
            <ul class="ticket_use">
				<li>이용권<span id="totM">0원</span></li>
			</ul>
            <!--웹 : 결제정보 추가-->

            <div class="check" style="letter-spacing:-1px"><input type="checkbox" id="agree" name="agree" value="General"><label for="agree"><span></span>&nbsp;&nbsp;&nbsp;<a href="/info/infoCoupon.do">추가요금</a>자동결제,<a href="/info/infoCoupon.do">환불규정</a>, <a href="/app/use/moveUseMenuClauseInfo.do">이용약관</a>에 동의하며 결제를 진행합니다.</label></div>

            <div class="check2" style="letter-spacing:-1px;line-height: normal;text-align: left;margin: 0 15px;margin-bottom: 20px;"><input type="checkbox" id="agree2" name="agree2" value="General"><label for="agree2"><span></span>&nbsp;&nbsp;&nbsp;만 15세 미만의 미성년자가 서비스를 이용하는 경우, 사고 발생 시 보험 적용을 받을수 없는 등의 불이익이 있습니다.</label></div>

            <div class="btn"><a href="javascript:seasonTicket.doPay();">결제하기</a></div>

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
<script type="text/javascript" src="https://static-bill.nhnent.com/payco/checkout/js/payco.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://xpay.uplus.co.kr/xpay/js/xpay_crossplatform.js" ></script>
<script type="text/javascript">

$(function() {
	seasonTicket.commonCode();
	seasonTicket.initBtn();
	var appOsType =  '';
});

var seasonTicket = {};
//seasonTicket.comPaymentClsCd = ""; //원본
seasonTicket.comPaymentClsCd = $("[name='paymentClsCd']").val();
seasonTicket.commonCode = function () {
	var _this = seasonTicket;
	var comPaymentClsCd = _this.comPaymentClsCd;
	var code = [];
//	var codePremium = []; //추가 : 프리미엄권 담을 배열_2016.06.24_by_JHN
var premiumTester = "2427766";//프리미엄 테스트 멤버_20170411
    //정기권 구분
    commonAjax.getCommonPayment("BIL", function(data) { //변경 : getCommonCode -> getCommonPayment_2016.07.11_by_JHN
	if(data !== null && data.codeList !== null) {
		 for(var i =0; i <data.codeList.length ;i++) {
    		 if(data.codeList[i].addVal3 === "RCC_001") { //원본
    			 code.push(data.codeList[i]);
    		 }
		 }

		 commCdBox.makeComboBox('D', '', code, "comPaymentClsCd"); //원본

		// commCdBox.makeComboBox('D', _this.comPaymentClsCd, codePremium, "comPaymentClsCdPremium"); //추가
     }
	});
};

//추가 : 최초 로딩시 상품 가격 및 결제 금액 표시
seasonTicket.viewRentFee = function (rentFee, idParent) {
	$("#"+idParent).val(rentFee); //요소 값
	var fmtRentPayAmt = comma(rentFee);
	if(fmtRentPayAmt === ""){
		fmtRentPayAmt = 0 + "원"
	}else{
		fmtRentPayAmt = fmtRentPayAmt + "원";
	}
	var rentTIme = "";
	if(idParent != 'PremiumRentFee'){
		rentTime = "60분";
	} else {
		rentTime = "120분";
	}
	//$("#"+idParent).text(fmtRentPayAmt).append('&nbsp;<span style="color:red"> 기본대여시간('+rentTime+') 초과시 30분마다 추가요금 1,000원 과금</br>(※ 추가요금은 이용권 결제수단으로 자동결제 됩니다.)</span>');//요소 값의 화면 표시
}

seasonTicket.initBtn = function () {

	seasonTicket.viewRentFee(0, "TICKET_PRICE");
	seasonTicket.viewRentFee(0, "TOT_AMOUNT");

    $("#comPaymentClsCd").on("change", function(e){
    	seasonTicket.viewRentFee($(this).val(), "TICKET_PRICE");
		 	$("[name='paymentClsCd']").val($("#comPaymentClsCd option:selected").attr("id"));//추가 : 상품 명칭_2016.06.25_by_JHNs
		 	$("[name='paymentClsCdNm']").val($("#comPaymentClsCd option:selected").text());//추가 : 상품 명칭_2018.04
    		seasonTicket.calTotPayAmt(0);
		 	seasonTicket.mileageOpen($("#comPaymentClsCd option:selected").attr("title"));
    });

    $('input[type="checkbox"][name="totMileageUse"]').click(function(){ // 사용 않하는 것
        if ($(this).prop('checked')) {
        	$("#useMileage").val("0");
        	seasonTicket.calTotPayAmt('0');
        } else {
        	$("#useMileage").val("");
        	seasonTicket.calTotPayAmt(0);
        }
    });

    $("[name='useMileage']").on("change", function(e){ //변경 : id -> name_2016.05.24_by_JHN
    	e.preventDefault();
    	if($(this).val() != null && $(this).val() != '') {
        	var useMileageAttrId = $(this).attr("id"); //선택된 마일리지 id 값 받기
    		var useMileage = uncomma($(this).val());
            var totMileagePoint =0;
            var minUseMileage = 100;
            var maxUseMileage = 15000;
            if(totMileagePoint >= useMileage){
            	if(totMileagePoint === 0) {
            		alert('사용할 수 있는 마일리지가 없습니다.\n최소 사용 가능 마일리지는 '+ comma(minUseMileage) +'입니다.');
                    $(this).val("");
            	} else {
	            	if(useMileage > maxUseMileage){
	            		alert('최대 '+ comma(maxUseMileage) +' 마일리지까지만 사용 가능합니다.');
	                	if(totMileagePoint >= maxUseMileage){
	                		seasonTicket.calTotPayAmt(maxUseMileage);
		                	$(this).val(maxUseMileage);
	                	}else{
	                		seasonTicket.calTotPayAmt(minUseMileage);
		                	$(this).val(minUseMileage);
	                	}
	                } else {
	                	if(useMileage < minUseMileage){
	                		alert('최소 '+ comma(minUseMileage) +' 마일리지이상 사용하여 합니다.');
	                		seasonTicket.calTotPayAmt(0);
	                		//seasonTicket.calTotPayAmtPremium(0); //추가
	                		$(this).val("");
	                	} else {
	                		var chk = seasonTicket.chkMileageAmt(useMileage);
	                		if(chk) {
		                			seasonTicket.calTotPayAmt(useMileage);}
	                		else {
	                			$(this).val("");
	                		}
	                	}
            		}
            	}
            } else{
            	if(totMileagePoint >= maxUseMileage){
            		alert('최대 '+ comma(maxUseMileage) +' 마일리지까지만 사용 가능합니다.');
            		seasonTicket.calTotPayAmt(maxUseMileage);
                	$(this).val(maxUseMileage);
            	} else {
            		if(totMileagePoint >= minUseMileage){
            			alert('현재 사용 가능한 마일리지는  '+ comma(totMileagePoint) +'입니다.');
            			seasonTicket.calTotPayAmt(totMileagePoint);
	                	$(this).val(totMileagePoint);
            		} else {
            			alert('사용할 수 있는 마일리지가 없습니다.\n최소 사용 가능 마일리지는 '+ comma(minUseMileage) +'입니다.');
            			seasonTicket.calTotPayAmt(0);
    	            	$(this).val("");
            		}
            	}
            }
		} else {
			seasonTicket.calTotPayAmt(0);
        }
	});
};

seasonTicket.chkMileageAmt = function(m) {
	var chk = true;
	if((m % 100) !== 0) {
        alert('100단위로만 사용이 가능합니다.');
        chk = false;
    }
	return chk;
};

seasonTicket.mileageOpen = function (mileageYn) {
    if(mileageYn =='Y'){
    	$("#mileageYn").css('display', '');
    } else {
    	$("#mileageYn").css('display', 'none');
    	seasonTicket.calTotPayAmt(0);
    }
}
seasonTicket.radioChk = function(num){
	var id = "radio";
	for(var i=1; i<4; i++){
		var radioBtn = id+i;
		if(i!=num){
			$("#"+radioBtn).attr("checked", false);
		} else {
			$("#LGD_CUSTOM_USABLEPAY").val($("#"+radioBtn).val());
		}
	}
	//결제 구분 변수 추가 2018.03
	if(num==1) {
		$('[name="paymentMethodCd"]').val("BIM_009");
		$("#paycoInfo").css("display","none");
		$("#kakaoInfo").css("display","none");
	} else if (num==2) {
		$('[name="paymentMethodCd"]').val("BIM_008");
		$("#paycoInfo").css("display","none");
		$("#kakaoInfo").css("display","none");
	} else if (num === 3) {
		 $('[name="paymentMethodCd"]').val("BIM_007");
		 $("#paycoInfo").css("display","");
		 $("#kakaoInfo").css("display","none");
	} else if (num === 4) {
		 $('[name="paymentMethodCd"]').val("BIM_010");
		 $("#paycoInfo").css("display","none");
		 $("#kakaoInfo").css("display","");
	}
};
seasonTicket.calTotPayAmt = function(useMileage) {
	var rentFee = $("#TICKET_PRICE").val(); //추가
	seasonTicket.viewRentFee(rentFee, "TICKET_PRICE");
	var totOverFee = 0;
	var totPayAmt = Number(rentFee) + totOverFee - Number(useMileage);

	if( $("#useMileage").val() !== ""){
		if(totPayAmt < 500) {
			$("#useMileage").val('');
			alert('결제 금액이 최소 500원은 되어야 합니다.');
		}
	}
	if(totPayAmt < 500){
		totPayAmt = Number(rentFee) + totOverFee;
	}

	var fmtTotPayAmt = comma(totPayAmt);
	var fmtTotPayAmtT = comma($("#TICKET_PRICE").val());
	var fmtMileT = comma(useMileage);

	//fmtTotPayAmt = fmtTotPayAmt + "원";

	//$("#totPayAmt").text(fmtTotPayAmt);
	$("#TOT_AMOUNT").val(totPayAmt);
	$("#LGD_AMOUNT").text(fmtTotPayAmt);
	/* 우측 이용권 금액, 마일리지 부분 표출 */
	$("#totM").text(fmtTotPayAmtT+"원");
	$("#mileM").text("-"+fmtMileT+"원");

	var totAmt = uncomma($("#totPayAmt").text());
	var rentOverFeeSum = uncomma($("#totOverFee").text());

	var mileagePaymentAmt = 0;
	comPaymentClsCd = $("[name='paymentClsCd']").val();
	var mileageYn = $("#comPaymentClsCd option:selected").attr("title");
	if(mileageYn  === 'Y') {
		//mileagePaymentAmt = uncomma($("#useMileage").val());
		// 범위에서 벗어난 마일리지가 들어가면 안되므로 수정
		mileagePaymentAmt = useMileage;
    }
	mileagePaymentAmt = mileagePaymentAmt !== '' ? mileagePaymentAmt : 0;
    rentOverFeeSum = rentOverFeeSum !== '' ? rentOverFeeSum : 0;

    if(totPayAmt > 0){
        //totAmt.replace(/\\/gi, "");
        $('[name="totAmt"]').val(totAmt);
        $('[name="mileagePaymentAmt"]').val(mileagePaymentAmt);
        $('[name="rentOverFeeSum"]').val(rentOverFeeSum);
        $('[name="partyUseCnt"]').val(1);

    }

	if(totOverFee != '0'){//추가 : 추가요금 결제 페이지 이동_2016.11.21
		alert("미납내역이 존재 합니다. 추가요금 결제 메뉴로 이동합니다.");
		location.replace("/app/ticket/guest/getTicketNonPayInfo.do");
	}
};
var code = [];

function LPad(digit, size, attatch) {
    var add = "";
    digit = digit.toString();

    if (digit.length < size) {
        var len = size - digit.length;
        for (i = 0; i < len; i++) {
            add += attatch;
        }
    }
    return add + digit;
}

function makeoid() {
	var now = new Date();
	var years = now.getFullYear();
	var months = LPad(now.getMonth() + 1, 2, "0");
	var dates = LPad(now.getDate(), 2, "0");
	var hours = LPad(now.getHours(), 2, "0");
	var minutes = LPad(now.getMinutes(), 2, "0");
	var seconds = LPad(now.getSeconds(), 2, "0");
	var timeValue = years + months + dates + hours + minutes + seconds;
	document.getElementById("LGD_OID").value = timeValue;
	document.getElementById("LGD_TIMESTAMP").value = timeValue;
}

seasonTicket.doPay = function(e){
	//e.preventDefault();
	//e.stopPropagation();
	var paymentMethodCd = $("#paymentMethodCd").val();
	$("#comPaymentClsCd option:selected").attr("id")
	var mileagePaymentAmt =  $('[name="mileagePaymentAmt"]').val();
	if(mileagePaymentAmt==''){
		mileagePaymentAmt = '0';
	}
	var validityTotAmt = $("[name='TOT_AMOUNT']").val();
	if($("#comPaymentClsCd option:selected").attr("id") == "selectDefaltGen" || $("#comPaymentClsCd").val() == "" ) {
		$("#selectDefaltGen").val("").attr("selected", "selected");
		alert("정기권 종류를 선택해주세요.");
		return;
	} else {
		if($("#radio1").is(":checked") || $("#radio2").is(":checked") || $("#radio3").is(":checked") || $("#radio4").is(":checked")){

			if ($("#radio1").is(":checked")) {
				$('[name="paymentMethodCd"]').val("BIM_009");
			} else if ($("#radio2").is(":checked")) {
				$('[name="paymentMethodCd"]').val("BIM_008");
			} else if ($("#radio3").is(":checked")) {
				$('[name="paymentMethodCd"]').val("BIM_007");
			} else if ($("#radio4").is(":checked")) {
				$('[name="paymentMethodCd"]').val("BIM_010");
			}

			if (validityTotAmt == "0") {
				alert('결제 금액에 오류가 있습니다.');
				return;
			} else {
				var payAgreeChk = $(':checkbox[name="agree"]:checked').val();
				var payAgreeChk2 = $(':checkbox[name="agree2"]:checked').val();
		    	if(payAgreeChk == 'General' && payAgreeChk2 == 'General'){
				    // 마일리지 공통 입력
		    		$("#mileagePaymentAmt").val(mileagePaymentAmt);
				    /* if(mileagePaymentAmt != '0'){
				    	alert(mileagePaymentAmt);
				    	return;
				    } */
					//이용권 구매 가능 여부
					commonAjax.postAjax("/app/ticket/guest/getVoucherCheckYn.do", "json",  $("#searchFrm").serialize()
						,function(data){
							if(data) {
								var isRent = data.isRentUsr === 'true' ? true : false;
				                if(isRent) {
				                    alert("이미 대여중입니다.");
				                    return;
				                } else {
				                	var voucherCheckYn = data.voucherCheckInfo.voucherCheckYn;
				    				if(voucherCheckYn == "N"){
				    					// 결제 진행
				    					$("[name='paymentMethodCd']").val(paymentMethodCd);

										if(paymentMethodCd === "BIM_009") {
											$("#LGD_CUSTOM_PROCESSTYPE").val("TWOTR");
											$("#LGD_CUSTOM_SKIN").val("SMART_XPAY2");
											$("#LGD_CUSTOM_FIRSTPAY").val("SC0060");
											$("#LGD_PAYWINDOWTYPE").val("");
											$("#LGD_VERSION").val("JSP_Non-ActiveX_SmartXPay");
											$("#LGD_AMOUNT").val($("#TOT_AMOUNT").val());
											$("#LGD_MONEPAYAPPYN").val("N");
											$("#LGD_EASYPAY_ONLY").val("");
											$("#LGD_PROVIDE_TERM").val("1");
											//$("#mileagePaymentAmt").val(mileagePaymentAmt);
											$("#LGD_MID").val("bikeSeoul");
										}

										if(paymentMethodCd === "BIM_008") {
											$("#LGD_CUSTOM_PROCESSTYPE").val("TWOTR");
											$("#LGD_CUSTOM_SKIN").val("");
											$("#LGD_CUSTOM_FIRSTPAY").val("");
											$("#LGD_PAYWINDOWTYPE").val("CardBillingAuth_smartphone");
											$("#LGD_VERSION").val("JSP_SmartXPay_CardBilling");
											$("#LGD_MONEPAYAPPYN").val("");
											$("#LGD_AMOUNT").val($("#TOT_AMOUNT").val());
											$("#LGD_EASYPAY_ONLY").val("PAYNOW");
											//$("#mileagePaymentAmt").val(mileagePaymentAmt);
											$("#LGD_MID").val("bikeSeoul");
										}

										if(paymentMethodCd === "BIM_007" || paymentMethodCd === "BIM_009" || paymentMethodCd === "BIM_010" ) {
											seasonTicket.presentTime();//추가 : 중복방지 상점 고유거래 번호_2106.10.07_JHN
										}

										if(paymentMethodCd === "BIM_008") {
											seasonTicket.ticketSession();
										}
				    				} else {
										alert('이미 사용중이거나 등록된 이용권이 있습니다.');
										return;
				    				}
								}

				    		} else {
				    			return;
				    		}
						}
					);

				} else {
					$("input[type='checkbox']").attr("checked", false);
					alert("추가요금 자동결제, 환불규정, 이용약관에 동의를 하여야 결제를 진행 할 수 있습니다.");
					return;
				}
			}
		} else{
			alert('결제수단을 선택하고 결제하기 바랍니다.');
			return;
		}
	}

};


seasonTicket.presentTime = function() {
//		var pData = {}
	$("[name='LGD_MID']").val($("#LGD_MID").val());
	$("[name='LGD_OID']").val($("#LGD_OID").val());
	$("[name='LGD_AMOUNT']").val($("#LGD_AMOUNT").val());
	$("[name='LGD_TIMESTAMP']").val($("#LGD_TIMESTAMP").val());
	$("[name='LGD_MERTKEY']").val($("#LGD_MERTKEY").val());

	//세션 추가
	var pData = $("#searchFrm").serialize();
	//commonAjax.postAjax("/app/mybike/addpay/svrTime.do", "json", pData
	commonAjax.postAjax("/app/ticket/ticketSvrTime.do", "json", pData
    	       ,function(data){
    	            if(data) {
    	            	var nowTimeAll = data.nowTime;
    	            	//alert(nowTimeAll);
    	            	var payCode = data.payCode;
    	            	var usrSeq = '2427766';//추가 : 결제 중복 방지 코드 값의 일부(사용자 정보)_2016.09.20_by_JHN

    	        		var payco = {
    	        				mb_serial_no : usrSeq+'_'+payCode+'_'+ nowTimeAll//변경 : 결제 중복 방지 코드_2016.09.20_by_JHN
    	        			};
    	        		$("[name='mb_serial_no']").val(payco.mb_serial_no);

    	        		if ($("[name='paymentMethodCd']").val() === "BIM_009") {
    	        			$("#LGD_OID").val(payco.mb_serial_no);
    	        			$("#LGD_HASHDATA").val(data.LGD_HASHDATA);
    	        			$("#LGD_CUSTOM_PROCESSTYPE").val(data.LGD_CUSTOM_PROCESSTYPE);
    	        			launchCrossPlatform();
    	        		} else if  ($("[name='paymentMethodCd']").val() === "BIM_007") {
    	        			// payco
    	        			autoPaymentReserve();
    	        		} else if  ($("[name='paymentMethodCd']").val() === "BIM_010") {
    	        			// kakao pay
    	        			kakaoPayReady();
    	        		}

    	            }else{
    	            	alert("중복 결제 예방 코드 미생성. 결제하기 버튼 다시 눌러주세요.");
    	            	return false;
    	            }
	});
};

seasonTicket.ticketSession = function() {
//	var pData = {}
$("[name='LGD_MID']").val($("#LGD_MID").val());
$("[name='LGD_OID']").val($("#LGD_OID").val());
$("[name='LGD_AMOUNT']").val($("#LGD_AMOUNT").val());
$("[name='LGD_TIMESTAMP']").val($("#LGD_TIMESTAMP").val());
$("[name='LGD_MERTKEY']").val($("#LGD_MERTKEY").val());

//세션 추가

var pData = $("#searchFrm").serialize();
//commonAjax.postAjax("/app/mybike/addpay/svrTime.do", "json", pData
commonAjax.postAjax("/app/ticket/putTicketSession.do", "json", pData
	       ,function(data){
	            if(data) {
	            	var nowTimeAll = data.nowTime;
	            	//alert(nowTimeAll);
	            	var payCode = data.payCode;
	            	var usrSeq = '2427766';//추가 : 결제 중복 방지 코드 값의 일부(사용자 정보)_2016.09.20_by_JHN

	        		var payco = {
	        				mb_serial_no : usrSeq+'_'+payCode+'_'+ nowTimeAll//변경 : 결제 중복 방지 코드_2016.09.20_by_JHN
	        			};
	        		$("[name='mb_serial_no']").val(payco.mb_serial_no);

	        		if ($("[name='paymentMethodCd']").val() === "BIM_008") {
	        			launchCrossPlatform();
	        		} else if  ($("[name='paymentMethodCd']").val() === "BIM_007") {
	        			// payco
	        			autoPaymentReserve();
	        		} else if  ($("[name='paymentMethodCd']").val() === "BIM_010") {
	        			// kakao pay
	        			kakaoPayReady();
	        		}

	            }else{
	            	alert("중복 결제 예방 코드 미생성. 결제하기 버튼 다시 눌러주세요.");
	            	return false;
	            }
});
};

//자동결제 예약
function autoPaymentReserve() {

	var mb_serial_no = $("[name='mb_serial_no']").val();
	var sellerAutoPaymentReferenceKey = mb_serial_no;      //외부가맹점의 자동결제 관리번호

    // localhost 로 테스트 시 크로스 도메인 문제로 발생하는 오류
    $.support.cors = true;

	/* + "&" + $('order_product_delivery_info').serialize() ); */
	var totAmt = $("#TOT_AMOUNT").val();
	$.ajax({
		type: "POST",
		url: "https://www.bikeseoul.com/autoPayment/autoPaymentReserve.do",
		data: {"sellerAutoPaymentReferenceKey":sellerAutoPaymentReferenceKey,"paymentType":"buy","totalPaymentAmt":totAmt},		// JSON 으로 보낼때는 JSON.stringify(customerOrderNumber)
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType:"json",
		success:function(data){
			var paycoResult = JSON.parse(data.paycoResult);

			if(paycoResult.code == '0') {
				//console.log(data.result.reserveOrderNo);
				$('#order_num').val(paycoResult.result.reserveOrderNo);
				$('#order_url').val(paycoResult.result.orderSheetUrl);
				var order_Url = paycoResult.result.orderSheetUrl;
				if(false){
					location.href = order_Url;
				}else{
					window.open("/autoPayment/autoPaymentUrl.do?orderSheetUrl="+order_Url, 'popupPayco', 'top=100, left=300, width=727px, height=512px, resizble=no, scrollbars=yes');
				}
			} else {
				alert("code : " + paycoResult.code + "\n" + "message : " + paycoResult.message);
			}
		},
        error: function(request,status,error) {
            //에러코드
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			return false;
        }
	});
}

//자동결제 예약
function kakaoPayReady() {
	var mb_serial_no = $("[name='mb_serial_no']").val();
	var sellerAutoPaymentReferenceKey = mb_serial_no;      //외부가맹점의 자동결제 관리번호
    // localhost 로 테스트 시 크로스 도메인 문제로 발생하는 오류
    $.support.cors = true;

	var appOsType2 = '';

	/* + "&" + $('order_product_delivery_info').serialize() ); */
	var productInfo = $("[name='productInfo']").val();
	var totAmt = $("#TOT_AMOUNT").val();

	$.ajax({
		type: "POST",
		url: "https://www.bikeseoul.com/kakaoPay/ready.do",
		data: {"sellerAutoPaymentReferenceKey":sellerAutoPaymentReferenceKey,"paymentType":"buy","totalPaymentAmt":totAmt, "productInfo":productInfo},		// JSON 으로 보낼때는 JSON.stringify(customerOrderNumber)
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType:"json",
		success:function(data){
			var kakaoResult = JSON.parse(data.kakaoPayResult);
			var result = data.result;
			if(result) {
				//console.log(data.result.reserveOrderNo);
				$('#order_num').val(kakaoResult.tid);

				var order_Url = "";
				if(false && appOsType2 == 'web'){
					order_Url = kakaoResult.next_redirect_mobile_url;
					$('#order_url').val(kakaoResult.next_redirect_mobile_url);
					location.href = order_Url;
				}else if (false && appOsType != '') {
					order_Url = kakaoResult.next_redirect_pc_url;
					$('#order_url').val(kakaoResult.next_redirect_pc_url);
					location.href = order_Url;
				} else {
					order_Url = kakaoResult.next_redirect_pc_url;
					$('#order_url').val(kakaoResult.next_redirect_pc_url);
					window.open(order_Url, 'popupKakao', 'top=100, left=300, width=727px, height=512px, resizble=no, scrollbars=yes');
				}
			} else {
				alert("code : " + kakaoResult.code + "\n" + "message : " + kakaoResult.message);
			}
		},
        error: function(request,status,error) {
            //에러코드
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			return false;
        }
	});
}

var appOsType = 'web';

/*
* iframe으로 결제창을 호출하시기를 원하시면 iframe으로 설정 (변수명 수정 불가)
*/
	var LGD_window_type = '';
	if (appOsType == 'web') {
		LGD_window_type = 'iframe';
	} else {
		LGD_window_type = 'submit';
	}

/*
* 수정불가
*/
function launchCrossPlatform(){
	// lgdwin = open_paymentwindow(document.getElementById('LGD_PAYINFO'), ' CST_PLATFORM %>', LGD_window_type);
	var paymentMethodCd = $("#paymentMethodCd").val();
	$("#LGD_RETURNURL").val("https://www.bikeseoul.com/app/ticket/guest/addTicketPayRes.do");
	if (appOsType == 'web') {
		if(paymentMethodCd == 'BIM_009'){
			$("#CST_PLATFORM").val("service");
			$("#LGD_MID").val("bikeSeoul");
			$("#LGD_CUSTOM_SKIN").val("red");
			$("#LGD_CUSTOM_SWITCHINGTYPE").val("IFRAME");
			$("#LGD_WINDOW_VER").val("2.5");
			$("#LGD_OSTYPE_CHECK").val("P");
			$("#LGD_CUSTOM_USABLEPAY").val("SC0060");
			$("#LGD_VERSION").val("JSP_Non-ActiveX_Standard");
		} else if(paymentMethodCd == 'BIM_008'){
			$("#CST_PLATFORM").val("service");
			$("#LGD_MID").val("bikeSeoul");
			$("#LGD_PAYWINDOWTYPE").val("CardBillingAuth");
			$("#LGD_VERSION").val("JSP_Non-ActiveX_CardBilling");
		}

		lgdwin = openXpay(document.getElementById('LGD_PAYINFO'), 'service', LGD_window_type, null, "", "");
	} else {
		if(paymentMethodCd == 'BIM_009'){
			$("#CST_PLATFORM").val("service");
			$("#LGD_MID").val("bikeSeoul");
			$("#LGD_OSTYPE_CHECK").val("M");
			$("#LGD_CUSTOM_USABLEPAY").val("SC0060");
			lgdwin = open_paymentwindow(document.getElementById('LGD_PAYINFO'), 'service', LGD_window_type);
		} else if(paymentMethodCd == 'BIM_008'){
			$("#CST_PLATFORM").val("service");
			$("#LGD_MID").val("bikeSeoul");
			$("#LGD_OSTYPE_CHECK").val("M");
			$("#LGD_PAYWINDOWTYPE").val("CardBillingAuth_smartphone");
			$("#LGD_VERSION").val("JSP_SmartXPay_CardBilling");
			lgdwin = open_paymentwindow(document.getElementById('LGD_PAYINFO'), 'service', LGD_window_type);
		}
	}
}
/*
* FORM 명만  수정 가능
*/
function getFormObject() {
        return document.getElementById("LGD_PAYINFO");
}


/*
 * 인증결과 처리
 */
function payment_return() {
	var fDoc;

	fDoc = lgdwin.contentWindow || lgdwin.contentDocument;

	closeIframe();
	document.location.href = "/app/mybike/payhistory/getPayHistory.do";
}
</script>


</body>
</html>
