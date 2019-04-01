<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html>
<html>
<head >
	<title>盈创动力</title>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
</head>
<body>
<!-- 网站头部 -->
<%@ include file="../header.jsp"%>
<!--廉洁申报弹窗开始 与首页app上线相同代码-->
<style>
	a#poperwm{display: none !important;}
</style>
<div class="usercenterPop">
	<div id="popbanner">
	</div>
	<div id="popbannerimg">
		<span id="apppopclose" class="apppopclose">&times;</span>
		<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/usercenter/warning.png" alt="">
		<span id="waittime" class="apppopclose"><i>2</i>秒后自动关闭</span>
	</div>
	<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/usercenter/warningphone.png" alt="" id="poperwm">
</div>
<!--廉洁提示弹窗结束-->
<script>
    $().ready(function(){
        var wait,timer;
        time();
        $('.apppopclose').click(function(){
            wait=0;
            $('#popbanner').fadeOut();
            $('#popbannerimg').fadeOut();
            $('img#poperwm').css('animation','erwm 0.5s').show();
        })
        $('img#poperwm').click(function(){
            wait=0;
            $('img#poperwm').css('animation','none').hide();
            $('#popbanner').fadeIn()
            $('#popbannerimg').fadeIn();
            $('#waittime>i').text("2");
            time();
        })
    })

    function time(){
        wait=2;
        timeOut();
        function timeOut(){
            if(wait==0){
                $('#popbanner').fadeOut();
                $('#popbannerimg').fadeOut();
                $('img#poperwm').css('animation','erwm 0.5s').show();
            }else{
                timer=setTimeout(function(){
                    wait--;
                    if(wait<0){wait=0;}
                    $('#waittime>i').text(wait);
                    timeOut();
                },1000)
            }
        }
    }
</script>

<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="leftnav.jsp"%>
	</div>
	<div class="list fr">
		<div class="rightbox">
			<div class="personHello ov">
				<div class="fl helloMsg">
					<h2>
						<%Cust acu =(Cust)session.getAttribute(com.winpow.core.FrontContainer.USER_INFO);
						if(acu!=null){
							out.print(acu.getUserid());
						}%>
					，您好！</h2>
					<s:if test="#request.zqrzdb != 0 and #request.zqrzdb != null">
						<p><a href="/usercenter/getProductapplist2.html">债权融资待办${zqrzdb }个</a></p>
					</s:if>
					<s:if test="#request.gqdb != 0 and #request.gqdb != null">
                        <p><a href="/usercenter/getPublishguquanlist.html">股权融资待办${gqdb }个</a></p>
                    </s:if>
                    <s:if test="#request.zjfwdb != 0 and #request.zjfwdb != null">
                        <p><a href="/usercenter/getIncreapplist.html">中介服务待办${zjfwdb }个</a></p>
                    </s:if>
					<!--<p>通知：股权融资项目A<a href="">已通过</a></p>-->
					<!--<p>通知：高新区培训活动正在开展，<a href="">点击查看</a></p>-->
				</div>
			</div>
			<div class="ywbox">
				<h2>主要业务</h2>
				<ul class="ywcontent ov">
					<li>
						<a href="/usercenter/usercenter.html?person.t=v">
							<s:if test="#session.usercomplete!=100"><b class="complete1"></b></s:if>
							<i></i>
							个人信息
						</a>
					</li>
					<li>
						<a href="/usercenter/getPwchange.html">
							<i></i>
							修改密码
						</a>
					</li>

					<%
					if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001".equals(u.getUsertype())){%>
					<li>
						<a href="/usercenter/getQiyeinfo.html?qiye.t=v">
							<s:if test="#session.qiyecomplete!=100"><b class="complete1"></b></s:if>
							<i></i>
							企业信息
						</a>
					</li>
					<%} else if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002".equals(u.getUsertype())){%>
					<li>
						<a href="/usercenter/relaqiyeinfo.html">
							<i></i>
							关联企业
						</a>
					</li>
					<%} else if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003".equals(u.getUsertype())){%>
					<li>
						<a href="/usercenter/getJigouinfo.html?jigou.t=v">
							<s:if test="#session.qiyecomplete!=100"><b class="complete1"></b></s:if>
							<i></i>
							投资机构
						</a>
					</li>
					<%} else if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008".equals(u.getUsertype())){%>
					<li>
						<a href="/usercenter/getOtherInfo.html?tbotherorg.t=v">
						<s:if test="#session.qiyecomplete!=100"><b class="complete1"></b></s:if>
							<i></i>
							机构信息
						</a>
					</li>
					<%}%>

			
					<%if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001".equals(u.getUsertype())){%>
						<li>
							<a href="/usercenter/getFinareportinfo.html?finareport.t=v">
								<s:if test="#request.finareport==0"><b class="complete2"></b></s:if>
								<i></i>
								财务报表
							</a>
						</li>
					<%} else{%>
						<li class="gray">
						<span>该功能仅对<br>企业用户开放</span>
							<a href="javascript：void(0);">
								<s:if test="#request.finareport==0"><b class="complete2"></b></s:if>
								<i></i>
								财务报表
							</a>
						</li>
					<%}%>
					
					
					
					
					<li>
						<a href="/usercenter/getProductapplist2.html">
							<s:if test="#request.zqrzdb != 0">
								<b class="number">${zqrzdb}</b>
							</s:if>
							<i></i>
							债权融资
					</a>
					</li>
					<li>
						<a href="/declare_base/selectAllBT.html">
							<s:if test="#request.baseNum != 0">
								<b class="number">${baseNum}</b>
							</s:if>
							<i></i>
							政策申报
						</a>
					</li>
					<li>
						<a href="/userextend/getBxlist.html?t=v">
							<i></i>
							数据报送
						</a>
					</li>
					<li>
						<a href="/usercenter/getPublishguquanlist.html">
							<s:if test="#request.gqdb != 0">
								<b class="number">${gqdb}</b>
							</s:if>
							<i></i>
							股权融资
					</a>
					</li>
					<li>
						<a href="/usercenter/getActivitieslist.html">
							<i></i>
							培训活动
						</a>
					</li>
					<li>
						<a href="/usercenter/getIncreapplist.html">
						<s:if test="#request.zjfwdb != 0">
                                <b class="number">${zjfwdb}</b>
                            </s:if>
							<i></i>
							增值服务
						</a>
					</li>
				</ul>
			</div>
			<a href="/incre/toacList.html" target="_blank" style=" display:block;margin-top: 20px;">
				<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/usercenter/zjcenterbanner.png">
			</a>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>
<script type="text/javascript" >
    leftnav_init("ywcenter");
</script>
</body>
</html>