<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/lr.css">
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.0.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate-1.13.1.js"></script>
</head>
<body>

<div class="login">
	<div class="logo"></div>
	<div class="input">


    	<form action="/user/doLogin.html" method="post" id="demoForm" style="display:inline;">
    	
    		<input type="text" value="手机号/账号" id="userid" name="userid" onfocus="if(value=='手机号/账号'){value=''}" onblur="if(value==''){value='手机号/账号'}"/><br/>
    		<input type="password" value="登录密码" id="password" name="password"   onfocus="if(value=='登录密码'){value=''}" onblur="if(value==''){value='登录密码'}"><br/>
            
            <div class="yzmwk">
	            <img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" src="/ValidateImage.do" onClick="reloadImg2()"
	                 alt="" style="cursor:pointer;width:100px;height:26px;"/><br/>
	            <span class="ts">请输入验证码：</span><span class="errorts"></span>
            </div>

            <div class="inputtext">
                <input class="inputbor" name="imagecode" id="imagecode" type="text">
                <div class="tipinfo"></div>
            </div>
    		<input class="submit" type="submit" value="登   录">
    	
    		<div class="type fr">
    			<li><span style="color:#FAFFBD;margin-right:5px;"><s:property value="#session.errorMsg"/></span><a href="/user/forget.html">忘记密码</a>&nbsp;|&nbsp;<a href="/user/register.html">免费注册</a></li>
    		</div>
    		
		         
			
 
        </form>



	</div>
 
</div>
	<div class="footer">
		<li>版权所有 : 成都高投盈创动力投资发展有限公司</li>
		<li>蜀ICP备18022655号-1  免责声明  电话：028-83159999</li>
	</div>



<script>
	//刷新验证码
	function reloadImg2() {
        document.getElementById("JD_Verification1").src = "/ValidateImage.do?" + "radom="
                + Math.random();
        $("#imagecode").focus();
    }
    
    
    $(document).ready(function () {
		$("#demoForm").validate({
           
            debug: false,
            rules: {
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
                imagecode: {
                    required: "请输入图形验证码！",
                    remote: "图形验证码输入错误！"
                }
            },
            groups:{
                login:"userid password"
            },
            errorElement: "font",
            errorPlacement: function (error, element) {
            
                error.appendTo($(".errorts"));
                
            },submitHandler: function(form){
				form.submit();   //提交表单   
            }
           
        });
    });
</script>
</body>
</html>