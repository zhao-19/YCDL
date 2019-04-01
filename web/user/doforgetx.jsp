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
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/lr.css">
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.0.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate-1.13.1.js"></script>
	 
</head>
<body>

<div class="register">
	<div class="logo"></div>
<!-- 	<div class="progress">
		<div class="img"></div>
		<li>1&nbsp;基本信息</li>
		<li>2&nbsp;详细信息</li>
		<li>3&nbsp;注册完成</li>
	</div> -->
	<div class="input">


		<form action="/user/submitforget.html" method="post"  name="demoForm"  id="demoForm">
  
  <input type="hidden" value= '<s:property value="#request.errorMsg"/>'  id="errorMsg"/>
			
			<div class="inputtext">用户号：<input class="inputbor" name="e.userid" readonly="readonly" value="<s:property value="#request.e.userid"/>"  id="userid"  type="text"><div class="tipinfo"></div></div>
			
			<div class="inputtext">密码：<input class="inputbor"  name="e.password"  id="password"     type="text"><div class="tipinfo"></div></div>

			<div class="inputtext">重复密码：<input class="inputbor"  name="password2"  id="password2"     type="text"><div class="tipinfo"></div></div>
						<div class="inputtext"><input type="hidden" value="<s:property value="#request.checkid"/>" name="checkid"/></div>
			
						<div class="inputtext"><input type="hidden" value="<s:property value="#request.e.cellphone"/>" name="e.cellphone"/></div>
						
			
			<input id="submitcheck" style="width: 358px;    margin-top: 14px;margin-bottom: 52px;" type="submit" class="submit"  values="提&nbsp;交"  value="提&nbsp;交">

		</form>

	</div>


</div>


	<div class="footer">
		<li>版权所有 : 成都高投盈创动力投资发展有限公司</li>
		<li>蜀ICP备18022655号-1  免责声明  电话：028-83159999</li>
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
            errorElement:"font",
            errorPlacement: function(error, element){
                error.appendTo(element.parent().find(".tipinfo"));
            },success:"valid"
             ,
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