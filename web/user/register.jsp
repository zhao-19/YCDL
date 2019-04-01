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

    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/lr2.css">
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css">
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.0.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<style>
		input:-webkit-autofill {-webkit-box-shadow: 0 0 0px 1000px white inset;}
		.new_rem .lobg_nr .leix .leix4 .ico{background:url("../image/lr/linputbg1.png") no-repeat 0 -42px;    margin-top: 14px !important;}
		.new_rem .lobg_nr .leix .leix4 .icoh{background:url("../image/lr/linputbg1.png") no-repeat 0 -80px;}
		.new_rem .lobg_nr .leix .leix3{margin-left:0px;}
	</style>
</head>
<body>
<!-- 新版登录界面 -->
<div class="wk">
	<div class="bl new_logint">
		<a href="/"><img src="/image/index/logo.jpg" alt="logo" class="fl"></a>
		<span class="fl">欢迎注册</span>
		<span class="fr">已有账号/请<a href="/user/login.html">登录</a></span>
	</div>
</div>
<div class="wk new_loginmwk">
	<div class="new_remt"></div>
	<div class="bl new_loginm new_rem">
		<div class="bl new_lobg">
			<div class="lobg_nr">
				<form action="/user/doRegister.html" method="post" name="demoForm" id="demoForm"  autocomplete="off">
					<input type="text" style="display:none;"/>
					<input type="password" style="display:none;"/>					
					<div class="lis lis1"><span class="fl ti">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span><p class="fl li telinp"><span class="icon"></span><input type="text" placeholder="手机号/账号" value="<s:property value="userid"/>" id="userid" name="userid" autocomplete="off"/><span class="err_box"></span></p></div>
					<div class="lis"><span class="fl ti">设置密码</span><p class="fl li telinp passinp"><span class="icon" style="margin-top:10px;"></span><input class="huise" type="password" placeholder="请输入密码" value="<s:property value="password"/>" id="password" name="password" autocomplete="off"/><span class="err_box"></span></p></div>
					<div class="lis register" style="display: none;"><span class="fl ti">客户经理</span>
						<div class="fl selectblock">
			                <%-- <c:forEach items="${accountManage}" var="am" varStatus="index">
				                <label lang="custmanage"><span class="bg"></span><span class="nr" lang="${am.username}">${am.nickname}</span></label>
			                </c:forEach> --%>		                
		                
				            <label lang="custmanage"><span class="bg"></span><span class="nr" lang="">随机分配</span></label>
		                </div>
		                <select name="e.custmanage" class="none" id="custmanage">
		                    <option value=""></option>
		                    <c:forEach items="${accountManage}" var="am" varStatus="index">
		                        <option value="${am.username}">${am.nickname}</option>
		                    </c:forEach>                    
	                        
	                    	<option value="" selected="selected">随机分配</option>
		                </select>
		                <span class="err_box"></span>
		                <input type="hidden" id="custmanagehidden" value="0"/>
					
					</div>
					<%-- <div class="lis register" style="overflow: visible;"><span class="fl ti">客户类型</span>
						<div class="fl selectblock selectblock2">
							<div class="leix">
								<div class="fl leixc leix1" lang="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001"><em><i></i>包含有限责任公司、股份有限公司等</em><span class="ico"></span><span class="w">企业客户</span></div>
								<div class="fl leixc leix2" lang="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002"><em><i></i>不适合其他3类的用户<br>（个人客户暂不能申报扶持政策）</em><span class="ico"></span><span class="w">个人客户</span></div>
								<br/><br/><br/>
								<div class="fl leixc leix3" lang="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003"><em><i></i>包含股权类投资机构</em><span class="ico"></span><span class="w">投资机构</span></div>
								<div class="fl leixc leix4" lang="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008"><em><i></i>包含银行、证券、担保、小贷、中介等</em><span class="ico"></span><span class="w">其它机构</span></div>
								<div class="clear"></div>
								<input type="hidden" name="usertype" id="usertype">						
								<span class="err_box"></span>
								<input type="hidden" id="usertypehidden" value="0"/>
								
								<style>
									.leixc{position:relative;}
									.leixc em{display:none;font-style:normal;color:#fff;position:absolute;top:64px;z-index:100;left:50%;    width: 160%;border-radius:3px;padding:5px 7px;line-height: 18px;font-size: 13px;transform:translateX(-50%);background:skyblue;}
									.leixc:hover em{display:block;}
									.leixc em i{position:absolute;top:-5px;left:50%;margin-left:-8px;width:16px;height:5px;background:url(/icon/res-tip-sj.png) no-repeat;}
									.leix3 em{width:120px;}
									.leix4 em{width:221px;}
									.leix2 em{width:195px; text-align: center;}
								</style>
							</div>
						</div>
					</div> --%>
					<div class="lis"><span class="fl ti yzt">验&nbsp;证&nbsp;码</span><p class="fl li yzminp"><span class="icon fl"></span><input class="fl" type="text" placeholder="请输入验证码" name="imagecode" id="imagecode" autocomplete="off"/><img id="JD_Verification1" ver_colorofnoisepoint="#888888" src="/ValidateImage.do" onclick="reloadImg2()" alt=""><span class="err_box"></span></p></div>
					<div class="lis"><span class="fl ti">手机号码</span><p class="fl li telinp phone"><span class="icon"></span><input type="text" placeholder="手机号" name="cellphone" id="cellphone" value="<s:property value="cellphone"/>"/><span class="err_box"></span></p></div>
					<div class="lis"><span class="fl ti yzt">短信验证码</span><p class="fl li yzminp dxyzm"><span class="icon fl"></span><input class="fl" type="text" placeholder="请输入短信验证码" name="vcode" id="vcode" autocomplete="off"/><input id="btnSendCode" disabled="disabled" class="fsyycode get" type="button" value="发送短信验证码" onclick="sendMessage()"/><span class="err_box"></span></p></div>
					<div class="lis"><span style="width:150px;float:left;">&nbsp;</span><p class="fl li sbinp"><input class="submit" type="submit" value="立即注册" /></p></div>
				</form>
			</div>
		</div>
	</div>
	<div class="new_remf"></div>
</div>
<div class="wk new_foot">
	<div class="bl">
		<span class="">版权所有 : 成都高投盈创动力投资发展有限公司 </span>
		<span class="b">蜀ICP备18022655号-1 免责声明  </span>
		<span class="b tel">&nbsp;&nbsp;&nbsp;&nbsp;联系电话：028-8315-9999</span>
	</div>
</div>



<script type="text/javascript">
var NV = {};
var UA = navigator.userAgent.toLowerCase();
try
{
	NV.name=document.all?'ie':
	(UA.indexOf("firefox")>0)?'firefox':
	(UA.indexOf("chrome")>0)?'chrome':
	window.opera?'opera':"C:/Users/50750/Desktop/browsercheck.jsp"
	window.openDatabase?'safari':
	'unkonw';
}catch(e){};
if((NV.name)=='chrome'){
	$(".new_remt").css("margin-left","1px");
	$(".new_remt").css("margin-left","1px");
}
	//选择客户经理
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
       			$("#"+mubiaoselect).next('.err_box').hide();
       			$("#"+mubiaoselect).next().next("input").attr('value',1);
        	}
        });
    });
    //选择客户类型
    $('.leix .leixc').click(function(){
    	$(this).addClass('leixchover').siblings().removeClass('leixchover');
    	var nowindex = $(this).index();
    	$('.leix .leixc .ico').removeClass("icoh");
    	$(this).children(".ico").addClass("icoh");
    	
    	$("#usertype").val($(this).attr("lang"));
    	$("#usertype").next('.err_box').hide();
       	$("#usertype").next().next("input").attr('value',1);
    })
    
    




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
                custmanage:{
                	required: true
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
                custmanage:{
                	required: '请选择客户经理'
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
	            error.appendTo(element.parent().children(".err_box"));
	        },submitHandler: function(form){
	        	//alert('ok');return false;
             	//提交表单
             	/* var usertypehidden = $('#usertypehidden').val();
             	if(usertypehidden==0){
             		var usertypeerror = $('<font class="error">请选择客户类型</font>');
            		usertypeerror.appendTo($("#usertype").next('.err_box').show());
            		$('#usertypehidden').val(2)
             	} */
             	
             	var custmanagehidden = $('#custmanagehidden').val();
             	if(custmanagehidden==0){
             		var custmanageerror = $('<font class="error">请选择客户经理</font>');
            		custmanageerror.appendTo($("#custmanage").next('.err_box').show());
            		$('#custmanagehidden').val(2);
             	}
             	
             
             	/* var usertypehidden2 = $('#usertypehidden').val(); */
             	var custmanagehidden2 = $('#custmanagehidden').val();
             	
             	//alert(usertypehidden2+"*"+custmanagehidden2);return false;
             	if(custmanagehidden2==1){
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
									window.location="/usercenter/userindex.html";
								},3000);
					    	}else{
					    		$('.registertishi').html(data.msg).show();
					    		
					    	}
					        // your code
					    }
					});
             	}else{
             		//客户类型和客户经理没对
             		return false;
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
    $(".nr").click();
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