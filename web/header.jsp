<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>
<%@page import="com.winpow.core.system.bean.Config"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<div id="sessionsubcode" style="display: none;">${sessionsubcode}</div>
<c:choose>  
	<c:when test="${sessionsubstation != '成都市' && sessionsubstation != '高新区' && sessionsubstation != '' && sessionsubstation != null }">
		<!--分站-->
		<div class="headertop subheadertop">
			<div class="bl">
				<div class="fl left">

			<span class="substation"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/fenzhan/addr.png" alt="">
					${sessionsubstation}
				<i></i>
				<div class="subList">

					<h2> 成都市</h2>
					<ul>
						<s:iterator value="#application.areasubstmap" var="area">
						<s:if test="#area.key.startsWith('510') && #area.key!='510100'">
							<li>
								<a id='sub${area.key}' href="/substation/index/${area.key}.html"> ${area.value}
									<s:if test="#area.key=='510117'">
											<!--郫都区-->综合金融服务平台
									</s:if>
									<s:else>
											科技金融服务平台
									</s:else>
								</a>
							</li>
						</s:if>
						</s:iterator>
					</ul>

					<h2>四川省</h2>
					<ul>
						<s:iterator value="#application.areasubstmap" var="area">
						<s:if test="#area.key.startsWith('51') && !#area.key.startsWith('510')">
							<li><a href="/substation/index/${area.key}.html"> ${area.value} 科技金融服务平台</a></li>
						</s:if>
						</s:iterator>
					</ul>
					<h2>其它地区</h2>
					<ul>
						<s:iterator value="#application.areasubstmap" var="area">
						<s:if test="!#area.key.startsWith('51') && #area.key!='320500'">
							<li><a href="/substation/index/${area.key}.html"> ${area.value} 科技金融服务平台</a></li>
						</s:if>
						</s:iterator>
					</ul>
				</div>
			</span>
					<a href="/substation/index/510100.html" class="backToIndex" id="backToIndex">回到主站</a>

				</div>

				<div class="fr right">
					<div class="fl se"><input type="text" class="inp" id="query"  onkeypress="if (event.keyCode == 13)  topdoquery()"
											  value="" onfocus="if(value=='请输入关键字...'){value=''}" onblur="if(value==''){value='请输入关键字...'}" />
						<a href="javascript:topdoquery()"></a>
					</div>
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
					<div class="fl help"><a href="/user/help/1.jsp" target="_blank" class="bor">帮助</a></div>
					<div class="fl addrName" id="headAddrName">盈创动力</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="headernav">
			<div class="bl">
				<div class="fl logo">
					<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/fenzhan/logo/${sessionsubcode}.png" alt="logo">
				&nbsp;
				</div>
				<div class="fr inav" style="margin-right: -6px;">
					<div class="index_cj_nav">
						<ul class="fr">
							<li class="yijinav1"><a class="firsta" href="/substation/index/${sessionsubcode}.html" class="yjbgc navhover" id="index">首页</a></li>
							<li class="yijinav2"><a class="firsta"  href="/substation/news/${sessionsubcode}.html" id="news"> 新闻</a></li>
							<li class="yijinav3"><a class="firsta"  href="/substation/product/${sessionsubcode}.html" id="product">债权融资</a></li>
							<li class="yijinav4"><a class="firsta"  href="/substation/guquan/${sessionsubcode}.html" id="stock">股权融资</a></li>
							<li class="yijinav5"><a class="firsta"  href="/substation/incre/${sessionsubcode}.html" id="incre">中介服务<img src="/icon/hot-fire.gif" style="position: absolute;margin: 10px 0 0 -17px;"/></a></li>
							<li class="yijinav6"><a class="firsta" href="/substation/activity/${sessionsubcode}.html" id="college">培训活动</a></li>
							<li class="yijinav8"><a class="firsta" href="/substation/files/${sessionsubcode}.html" id="files">资料下载</a></li>
							<li class="yijinav10"><a class="firsta" href="/substation/aboutus/${sessionsubcode}.html" id="aboutus">关于我们</a></li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</c:when>  
	<c:otherwise>
		<!--总站-->
		<div class="headertop subheadertop">
			<div class="bl">
				<!--<i class="rect rect-lt"></i><i class="rect rect-rt"></i>-->

				<div class="fl left">

			<span class="substation"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/fenzhan/addr.png" alt="">
				  成都市
				<i></i>
				<div class="subList">
					<h2> 成都市</h2>
					<ul>
						<s:iterator value="#application.areasubstmap" var="area">
						<s:if test="#area.key.startsWith('510') && #area.key!='510100'">
							<li><a id='sub${area.key}' href="/substation/index/${area.key}.html"> ${area.value}
								<s:if test="#area.key=='510117'">
										综合金融服务平台
								</s:if>
								<s:else>
										科技金融服务平台
								</s:else>
							</a></li>
						</s:if>
						</s:iterator>
					</ul>

					<h2>四川省</h2>
					<ul>
						<s:iterator value="#application.areasubstmap" var="area">
						<s:if test="#area.key.startsWith('51') && !#area.key.startsWith('510')">
							<li><a href="/substation/index/${area.key}.html"> ${area.value} 科技金融服务平台</a></li>
						</s:if>
						</s:iterator>
					</ul>
					<h2>其它地区</h2>
					<ul>
						<s:iterator value="#application.areasubstmap" var="area">
						<s:if test="!#area.key.startsWith('51') && #area.key!='320500'">
							<li><a href="/substation/index/${area.key}.html"> ${area.value} 科技金融服务平台</a></li>
						</s:if>
						</s:iterator>
					</ul>
				</div>
			</span>
				</div>
				<div class="fr right">
					<div class="fl se"><input type="text" class="inp" id="query"  onkeypress="if (event.keyCode == 13)  topdoquery()"
											  value="" onfocus="if(value=='请输入关键字...'){value=''}" onblur="if(value==''){value='请输入关键字...'}" />
						<a href="javascript:topdoquery()"></a>
					</div>
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
					<div class="fl help"><a href="/help/1.html" target="_blank" class="bor">帮助中心</a></div>
					<div class="fl phone">028-8315-9999</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="headernav">
			<div class="bl">
				<div class="fl logo">
					<img src="/image/index/logo.jpg" alt="logo">
					&nbsp;
				</div>
				<div class="fr inav">
					<div class="index_cj_nav">
						<ul>
							<li class="yijinav1"><a class="firsta" href="/" class="yjbgc navhover" id="index">首页</a></li>
							<li class="yijinav2"><a class="firsta"  href="/news/toList.html" id="news">盈创资讯</a></li>
							<li class="yijinav3"><a class="firsta"  href="/product/toList.html" id="product">债权融资</a></li>
							<li class="yijinav4"><a class="firsta"  href="/stock/toList.html" id="stock">股权融资</a></li>
							<li class="yijinav5"><a class="firsta"  href="/incre/toList.html" id="incre">中介服务<!-- <img src="/icon/hot-fire.gif" style="position: absolute;margin: 10px 0 0 -17px;"/> --></a></li>
							<li class="yijinav6"><a class="firsta" href="/college/colleges.html" id="college">盈创活动</a></li>
							<li class="yijinav7"><a class="firsta" href="/data/toGuquanList.html" id="data">盈创数据</a></li>
							<li class="yijinav8"><a class="firsta" href="/files/toList.html" id="files">资料下载</a></li>
							<li class="yijinav9"><a class="firsta" href="/interestapp/taotallist.html" id="interestapp">政策申报<!-- <img src="/icon/hot-fire.gif" style="position: absolute;margin: 10px 0 0 -17px;"/> --></a></li>
							<li class="yijinav8"><a class="firsta" href="/interestapp/sjbs.html" id="sjbs">数据报送</a></li>
							<li><a href="https://credit.winpow.com/" target="_blank">盈创征信</a></li>
							<li class="yijinav10"><a class="firsta" href="/aboutus/about.html" id="aboutus">关于我们</a></li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</c:otherwise>  
</c:choose> 

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

<script type="text/javascript">
	if (location.href.indexOf("winpow.com") == -1
	    || location.href.indexOf("https://www.winpow.com/") != -1
	    || location.href.indexOf("https://apps.winpow.com/") != -1
	    || location.href.indexOf("http://jykjjr.winpow.com/") != -1
	) {
	    //$("#sub510185").attr("href", "http://www.jykjjr.com/");				//简阳
	    $("#sub510185").attr("href", "http://jykjjr.winpow.com/");				//简阳
	    $("#sub510113").attr("href", "http://www.qbjkjjr.com/");				//青白江
	    $("#sub510117").attr("href", "http://www.pdzhjr.com/");					//郫都区
	    $("#sub510100, #sub510199,#backToIndex").attr("href", "https://www.winpow.com/");	//成都高新
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


