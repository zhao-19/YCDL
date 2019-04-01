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
	
	<script type="text/javascript">
var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount;//当前剩余秒数
function sendMessage(){
	var phone = $("#cellphone").val();
	if(/^1[34578]\d{9}$/g.test(phone)){
    }else{
        alert("手机号码错误!");
        $("#cellphone").focus();
        return false;
    }
	
  　 curCount = count;
　　//设置button效果，开始计时
     $("#btnSendCode").attr("disabled", "true");
     $("#btnSendCode").val( curCount + "秒后重新发送");
     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
 
     var cellphone = $("#cellphone").val();
　　  //向后台发送处理数据
     $.ajax({
     　　type: "POST", //用POST方式传输
     　　dataType: "text", //数据格式:JSON
     　　url: '/user/sendMsgCode2.html', //目标地址
    　　 data: "e.cellphone=" + cellphone,
    　　 error: function (XMLHttpRequest, textStatus, errorThrown) { },
     　　success: function (msg){
     		if(msg=='0') {
     			//发送成功
     		}else {
     			alert('发送失败');
     		}
     	 }
     });
}

//timer处理函数
function SetRemainTime() {
            if (curCount == 0){                
                window.clearInterval(InterValObj);//停止计时器
                $("#btnSendCode").removeAttr("disabled");//启用按钮
                $("#btnSendCode").val("重新发送验证码");
            }else {
                curCount--;
                $("#btnSendCode").val( curCount + "秒后可重新发送验证码");
            }
        }
        
 </script>
        
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


		<form action="/user/doforget.html" method="post"  name="demoForm"  id="demoForm">
  
			
			<div class="inputtext">手机号码：<input class="inputbor" name="cellphone" value="<s:property value="cellphone"/>"  id="cellphone"  type="text"></div>
			
 			<img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" src="/ValidateImage.do" onClick="reloadImg2()" alt="" style="cursor:pointer;width:100px;height:26px;"/>
			
			<div class="inputtext">请输入上面图形中的4个字符：
				 <input class="inputbor" name="imagecode" id="imagecode" type="text">
			</div> 
				<div class="inputtext code">短信验证码：<br/>
			<div >
			<input class="inputcode" name="vcode" id="vcode" type="text">
			<div class="get fr"><input id="btnSendCode"  class="fsyycode" type="button" value="发送短信验证码" onclick="sendMessage()" /></div>
			<div class="tipinfo"></div>
			
			</div>
		 

		 	<div class="error_box">
				 <label id="register-error" class="error" for="register"></label>
				             <div id="err"><s:property value="errorMsg"/></div>
			</div>

			<input style="width: 358px;    margin-top: 14px;margin-bottom: 52px;" type="submit" class="submit" values="提&nbsp;交"  value="提&nbsp;交">

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
	if(/^1[34578]\d{9}$/g.test(cellphone)){
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

var errorMsg = '<s:property value="#request.errorMsg"/>';
if(errorMsg=='1') {
	alert('密码找回成功，新密码已经通过短信发送到手机上，请用新密码登录系统。');
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
            var mobile = /^((0\d{2,3}-\d{7,8})|(1[34578]\d{9}))$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写您的手机号码1");
    	
		$("#demoForm").validate({
           
            rules: {
                userid: {
                    required: true,
                    minlength: 6,
                    maxlength: 16
                },
                
                cellphone : {
		            required : true,
		            minlength : 11,
		            maxlength: 11,
		            isMobile : true
	       		 },
		        imagecode : {
		            required : true
		        }
		        
		       
            },
            messages: {
                userid:{
                    required: '请输入用户名',
                    minlength: '用户名不能小于6个字符',
                    maxlength: '用户名不能超过16个字符'
                },
                 
                cellphone:{
		            required : "请输入手机号",
		            minlength : "手机号码为11位",
		            maxlength: '手机号码为11位',
		            isMobile : "请正确填写您的手机号码"
       	 		},
		        imagecode:{
		            required : "请输入图形验证码"
		        }
		        
		        
            },

            errorLabelContainer:"#err",
                   wrapper:"div",
                   showErrors:function(errorMap,errorList) {
                       this.defaultShowErrors();
                       $('#err div:hidden').remove();//删除所有隐藏的li标签
                       $('#err div:eq(0)').nextAll().remove();//第一个li下所有跟随的同胞级li删除
                   }
           /*  ,
            submitHandler:function(form){
            	//alert('ok!');
            	//$("#demoForm").submit();
            } */
        });
    });
</script>
 



</body>
</html>