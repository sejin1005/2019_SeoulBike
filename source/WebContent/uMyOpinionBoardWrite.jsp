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
<script type="text/javascript" src="./js/select/jquery.selectify.js"></script>
<script src="/js/select/jquery.styled-select-box_gray.js"></script>
<!-- daumeditor -->
<link type="text/css" rel="stylesheet" href="./daumeditor/css/editor.css"/>
<script type="text/javascript" src="./daumeditor/js/editor_loader.js?environment=production" charset="utf-8"></script>
<script type="text/javascript">
	 var currentPageName = "opinionboard";
console.log("web2");


</script>
</head>
<body>

<div class="wrap board">
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
    	<div class="content">

        <div class="board">
            <div class="top">
                <h3>시민의견수렴</h3>
                <button class="back"></button>
                <button class="close"></button>
            </div>

			<form id="tx_editor_form" name="tx_editor_form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="consentYn"/>
				<input type="hidden" name="secretYN" value="" /> <!-- 추가 : 비밀글 정보 저장_2016.04.22_by_JHN -->
				<input type="hidden" name="cateCD" value="" /> <!-- 추가 : 구분 카테고리 변경시 해당 값 저장_2016.05.30_by_JHN -->
				<input type="hidden" id="usrQnaSeq" name="usrQnaSeq" value="0" />
				<input type="hidden" id="mode" name="mode" value="insert" />
				<input type="hidden" id="bbsClsCD" name="bbsClsCD" value="CTM_003" />
				<input type="hidden" id="currentPageName" name="currentPageName" value="opinionboard" />
				<input type="hidden" id="wMode" name="wMode" value="" />

            <div class="write_box noline">
                <table>
                	<colgroup>
                        <col width="25%">
                        <col width="75%">
                    </colgroup>
                	<tr>
                    	<th class="first">구분</th>
                        <td class="first">

                            <select id="cateCDList" name="cateCDList">
                              <option value="">선택</option>
							<option value="OPI_006">이용방법</option>
							<option value="OPI_007">대여소</option>
							<option value="OPI_008">결제관련</option>
							<option value="OPI_009">홈페이지,앱</option>
							<option value="OPI_010">장애,오류</option>
							<option value="OPI_011">정책건의</option>
							<option value="OPI_012">기타문의</option>
							</select>
                            <script>$("select").styledSelect();</script>
                        </td>
                    </tr>
                    <tr>
                    	<th>제목</th>
                        <td><div class="input w100"><input type="text" class="w100" id="qestnTitle" name="qestnTitle" value=""></div></td>
                    </tr>
                    <tr>
                    	<th>아이디</th>
                        <td>abcd0134</td>
                    </tr>
                    <tr>
                    	<th>내용</th>
                        <td><div class="input w100"><input type="text" class="w100" id="qestnTitle" name="qestnTitle" value=""></div></td>
                </table>
            </div>

            <div class="btns">
                <a href="./customer/opinionBoard/opinionBoardList.do" class="cancel" id="goList">취소</a>
                <a href="#" class="write" id="submitButton">저장</a>
            </div>
 		</form>

<script type='text/javascript' src='./webfilter/js/webfilter.js' defer='defer'></script><iframe id='webfilterTargetFrame' name='webfilterTargetFrame' width='0' height='0' frameborder='0' scrolling='no' noresize></iframe></div>

        </div>
    </div>


</div>

	<script type="text/javascript">
			var config = {
				txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
				txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
				txService: 'ntc', /* 수정필요없음. */
				txProject: 'ntc', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
				initializedId: "", /* 대부분의 경우에 빈문자열 */
				wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
				form: 'tx_editor_form'+"", /* 등록하기 위한 Form 이름 */
				txIconPath: "/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
				txDecoPath: "/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
				canvas: {
		            exitEditor:{
		            	/*
		                desc:'빠져 나오시려면 shift+b를 누르세요.',
		                hotKey: {
		                    shiftKey:true,
		                    keyCode:66
		                },
		                nextElement: document.getElementsByTagName('button')[0]
		                 */
		            },
					styles: {
						color: "#123456", /* 기본 글자색 */
						fontFamily: "굴림", /* 기본 글자체 */
						fontSize: "10pt", /* 기본 글자크기 */
						backgroundColor: "#fff", /*기본 배경색 */
						lineHeight: "1.5", /*기본 줄간격 */
						padding: "8px" /* 위지윅 영역의 여백 */
					},
					showGuideArea: false
		            /* autolink: false */
				},
				events: {
					preventUnload: false
				},
				sidebar: {
					attachbox: {
						show: true,
						confirmForDeleteAll: true
					}
				},
				size: {
					contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
				}
				/* toolbar: {
				    image: {
				        disabledonmobile: false
				    }
				} */
		        /* toolbar: {
		            codehighlight: {
		                styleSheetUrl: ["http://google-code-prettify.googlecode.com/svn/trunk/src/prettify.css"],
		                highlight: function(code){
		                    return prettyPrintOne(code);
		                }
		            },
		            image:{
		            	disabledonmobile : false,
		            	popPageUrl: "/daumeditor/daumeditorFileUploadPopup.do"
		            },
		            file: {
		                disabledonmobile: false
		            }
		            /* paste: {
		                defaultMode: Trex.Paste.MODE_HTML
		            } */
		        //}
			};
			EditorJSLoader.ready(function(Editor) {
				// 툴바 없애기
				var filter = "win16|win32|win64|mac|macintel";
				if(navigator.platform){
					if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
						//mobile
						document.getElementById("tx_toolbar_basic").style.display = "none";
						document.getElementById("tx_sidebar").style.display = "none";
					} else {
						//pc
						document.getElementById("tx_toolbar_basic").style.display = "none";
						document.getElementById("tx_sidebar").style.display = "none";
						/* Trex.I.AttachBox.isDisplay = true;
				        Trex.I.AttachBox.displayBox = function() {
				            var isDisplay = true;
				            if (isDisplay) {
				                $tx.show(this.elBox);
				                this.fireJobs(Trex.Ev.__ATTACHBOX_SHOW, _TRUE);
				            } else {
				                $tx.hide(this.elBox);
				                this.fireJobs(Trex.Ev.__ATTACHBOX_HIDE, _FALSE);
				            }
				            this.isDisplay = isDisplay;
				        } */
					}
				}
		        /* 사진첨부 이미지 활성화 */
		        //$('#tx_image').removeClass('tx-disable');
				var editor = new Editor(config);
			});
		</script>
<!-- ================================================== Start: Saving Contents ================================================== -->
		<script type="text/javascript">
			/* 예제용 함수 */
			/*
			function saveContent() {
				if(confirm("저장 하시겠습니까?")){
					Editor.save();
				}
			}
			*/

			function validForm(editor) {
				if($("#cateCDList").val() === ''){
	    			alert('시민의견 수렴의 "구분"을 선택해 주세요.');
	    			return false;
	    		}
				if($.trim($("#qestnTitle").val())==''){
					$("#qestnTitle").focus();
					alert('제목을 입력해 주세요.');
					return false;
				}
				/* if($("#qestnTextContent").val()=='') {
					alert('내용을 입력해 주세요.');
					return false;
				} */
				/* 본문 내용이 입력되었는지 검사하는 부분 */
				var validator = new Trex.Validator();
				var content = editor.getContent();
				if(!validator.exists(content)) {
					alert('내용을 입력해 주세요.');
					alert("내용을 입력해 주세요.");
					return false;
				}
				var mode = $("#tx_editor_form").children("#mode").val();
				if(mode=='insert' || mode=='update'){
					$("#tx_editor_form").attr('action','./customer/opinionBoard/opinionBoardPersist.do').submit();
				} else {
					alert("모드 값이 설정되지 않았습니다.");
					return false;
				}
				return true;
			}

			function setForm(editor) {
				document.getElementById("qestn_TEXT_content").disabled=true;
		        var i, input;
		        var form = editor.getForm();
		        var qestnHTMLContent = editor.getContent();
		        var textarea = document.createElement('textarea');
		        textarea.name = 'qestnHTMLContent';
		        textarea.value = qestnHTMLContent;

		        if(document.getElementsByName("qestnHTMLContent").length == 0){
			        form.createField(textarea);
		        }

		       /*
		       $('[name="qestnHTMLContent"]').attr('style', 'display:none');
		       var images = editor.getAttachments('image');
		        for (i = 0; i < images.length; i++) {
		            if (images[i].existStage) {
		                //alert('attachment information - image[' + i + '] \r\n' + JSON.stringify(images[i].data));
						iinput = document.createElement('input');
		                input.type = 'hidden';
		                input.name = 'attach_image_info';
		                input.value = JSON.stringify(images[i].data);
		                form.createField(input);
		            }
		        }
		         var files = editor.getAttachments('file');
		        for (i = 0; i < files.length; i++) {
		            input = document.createElement('input');
		            input.type = 'hidden';
		            input.name = 'attach_file';
		            input.value = files[i].data.attachurl;
		            form.createField(input);
		        }
		        */

		      //이미지, 파일 업로드 _cms_20161108
		       var edtList = Editor.getAttachBox().datalist;
		        var imglist =Editor.getAttachments('image', true);
		        var filelist =Editor.getAttachments('file', true);

		         for( f = 0; f < edtList.length; f++ ){
		        	for(k = 0; k < imglist.length; k++){
		        		if(edtList[f].data.dispElId == imglist[k].data.dispElId){
			        		 var entry = edtList[f];
				            	 input = document.createElement('input');
					             input.type = 'hidden';
					             input.name = 'attach_image_info';
					             input.value = JSON.stringify(edtList[f].data);
					             form.createField(input);
		        		}
		        	 }
		         }

		         for( f = 0; f < edtList.length; f++ ){
			        	for(k = 0; k < filelist.length; k++){
			        		if(edtList[f].data.dispElId == filelist[k].data.dispElId){
				        		 var entry = edtList[f];
					            	 input = document.createElement('input');
						             input.type = 'hidden';
						             input.name = 'attach_file';
						             input.value = JSON.stringify(edtList[f].data);
						             form.createField(input);
		        		}
		        	}
		        }

		        return true;
			}
		</script>
<!-- ================================================== End: Saving Contents ================================================== -->
<!-- ================================================== Start: Loading Contents ================================================== -->
<textarea id="qestn_TEXT_content" style="display:none;"></textarea>
		<script type="text/javascript">
			$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
			$(document).ready(function(){
				var filter = "win16|win32|win64|mac|macintel";
				if(navigator.platform){
					if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
						$("#wMode").val("M");
						$("#fileattach").css("display","none");
					}else{
						$("#wMode").val("P");
					}
				}
		        $('#submitButton').on('click', function(){
		            if(confirm("저장 하시겠습니까?")){
		                Editor.save();
		            }
		        });
				/* 에러 메시지  */
				var alertValue = "";
				if(alertValue!=""){ alert(alertValue); }
				/* 이미지 */
				var attachments = {};
				attachments['image'] = [];

				/* 내용 */
				Editor.modify({
					"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
						var allattachments = [];
						for (var i in attachments) { allattachments = allattachments.concat(attachments[i]); }
						return allattachments;
					}(),
					"content": document.getElementById("qestn_TEXT_content").value
				});
			});
			</script>
		<!-- ================================================== End: Loading Contents ================================================== -->

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
		//추가 : 수정시 해당 게시글의 카테고리 적용하여 보여주기_2016.05.30_by_JHN
		$(document).ready(function () {
			var comCD = '';
			$("#cateCDList").val(comCD).prop("selected", true);
			if(''==''){
				$('[name="secretYN"]').val('Y');
			}
		});
		//추가 : 구분 카테고리 변경시 해당 값 저장_2016.05.30_by_JHN
		$("#cateCDList").change(function(){
			//$("#cateCDList option:selected").each(function () {  alert( $(this).val()+' '+ $(this).text()  );  }); // 다른 방법
			var comCDChange = $("#cateCDList option:selected").val();
			$('[name="cateCD"]').val(comCDChange);
		});

		//추가 : 비공개 버튼 클릭시 DB openYN 컬럼에 "Y", "N"입력 2016.04.12 by 정하늘
   		$("#secretInfo").click(function(){
					//var chk = $(this).is(":checked");
					if($('[name="secretInfo"]').is(':checked')){
						//$(".checkbox input").attr('checked', true);
						$('[name="secretYN"]').val('Y');
// 						alert('비공개');
					}else{
						//$(".checkbox input").attr('checked', false);
						$('[name="secretYN"]').val('N');
// 						alert('공개');
					}
		});

   		$('[name="imgFile"]').on("change", changeFile);

	});

function changeFile(e){
	e.preventDefault();
	$('[name="imgPath"]').val($('[name="imgFile"]').val());
	///daumeditor/daumeditorFileUploadPersist.do
}
</script>
</body>
</html>
