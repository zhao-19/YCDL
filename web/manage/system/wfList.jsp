<%@page import="com.winpow.services.manage.order.bean.OrdersReport"%>
<%@page import="com.winpow.services.front.systemSetting.bean.SystemSetting"%>
<%@page import="com.winpow.core.ManageContainer"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.winpow.core.system.bean.Config"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css"  type="text/css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/jquery-1.5.1.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
<script src="<%=request.getContextPath() %>/resource/loading.js"></script>

<style>
	a:link {text-decoration:underline;}
a:visited {text-decoration:underline;}
a:hover {text-decoration:underline;}
a:active {text-decoration:underline;}

.Afont22{
font-weight: 700;font-size: 16px;color: #f50;
}

	iframe{width: 100%;height: 100%;border: 0;}
	.ui-tabs .ui-tabs-panel{padding:1em 0;}
	.ui-tabs .ui-tabs-panel{padding:0;}
	#tabs{position: fixed;width: 99.5%;height: 100%;top:0%;left: 0%;}
	#tabs>div{height: 100%; position: absolute;width: 100%; top: -1px;left:-1px;}
	.ui-tabs .ui-tabs-nav{position: absolute;width: 100%; z-index: 1;top: -1px;left:-1px;}
	.phone{position: absolute;top:9%;right:9%;width: 20%;}
	.phone .er{position: absolute;top:40%;left:50%;width: 55%;
		transform:translate(-50%,-50%);
		-ms-transform:translate(-50%,-50%);
		-moz-transform:translate(-50%,-50%);
		-webkit-transform:translate(-50%,-50%);
		-o-transform:translate(-50%,-50%);
	}
	.codebox{ position: absolute;width: 97%;height: 40%;top: 10%;left: 1.5%;border-radius: 6px;box-shadow: 0px 0px 14px rgba(0,0,0,0.15);}
	.codebox h4{margin: 7px;font-size: 15px;}
	.codebox2{top:55%;}
	.codebox>div{float:left;}
	.codelogo{width:30%;}
	.codelogo img{width: 30%;margin-top: 10%;}
	.codes{width:70%;}
	.codes li{width:50%;float:left;list-style: none;}
	.codes img{border:4px solid #e0e0e0;border-radius: 6px; display: inline-block;    width: 25%;padding:5px; margin: 0 auto;}
	.codes .uploadbtn{display:inline-block;width: 33%;height: 33px;line-height:33px;border-radius: 4px;margin:5px 0;
		background: url("<%=request.getContextPath()%>/resource/images/appdownarrow.png") no-repeat 93% center;
		background-color: #1394ef;border:0;color:#fff;  background-size: 14px;
		text-align: left;padding-left: 2%;box-sizing: border-box;cursor: pointer;
	}
	.codes .uploadbtn:hover{background-color: #087ccd;}
	.codes .btn2{background-color: #b0d62b;}
	.codes .btn2:hover{background-color: #93b619;}
	.codes p{color: #ff534f;font-size: 12px;}

</style>
<%
SystemSetting ssInfo = SystemManager.systemSetting;
if(ssInfo==null){
	ssInfo = new SystemSetting();
}
%>
<script>
$(function() {
	$( "#tabs" ).tabs({
		//event: "mouseover"
	});
});

</script>

</head>

<body style="background-color: #E6EAE9; text-align: center; margin: auto;">
<div id="uploadbg">
    <div id="uploadbox"></div>
</div>
	<div class="container">
		<div class="row" style="height: 30px;">
		</div>
		
		<div class="row">
			<div id="tabs">
				<ul id="tabHead">
					<s:if test="#request.power==1">
						<s:if test="#request.issubstation==1">
							<li><a href="#tabs-0" style="font-size: 14px;">我的待办</a></li>
							<li><a href="#tabs-2" style="font-size: 14px;">已办事项</a></li>
							<li><a href="#tabs-3" style="font-size: 14px;">办结事项</a></li>
						</s:if>
						<s:else>
							<li><a href="#tabs-0" style="font-size: 14px;">我的待办</a></li>
							<li><a href="#tabs-1" style="font-size: 14px;">待办事项</a></li>
							<li><a href="#tabs-2" style="font-size: 14px;">已办事项</a></li>
							<li><a href="#tabs-3" style="font-size: 14px;">办结事项</a></li>
						</s:else>
					</s:if>
					<li><a href="#tabs-4" style="font-size: 14px;">APP下载</a></li>
				</ul>
				<s:if test="#request.power==1">
					<s:if test="#request.issubstation==1">
							<div id="tabs-0">
								<iframe id="iframe0" src="user!getTaskList1.action?querytype=0&issubstation=1"></iframe>
							</div>
							<div id="tabs-2">
								<iframe id="iframe2" src="user!getTaskList1.action?querytype=2&issubstation=1"></iframe>
							</div>
							<div id="tabs-3">
								<iframe id="iframe3" src="user!getTaskList1.action?querytype=3&issubstation=1"></iframe>
							</div>
					</s:if>
					<s:else>
						<div id="tabs-0">
							<iframe id="iframe0" src="user!getTaskList1.action?querytype=0"></iframe>
						</div>
						<div id="tabs-1">
							<iframe id="iframe1" src="user!getTaskList1.action?querytype=1"></iframe>
						</div>
						<div id="tabs-2">
							<iframe id="iframe2" src="user!getTaskList1.action?querytype=2"></iframe>
						</div>
						<div id="tabs-3">
							<iframe id="iframe3" src="user!getTaskList1.action?querytype=3"></iframe>
						</div>
					</s:else>
				</s:if>
				<div id="tabs-4" style="overflow: hidden;position: relative;">
					<div class="codebox">
						<div class="codelogo">
							<img src="<%=request.getContextPath()%>/resource/images/apptest.png" alt="">
						</div>
						<div class="codes">
							<ul>
								<li>
									<h4>IOS版</h4>
									<div>
										<img src="<%=request.getContextPath()%>/resource/images/er.png" alt="" id="iostest">
									</div>
									<span class="uploadbtn" reg="image" type="iostest">上传二维码</span>
									<p>最新更新 <span id="iostesttime"></span></p>
								</li>
								<li>
									<h4>Android版</h4>
									<div id="androidtest">
										<!--<img src="<%=request.getContextPath()%>/resource/images/er.png" alt="" id="androidtest">-->
									</div>
									<span class="btn2 uploadbtn" reg="apk" type="androidtest">上传二维码</span>
									<p>最新更新 <span id="androidtesttime"></span></p>
								</li>
							</ul>
						</div>
					</div>
					<div class="codebox codebox2">
						<div class="codelogo">
							<img src="<%=request.getContextPath()%>/resource/images/appadmin.png" alt="">
						</div>
						<div class="codes">
							<ul>
								<li>
									<h4>IOS版</h4>
									<div>
										<img src="<%=request.getContextPath()%>/resource/images/er.png" alt="" id="iosadmin">
									</div>
									<span class="uploadbtn" reg="image" type="iosadmin">上传二维码</span>
									<p>最新更新 <span id="iosadmintime"></span></p>
								</li>
								<li>
									<h4>Android版</h4>
									<div id="androidadmin">
										<!--<img src="<%=request.getContextPath()%>/resource/images/er.png" alt="" id="androidadmin">-->
									</div>
									<span class="btn2 uploadbtn" reg="apk" type="androidadmin">上传二维码</span>
									<p>最新更新 <span id="androidadmintime"></span></p>
								</li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/qrcode.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/easyUpload/easy-upload.css" />
	<script charset="utf-8" src="<%=request.getContextPath() %>/resource/easyUpload/easyUploadappdown.js"></script>
	<script type="text/javascript">
	var loadupdate = true;
	function getdata() {
		var href = $("#tabs .ui-tabs-active a").attr("href");
		if (href == "#tabs-0") {
			$("#iframe0").contents().find("#loaddata").click();
		} else if (href == "#tabs-1") {
			$("#iframe1").contents().find("#loaddata").click();
		} else if (href == "#tabs-2") {
			$("#iframe2").contents().find("#loaddata").click();
		} else if (href == "#tabs-3") {
			$("#iframe3").contents().find("#loaddata").click();
		} else if (href == "#tabs-4") {
			if (loadupdate) {
				loadupdate = false;
				$.ajax({
		            type: "post",
		            url:"/manage/user!getupdate.action",
		            dataType: "json",
		            success: function(data) {
		            	$('#iostest').attr('src',data.iostest);
		            	$('#iostesttime').html(data.iostesttime);
		            	$('#iosadmin').attr('src',data.iosadmin);
		            	$('#iosadmintime').html(data.iosadmintime);
		                new QRCode(document.getElementById("androidtest"),data.androidtest);
		                $('#androidtesttime').html(data.androidtesttime);
		                new QRCode(document.getElementById("androidadmin"),data.androidadmin);
		            	$('#androidadmintime').html(data.androidadmintime);
		            }
		        });
			}
		}
	}
	window.onload = function() {
		getdata();
		$("#tabs li").click(function(){
			getdata();
		});
	}
</script>
</body>
</html>