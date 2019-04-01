<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.winpow.core.system.bean.Config"%>
<%@ page import="com.winpow.core.front.SystemManager"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <s:if test="#session.sessionsubcode=='510117'">
        <!--郫都区-->
        <title>${sessionsubstation}综合金融服务平台</title>
    </s:if>
    <s:else>
        <title>${sessionsubstation}科技金融服务平台</title>
    </s:else>
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/equity.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/about.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
   	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/yjfk.js"></script>
    
    <style>
.error {
    border: none;
    background:none;
    }
    #err{color: #F67653;}
    #err2{color: #F67653;}
label.error {
   /*  border: 1px solid #F67653!important; */
    background:none;
	color: #F67653;
	padding: 0 2px;
	display:inline-block;
    }
</style>
</head>

<body>
<input type="hidden" id="flag" value='<s:property value="#request.flag"/>' />
<script type="text/javascript">
$(document).ready(function(){
	yjfk();
	var flag = $("#flag").val();
	if(flag=='0'){
		alert('验证码输入错误！');
	}
	if(flag=='1'){
		alert('问题反馈成功！');
	//	setTimeout(function(){location.reload();},1000);
	}
	
	

});
</script>
<script type="text/javascript">
function reloadImg2() {
	document.getElementById("JD_Verification1").src = "/ValidateImage.do?" + "radom="
			+ Math.random();
	$("#imagecode").focus();
}

</script>



<!-- 网站头部 -->
	<%@ include file="../../header.jsp"%>

<!-- 内容部分 -->
<div class="ycdata_bgimg" style="position: relative;">
    <h2 style="   position: absolute;top:0;left:0;line-height: 200px;text-align: center;width: 100%;color: #fff;font-size: 50px;letter-spacing: 13px;">${pcaboutus.title }</h2>
    <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/fenzhan/banner_aboutus.jpg" alt="背景图">
</div>
 <br/>
<div class="widthbox">
<div class="yj_info">
    <img src="../image/ab/yj_img.png" alt="">
    <div class="yj_form">
        <div class="fkleixing">反馈类型:</div>

        <form action="/aboutus/feedback.html" method="post" id="yjfkk" name="yjfk">
        <div class="radio">
            <input type="radio" name="e.feedtype" value="咨询" checked="checked" /><span>咨询</span>
            <input class="danxuan" type="radio" name="e.feedtype" value="建议" /><span>建议</span>
            <input class="danxuan" type="radio" name="e.feedtype" value="投诉" /><span>投诉</span>
            <input class="danxuan" type="radio" name="e.feedtype" value="其他" /><span>其他</span>
        </div>
        <div class="areatitle">请详细描述您的建议、意见、问题等：</div>
        <div class="textarea">
            <textarea name="e.feedcontent" id="input_comment" rows="10" class="input textarea" 
            onfocus="this.value=''; this.onfocus=null;" >请输入您要反馈的话...</textarea>
        </div>
        <div class="text fl">
            <div class="wenben">
                <div class="wb_text">电子邮箱：</div>
                <input name="e.email" type="text" value="请输入您常用邮箱" onfocus="if(value=='请输入您常用邮箱'){value=''}"
                onblur="if(value==''){value='请输入您常用邮箱'}">
            </div>
        </div>

        <div class="text fl">
            <div class="wenben">
                <div class="wb_text">手机号码：</div>
                <input name="e.cellphone" type="text" value="请输入您常用手机号" onfocus="if(value=='请输入您常用手机号'){value=''}"
                onblur="if(value==''){value='请输入您常用手机号'}">
            </div>
        </div>

        <div class="text fl">
            <div class="wenben">
                <div class="wb_text">验证码：</div>
                <input type="text" name="e.imgcode" value="请输入验证码" onfocus="if(value=='请输入验证码'){value=''}"
                onblur="if(value==''){value='请输入验证码'}">
            </div>
        </div>

        <div class="text yj_codes fl">
           <img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" src="/ValidateImage.do" onClick="reloadImg2()" alt="" style="cursor:pointer;width:100px;margin-top: 40px;"/>
        </div>
        
        <div class="yj_bot">
            <input type="submit" value="提&nbsp;交"/>&nbsp;&nbsp;<span id="err"></span> 
        </div>
        

        </form>
    </div>




 

</div>
</div>


 <div class="fixed" id="totop">
    <div class="home">
        <div class="fixed_img tc">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="../../image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>
<style type="text/css">
.fixed{top:auto;bottom:10%!important;}
</style>
<script>
 menu_init("aboutus");
</script>
<%@ include file="footer.jsp"%>
</body>
</html>
 