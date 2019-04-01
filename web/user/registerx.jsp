<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>

    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/lr.css">
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css">
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.0.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
</head>
<body>
<style>
#ldksq #ldksq_c {
    background-color: #fff;
    width: 468px;
    min-height: 146px;
}
.registerokokok{padding-top:54px;font-size: 18px;
    padding-left: 17px;}
</style>

<div class="register">
    <div class="logo"></div>
    <div class="input">


        <form action="/user/doRegister.html" method="post" name="demoForm" id="demoForm">
            <div class="inputtext">账号：<input class="inputbor" value="<s:property value="userid"/>" name="userid"
                                             id="userid" type="text">
                <div class="tipinfo"></div>
                <div id="zhsm" style="clear: both;padding-top: 5px;color: #D5B9B9;">账号只能是字母、数字、下划线、@</div>
            </div>


            <div class="inputtext">密码：<input class="inputbor" name="password" id="password"
                                             value="<s:property value="password"/>" type="text">
                <div class="tipinfo"></div>
            </div>


            <div class="inputtext">客户类型：
                
                
                <div class="selectblock">
	                <label lang="usertype"><span class="bg"></span><span class="nr" lang="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001">企业客户</span></label>
					<label lang="usertype"><span class="bg"></span><span class="nr" lang="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002">个人客户</span></label>
					<label lang="usertype"><span class="bg"></span><span class="nr" lang="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003">机构客户</span></label>
                </div>
                <select name="usertype" id="usertype" class="none">
                    <option value=""></option>
                    <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001">企业客户</option>
                    <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002">个人客户</option>
                    <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003">机构客户</option>
                </select>
                <div class="tipinfo selecttipinfo"></div>
                <input type="hidden" id="usertypehidden" value="0"/>
            </div>

            <div class="inputtext">客户经理：
                
                <div class="selectblock">
	                <c:forEach items="${accountManage}" var="am" varStatus="index">
		                <label lang="custmanage"><span class="bg"></span><span class="nr" lang="${am.username}">${am.nickname}</span></label>
	                </c:forEach>
	                <label lang="custmanage"><span class="bg"></span><span class="nr" lang="">随机分配</span></label>
                </div>
                <select name="e.custmanage" class="none" id="custmanage">
                    <option value=""></option>
                    <c:forEach items="${accountManage}" var="am" varStatus="index">
                        <option value="${am.username}">${am.nickname}</option>
                    </c:forEach>
                    <option value="">随机分配</option>
                </select>                
                <div class="tipinfo selecttipinfo"></div>
                <input type="hidden" id="custmanagehidden" value="0"/>
            </div>

            <div class="inputtext">手机号码：<input class="inputbor" name="cellphone" value="<s:property value="cellphone"/>"
                                               id="cellphone" type="text">
                <div class="tipinfo"></div>
            </div>

            <img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" src="/ValidateImage.do" onClick="reloadImg2()"
                 alt="" style="cursor:pointer;width:100px;height:26px;"/>

            <div class="inputtext">请输入上面图形中的4个字符：
                <input class="inputbor" name="imagecode" id="imagecode" type="text">
                <div class="tipinfo"></div>
            </div>

            <div class="inputtext code">短信验证码：<br/>
                <div>
                    <input class="inputcode" name="vcode" id="vcode" type="text">
                    <div class="get fr"><input id="btnSendCode" disabled="disabled" class="fsyycode" type="button"
                                               value="发送短信验证码" onclick="sendMessage()"/></div>
                    <div class="tipinfo"></div>
                </div>
            </div>

            <input type="submit" class="submit" values="提&nbsp;交" value="提&nbsp;交">
            <div class="registertishi" style="padding: 5px 0;color: #fff;display:none;line-height: 18px;">正在注册，请稍后...</div>
            <div style="margin-bottom:50px;"></div>

        </form>

    </div>


</div>


<div class="footer">
    <li>版权所有 : 成都高投盈创动力投资发展有限公司</li>
    <li>蜀ICP备18022655号-1 免责声明 电话：028-83159999</li>
</div>

<script type="text/javascript">
	var khjl;
	$('.selectblock label').click(function(){
        $(this).addClass('labelhover').siblings().removeClass('labelhover');
        
        $(this).parent().find('.bg').removeClass('bghover');
        $(this).children('.bg').addClass('bghover');
        
        var dangqianlang = $(this).children('.nr').attr('lang');
        var mubiaoselect = $(this).attr('lang');
        $("#"+mubiaoselect+" option").each(function(){
        	if($(this).attr('value') == dangqianlang){
        		khjl = $(this).html();
       			$("#"+mubiaoselect+" option[value="+$(this).attr('value')+"]").attr('selected','selected');
       			$("#"+mubiaoselect).next('.tipinfo').hide();
       			$("#"+mubiaoselect).next().next("input").attr('value',1);
        	}
        });
    });




    function reloadImg2() {
        document.getElementById("JD_Verification1").src = "/ValidateImage.do?" + "radom="
                + Math.random();
        $("#imagecode").focus();
    }
    var errorMsg = $("#diverror").val();
    if (errorMsg) {
        if (errorMsg != '') {
            document.getElementById("err").innerHTML(errorMsg);
        }
    }

</script>
<script>
    $(document).ready(function () {
        // 联系电话号码验证
        jQuery.validator.addMethod("isMobile", function (value, element) {
            var length = value.length;
            var mobile = /^((0\d{2,3}-\d{7,8})|(1[3456789]\d{9}))$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写您的手机号码1");

        // 账号验证
        jQuery.validator.addMethod("isZhanghao", function (value, element) {
            var lengthx = value.length;
            var mobilex = /^[a-zA-Z0-9_@]+$/;
            //return this.optional(element) || (mobilex.test(value));
            return this.optional(element) || (mobilex.test(value));
        }, "输入的账号不符合规则");

        $("#demoForm").validate({

            rules: {
                userid: {
                    required: true,
                    minlength: 6,
                    maxlength: 16,
                    isZhanghao: true,
                    remote: {
                        url: '/usercenter/ajaxcheck.html',
                        type: "post",
                        data: {
                            str: function () {
                                return $("#userid").val();
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
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 16
                },
                cellphone: {
                    required: true,
                    minlength: 11,
                    maxlength: 11,
                    isMobile: true,
                    remote: {
                        url: '/usercenter/ajaxcheck.html',
                        type: "post",
                        data: {
                            str: function () {
                                return $("#cellphone").val();
                                //这个是取要验证的密码
                            }
                        },
                        dataFilter: function (data) {
                            //判断控制器返回的内容
                            if (data == 0) {
                                //发送短信验证码按钮外框灰色，自身cursor为非手型
                                $(".get").removeClass("nodisabled");
                                $("#btnSendCode").removeClass("cursor");
                                //发送短信验证码按钮继续禁止点击
                                $("#btnSendCode").attr("disabled", true);
                                //表示号码已经存在
                                return false;
                            } else {
                                //发送短信验证码按钮外框可点击色，自身cursor为pointer
                                $(".get").addClass("nodisabled");
                                $("#btnSendCode").addClass("cursor");
                                //发送短信验证码按钮可以点击
                                $("#btnSendCode").attr("disabled", false);
                                return true;
                            }
                        }
                    }
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
                userid: {
                    required: '请输入账号',
                    minlength: '用户名不能小于6个字符',
                    maxlength: '用户名不能超过16个字符',
                    isZhanghao: '输入的账号不符合规则',
                    remote: '该账户已被注册'
                },
                password: {
                    required: '请输入密码',
                    minlength: '密码不能小于6个字符',
                    maxlength: '密码不能超过16个字符'
                },
                cellphone: {
                    required: "请输入手机号",
                    minlength: "手机号码为11位",
                    maxlength: '手机号码为11位',
                    isMobile: "请正确填写您的手机号码",
                    remote: "该手机号已被注册"
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
            
                error.appendTo(element.parent().find(".tipinfo"));
                
            }, success: "valid"
            /* errorLabelContainer:"#err",
             wrapper:"div",
             showErrors:function(errorMap,errorList) {
             this.defaultShowErrors();
             $('#err div:hidden').remove();//删除所有隐藏的li标签
             $('#err div:eq(0)').nextAll().remove();//第一个li下所有跟随的同胞级li删除
             } */
            /*  ,
             */,
             submitHandler: function(form){
             
             	var usertypehidden = $('#usertypehidden').val();
             	if(usertypehidden==0){
             		var usertypeerror = $('<p class="error">请选择客户类型</p>');
            		usertypeerror.appendTo($("#usertype").next('.tipinfo').show());
            		$('#usertypehidden').val(2)
             	}
             	
             	var custmanagehidden = $('#custmanagehidden').val();
             	if(custmanagehidden==0){
             		var custmanageerror = $('<p class="error">请选择客户经理</p>');
            		custmanageerror.appendTo($("#custmanage").next('.tipinfo').show());
            		$('#custmanagehidden').val(2);
             	}
             	
             
             	var usertypehidden2 = $('#usertypehidden').val();
             	var custmanagehidden2 = $('#custmanagehidden').val();
             	if((usertypehidden2==1) && (custmanagehidden2==1)){
             		//$('.registertishi').show();
					//$("#demoForm").submit();
					//document.getElementById("demoForm").submit();
					$.ajax({
					    type: 'post',
					    dataType:"json",
					    url: '/user/doRegister.html',
					    data: $("#demoForm").serialize(),
					    success: function(data) {

					    	if(data.msg=='ok'){
					    		//注册成功，提示，跳转到首页
					    		$("#ldksq").show();
					    		$('.registerokokok').html("注册成功，您的客户经理是【"+khjl+"】，系统自动登录中.....").fadeIn('slow');
								
						   	 	var divName = $("#ldksq_c");
								var top = ($(window).height() - $(divName).height())/2;
						        var left = ($(window).width() - $(divName).width())/2;
						        var scrollTop = $(document).scrollTop();
						        var scrollLeft = $(document).scrollLeft();
						        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
					    		
					    		
					    		setTimeout(function(){
									window.location="/";
								},3000);
					    	}else{
					    		$('.registertishi').html(data.msg).show();
					    		
					    	}
					        // your code
					    }
					});
             	}
             	
             }
        });
        
        
        //点击贷款品种后面的修改按钮，弹出修改form表单 ，单独修改产品名称
	
	$("#ldksq_lose").click(function(){
        $("#ldksq").hide();
    });
    
    
    });
</script>

<script type="text/javascript">
    var InterValObj; //timer变量，控制时间
    var count = 60; //间隔函数，1秒执行
    var curCount;//当前剩余秒数
    function sendMessage() {
        var phone = $("#cellphone").val();
        if (/^1\d{10}$/g.test(phone)) {
        } else {
            alert("手机号码错误!");
            $("#cellphone").focus();
            return false;
        }

        curCount = count;
        //设置button效果，开始计时
        $("#btnSendCode").attr("disabled", "true");
        $("#btnSendCode").val(curCount + "秒后重新发送");
        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次

        var cellphone = $("#cellphone").val();
        //向后台发送处理数据
        $.ajax({
            type: "POST", //用POST方式传输
            dataType: "text", //数据格式:JSON
            url: '/user/sendMsgCode.html', //目标地址
            data: "e.cellphone=" + cellphone,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            success: function (msg) {
                if (msg == '0') {
                    //发送成功
                } else {
                    alert('发送失败');
                }
            }
        });
    }

    //timer处理函数
    function SetRemainTime() {
        if (curCount == 0) {
            window.clearInterval(InterValObj);//停止计时器
            $("#btnSendCode").removeAttr("disabled");//启用按钮
            $("#btnSendCode").val("重新发送验证码");
        } else {
            curCount--;
            $("#btnSendCode").val(curCount + "秒后可重新发送");
        }
    }
</script>

<!--我要参加弹出框 start-->
<div id="ldksq">
    <div id="ldksq_c">
        <div id="ldksq_lose"></div>
        <div class="registerokokok"></div>
        
    </div>
</div>
<!--我要参加弹出框 end-->
</body>
</html>