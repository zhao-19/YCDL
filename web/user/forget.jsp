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
				<form action="/user/doforget.html" method="post" id="demoForm" autocomplete="off">
					<input type="text" style="display:none;"/>
					<input type="password" style="display:none;"/>
					<p class="t"><span class="tlspan fl">忘记密码</span><span class="trspan fr"><a href="/user/login.html">立即登陆</a></span><div class="clear"></div></p>
					<p class="li telinp"><span class="icon"></span><input type="text" placeholder="输入手机号码" value="" id="cellphone" name="cellphone" value="<s:property value="cellphone"/>" autocomplete="off"/><span class="err_box"></span></p>
					<p class="li telinp passinp yzminp"><span class="icon"></span><input class="huise" type="text" placeholder="输入短信验证码" name="vcode" id="vcode" autocomplete="off"/><input id="btnSendCode" disabled="disabled" class="fsyycode get" type="button" value="发送短信验证码" onclick="sendMessage()"/><span class="err_box"></span></p>
					<p class="li yzminp"><span class="icon fl"></span><input class="fl" type="text" placeholder="输入验证码" name="imagecode" id="imagecode" autocomplete="off"/><img id="JD_Verification1" ver_colorofnoisepoint="#888888" src="/ValidateImage.do" onclick="reloadImg2()" alt=""><span class="err_box"></span></p>
					<p class="li sbinp"><input class="submit" type="submit" value="提&nbsp;交"/></p>
					<p class="li telinp forgetinp"><span><a href="/user/login.html">返回登录</a>&nbsp;|&nbsp;</span><span><a href="/user/register.html">免费注册</a></span></p>
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
                
                cellphone: {
                    required: true,
                    minlength: 11,
                    maxlength: 11,
                    isMobile: true
                },
                imagecode: {
                    required: true,
                    remote: {
                        url: '/usercenter/ajaxcode.html',
                        type: "post",
                        data: {
                            str: function () {
                                return $("#imagecode").val();
                                //这个是取要验证的密码
                            }
                        },
                        dataFilter: function (data) {
                            //判断控制器返回的内容
                            if (data == 0) {
                                //表示号码已经存在
                                return false;
                            } else {
                                return true;
                            }
                        }
                    }
                },
                vcode: {
                    required: true,
                    remote: {
                        url: '/usercenter/ajaxmsg.html',
                        type: "post",
                        data: {
                            str: function () {
                                return $("#vcode").val();
                                //这个是取要验证的密码
                            }
                        },
                        dataFilter: function (data) {
                            //判断控制器返回的内容
                            if (data == 0) {
                                //表示号码已经存在
                                return false;
                            } else {
                                return true;
                            }
                        }
                    }
                }

            },
            messages: {
                cellphone: {
                    required: "请输入手机号",
                    minlength: "手机号码为11位",
                    maxlength: '手机号码为11位',
                    isMobile: "请正确填写您的手机号码"
                },
                imagecode: {
                    required: "请输入图形验证码",
                    remote: "图形验证码输入错误"
                },
                vcode: {
                    required: "请输入短信验证码",
                    remote: "短信验证码错误"
                }

            },
            errorElement: "font",
	        errorPlacement: function (error, element) {
	            error.appendTo(element.parent().children(".err_box"));
	        }/*,submitHandler: function(form){
	        	//alert('ok');return false;
             	//提交表单
             	//alert('ok!');
            	//$("#demoForm").submit();
             	
             }*/
        });        
		
    });
</script>
 



</body>
</html>