<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
	<script>
		document.domain="winpow.com";
	</script>
</head>
<body>
<!-- 新版登录界面 -->
<!-- <div class="wk">
	<div class="bl new_logint">
		<a href="/"><img src="/image/index/logo.jpg" alt="logo" class="fl"></a>
		<span class="fl">欢迎登录</span>
	</div>
</div> -->
<div id="mask" class="wk new_loginmwk" style="background:rgba(0,0,0,0);position:fixed;width:100%;height:100%;top:0;left:0;z-index:1000000;">
	<div class="bl new_loginm" style="background:0 0;">
		<div class="bl new_lobg fr" style="position:absolute;top:50%;left:50%;margin:-204px 0 0 -192px;background:0 0;">
			<div class="lobg_nr">
				<form action="/user/doLogin.html" method="post" id="demoForm" autocomplete="off">
					<input type="text" style="display:none;"/>
					<input type="password" style="display:none;"/>
					<input type="hidden" name="credit" value="${credit}"/>
					<p class="t ov"><span class="tlspan fl">用户登录</span>
					<div class="clear"></div></p>
					<p class="li telinp"><span class="icon"></span><input type="text" placeholder="手机号/账号" value="" id="userid" name="userid" autocomplete="off"/><span class="err_box"></span></p>
					<p class="li telinp passinp"><span class="icon"></span><input class="huise" type="password" placeholder="请输入密码" value="" id="password" name="password" autocomplete="off"/><span class="err_box"></span></p>
					<p class="li yzminp"><span class="icon fl"></span><input class="fl" type="text" placeholder="请输入验证码" name="imagecode" id="imagecode" autocomplete="off"/><img id="JD_Verification1" ver_colorofnoisepoint="#888888" src="/ValidateImage.do" onclick="reloadImg2()" alt=""><span class="err_box"></span></p>
					<p class="li sbinp"><input class="submit" type="submit" value="登&nbsp;&nbsp;录"/></p>
					<p class="li telinp forgetinp"><span style="color:#f58357;margin-right:5px;"><s:property value="#session.errorMsg"/></span><span><a href="/user/forget.html" target="_blank" class="loginClose">忘记密码</a>&nbsp;|&nbsp;</span><span><a href="/user/register.html?credit=${credit}" target="_blank" class="loginClose">免费注册</a></span></p>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- <div class="wk new_foot">
	<div class="bl">
		<span class="">版权所有 : 成都高投盈创动力投资发展有限公司 </span>
		<span class="b">蜀ICP备18022655号-1 免责声明  </span>
		<span class="b tel">&nbsp;&nbsp;&nbsp;&nbsp;联系电话：028-8315-9999</span>
	</div>
</div> -->

<script>


	//刷新验证码
	function reloadImg2() {
        document.getElementById("JD_Verification1").src = "/ValidateImage.do?" + "radom="
                + Math.random();
        $("#imagecode").focus();
    }
    
    
    $(document).ready(function () {
    reloadImg2();
	    //触发 reset 事件
		//$("#reset").trigger("click");
		//$("#reset").click();
	
		$("#demoForm").validate({
           
            debug: false,
            rules: {
            	userid: {
           			required: true
           		},
           		password: {
           			required: true
           		},
                imagecode: {
                    required: true,
                    remote: {
                        url: '/usercenter/ajaxcode.html',
                        type: "post",
                        dataType:"text",
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
                }
            },
            messages: {
            	userid: {
           			required: '请输入手机号/账号'
           		},
           		password: {
           			required: '请输入登陆密码'
           		},
                imagecode: {
                    required: "请输入图形验证码！",
                    remote: "图形验证码输入错误！"
                }
            },
            errorElement: "font",
	        errorPlacement: function (error, element) {
	            error.appendTo(element.parent().children(".err_box"));
	        },submitHandler: function(form){
				$('#logininput', window.parent.document).val("true");
				$('#logininput', window.parent.document).trigger("click");
				$('#loginwindow', window.parent.document).hide();
				form.submit();   //提交表单
            }
           
        });
    });
</script>
</body>
</html>