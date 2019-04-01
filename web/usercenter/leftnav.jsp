<%@page import="com.winpow.core.util.StrKit"%>
<%@page import="com.winpow.services.manage.tbotherorg.bean.Tbotherorg"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>
<%@page import="com.winpow.core.ManageContainer"%>
<%@page import="com.winpow.core.FrontContainer"%>
<%@ page import="com.winpow.core.system.bean.Config" %>

<div class="operate">
	<ul id="J_navlist">
		<div class="li">
			<h4 class="qitaxx"><span><i></i>账户信息</span></h4>
			<div class="list-item none">
				<p id="ywcenter" ><a href="/usercenter/userindex.html">业务中心</a></p>

				<p id="basicinfo" ><a href="/usercenter/usercenter.html?person.t=v">个人信息<span id="personcheck" class="cher" style="color:#999;font-size: 12px;margin-left:10px;">完成度${usercomplete}%</span></a></p>
				<!-- <p id="personinfo"><a href="/usercenter/getPersoninfo.html?person.t=v">个人信息</a></p> -->
				<%Cust u = (Cust)session.getAttribute(FrontContainer.USER_INFO);
				if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001".equals(u.getUsertype())){%>
				<p id="qiyeinfo"><a href="/usercenter/getQiyeinfo.html?qiye.t=v" >企业信息<span id="qiyecheck" class="cher" style="color:#999;font-size: 12px;margin-left:10px;">完成度${qiyecomplete}%</span></a></p>
				<p id="finareportinfo"><a href="/usercenter/getFinareportinfo.html?finareport.t=v" >财务报表
				<span id="finareport" style="color:#e40000;font-size: 12px;padding:3px 0 0 10px;background: url('../icon/redPoint.png') no-repeat  1px 0;display: none;">未填写</span>
				</a></p>
				<%} else if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002".equals(u.getUsertype())){%>
					<p id="relaqiyeinfo"><a href="/usercenter/relaqiyeinfo.html">关联企业<span style="color:#e40000;font-size: 12px;padding:3px 0 0 10px;background: url('../icon/redPoint.png') no-repeat  1px 0;">尚未关联</span></a></p>
				<%} else if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003".equals(u.getUsertype())){%>
				<p id="jigouinfo"><a href="/usercenter/getJigouinfo.html?jigou.t=v" >投资机构<span id="qiyecheck" style="color:#999;font-size: 12px;margin-left:10px;">完成度${qiyecomplete}%</span></a></p>
				<%} else if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008".equals(u.getUsertype())){%>
				<p id="tbotherorginfo"><a href="/usercenter/getOtherInfo.html?tbotherorg.t=v">机构信息<span id="qiyecheck" style="color:#999;font-size: 12px;margin-left:10px;">完成度${qiyecomplete}%</span></a></p>
				<%}%>
				<p id="childaccount"><a href="/usercenter/getChildaccount.html">我的同事</a></p>
				<p id="pwchange" ><a href="/usercenter/getPwchange.html">修改密码</a></p>
			</div>
		</div>
		<div class="li">
			<h4 class="qitaxx"><span><i></i>债权融资申请</span></h4>
			<div class="list-item none">
		<!-- 		<p id="debtsinfo"><a id="zqxx-a" href="/usercenter/getProductapplist.html">初审的贷款</a></p>
				<p id="redebtsinfo"><a id="zqxx-a" href="/productczdbase/selectList.html">复审的贷款</a></p> -->
				<p id="debtsinfo"><a id="zqxx-a" href="/usercenter/getProductapplist2.html">债权融资申请</a></p>
				<p id="debtsinfo1"><a id="zqxx-b" href="/usercenter/getProductapplist3.html">债权融资申请（旧版）</a></p>
			</div>
		</div>
		<div class="li">
			<h4 class="qitaxx"><span><i></i>股权项目申请</span></h4>
			<div class="list-item none">
				<p id="publishguquanlist"><a id="gqxmxx-a" href="/usercenter/getPublishguquanlist.html">已发布的股权项目</a></p>
				<p id="appointmentguquanlist"><a id="gqxmxx-a" href="/usercenter/getAppointmentguquanapplist.html">已约谈的股权项目</a></p>
			</div>
		</div>
		<div class="li">
			<h4 class="qitaxx"><span><i></i>增值业务申请</span></h4>
			<div class="list-item none">
				<p id="ydyzzfw"><a  href="/usercenter/getIncreapplist.html">已订购的增值业务</a></p>
			</div>
		</div>
		<div class="li">
			<h4 class="qitaxx"><span><i></i>盈创活动</span></h4>
			<div class="list-item none">
				<p  id="regiinfo"><a id="pxhd-a" href="/usercenter/getActivitieslist.html">已报名信息</a></p>
				<p id="comregiinfo" ><a id="pxhd-a" href="/usercenter/getActivitieslinkuserlist.html">常用报名人员信息</a></p>
			</div>
		</div>
		<div class="li">
			<h4 class="qitaxx"><span><i></i>政策申报<!-- <img id="zcsbleftimg" src="/icon/hot-fire.gif" style="position: absolute;margin: 5px 2px 0 5px;display: none;"> --></span></h4>
			<div class="list-item none">
				<%if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001".equals(u.getUsertype())){%>
					<p  id="qysqjbxx"><a href="/declare_base/toFrontBase.html?t=v">企业基本情况表<span id="base" style="color:#e40000;font-size: 12px;margin-left:10px;display: none;">(未填写)</span></a></p>
				<%} else if(u!=null && ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003".equals(u.getUsertype())||"aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008".equals(u.getUsertype()))){%>
					<p  id="jrljbqkb"><a href="/userextend/getBaseJg.html">金融类基本情况表<span id="basejg" style="color:#e40000;font-size: 12px;margin-left:10px;display: none;">(未填写)</span></a></p>
				<%}%>
			 	<p  id="downloadbt"><a href="/declare_uploader/selectList.html">文件下载<font size="0" color="red">(生成的申报文件在此下载)</font></a></p>
			 	<p  id="allbt"><a href="/declare_base/selectAllBT.html">政策申报汇总<span id="zcsblefthz" style="color:#e40000;font-size: 12px;">(发起申请)</span></a></p>	
			</div>
		</div>
		<div class="li">
			<h4 class="qitaxx"><span><i></i>数据报送</span></h4>
			<div class="list-item none">
			
			<%if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003".equals(u.getUsertype())){%>
				<p id="fundinfo"><a href="/userextend/getFundList.html">高新区私募基金管理</a></p>
			<%}%>
			<p id="jrindex"><a href="/userextend/getJrIndex.html">数据报送汇总</a></p>
			<div class="third-list"><span>金融机构数据报送<b>>></b></span>
						<ul class="none">
							<li id='bxinfo'><a href='/userextend/getBxlist.html?t=v'>保险公司数据报送</a></li>
							<li id='yhinfo'><a href='/userextend/getYhlist.html?t=v'>银行数据报送</a></li>
							<li id='qsqhinfo'><a href='/userextend/getQsqhlist.html?t=v'>券商期货数据报送</a></li>
							<li id='rzzninfo'><a href='/userextend/getRzznlist.html?t=v'>融资租赁数据报送</a></li>
							<li id='ysscinfo'><a href='/userextend/getYssclist.html?t=v'>要素市场数据报送</a></li>
							<li id='gqtzinfo'><a href='/userextend/getGqtzlist.html?t=v'>股权投资数据报送</a></li>
							<li id='xdinfo' style="display: none;"><a href='/userextend/getXdlist.html?t=v'>小额贷款数据报送</a></li>
							<li id='dbinfo' style="display: none;"><a href='/userextend/getDblist.html?t=v'>担保公司数据报送</a></li>
						</ul>
					</div>
					<div class="third-list"><span>自贸区企业数据报送<b>>></b></span>
					<ul class="none">
					<li id='qyinfo'><a href='/userextend/getQylist.html?t=v'>自贸区企业数据报送</a></li>
					</ul>
					</div>
			</div>
		</div>
		
		<%if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001".equals(u.getUsertype())){%>
			<div class="li">
				<h4 class="qitaxx"><span><i></i>新经济企业入库</span></h4>
				<div class="list-item none">
					<p id='tbnewecoinfo'><a href='/usercenter/getNewEco.html?t=v'>新经济企业入库</a></p>
				</div>
			</div>
		<%}%>
	</ul>
</div>
<div id="shenbaoleft" style="display: none;"><%out.print(SystemManager.CONFIGS.get(Config.ZHENGCHESHENBAO));%></div>
<script type="text/javascript">
navList(12);
$.ajax({
	type: 'post',
	url: "/usercenter/checkQiye.html",
	dataType: "json",
	success: function(data) {
		if (data.qiyecheck == 1) {
			$("#qiyecheck").show();
		}
		if (data.finareport == 1) {
			$("#finareport").show();
		}
		if (data.base == 1) {
			$("#base").show();
		}
		if (data.basejg == 1) {
			$("#basejg").show();
		}	
		if (data.personcheck == 1) {
			$("#personcheck").show();
		}
	}
});
$('.third-list>span').click(function(){
	$(this).siblings('ul').slideToggle(500);
})
$(".cher").each(function(){
	if ($(this).html().indexOf("100") == -1) {
		$(this).css("color", "red");
	}
});
if ($("#shenbaoleft").html() == 1) {
	$("#zcsblefthz, #zcsbleftimg").show();
}
</script>
 