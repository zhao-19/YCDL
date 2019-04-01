<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/updateproductappinfo.js"></script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	//appproductappinfo();
	updateproductappinfo();
	$(".upback").click(function(){
		location.href = "/usercenter/getProductapplist.html";
	});
});
</script>
<style>
.error {
    border: none;
    background:none;
    }
label.error {
    border: 1px solid #f5694b!important;
    background:none;
	color: #f5694b;
	padding: 0 2px;
	display:inline-block;
    height: 24px;
    line-height: 24px;
    }
</style>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>





<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="leftnav.jsp"%>
	</div>


	<div class="list fr">
		<div class="rightbox">
			
			<!-- 债权信息申请    用户为企业时显示    -->
			<div id="zaiquanxinxi-update" class="vipinfo" >
			
			<form id="updateproductappinfo" action="/usercenter/saveProductappinfo.html" method="post">
			<div class="wk">
				<div class="title"><li>贷款信息申请</li></div>
				<input type="hidden" name="id"/>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">申请人：</span>
					<span class="rightinfo"><input class="input" name="userid" id="userid"  type="text"  value="周总理"></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">申请人名称：</span>
					<span class="rightinfo"><input class="input" name="username"  id="username"  type="text"  value="Miss周" ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">产品编号：</span>
					<span class="rightinfo"><input class="input" name="prodid" id="prodid"  type="text"  value="20161198"></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">产品名称：</span>
					<span class="rightinfo"><input class="input" name="prodname" id="prodname"  type="text"  value="换样工程项目"></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">企业名称：</span>
					<span class="rightinfo"><input class="input" name="qiyemingcheng" id="qiyemingcheng"  type="text" ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">申请金额：</span>
					<span class="rightinfo"><input class="input" name="loanamt" id="loanamt"  type="text"  ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">贷款用途：</span>
					<span class="rightinfo"><input class="input" name="loanuser" id="loanuser"  type="text"  ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">法人：</span>
					<span class="rightinfo"><input type="text" class="input" name="faren"  id="faren" ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">成立日期：</span>
					<span class="rightinfo"><input type="text" class="input" name="chengliriqi"   id="chengliriqi"  ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">注册资本(万元)：</span>
					<span class="rightinfo"><input type="text" class="input" name="zhuceziben"  id="zhuceziben"   ></span>
				</div>

				<div class="gszcddiv">
					<span class="leftname leftnamel">工商注册地：</span> 
					<span class="rightinfo" id="gszcdspan">
						<select class="ssx" id="gszcd_province" name="gszcd_province"><s:property value="productapp.gszcd_province"/></select>  
					    <select class="ssx" id="gszcd_city" name="gszcd_city" ><s:property value="productapp.gszcd_city"/></select>  
					    <select class="ssx" id="gszcd_county" name="gszcd_county"><s:property value="productapp.gszcd_county"/></select>
					</span>
					<script type="text/javascript">var custtype = 'productczdfirst';</script>
					<script src="../resource/js/area.js"></script>
					<script type="text/javascript">
					//var custtype = '<s:property value="userType"/>';
					_init_area();

					//控制省市县初始化被选中
					var pro = '';
					var city = '';
					var county = '';

					if(custtype=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001') { //企业
						pro =  '<s:property value="qiye.gszcd_province"/>';
						city = '<s:property value="qiye.gszcd_city"/>';
						county =  '<s:property value="qiye.gszcd_county"/>';

					}else if(custtype=='productczdfirst') {//机构
						pro =  '<s:property value="gszcd_province"/>';
						city = '<s:property value="gszcd_city"/>';
						county =  '<s:property value="gszcd_county"/>';
					}

					var opt0 = ["","",""];//初始值
					if(pro!=null && pro!= 'undefine' && pro!='') {
						opt0[0]= pro;
					}
					if(city!=null && city!= 'undefine' && city!='') {
						opt0[1]= city;
					}
					if(county!=null && county!= 'undefine' && county!='') {
						opt0[2]= county;
					}
					//初始化
					change(0);
					</script>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">所属行业：</span> 
					<span class="rightinfo">
						<select class="select" name="hangyeid" id="fasdf">
							<option value="">请选择</option>
							<option value="物流行业">物流行业</option>
							<option value="ＩＴ行业">ＩＴ行业</option>
							<option value="汽车行业">汽车行业</option>
							<option value="其他行业">其他行业</option>
							<option value="旅游行业">旅游行业</option>
							<option value="能源行业">能源行业</option>
							<option value="制造行业">制造行业</option>
							<option value="医疗健康">医疗健康</option>
							<option value="化学工业">化学工业</option>
							<option value="研究咨询">研究咨询</option>
							<option value="教育行业">教育行业</option>
							<option value="传媒娱乐">传媒娱乐</option>
							<option value="农林牧渔">农林牧渔</option>
							<option value="房地产业">房地产业</option>
							<option value="电信及增值">电信及增值</option>
							<option value="互联网络">互联网络</option>
							<option value="食品饮料">食品饮料</option>
							<option value="家居建材">家居建材</option>
							<option value="金融行业">金融行业</option>
							<option value="投资行业">投资行业</option>
							<option value="连锁经营">连锁经营</option>
						</select>
					</span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">专利情况：</span>
					<span class="rightinfo"><input class="input" name="zhuanli"  id="zhuanli"  type="text" ></span>
				</div>
		 
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">上年度销售收入：</span>
					<span class="rightinfo"><input class="input" name="lastsellincome" id="lastsellincome"  type="text"  ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">上年度净利润：</span>
					<span class="rightinfo"><input class="input" name="lastimcome"  id="lastimcome"  type="text"  ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">截止上年度银行贷款：</span>
					<span class="rightinfo"><input class="input" name="lastloanamt" id="lastloanamt"  type="text"  ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">本年度销售收入：</span>
					<span class="rightinfo"><input class="input" name="sellincome"  id="sellincome"  type="text" ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">本年度净利润：</span>
					<span class="rightinfo"><input class="input" name="imcome"  id="imcome"  type="text"  ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">本年度银行贷款：</span>
					<span class="rightinfo"><input class="input" name="loanamt2"  id="loanamt2"  type="text"  ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">联系人：</span>
					<span class="rightinfo"><input class="input" name="lianxiren" id="lianxiren"  type="text"  ></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">联系电话：</span>
					<span class="rightinfo"><input type="text" class="input" name="lianxidianh"  id="lianxidianh"  ></span>
				</div>
				</div>
				<div class="revise " ><input class="shenqingdkt upback" type="button" value="返回"/>&nbsp;&nbsp; <input class="shenqingdkt"  type="submit" value="提交申请"/></div>
			</form>

		</div>	
		
		</div>
		</div>

</div>
</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("debtsinfo");
 </script>
</body>
</html>
 