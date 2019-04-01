<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head >
    <title>${sessionsubstation}科技金融服务平台管理系统</title>
    <%@ include file="/manage/system/common.jsp"%>
    <link rel="stylesheet" href="/css/common.css?${sysversion}"/>
    <link rel="stylesheet" href="/css/index.css?${sysversion}"/>
	<script type="text/javascript" src="/js/jquery.validate-1.13.1.js"></script>
</head>
<style>
	.container{width: 1200px;margin:0 auto;}
	.top{width: 100%;height: 50px;background:#374754;color: #fff;padding-left:20px;box-sizing: border-box;}
	.logo{float:left;line-height: 50px;font-size: 16px;padding-left:90px;background: url("/resource/zTree3.1/css/zTreeStyle/img/logo.png") no-repeat 0 center;}
	.input-prepend{width: 100%;}
	.input-prepend>input{border-radius: 0;width:290px;padding:5px 0;border:0;border-bottom: 1px solid #d8dfea;outline: none !important;;box-shadow: none !important;}
	.input-prepend>input:-webkit-autofill{-webkit-box-shadow: 0 0 0px 1000px white inset !important;}

	body{padding:0;margin:0;}
	.loginbox{background: #e3efff;padding:80px 0 60px;}
	.table th, .table td{border-top:0;}
	/*.span7{width: 410px;margin:0;margin-left:40px;}*/
	.span5{margin:0;width: 50%;}
	.form-horizontal .control-label{width: 65px;padding-top: 8px;text-align: left;}
	.form-horizontal .controls{margin-left:0px;}
	.form-horizontal .control-group{margin-bottom: 25px;}
	.btn{width: 265px;border-radius: 0 !important;background:#374754;color:#fff;padding: 8px;}
	.btn:hover{background: #283742;color:#fff;}
	.title{text-align:center;color: #fff;padding: 2px 20px;font-weight: normal;font-size: 20px;margin: 0;margin-bottom: 40px;border-radius: 3px 3px 0 0;background: url("/resource/images/logintitile.png") repeat center center;}
	.errorts{color: #f00;}
	.ts{color: #666;}
	.logoHead{float:left;line-height: 50px;font-size: 18px;font-weight:bold;padding-left:210px;cursor:pointer;background: url("/resource/zTree3.1/css/zTreeStyle/img/FZlogo.png") no-repeat 0 center;}

	#demoForm{background: #fff;box-shadow:0 0 10px #b1d2ff;width: 290px;float:right;padding:25px;border-radius: 5px; }
	#demoForm h2{font-weight: normal;font-size: 24px;color:#424e67;border-bottom: 2px solid #3b8cff;padding:10px 0;margin-bottom: 30px;}
	#demoForm_subbtn{background: #3b8cff;border-radius: 20px !important;width: 290px;box-shadow: 0 3px 6px rgba(59,140,255,0.2)!important;   padding: 8px 0;}
	#demoForm_subbtn:hover{background: #3080f1;}
	.Copyright{text-align: center;color: #424e67;padding:40px 0;}
</style>
<script type="text/javascript">
//刷新验证码
	function reloadImg2() {
        document.getElementById("JD_Verification1").src = "/ValidateImage.do?" + "radom="
                + Math.random();
        $("#imagecode").focus();
    }
</script>
</head>
<body>
<div class="container" >
	<span class="logoHead">
		${sessionsubstation}科技金融服务平台管理系统
	</span>
</div>
<div class="loginbox">
	<div class="container" >
		<div class="row ov">
			<div class="span5 fl">
				<div>
					<img  class="img-circle" alt="" src="<%=request.getContextPath() %>/resource/images/fenzhan/loginImg.png" style="width: 500px;">
				</div>
			</div>
			<div class="span5 fr">
				<table class="table " style="width: 340px;float: right;">
					<caption>
						<s:if test="#request.rmsg != '' && #request.rmsg != null">
                            <div class="alert alert-warning alert-dismissable" style="margin-bottom:0px;color:red;font-weight: bolder;">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
								${rmsg }
							</div>
                     	</s:if>  
					</caption>
					<tr>
						<td colspan="2" style="border:0;">
							<s:form action="/usermanage/login.html" theme="simple" namespace="/front"
								cssClass="form-horizontal" id="demoForm">
								<div class="control-group">
									<h2>用户登录</h2>
								</div>
								<div class="control-group">
									<div class="controls">
										<div class="input-prepend">
											<s:textfield name="username" cssClass="len" id="username" placeholder="请输入用户名"/>
										</div>
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<div class="input-prepend">
											<s:password showPassword="true" name="password" cssClass="len" label="密码"  placeholder="请输入密码"/>
										</div>
									</div>
								</div>

					            
					            <div class="control-group">
									<div class="controls" style="float:left;width: 190px;margin:0;">
										<div class="input-prepend">
											<input class="inputbor" name="imagecode" id="imagecode" type="text" placeholder="请输入验证码" style="width: 190px;">
										</div>
									</div>
									<div class="yzmwk" style="float:left;margin-top:5px;">
										<img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" src="/ValidateImage.do" onClick="reloadImg2()"
											 alt="" style="cursor:pointer;width:100px;height:26px;"/><br/>
										<span class="errorts"></span>
									</div>
								</div>
								<div class="control-group" style="margin-top:50px;">
									<div class="controls">
										<div class="input-prepend">
										<s:submit value="登录" name="subbtn" cssClass="btn"/>
										</div>
									</div>
								</div>
							</s:form>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="Copyright">
	Copyright  2011-2019   版权所有 : 成都高投盈创动力投资发展有限公司
</div>
<script>
	$(function () {
		$('body').height($(document).height())
    })
</script>
</body>
</html>
