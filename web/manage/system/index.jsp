<%@page import="com.winpow.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<script src="/js/jquery.validate-1.13.1.js"></script>
<script type="text/javascript">
//刷新验证码
	function reloadImg2() {
        document.getElementById("JD_Verification1").src = "/ValidateImage.do?" + "radom="
                + Math.random();
        $("#imagecode").focus();
    }
	/*//刷新验证码
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
						dataType:"json",
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
    
	$(function() {
		$("#username").focus();

		if (top.location != self.location) {
			top.location = self.location;
		}
	});
	 $(function(){

		  	//让首页的右边侧边栏一直显示
		      $("#totop").fadeIn();

	 })*/
</script>
</head>
<body>
<!--<div class="top">-->
	<!--<span class="logo">盈创动力后台管理系统</span>-->
<!--</div>-->
	<div class="container" >
		<div class="row loginbox">
				<h3 class="title">盈创动力后台管理系统</h3>
			<div class="span5">
				<div>
					<img  class="img-circle" alt="" src="<%=request.getContextPath() %>/resource/images/logo.jpg" style="width: 270px;">
				</div>
			</div>
			
			<div class="span7">
<!-- 				<hr width="1px" size="100" style="height: 400px;float: left;"> -->
<!-- <HR align=center width=12 height="5"  color=#ccc style="height: 500px;float: left;display:block;"> -->
				<table class="table " style="width: 95%;">
					<caption>
						<%
						Object loginErrorObj = request.getSession().getAttribute(ManageContainer.loginError);
						if(loginErrorObj!=null){
						%>
						<div class="alert alert-warning alert-dismissable" style="margin-bottom:0px;">
						  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<%-- 			  <strong>登录失败!</strong> 账号或密码错误！ --%>
							<%=loginErrorObj.toString() %>
						</div>
						<%}
						request.getSession().setAttribute("loginError",null);
						%>
					</caption>
					<!--<tr>-->
						<!--<td colspan="2"-->
							<!--style="background-color: #dff0d8; text-align: center;"><strong>&nbsp;盈创动力科技金融服务平台-后台管理</strong>-->
						<!--</td>-->
					<!--</tr>-->
					<tr>
						<td colspan="2">
							<s:form action="user!login.action" theme="simple" namespace="/manage"
								cssClass="form-horizontal" id="demoForm">
								<div class="control-group">
									<label class="control-label" for="inputEmail">帐&nbsp;&nbsp;&nbsp;&nbsp;号</label>
									<div class="controls">
										<div class="input-prepend">
											<!--<span class="add-on"><i class="icon-user"></i></span>-->
											<s:textfield name="e.username" cssClass="len" id="username" />
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="inputPassword">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
									<div class="controls">
										<div class="input-prepend">
											<!--<span class="add-on"><i class="icon-lock"></i></span>-->
											<s:password name="e.password" cssClass="len" value="111111" label="密码" />
										</div>
									</div>
								</div>

					            
					            <div class="control-group">
									<label class="control-label" for="inputPassword">验证码</label>
									<div class="controls" style="float:left;width: 160px;margin:0;">
										<div class="input-prepend">
											<!--<span class="add-on"><i class="icon-lock"></i></span>-->
											<input class="inputbor" name="imagecode" id="imagecode" type="text" style="width: 146px;">
										</div>
									</div>
									<div class="yzmwk" style="float:left;padding-left:5px;margin-top:9px;">
										<img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" src="/ValidateImage.do" onClick="reloadImg2()"
											 alt="" style="cursor:pointer;width:100px;height:26px;"/><br/>
										<!--<span class="ts">请输入验证码：</span>-->
										<span class="errorts"></span>
									</div>
								</div>
					           
            
								<div class="control-group">
									<div class="controls">
										<div class="input-prepend">
											<!--<span class="add-on"><i class="icon-hand-right"></i></span>-->
										<s:submit value="登录" name="subbtn" cssClass="btn"/>
										<!--<button class="btn">登录</button>-->
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
	<%@ include file="../browsercheck2.jsp"%>

	<style>
		.top{width: 100%;height: 50px;background:#374754; color: #fff;padding-left:20px;box-sizing: border-box;}
		.logo{float:left; line-height: 50px;font-size: 16px;padding-left:90px;
			background: url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/logo.png") no-repeat 0 center;
		}
		.input-prepend{width: 100%;}
		.input-prepend>input{border-radius: 0;width:250px;padding:7px;border-color: #e6eae9;}
		.input-prepend>input:-webkit-autofill {
			-webkit-box-shadow: 0 0 0px 1000px white inset !important;
		}
		body{padding:0;margin:0;background: #e5e9e8 url("<%=request.getContextPath()%>/resource/images/loginbg.png") no-repeat center center;background-size: 100% 100%;}
     	.loginbox{background: #fff;position: fixed;top:50%;left:50%;margin:-170px 0 0 -375px; box-shadow: 0 0 20px rgba(0,0,0,0.2);border-radius: 3px 3px 0 0;}
		.table th, .table td{border-top:0;}
		.span7{width: 410px;margin:0;margin-left:40px;}
		.span5{text-align: center;margin:0;margin-top: 55px;width: 300px;}
		.form-horizontal .control-label{width: 65px; padding-top: 8px;text-align: left;}
		.form-horizontal .controls{margin-left:65px;}
		.form-horizontal .control-group{margin-bottom: 25px;}
		.btn{width: 265px;border-radius: 0 !important;background:#374754;color:#fff; padding: 8px;}
		.btn:hover{background: #283742;color:#fff;}
		.title{text-align:center;color: #fff;padding: 2px 20px;font-weight: normal;font-size: 20px;margin: 0;margin-bottom: 40px;border-radius: 3px 3px 0 0;
			background: url("<%=request.getContextPath()%>/resource/images/logintitile.png") repeat center center;
		}
     .errorts {color: #f00;}
     .ts{color: #666;}
	</style>
<script>
	$(function () {
		$('body').height($(document).height())
    })
</script>
</body>
</html>
