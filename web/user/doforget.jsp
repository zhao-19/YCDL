<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/lr2.css">
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.0.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate-1.13.1.js"></script>
 	<style>
		input:-webkit-autofill { 
			-webkit-box-shadow: 0 0 0px 1000px white inset; 		
		}
	</style>
</head>
<body>
<!-- 新版登录界面 -->
<div class="wk">
	<div class="bl new_logint">
		<a href="/"><img src="/image/index/logo.jpg" alt="logo" class="fl"></a>
		<span class="fl">忘记密码</span>
	</div>
</div>
<div class="wk new_loginmwk">
	<div class="bl new_loginm">
		<div class="bl new_lobg fr">
			<div class="lobg_nr">
				<form action="/user/submitforget.html" method="post" id="demoForm" autocomplete="off">
				 	<input type="hidden" value= '<s:property value="#request.errorMsg"/>'  id="errorMsg"/>
					<input type="text" style="display:none;"/>
					<input type="password" style="display:none;"/>
					<p class="t findt"><span class="tlspan fl">密码找回</span><span class="trspan fr"><a href="/user/login.html">返回登录</a></span><div class="clear"></div></p>
					<div class="findp"><span class="finds">用户号</span><p class="li telinp findinp"><span class="icon"></span><input type="text"  id="userid" name="e.userid" readonly="readonly" value="<s:property value="#request.e.userid"/>" autocomplete="off"/><span class="err_box"></span></p></div>
					<div class="findp"><span class="finds">密码</span><p class="li telinp passinp findinp"><span class="icon"></span><input class="huise" type="text" placeholder="输入新密码" name="e.password" id="password" autocomplete="off"/><span class="err_box"></span></p></div>
					<div class="findp"><span class="finds">重复密码</span><p class="li telinp passinp findinp"><span class="icon"></span><input class="huise" type="text" placeholder="再次输入新密码" name="password2" id="password2" autocomplete="off"/><span class="err_box"></span></p></div>
					<div class="inputtext"><input type="hidden" value="<s:property value="#request.checkid"/>" name="checkid"/></div>
					<div class="inputtext"><input type="hidden" value="<s:property value="#request.e.cellphone"/>" name="e.cellphone"/></div>
					<p class="li sbinp"><input class="submit" type="submit" value="提&nbsp;交"/></p>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="wk new_foot">
	<div class="bl">
		<span class="">版权所有 : 成都高投盈创动力投资发展有限公司 </span>
		<span class="b">蜀ICP备18022655号-1 免责声明  </span>
		<span class="b tel">&nbsp;&nbsp;&nbsp;&nbsp;联系电话：028-8315-9999</span>
	</div>
</div>

<script type="text/javascript">


$("#cellphone").blur(function(){
	var cellphone = $("#cellphone").val();
	if(/^1\d{10}$/g.test(cellphone)){
		//发送短信验证码按钮外框可点击色，自身cursor为pointer
	   	$(".get").addClass("nodisabled");
	   	$("#btnSendCode").addClass("cursor");
	   	//发送短信验证码按钮可以点击
	   	$("#btnSendCode").attr("disabled",false);
	}
});

function reloadImg2() {
	document.getElementById("JD_Verification1").src = "/ValidateImage.do?" + "radom="
			+ Math.random();
	$("#imagecode").focus();
}

var errorMsg = $('#errorMsg').val();
if(errorMsg=='0') {
	alert('密码修改成功，请用新密码登录系统。');
	window.location='/user/login.html';
}else if(errorMsg!=''){
	alert(errorMsg);
}
</script>
<script>
    $(document).ready(function () {
    	
    	// 联系电话号码验证
        jQuery.validator.addMethod("isMobile", function(value, element) {
            var length = value.length;
            var mobile = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写您的手机号码1");
    	
		$("#demoForm").validate({
           
            rules: {
				"e.userid": {
	                required: true
	             },
	            "e.password" : {
		            required : true,
		            rangelength: [6,12]
	      		 },
	      		"password2" : {
	      			required : true,
	            	equalTo: "#password"
	            }
			},
            messages: {
                "e.userid":{
                    required: '请输入用户名'
                },
                "e.password":{
		            required : "请输入密码",
		            rangelength : "6到12个字符"
       	 		},
       	 	    "password2":{
       	 		    required : "请输入新密码",
       	 		    equalTo:"两次输入的密码不相同"
		        }
            },
            errorElement: "font",
	        errorPlacement: function (error, element) {
	            error.appendTo(element.parent().children(".err_box"));
	        },
            submitHandler:function(form){
            	//alert('ok!');
            	//return false;
            	form.submit();   //提交表单   
            } 
        });
    });
</script>
 



</body>
</html>