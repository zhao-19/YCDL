<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>

<div class="headertop">
	<div class="bl">
		<i class="rect rect-lt"></i><i class="rect rect-rt"></i>

		<div class="fl left">
			<span class="substation"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/fenzhan/addr.png" alt="">${sessionsubstation}
				<div class="subList">
					<h2> 成都市</h2>
					<ul>
						<s:iterator value="#application.areasubstmap" var="area">
						<s:if test="#area.key.startsWith('510')">
							<li><a href="/substation/index/${area.key}.html"> ${area.value }科技金融服务平台</a></li>
						</s:if>
						</s:iterator>
					</ul>
					<h2>四川省</h2>
					<ul>
						<s:iterator value="#application.areasubstmap" var="area">
						<s:if test="#area.key.startsWith('51') && !#area.key.startsWith('510')">
							<li><a href="/substation/index/${area.key}.html"> ${area.value }科技金融服务平台</a></li>
						</s:if>
						</s:iterator>
					</ul>
					<h2>其它地区</h2>
					<ul>
						<s:iterator value="#application.areasubstmap" var="area">
						<s:if test="!#area.key.startsWith('51')">
							<li><a href="/substation/index/${area.key}.html"> ${area.value }科技金融服务平台</a></li>
						</s:if>
						</s:iterator>
					</ul>
				</div>
			</span>
			<a href="/" class="backToIndex">回到首页</a>
		</div>
		<div class="fr right">
			<div class="fl lo">
			<%  Cust acc =(Cust)session.getAttribute(com.winpow.core.FrontContainer.USER_INFO);
				Object userheadimg = session.getAttribute("userheadimg");
				userheadimg = userheadimg == null ? "/icon/defaultHead.png" : userheadimg;
			if(acc==null){
			 out.print("<a href=\"/user/login.html\" class=\"login\">登录</a><a href=\"/user/register.html\" class=\"register bor\">注册</a>");
			 }
			else {
				out.print("<a href=\"/usercenter/userindex.html\" class=\"logined bor\"><img src='" + userheadimg + "'/><b>"+acc.getUserid()+"</b><span>个人中心</span></a><a href=\"/user/loginout.html\" class=\"register bor\">退出</a>");
			;}%>
			</div>
			<div class="fl help"><a href="/help/1.html" target="_blank" class="bor">帮助</a></div>
			<div class="fl se"><input type="text" class="inp" id="query"  onkeypress="if (event.keyCode == 13)  topdoquery()"
									  value="" onfocus="if(value=='请输入关键字...'){value=''}" onblur="if(value==''){value='请输入关键字...'}" />
				<a href="javascript:topdoquery()"></a>
			</div>
			<div class="fl phone">028-8315-9999</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<div class="headernav">
	<div class="bl">
		<div class="fl logo"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/fenzhan/logo/${subnum}.png" alt="logo"></div>
		<div class="fr inav">
			<div class="index_cj_nav">
                <ul class="fr">
                    <li class="yijinav1"><a class="firsta" href="/substation/index/${subnum}.html" class="yjbgc navhover" id="index">首页</a></li>
                    <li class="yijinav2"><a class="firsta"  href="/substation/news/${subnum}.html" id="news">盈创新闻</a></li>
                    <li class="yijinav3"><a class="firsta"  href="/substation/product/${subnum}.html" id="product">债权融资</a></li>
                    <li class="yijinav4"><a class="firsta"  href="/substation/guquan/${subnum}.html" id="stock">股权融资</a></li>
                    <li class="yijinav5"><a class="firsta"  href="/substation/incre/${subnum}.html" id="incre">中介服务<img src="/icon/hot-fire.gif" style="position: absolute;margin: -10px 0 0 -17px;"/></a></li>
                    <li class="yijinav6"><a class="firsta" href="/substation/activity/${subnum}.html" id="college">培训活动</a></li>
                    <li class="yijinav8"><a class="firsta" href="/substation/files/${subnum}.html" id="files">资料下载</a></li>
                    <li class="yijinav10"><a class="firsta" href="/substation/aboutus/${subnum}.html" id="aboutus">关于我们</a></li>
                </ul>
            </div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<script>

 $(document).ready(function(){
    $('#subsite').hover(function(){
        var subnav = $(this).children("#subuls")
        if(subnav.is(':animated')){
            subnav.stop(true,true);
        }
        subnav.slideToggle("1000")
    })
});
function topdoquery(){
    var query = $('#query').val();
 	if(query==''||query=='请输入关键字...') {

	}else if(query=='中介服务优惠'){
        var url = '/incre/toacList.html';
        window.location = url;
        return ;
	}else {
		var url = '/news/toList.html?t=q&q='+query;
 		window.location = url;
		return ;
	}
 }
</script>


<!--ajax加载提示提示框-->
<div class="ajaxloading"></div>
<script type="text/javascript">
    function ggts(val){
        $(".ggts").html(val).fadeIn().delay(1500).fadeOut();//显示，停留，隐藏
    }
    //公共提示二,第二种js样式
    function ggts2(val){
        $("#ggts2").html(val).fadeIn().delay(1500).fadeOut();//显示，停留，隐藏
    }
    function ajaxloading(val){
        $(".ajaxloading").html(val).fadeIn().delay(1500).fadeOut();//显示，停留，隐藏
    }

</script>


