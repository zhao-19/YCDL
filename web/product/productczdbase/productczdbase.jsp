<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html PUBLIC “-//W3C//DTD XHTML 1.0 Transitional//EN” “http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd”>
<html xmlns=”http://www.w3.org/1999/xhtml”>
<head >
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.dialogbox.css">
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/productczdbase.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>	
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
</head>
<body>
<!-- t有值代表是查看 -->
<input type="hidden" id="t" value="<s:property value="e.t"/>">
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#t").val();
	//alert(t);
	if(t=='v'){
		$("#ycacti").css("border","2px solid #eaeaea");
		$("#productczdbase input,radio,select,textarea,checkbox").attr('disabled',true).parent().addClass("nohover");
		$("#czdsteponesbt").attr("disabled",false);
		$("#czdsteponesave").attr("disabled",false);
		var id = $("#czdsteponesbt").attr("lang");
		$("#productczdbase").attr("action","/productczdbase/tostep2.html?e.id="+id+"&e.t="+t);
		/* $("#czdsteponesbt").click(function(){
			var id=$(this).attr("lang");
			//点击下一步 链接是第二步
			location.href="/productczdbase/tostep2.html?e.id="+id+"&e.t="+t;
			return;
		}); */
		$(".nextnotice").hide();
		
	}else{
		productczdbase();
	}
	$("#czdsteponesave").click(function(){
	//	返回上一步
		var id=$(this).attr("lang");
		location.href="/usercenter/getProductapplist2.html";
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
    }
</style>
<!-- 网站头部 -->
<div class="nav widthbox">
    <div class="logo fl"><img src="../image/index/logo.jpg" alt="logo"></div>
    <div class="nav_right fr">
    
    <%@ include file="../userinfo.jsp"%>

    <%@ include file="../menu.jsp"%>
    </div>
</div>





<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="../usercenter/leftnav.jsp"%>
	</div>


	<div class="list fr">
		<div class="rightbox">
			
			
			<!--培训活动   所有用户显示    -->
			<div id="peixunhuodong" class="vipinfo" >
				<div class="title"><li><span class="t">复审第一步（共七步）：基本信息</span><%--<a href="/usercenter/toAppProductappinfo.html"> <span id="CreateTBpxhd" class="update">债权融资申请</span> </a>--%></li></div>
 
				<form action="/productczdbase!updatestep1.action?e.id=<s:property value='#request.id'/>&e.t=<s:property value='e.t'/>"  id="productczdbase" name="czdstepone" method="post">
				<table id="ycacti"  class="ycactifs"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr>
 						<td colspan="4" >基本信息</td>
					</tr>
					<tr>
 						<td  >企业名称</td>
 						<td class="input tdtwo" colspan="3"  ><input type="text" id="qiyemingcheng"  name="qiyemingcheng"  value="<s:property value='e.qiyemingcheng'/>"></td>
						
						<!-- <td  >申请人名称</td>
						<td class="input tdtwo"  ><input type="text" id="username"  name="username"  value="<s:property value='e.username'/>"></td>
						 -->
					</tr>
					<tr>
					<td>申请人</td>
 						<td class="input tdtwo"  ><input type="text"  id="userid"  name="userid"  value="<s:property value='e.userid'/>"></td>
 						<td  >成立时间</td>
						<td  class="input tdtwo"  ><input class="stext laydate-icon" type="text" id="chengliriqi"  name="chengliriqi"  value="<s:property value='e.chengliriqi'/>"></td>
					</tr>
					<tr><td colspan="4">
					<div class="gszcddiv gszcddivr">
					<span class="leftname leftnamel">注册地</span> 
					<span class="rightinfo" id="gszcdspan">
						<select class="ssx" id="gszcd_province" name="gszcd_province"><s:property value="e.gszcd_province"/></select>  
					    <select class="ssx" id="gszcd_city" name="gszcd_city" ><s:property value="e.gszcd_city"/></select>  
					    <select class="ssx" id="gszcd_county" name="gszcd_county"><s:property value="e.gszcd_county"/></select>
					</span>
					<input type="hidden" id="province" value='<s:property value="e.gszcd_province"/>'/>
					<input type="hidden" id="city" value='<s:property value="e.gszcd_city"/>'/>
					<input type="hidden" id="county" value='<s:property value="e.gszcd_county"/>'/>
					<input type="hidden" id="custtype" value='productczdfirst'/>
					<script type="text/javascript">var custtype = 'productczdfirst';</script>
					<script src="../resource/js/area.js"></script>
					<script type="text/javascript">
					_init_area();

					
				
					//初始化
					//change(0);
					</script>
					
				</div>
					
					
					
					
					</td></tr>
					<tr>
 						<td  >办公地址</td>
						<td  class="input tdtwo"  colspan="3" ><input style="width: 100%;" type="text" id="bgdz" name="bgdz"  value="<s:property value='e.bgdz'/>"></td>
					</tr>
					<tr>
 						<td  >注册资本</td>
 						<td class="input tdtwo"  ><input type="text" id="zhuceziben" name="zhuceziben"  value="<s:property value='e.zhuceziben'/>"></td>
						<td  >生产地址</td>
						<td  class="input tdtwo"  ><input type="text"  id="scdz"  name="scdz"  value="<s:property value='e.scdz'/>"></td>
					</tr>
					<tr>
 						<td  >法人代表</td>
 						<td class="input tdtwo"  ><input type="text"  id="faren"  name="faren"  value="<s:property value='e.faren'/>"></td>
						<td  >身份证号码</td>
						<td  class="input tdtwo"  ><input type="text"  id="sfzhm" name="sfzhm"  value="<s:property value='e.sfzhm'/>"></td>
					</tr>
					<tr>
 						<td  >贷款联系人</td>
 						<td class="input tdtwo"  ><input type="text" id="lianxiren" name="lianxiren"  value="<s:property value='e.lianxiren'/>"></td>
						<td  >职务</td>
						<td  class="input tdtwo"  ><input type="text" id="zhiwu"  name="zhiwu"  value="<s:property value='e.zhiwu'/>"></td>
					</tr>
					<tr>
 						<td  >电话(手机)</td>
 						<td class="input tdtwo"  ><input type="text" id="dianhua" name="dianhua"  value="<s:property value='e.dianhua'/>"></td>
						<td  >电子邮件</td>
						<td  class="input tdtwo"  ><input type="text"  id="dianzhiyoujian" name="dianzhiyoujian"  value="<s:property value='e.dianzhiyoujian'/>"></td>
					</tr>
					<tr>
 						<td  >客户类型</td>
 						<td class="input tdtwo"><input class="rad"  type="radio" id="kehuleixing" name="kehuleixing" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa190".equals(request.getAttribute("e.kehuleixing"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa190"/>新客户&nbsp;&nbsp;&nbsp;<input class="rad"  type="radio" name="kehuleixing" <%if  ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa191".equals(request.getAttribute("e.kehuleixing"))) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa191">续保客户</td>
 						<td  >申请品种</td>
						<td class="input tdtwo" id="readonlysel">
						<input type="hidden" id="sqpzselect" value="<s:property value='e.daikuanpingz'/>"/>
							<select type="text"  id="e_daikuanpingz">
	 							<option value=成长贷>成长贷</option>
	 							<option value="壮大贷">壮大贷</option>
	 							<option value="新创贷">新创贷</option>
	 						</select>
						</td>
 						</tr>
					
					<tr>
 						<td  >业务来源</td>
 						<td class="input"  colspan="3" >
 						<input class="rad"  type="radio" id="yewulaiyuan" name="yewulaiyuan"   <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa200".equals(request.getAttribute("e.yewulaiyuan"))) { out.print("checked='checked'");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa200">政府推荐&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="yewulaiyuan" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa201".equals(request.getAttribute("e.yewulaiyuan"))) { out.print("checked='checked'");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa201">银行推荐&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="yewulaiyuan" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa202".equals(request.getAttribute("e.yewulaiyuan"))) { out.print("checked='checked'");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa202">担保推荐&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="yewulaiyuan" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa203".equals(request.getAttribute("e.yewulaiyuan"))) { out.print("checked='checked'");} %>value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa203">盈创推荐&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="yewulaiyuan" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa204".equals(request.getAttribute("e.yewulaiyuan"))) { out.print("checked='checked'");} %>value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa204">其它</td>
					</tr>
					<tr>
 						<td rowspan="2"  >经营范围</td>
 						<td  class="input"   colspan="3"><span class="spgap">主营：</span><input class="inputgap"   type="text" id="zhuyingyewu" name="zhuyingyewu"  value="<s:property value='e.zhuyingyewu'/>"></td>
 						
					</tr>
					<tr>
						<td  class="input"   colspan="3"><span class="spgap">兼营：</span><input class="inputgap"   type="text" id="jianyingywu" name="jianyingywu"  value="<s:property value='e.jianyingywu'/>"></td>
					</tr>
					<tr>
 						<td  >主营产品</td>
 						<td class="input"  colspan="3" ><input  type="text" id="zhuyingchanpin"   name="zhuyingchanpin"  value="<s:property value='e.zhuyingchanpin'/>"></td>
					</tr>
					<tr>
 						<td  >兼营产品</td>
 						<td class="input"  colspan="3" ><input  type="text" id="jianyingchanpin"  name="jianyingchanpin"  value="<s:property value='e.jianyingchanpin'/>"></td>
					</tr>
					<tr>
 						<td  >企业相关资质证书</td>
 						<td class="input"  colspan="3" ><textarea id="zhizhizhegnshu" name="zhizhizhegnshu"><s:property value='e.zhizhizhegnshu'/></textarea></td>
					</tr>
					
 					<!--<tr>
 					 	<td  >专利情况</td>
 						<td class="input"  colspan="3" ><textarea id="zhuanliqingkuang" name="zhuanliqingkuang"><s:property value='e.zhuanliqingkuang'/></textarea></td>
					</tr>
					 -->
					<tr> 
 						<td  >行业归属</td>
 						<td class="input"  colspan="3" >
 						  <input class="rad"  type="radio" id="hangyeguishu" name="hangyeguishu" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa210".equals(request.getAttribute("e.hangyeguishu"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa210">电子信息&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="hangyeguishu" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa211".equals(request.getAttribute("e.hangyeguishu"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa211">化工&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="hangyeguishu" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa212".equals(request.getAttribute("e.hangyeguishu"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa212">生物医药&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="hangyeguishu" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa213".equals(request.getAttribute("e.hangyeguishu"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa213">机械、机电&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="hangyeguishu" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa214".equals(request.getAttribute("e.hangyeguishu"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa214">纺织&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="hangyeguishu" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa215".equals(request.getAttribute("e.hangyeguishu"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa215">资源与环境&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="hangyeguishu" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa216".equals(request.getAttribute("e.hangyeguishu"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa216">能源&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="hangyeguishu" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa217".equals(request.getAttribute("e.hangyeguishu"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa217">新材料&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="hangyeguishu" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa218".equals(request.getAttribute("e.hangyeguishu"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa218">建筑、建材&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="hangyeguishu" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa219".equals(request.getAttribute("e.hangyeguishu"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa219">其它</td>
					</tr>
					<tr>
 						<td  >企业性质</td>
 						<td class="input"  colspan="3" >
	   <input class="rad"  type="radio" id="qiyexingzhi" name="qiyexingzhi" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121".equals(request.getAttribute("e.qiyexingzhi"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121">民营企业&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="qiyexingzhi" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122".equals(request.getAttribute("e.qiyexingzhi"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122">中外合资企业&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="qiyexingzhi" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120".equals(request.getAttribute("e.qiyexingzhi"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120">国有企业&nbsp;&nbsp;&nbsp;
 						<input class="rad"  type="radio" name="qiyexingzhi" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa123".equals(request.getAttribute("e.qiyexingzhi"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa123">其它</td>
					</tr>
					<tr>
 						<td colspan="4" >员工构成</td>
					</tr>
					<tr>
 						<td  >员工总数</td>
 						<td class="input tdtwo" ><input type="text" id="yuangongshu" name="yuangongshu"  value="<s:property value='e.yuangongshu'/>"></td>
						<td  >大专以上人数</td>
 						<td class="input tdtwo"  ><input type="text" id="dazhuanrenshu" name="dazhuanrenshu"  value="<s:property value='e.dazhuanrenshu'/>"></td>
					</tr>
					<tr>
 						
						<td  >技术开发人员总数</td>
						<td class="input tdtwo"  ><input type="text"  id="jishurenyuanshu" name="jishurenyuanshu"  value="<s:property value='e.jishurenyuanshu'/>"></td>
 						<td  >其中本科学历人数</td>
						<td class="input tdtwo"  ><input type="text" id="benkerenshu" name="benkerenshu"  value="<s:property value='e.benkerenshu'/>"></td>
 						</tr>
					<tr>
 						<td  >硕士及以上人数</td>
 						<td class="input tdtwo"  ><input type="text" id="shuoshirenshu" name="shuoshirenshu"  value="<s:property value='e.shuoshirenshu'/>"></td>
						<td  >中高级技术职称人数</td>
 						<td class="input tdtwo"  ><input type="text" id="zhonggaojirenshu"  name="zhonggaojirenshu"  value="<s:property value='e.zhonggaojirenshu'/>"></td>
					</tr>
					<tr>
 						<td  >管理人员人数</td>
						<td class="input tdtwo"  ><input type="text" id="guanliyuanrenshu" name="guanliyuanrenshu"  value="<s:property value='e.guanliyuanrenshu'/>"></td>
						<td  >本科以上人数</td>
						<td class="input tdtwo"  ><input type="text" id="benkeyishangrenshu" name="benkeyishangrenshu"  value="<s:property value='e.benkeyishangrenshu'/>"></td>
					
						</tr>
					<tr>
 						<td colspan="4" >本期申请贷款情况</td>
					</tr>
					<tr>
 						<td  >申请贷款额度（万元）</td>
 						<td class="input tdtwo"  ><input type="text" id="shenqingjine" name="shenqingjine"  value="<s:property value='e.shenqingjine'/>"></td>
						<td  >申请贷款期限（月）</td>
						<td class="input tdtwo"  ><input type="text" readonly="readonly" style="color:#777;" id="daikuanqixian" name="daikuanqixian"  value="12"></td>
					</tr>
					<tr>
 						<td  >贷款银行</td>
 						<td class="input tdtwo" id="daikuantd"  >
 						<input type="hidden" id="hiddensdkyh" value="<s:property value='e.daikuanyinhang'/>"/>
 						<!-- daikuanyinhang -->
 						<select type="text" class="sdkyh"  id="sczd">
 							<option value="">-请选择-</option>
 							<option value="盈创动力分配银行">盈创动力分配银行</option>
							<option value="成都银行营业部">成都银行营业部</option>
							<option value="成都银行华兴支行">成都银行华兴支行</option>
 							<option value="成都银行高新支行">成都银行高新支行</option>
 							<option value="成都银行琴台支行">成都银行琴台支行</option>
 							<option value="成都银行金河支行">成都银行金河支行</option>
 							<option value="成都银行长顺支行">成都银行长顺支行</option>
 							<option value="成都银行锦江支行">成都银行锦江支行</option>
 							<option value="成都银行成华支行">成都银行成华支行</option>
 							<option value="成都银行武侯支行">成都银行武侯支行</option>
 							<option value="成都银行德盛支行">成都银行德盛支行</option>
 							<option value="成都银行青羊支行">成都银行青羊支行</option>
 							<option value="成都银行高升桥支行">成都银行高升桥支行</option>
 							<option value="成都银行金牛支行">成都银行金牛支行</option>
 							<option value="成都银行沙湾支行">成都银行沙湾支行</option>
 							<option value="成都银行体育场路支行">成都银行体育场路支行</option>
 							<option value="成都银行科技支行">成都银行科技支行</option>
 							<option value="成都银行双流支行">成都银行双流支行</option>
 							<option value="成都银行龙泉驿支行">成都银行龙泉驿支行</option>
							<option value="成都银行彭州支行">成都银行彭州支行</option>
							<option value="成都银行邛崃支行">成都银行邛崃支行</option>
							<option value="成都银行新津支行">成都银行新津支行</option>
							<option value="成都银行郫县支行">成都银行郫县支行</option>
							<option value="成都银行都江堰支行">成都银行都江堰支行</option>
							<option value="成都银行温江支行">成都银行温江支行</option>
							<option value="成都银行崇州支行">成都银行崇州支行</option>
							<option value="成都银行新都支行">成都银行新都支行</option>
							<option value="成都银行大邑支行">成都银行大邑支行</option>
							<option value="成都银行青白江支行">成都银行青白江支行</option>
							<option value="成都银行金堂支行">成都银行金堂支行</option>
							<option value="成都银行蒲江支行">成都银行蒲江支行</option>
 						</select>
 						<select type="text" class="sdkyh"  id="szdd">
 							<option value="">-请选择-</option>
 							<option value="盈创动力分配银行">盈创动力分配银行</option>
							<option value="成都银行营业部">成都银行营业部</option>
 							<option value="成都银行华兴支行">成都银行华兴支行</option>
 							<option value="成都银行高新支行">成都银行高新支行</option>
 							<option value="成都银行琴台支行">成都银行琴台支行</option>
 							<option value="成都银行金河支行">成都银行金河支行</option>
 							<option value="成都银行长顺支行">成都银行长顺支行</option>
 							<option value="成都银行锦江支行">成都银行锦江支行</option>
 							<option value="成都银行成华支行">成都银行成华支行</option>
 							<option value="成都银行武侯支行">成都银行武侯支行</option>
 							<option value="成都银行德盛支行">成都银行德盛支行</option>
 							<option value="成都银行青羊支行">成都银行青羊支行</option>
 							<option value="成都银行高升桥支行">成都银行高升桥支行</option>
 							<option value="成都银行金牛支行">成都银行金牛支行</option>
 							<option value="成都银行沙湾支行">成都银行沙湾支行</option>
 							<option value="成都银行体育场路支行">成都银行体育场路支行</option>
 							<option value="成都银行科技支行">成都银行科技支行</option>
 							<option value="成都银行双流支行">成都银行双流支行</option>
 							<option value="成都银行龙泉驿支行">成都银行龙泉驿支行</option>
							<option value="成都银行彭州支行">成都银行彭州支行</option>
							<option value="成都银行邛崃支行">成都银行邛崃支行</option>
							<option value="成都银行新津支行">成都银行新津支行</option>
							<option value="成都银行郫县支行">成都银行郫县支行</option>
							<option value="成都银行都江堰支行">成都银行都江堰支行</option>
							<option value="成都银行温江支行">成都银行温江支行</option>
							<option value="成都银行崇州支行">成都银行崇州支行</option>
							<option value="成都银行新都支行">成都银行新都支行</option>
							<option value="成都银行大邑支行">成都银行大邑支行</option>
							<option value="成都银行青白江支行">成都银行青白江支行</option>
							<option value="成都银行金堂支行">成都银行金堂支行</option>
							<option value="成都银行蒲江支行">成都银行蒲江支行</option>
 						</select>
 						<select type="text" class="sdkyh"  id="sxcd">
 							<option value="">-请选择-</option>
 							<option value="工行高新支行">工行高新支行</option>
 						</select>
 						<div id="daikuanlist"></div>
 						</td>
						<td  >担保公司</td>
						<td class="input tdtwo"  >
	
						
						<select type="text" style="width: 230px;padding: 4px;background-color: #fff;"  id="danbaogongsi" name="danbaogongsi">
 							<option value="">-请选择-</option>
 							<option  <% if ("无".equals(((com.winpow.services.manage.productczdbase.bean.Productczdbase) request.getAttribute("e")).getDanbaogongsi())) { out.print("selected=selected");} %>  value="无">无</option>
 							<option  <% if ("成都中小担".equals(((com.winpow.services.manage.productczdbase.bean.Productczdbase) request.getAttribute("e")).getDanbaogongsi())) { out.print("selected=selected");} %>  value="成都中小担">成都中小担</option>
 							<option  <% if ("高投担保".equals(((com.winpow.services.manage.productczdbase.bean.Productczdbase) request.getAttribute("e")).getDanbaogongsi())) { out.print("selected=selected");} %> value="高投担保">高投担保</option>
 						</select>
 						
						</td>
					</tr>
					 
					<tr>
 						<td  >贷款用途</td>
 						<td class="input"  colspan="3" ><textarea id="daikuanyongtu" name="daikuanyongtu"><s:property value='e.daikuanyongtu'/></textarea></td>
					</tr>
					<tr>
 						<td  >与贷款用途相关的项目情况</td>
 						<td class="input"  colspan="3" ><textarea id="xiangmuqingkuang" name="xiangmuqingkuang"><s:property value='e.xiangmuqingkuang'/></textarea></td>
					</tr>
					<tr>
 						<td  >还款计划及还款来源</td>
 						<td class="input"  colspan="3" ><textarea id="huankuanlaiyuan" name="huankuanlaiyuan"><s:property value='e.huankuanlaiyuan'/></textarea></td>
					</tr>
					<tr class="tijiao">
						<td colspan="4"><input type="button"  id="czdsteponesave" lang="<s:property value="e.id"/>"   name="czdsteponesave"  value="返回">&nbsp;&nbsp;&nbsp;<input type="submit"  id="czdsteponesbt"  lang="<s:property value="e.id"/>"    name="czdsteponesbt" value="下一步"><span class="nextnotice">&nbsp;&nbsp;(注：点击下一步会保存当前这一步的数据)</span></td>
					</tr>
			
				</table>
				</form>
				
			</div>
			</div>
			</div>

</div>


<script type="text/javascript"> //把贷款品种设置为禁止修改
	$("#e_daikuanpingz").attr("disabled",true);
	//根据申请品种hidden框把申请品种select对应的值选中
	var sqpzselect = $("#sqpzselect").val();
	$("#e_daikuanpingz option").each(function(){
		if($(this).attr("value")==sqpzselect){
			$(this).attr("selected",true);
			return;
		}
	});

	//根据申请品种的值让对应的贷款银行select框显示，并添加name属性以便validate验证。
	var daikuanpingzVal = sqpzselect;

	var hiddensdkyhVal = $("#hiddensdkyh").val();

	if(daikuanpingzVal=='成长贷'){
		$("#sczd").show().attr("name","daikuanyinhang");
		$("#szdd").hide().attr("name","");
		$("#sxcd").hide().attr("name","");
		//遍历成长贷option的值与隐藏域中的值相等的边添加selected样式。
		$("#sczd option").each(function(){
			if($(this).attr("value")==hiddensdkyhVal){
				$(this).attr("selected",true);
				return;
			}
		});
		
	}else if(daikuanpingzVal=='壮大贷'){
		
		$("#szdd").show().attr("name","daikuanyinhang");
		$("#sczd").hide().attr("name","");
		$("#sxcd").hide().attr("name","");
		//遍历壮大贷option的值与隐藏域中的值相等的边添加selected样式。
		$("#szdd option").each(function(){
			if($(this).attr("value")==hiddensdkyhVal){
				
				$(this).attr("selected",true);
				return;
			}
		});
		
	}else{
		$("#sxcd").show().attr("name","daikuanyinhang");
		$("#sczd").hide().attr("name","");
		$("#szdd").hide().attr("name","");
		//遍历新创贷option的值与隐藏域中的值相等的边添加selected样式。
		$("#sxcd option").each(function(){
			if($(this).attr("value")==hiddensdkyhVal){
				$(this).attr("selected",true);
				return;
			}
		});
		
	}




/* 贷款银行检索 start*/

//ie6,7,ie8无法使用trim()函数，在js中写上这个函数再用.trim()就可以了。
//String.prototype.trim = function () {
//return this .replace(/^\s\s*/, '' ).replace(/\s\s*$/, '' );
 //}
 
/*
var daikuanyinhang = $("#daikuanyinhang");

var daikuanlist = $("#daikuanlist");
//给input绑定内容变化时立即出发事件要用原生的.bind函数才兼容ie6,7,8
daikuanyinhang.bind('input propertychange', function() {
	var daikuanyinhangVal = $("#daikuanyinhang").val();
	if(daikuanyinhangVal.trim() != ""){
		daikuanlist.html(daikuanyinhangVal);
		daikuanlist.slideDown();
	}else{
		daikuanlist.hide();
	}
	});
	*/

/* 贷款银行检索 end*/






!function(){
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	laydate({elem: '#chengliriqi'});//绑定元素
	//laydate({elem: '#fksj'});//绑定元素
	//laydate({elem: '#dqsj'});//绑定元素
}();

//日期范围限制
var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: laydate.now(), //设定最小日期为当前日期
    max: '2099-06-16', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};

var end = {
    elem: '#end',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: '2099-06-16',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，充值开始日的最大日期
    }
};
laydate(start);
laydate(end);

//自定义日期格式
laydate({
    elem: '#test1',
    format: 'YYYY年MM月DD日',
    festival: true, //显示节日
    choose: function(datas){ //选择日期完毕的回调
        alert('得到：'+datas);
    }
});

//日期范围限定在昨天到明天
laydate({
    elem: '#hello3',
    min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
    max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
});
</script>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("redebtsinfo");
 </script>
</body>
</html>
 