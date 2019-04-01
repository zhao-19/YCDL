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
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.dialogbox.css">
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog/jDialog.css" type="text/css">
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.dialogBox.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog.js"></script>
</head>
<body>

<div class="zgezhaoceng" style="display: none;width:100%;height:2400px;"></div>

<script>
	$(function(){
		$(".zgezhaoceng").width(body).width();
//		$('.zgezhaoceng').height(body).height();
		$('.zgezhaoceng').css('left',0);
		$('.zgezhaoceng').css('top',0);
	});	

 
</script>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>





<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
<div class="operate">
		<ul id="J_navlist">
			<li class="selected">
				<h4 class="gerenzl">个人资料</h4>
			</li>
			<li>
				<h4 class="qitaxx">账户信息</h4>
				<div class="list-item none">
					<p><a id="jbxx-a" href="#">基本信息</a></p>
					<p><a id="qyxx-a" href="#">企业信息</a></p>
				</div>
			</li>
			<li>
				<h4 class="qitaxx">债权融资</h4>
				<div class="list-item none">
					<p><a id="zqxx-a" href="#">债权信息</a></p>
				</div>
			</li>
			<li>
				<h4 class="qitaxx">股权项目</h4>
				<div class="list-item none">
					<p><a id="gqxmxx-a" href="#">股权项目信息</a></p>
				</div>
			</li>
			<li>
				<h4 class="qitaxx">增值业务</h4>
				<div class="list-item none">
					<p><a id="ydyzzfw" href="#">已订阅的增值服务</a></p>
				</div>
			</li>
			<li>
				<h4 class="qitaxx">盈创活动</h4>
				<div class="list-item none">
					<p><a id="pxhd-a" href="#">培训活动</a></p>
				</div>
			</li>
			
			
			
		</ul>
	</div>
		<script type="text/javascript">
		navList(12);
		</script>
	</div>


	<div class="list fr">
		<div class="rightbox">
		
			<!-- 基本信息   所有用户显示   -->
			<div class="vipinfo" id="jibenxinxi" style="display:block">
				<div class="title"><li>基本信息</li></div>
				
				<div class="inputtest">
					<span class="leftname">帐号：</span> 
					<span class="rightinfo"><s:property value="e.userid"/></span>
				</div>
				<div class="inputtest">
					<span class="leftname">类型：</span> 
					<span class="rightinfo"> <s:select list="%{#application.dic.khlx.childs}" listKey="id"  
                            listValue="name" name="e.usertype"  
                            headerKey="" headerValue=""    />  	   </span>
				</div>
				<div class="inputtest">
					<span class="leftname">手机号码：</span> 
					<span class="rightinfo"><s:property value="e.cellphone"/></span>
				</div>	
				<div class="inputtest">
					<span class="leftname">EMAIL：</span> 
					<span class="rightinfo"><s:property value="e.email"/></span>
				</div>
				<div class="inputtest">
					<span class="leftname">客户经理：</span> 
					<span class="rightinfo"><s:property value="e.custmanage"/></span>
				</div>

			</div>
			

			<!-- 企业信息  企业用户显示   --> 	<!-- &nbsp;&nbsp;&nbsp;&nbsp;<span class="zhuozhong">*</span> -->
			
		 
			<div class="vipinfo" id="qiyexinxi" style="display:none">
		<form id="qyxxform" action="" method="post">
				<div class="title"><li>企业信息<span id="qyxx-update" class="update">企业信息修改</span></li></div>
				
				
			 
			 
				<div class="inputtest">
 				 <input name="pk_qiyeid"   readonly="readonly" type="hidden"  > 
				</div>
				
				<div class="inputtest">
					<span class="leftname">企业名称：</span>
					<span class="rightinfo"><input class="input" name="qiyemingcheng"   readonly="readonly" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">成立日期：</span>
					<span class="rightinfo"><input class="input" name="chengliriqi" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">办公(经营)地址：</span>
					<span class="rightinfo"><input class="input" name="dizhi" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">注册资本(万元)：</span>
					<span class="rightinfo"><input class="input" name="zhuceziben" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">法人代表姓名：</span> 
					<span class="rightinfo"><input class="input" name="faren" readonly="readonly"  type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">工商注册地（旧）：</span> 
					<span class="rightinfo">
						<select class="select" name="gszcd" id="qw1" readonly="readonly">
							<option value="">--  请选择  --</option>
							<option value="">北京市</option>
							<option value="">上海市</option>
							<option value="">广州市</option>
							<option value="">深圳市</option>
						</select>
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">工商注册地-省：</span>
					<span class="rightinfo">
						<select class="select" name="" id="rre1" readonly="readonly">
							<option value="">--  请选择  --</option>
							<option value="">北京市</option>
							<option value="">上海市</option>
							<option value="">广州市</option>
							<option value="">深圳市</option>
						</select>
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">工商注册地-市：</span>
					<span class="rightinfo">
						<select class="select" name="" id="dsf1" readonly="readonly">
							<option value="">--  请选择  --</option>
							<option value="">北京市</option>
							<option value="">上海市</option>
							<option value="">广州市</option>
							<option value="">深圳市</option>
						</select>
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">工商注册地-县/区：</span>
					<span class="rightinfo">
						<select class="select" name="" id="dfg1" readonly="readonly">
							<option value="">--  请选择  --</option>
							<option value="">北京市</option>
							<option value="">上海市</option>
							<option value="">广州市</option>
							<option value="">深圳市</option>
						</select>						
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">组织机构代码（统一社会信用代码）：</span>
					<span class="rightinfo"><input class="input" name="zzjgdm"  readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">企业性质：</span>
					<span class="rightinfo">
						<select class="select" name="qiyexingzhiid" id="dsfgf1" readonly="readonly">
							<option value="">--  请选择  --</option>
							<option value="">企业性质</option>
							<option value="">企业性质</option>
							<option value="">企业性质</option>
							<option value="">企业性质</option>
						</select>
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">所属行业：</span>
					<span class="rightinfo">
						<select class="select" name="hangyeid" id="zxv1" readonly="readonly">
							<option value="">--  请选择  --</option>
							<option value="">所属行业</option>
							<option value="">所属行业</option>
							<option value="">所属行业</option>
							<option value="">所属行业</option>
						</select>
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">所处阶段：</span>
					<span class="rightinfo">
						<select class="select" name="suchujieduanid" id="dfasdf1" readonly="readonly">
							<option value="">--  请选择  --</option>
							<option value="">所处阶段</option>
							<option value="">所处阶段</option>
							<option value="">所处阶段</option>
							<option value="">所处阶段</option>
						</select>
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">经营范围：</span>
					<span class="rightinfo"><input class="input" name="jingyingfanwei" readonly="readonly"  type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">企业基本介绍：</span>
					<span class="rightinfo"><input class="input" name="qiyejieshao" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">主营业务：</span>
					<span class="rightinfo"><input class="input" name="zhuyingyewu" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">兼营业务：</span>
					<span class="rightinfo"><input class="input" name="jianyingyewu" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">企业认证：</span>
					<span class="rightinfo"><input class="input" name="qiyerenzheng" readonly="readonly"  type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">员工数：</span>
					<span class="rightinfo"><input class="input" name="yuangongshu" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">大专以上技术人员数：</span>
					<span class="rightinfo"><input class="input" name="dazhuanrenshu" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">从事研发人数：</span>
					<span class="rightinfo"><input class="input" name="yanfarenshu" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">本科以上占管理比例：</span>
					<span class="rightinfo"><input class="input" name="bkzglbl" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">有无上市计划：</span>
					<span class="rightinfo">
						<select class="select" name="shangshijihua" id="hgkh" readonly="readonly">
							<option value="">--  请选择  --</option>
							<option value="">有无上市计划</option>
							<option value="">有无上市计划</option>
							<option value="">有无上市计划</option>
							<option value="">有无上市计划</option>
						</select>
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">企业LOGO：</span>
					<span class="rightinfo"><input class="input" name="logo" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">网址：</span>
					<span class="rightinfo"><input class="input" name="wangzhi" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">联系人姓名：</span>
					<span class="rightinfo"><input class="input" name="xingming" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">职务：</span>
					<span class="rightinfo"><input class="input" name="bumenzhiwu" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">移动电话：</span>
					<span class="rightinfo"><input class="input" name="yidongdianhua" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">固定电话：</span>
					<span class="rightinfo"><input class="input" name="gudingdianhua" readonly="readonly" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">联系人Email：</span>
					<span class="rightinfo"><input class="input" name="email" readonly="readonly" type="text" ></span>
				</div>
				 
				<div class="revise" id="qyxxxgan" style="display:block"><a href="javascript:qyxxsubmit()">确认</a></div>
		 </form>
			</div>
			
			<!-- 债权信息    用户为企业时显示    -->
			<div id="zaiquanxinxi" class="vipinfo" style="display:none">
				<div class="title"><li>已申请的债权融资<span id="zaiquanxinxi-insert" onclick="zqrzsq()" class="update">债权融资申请</span></li></div>
				<table id="TBzq" align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TTjc">
						 
						<td width="50">申请人</td>
						<td width="150">产品名称</td>
						<td width="100">申请金额</td>
						<td width="150">状态</td>
						<td width="120">操作</td>
					</tr>
				 
				</table>
			<!-- 	<table width="980" id="TBszq1" align="center" border="0" cellpadding="0" cellspacing="0" style="margin-left: 550px;">
					<tr height="30">
						<td>
							<input type="button" id="CreateTBssszq" value="添加" />
							<input type="button" onclick="chkFunzq()" value="反选" />
							<input type="button" onclick="delzq('chk')" value="多选删除" />
						</td>
					</tr>
				</table>
				 -->
				

			</div>
			 
	
			 
			 	<!-- 债权信息修改    用户为企业时显示    -->
			<div id="zaiquanxinxi-update" class="vipinfo" style="display:none">
			
					<form id="zaiquanxinxiform" action="" method="post">
			
				<div class="title"><li>债权信息修改</li></div>
				<input type="hidden" name="id"/>
				<div class="inputtest">
					<span class="leftname">申请人：</span>
					<span class="rightinfo"><input class="input" name="userid" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">申请人名称：</span>
					<span class="rightinfo"><input class="input" name="username" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">产品编号：</span>
					<span class="rightinfo"><input class="input" name="prodid" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">产品名称：</span>
					<span class="rightinfo"><input class="input" name="prodname" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">企业名称：</span>
					<span class="rightinfo"><input class="input" name="qiyemingcheng" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">申请金额：</span>
					<span class="rightinfo"><input class="input" name="loanamt" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">贷款用途：</span>
					<span class="rightinfo"><input class="input" name="loanuser" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">法人：</span>
					<span class="rightinfo"><input type="text" class="input" name="faren" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">成立日期：</span>
					<span class="rightinfo"><input type="text" class="input" name="chengliriqi"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">注册资本(万元)：</span>
					<span class="rightinfo"><input type="text" class="input" name="zhuceziben"  ></span>
				</div>

				<div class="inputtest">
					<span class="leftname">工商注册地：</span> 
					<span class="rightinfo">
						<select class="select" name="gszcd" id="asdfss">
							<option value="">--  请选择  --</option>
							<option value="">工商注册地1</option>
							<option value="">工商注册地2</option>
							<option value="">工商注册地3</option>
							<option value="">工商注册地4</option>
						</select>
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">所属行业：</span> 
					<span class="rightinfo">
						<select class="select" name="hangyeid" id="fasdf">
							<option value="">--  请选择  --</option>
							<option value="">所属行业1</option>
							<option value="">所属行业2</option>
							<option value="">所属行业3</option>
							<option value="">所属行业4</option>
						</select>
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">专利情况：</span>
					<span class="rightinfo"><input class="input" name="zhuanli" type="text" ></span>
				</div>
		 
				<div class="inputtest">
					<span class="leftname">上年度销售收入：</span>
					<span class="rightinfo"><input class="input" name="lastsellincome" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">上年度净利润：</span>
					<span class="rightinfo"><input class="input" name="lastimcome" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">截止上年度银行贷款：</span>
					<span class="rightinfo"><input class="input" name="lastloanamt" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">本年度销售收入：</span>
					<span class="rightinfo"><input class="input" name="sellincome" type="text" ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">本年度净利润：</span>
					<span class="rightinfo"><input class="input" name="imcome" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">本年度银行贷款：</span>
					<span class="rightinfo"><input class="input" name="loanamt2" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">联系人：</span>
					<span class="rightinfo"><input class="input" name="lianxiren" type="text"  ></span>
				</div>
				<div class="inputtest">
					<span class="leftname">联系电话：</span>
					<span class="rightinfo"><input type="text" class="input" name="lianxidianh"  ></span>
				</div>

				<div class="revise" id="zqxxxgan" onclick="javascript:zqxxsubmit()"><a href="">确认</a></div>
			</form>
		</div>
			 
		 
			
			<!-- 股权项目信息    用户为企业时显示    -->
			<div id="guquanxiangmuxinxi" class="vipinfo"  style="display:none">
				<div class="title"><li>股权项目信息<span id="gqxx-update" class="update">股权项目信息修改</span></li></div>

				<div class="inputtest">
					<span class="leftname">项目名称：</span>
					<span class="rightinfo">项目名称</span>
				</div>
				<div class="inputtest">
					<span class="leftname">核心竞争力：</span>
					<span class="rightinfo indent">项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介</span>
				</div>
				<div class="inputtest">
					<span class="leftname">项目/产品简介：</span>
					<span class="rightinfo indent">项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品</span>
				</div>
				<div class="inputtest">
					<span class="leftname">行业：</span>
					<span class="rightinfo">金融业</span>
				</div>
				<div class="inputtest">
					<span class="leftname">融资额度（万元）：</span>
					<span class="rightinfo">10000</span>
				</div>
				<div class="inputtest">
					<span class="leftname">出让股权比例（%）：</span>
					<span class="rightinfo">30%</span>
				</div>
				<div class="inputtest">
					<span class="leftname">项目所处阶段：</span>
					<span class="rightinfo">上市筹备期</span>
				</div>
				<div class="inputtest">
					<span class="leftname">标签：</span>
					<span class="rightinfo">高成长，新兴产业</span>
				</div>
				<div class="inputtest">
					<span class="leftname">附件路径：</span>
					<span class="rightinfo">aa</span>
				</div>
			</div>
			
			<!-- 股权项目信息修改    用户为企业时显示    -->
			<div id="guquanxinxi-update1" class="vipinfo" style="display:none">
				<div class="title"><li>债权信息修改</li></div>
				<div class="inputtest">
					<span class="leftname">项目名称：</span>
					<span class="rightinfo"><input type="text" class="input" name="" value="项目名称"></span>
				</div>
				<div class="inputtest">
					<span class="leftname">核心竞争力：</span>
					<span class="rightinfo indent"><textarea>核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力核心竞争力</textarea></span>
				</div>
				<div class="inputtest">
					<span class="leftname">项目/产品简介：</span>
					<span class="rightinfo indent"><textarea>项目/产品项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介项目/产品简介</textarea></span>
				</div>
				<div class="inputtest">
					<span class="leftname">行业：</span>
					<span class="rightinfo"><input type="text" class="input" name="" value="金融业"></span>
				</div>
				<div class="inputtest">
					<span class="leftname">融资额度（万元）：</span>
					<span class="rightinfo"><input type="text" class="input" name="" value="10000"></span>
				</div>
				<div class="inputtest">
					<span class="leftname">出让股权比例（%）：</span>
					<span class="rightinfo"><input type="text" class="input" name="" value="30%"></span>
				</div>
				<div class="inputtest">
					<span class="leftname">项目所处阶段：</span> 
					<span class="rightinfo">
						<select class="select" name="" id="asdfsss">
							<option value="">--  请选择  --</option>
							<option value="">上市筹备中</option>
						</select>
					</span>
				</div>
				<div class="inputtest">
					<span class="leftname">标签：</span>
					<span class="rightinfo"><input type="text" class="input" name="" value="高成长，新兴产业"></span>
				</div>
				<div class="inputtest">
					<span class="leftname">附件路径：</span>
					<span class="rightinfo"><input type="text" class="input" name="" value="aa"></span>
				</div>
				
				

				<div class="revise"><a href="../">确认</a></div>
			</div>
			
			<!-- 股权项目进程     用户为企业时显示    -->
			<div id="guquanxinxi-update2" class="vipinfo" style="display:none">
				<div class="title"><li>股权项目进程</li></div>
				<table id="TBjc" align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TTjc">
						<td width="10"><input type="checkbox" onclick="chkjc('all',this)" /></td>
						<td width="50">事件进程时间点</td>
						<td width="150">事件进程内容</td>
						<td width="10">操作</td>
					</tr>
					<tr><td><input type="checkbox" name="ck"></td><td><div>name</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>info</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><input type="button" value="修改" class="editjc"><input type="button" value="删除" onclick="deljc(this)"></td></tr>
					<tr><td><input type="checkbox" name="ck"></td><td><div>name</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>info</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><input type="button" value="修改" class="editjc"><input type="button" value="删除" onclick="deljc(this)"></td></tr>
					<tr><td><input type="checkbox" name="ck"></td><td><div>name</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>info</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><input type="button" value="修改" class="editjc"><input type="button" value="删除" onclick="deljc(this)"></td></tr>

				</table>
				<table width="980" id="TBsjc1" align="center" border="0" cellpadding="0" cellspacing="0" style="margin-left: 550px;">
					<tr height="30">
						<td>
							<input type="button" id="CreateTBsssjc" value="添加" />
							<input type="button" onclick="chkFunjc()" value="反选" />
							<input type="button" onclick="deljc('chk')" value="多选删除" />
						</td>
					</tr>
				</table>
				<script type="text/javascript">


					function CreateTBsjc(){
						var oTB = document.getElementById("TBjc");
						i++;
					}

					//Delete TR
					function deljc(o){
						var oTB = document.getElementById("TBjc");
						var oInpt = oTB.getElementsByTagName("input");
						if (o == 'chk')
						{
							if (confirm("删除的数据将无法被恢复，请您谨慎操作...")) {
								for (var i=1; i<oInpt.length ; i++)
								{
									if (oInpt[i].type == 'checkbox' && oInpt[i].checked)
									{
										var oRow = oInpt[i].parentNode.parentNode.sectionRowIndex;
										oTB.deleteRow(oRow);
										i--;
									}
								}
							}
							else {
								return false;
							}
							
						}else{
							//利用对话框返回的值 （true 或者 false）
							if (confirm("删除的数据将无法被恢复，请您谨慎操作...")) {
								var oDel = o.parentNode.parentNode.sectionRowIndex;
								oTB.deleteRow(oDel);
							}
							else {
								return false;
							}
						}
					}

					//Check All
					function chkjc(type,o){
						var oInpt = document.getElementsByTagName("input");
						for (var i=0; i<oInpt.length; i++){
							if (oInpt[i].type == "checkbox"){
								oInpt[i].checked = o.checked;
							}
						}
					}

					//Check Fan
					function chkFunjc(){
						var oTB = document.getElementById("TBjc");
						var oInpt = oTB.getElementsByTagName("input");
						for (var i=1; i<oInpt.length; i++){
							if (oInpt[i].type == "checkbox"){
								if (oInpt[i].checked)
								{
									oInpt[i].checked = false;
								}else{
									oInpt[i].checked = true;
								}
							}
						}
					}


					$("#file0").change(function(){
						var objUrl = getObjectURL(this.files[0]) ;
						console.log("objUrl = "+objUrl) ;
						if (objUrl) {
							$("#img0").attr("src", objUrl) ;
						}
					});
					//建立一個可存取到該file的url
					function getObjectURL(file) {
						var url = null ;
						if (window.createObjectURL!=undefined) { // basic
							url = window.createObjectURL(file) ;
						} else if (window.URL!=undefined) { // mozilla(firefox)
							url = window.URL.createObjectURL(file) ;
						} else if (window.webkitURL!=undefined) { // webkit or chrome
							url = window.webkitURL.createObjectURL(file) ;
						}
						return url ;
					}


				</script>
				
				
			</div>
			<!-- 股权项目进程修改   用户为企业时显示    -->
			<div class="tabletanchuang1" style="display: none" id="qgxmjcxg">
				<div class="title"><li>股权项目进程修改</li></div>
				<form action="">
					<div class="inputtest">
						<span class="leftname">事件进程时间点：</span>
						<span class="rightinfo"><input type="text" class="input" name="" value="事件进程"></span>
					</div>
					<div class="inputtest">
						<span class="leftname">事件进程内容：</span>
						<span class="rightinfo"><textarea>事件进程内容事件进程内容事件进程内容事件进程内容事件进程内容事件进程内容</textarea></span>
					</div>
					<div class="revise"><a href="../">确认</a></div>
				</form>
			</div>
			<!-- 股权项目进程添加   用户为企业时显示    -->
			<div class="tabletanchuang1" style="display: none" id="gqxmjctj">
				<div class="title"><li>股权项目进程添加</li></div>
				<form action="">
					<div class="inputtest">
						<span class="leftname">事件进程时间点：</span>
						<span class="rightinfo"><input type="text" class="input" name="" value="事件进程"></span>
					</div>
					<div class="inputtest">
						<span class="leftname">事件进程内容：</span>
						<span class="rightinfo"><textarea>事件进程内容事件进程内容事件进程内容事件进程内容事件进程内容事件进程内容</textarea></span>
					</div>
					<div class="revise"><a href="../">确认添加</a></div>
				</form>
			</div>

			
			<!-- 股权项目成员   用户为企业时显示    -->
			<div id="guquanxinxi-update3" class="vipinfo" style="display:none">
				<div class="title"><li>股权项目成员</li></div>

				<table id="TB" align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TT">
						<td width="10"><input type="checkbox" onclick="chk('all',this)" /></td>
						<td width="40">姓名</td>
						<td width="40">图片</td>
						<td width="100">介绍</td>
						<td width="20">操作</td>
					</tr>
					<tr><td><input type="checkbox" name="ck"></td><td><div>name</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div><img src="../image/box/inc_infobg.jpg" alt=""></div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>info</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><input type="button" value="修改" class="edit"><input type="button" value="删除" onclick="del(this)"></td></tr>
					<tr><td><input type="checkbox" name="ck"></td><td><div>name</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div><img src="../image/box/inc_infobg.jpg" alt=""></div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>info</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><input type="button" value="修改" class="edit"><input type="button" value="删除" onclick="del(this)"></td></tr>
					<tr><td><input type="checkbox" name="ck"></td><td><div>name</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div><img src="../image/box/inc_infobg.jpg" alt=""></div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>info</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><input type="button" value="修改" class="edit"><input type="button" value="删除" onclick="del(this)"></td></tr>

				</table>
				<table width="980" id="TBs" align="center" border="0" cellpadding="0" cellspacing="0" style="margin-left: 550px;">
					<tr height="30">
						<td>
							<input type="button" id="CreateTBsss" value="添加" />
							<input type="button" onclick="chkFun()" value="反选" />
							<input type="button" onclick="del('chk')" value="多选删除" />
						</td>
					</tr>
				</table>
				<script type="text/javascript">


					function CreateTBs(){
						var oTB = document.getElementById("TB");
						i++;
					}

					//Delete TR
					function del(o){
						var oTB = document.getElementById("TB");
						var oInpt = oTB.getElementsByTagName("input");
						if (o == 'chk')
						{
							if (confirm("删除的数据将无法被恢复，请您谨慎操作...")) {
								for (var i=1; i<oInpt.length ; i++)
								{
									if (oInpt[i].type == 'checkbox' && oInpt[i].checked)
									{
										var oRow = oInpt[i].parentNode.parentNode.sectionRowIndex;
										oTB.deleteRow(oRow);
										i--;
									}
								}
							}
							else {
								return false;
							}
							
						}else{
							//利用对话框返回的值 （true 或者 false）
							if (confirm("删除的数据将无法被恢复，请您谨慎操作...")) {
								var oDel = o.parentNode.parentNode.sectionRowIndex;
								oTB.deleteRow(oDel);
							}
							else {
								return false;
							}
						}
					}

					//Check All
					function chk(type,o){
						var oInpt = document.getElementsByTagName("input");
						for (var i=0; i<oInpt.length; i++){
							if (oInpt[i].type == "checkbox"){
								oInpt[i].checked = o.checked;
							}
						}
					}

					//Check Fan
					function chkFun(){
						var oTB = document.getElementById("TB");
						var oInpt = oTB.getElementsByTagName("input");
						for (var i=1; i<oInpt.length; i++){
							if (oInpt[i].type == "checkbox"){
								if (oInpt[i].checked)
								{
									oInpt[i].checked = false;
								}else{
									oInpt[i].checked = true;
								}
							}
						}
					}


					$("#file0").change(function(){
						var objUrl = getObjectURL(this.files[0]) ;
						console.log("objUrl = "+objUrl) ;
						if (objUrl) {
							$("#img0").attr("src", objUrl) ;
						}
					});
					//建立一個可存取到該file的url
					function getObjectURL(file) {
						var url = null ;
						if (window.createObjectURL!=undefined) { // basic
							url = window.createObjectURL(file) ;
						} else if (window.URL!=undefined) { // mozilla(firefox)
							url = window.URL.createObjectURL(file) ;
						} else if (window.webkitURL!=undefined) { // webkit or chrome
							url = window.webkitURL.createObjectURL(file) ;
						}
						return url ;
					}

					
				</script>
			</div>
			<!-- 股权项目成员信息修改   用户为企业时显示    -->
			<div class="tabletanchuang2" style="display: none" id="gqxmcyxxxg">
				<div class="title"><li>股权项目成员信息修改</li></div>
				<form action="">
					<div class="inputtest">
						<span class="leftname">姓名：</span>
						<span class="rightinfo"><input type="text" class="input" name="" value="金融业"></span>
					</div>
					<div class="inputtest">
						<span class="leftname">图片：</span>
						<span class="rightinfo file"><input type="file"></span>
					</div>
					<div class="inputtest">
						<span class="leftname">介绍：</span>
						<span class="rightinfo"><textarea>的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的</textarea></span>
					</div>
					<div class="revise"><a href="../">确认</a></div>
				</form>
			</div>
			<!-- 股权项目成员信息添加   用户为企业时显示    -->
			<div class="tabletanchuang2" style="display: none" id="gqxmcyxxtj">
				<div class="title"><li>股权项目成员信息添加</li></div>
				<form action="">
					<div class="inputtest">
						<span class="leftname">姓名：</span>
						<span class="rightinfo"><input type="text" class="input" name="" value="金融业"></span>
					</div>
					<div class="inputtest">
						<span class="leftname">图片：</span>
						<span class="rightinfo file"><input type="file"></span>
					</div>
					<div class="inputtest">
						<span class="leftname">介绍：</span>
						<span class="rightinfo"><textarea>的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的的所发生的</textarea></span>
					</div>
					<div class="revise"><a href="../">确认添加</a></div>
				</form>
			</div>
			
			 <!--培训活动   所有用户显示    -->
			<div id="peixunhuodong" class="vipinfo" style="display:none">
				<div class="title"><li>培训活动<span id="CreateTBpxhd" class="update">培训活动报名</span></li></div>

				<table id="TBpxhd" align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TT">
 						<td  >活动名称</td>
 						<td >名字</td>
						<td  >电话</td>
						<td >岗位</td>
						<td  >开始日期</td>
						<td >操作</td>
					</tr>
					<tr><td>创新创业大赛</td><td><div>name</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>178888888888</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>info</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td>2016-12-12</td><td><input type="button" value="修改" class="pxhdjs"><input type="button" value="取消报名" onclick="delpxhd(this)"></td></tr>
					<tr><td>创新创业大赛</td><td><div>name</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>178888888888</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>info</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td>2016-12-12</td><td><input type="button" value="修改" class="pxhdjs"><input type="button" value="取消报名" onclick="delpxhd(this)"></td></tr>
					<tr><td>创新创业大赛<td><div>name</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>178888888888</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td><div>info</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td><td>2016-12-12</td><td><input type="button" value="修改" class="pxhdjs"><input type="button" value="取消报名" onclick="delpxhd(this)"></td></tr>

				</table>
			 
				<script type="text/javascript">

 
 

					//Check All
					function chkpxhd(type,opxhd){
						var oInptpxhd = document.getElementsByTagName("input");
						for (var i=0; i<oInptpxhd.length; i++){
							if (oInptpxhd[i].type == "checkbox"){
								oInptpxhd[i].checked = opxhd.checked;
							}
						}
					}

					//Check Fanpxhd
					function chkFunpxhd(){
						var oTBpxhd = document.getElementById("TBpxhd");
						var oInptpxhd = oTBpxhd.getElementsByTagName("input");
						for (var i=1; i<oInptpxhd.length; i++){
							if (oInptpxhd[i].type == "checkbox"){
								if (oInptpxhd[i].checked)
								{
									oInptpxhd[i].checked = false;
								}else{
									oInptpxhd[i].checked = true;
								}
							}
						}
					}

				</script>
			</div>
			<!-- 培训活动信息修改   用户为企业时显示    -->
			<div class="tabletanchuangpxhd" style="display: none" id="pxhdxg">
				<div class="title"><li>培训活动信息修改</li></div>
				<form action="">
					<div class="inputtest">
						<span class="leftname">活动名称：</span>
						<span class="rightinfo"><input type="text" class="input" name="" value="小东"></span>
					</div>
					<div class="inputtest">
						<span class="leftname">名字：</span>
						<span class="rightinfo"><input type="text" class="input" name="" value="小东"></span>
					</div>
					<div class="inputtest">
						<span class="leftname">电话：</span>
						<span class="rightinfo file"><input type="text" class="input" name="" value="17888888888"/></span>
					</div>
					<div class="inputtest">
						<span class="leftname">岗位：</span>
						<span class="rightinfo"><input type="text" class="input" name="" value="技术部门"/></span>
					</div>
					<div class="revise"><a href="../">确认</a></div>
				</form>
			</div>
			<!-- 培训活动信息添加   用户为企业时显示    -->
			<div class="tabletanchuangpxhd" style="display: none" id="pxhdtj">
				<div class="title"><li>培训活动信息添加</li></div>
				<form action="">
					<div class="inputtest">
						<span class="leftname">活动名称：</span>
						<span class="rightinfo"><input type="text" class="input" name="" value="小东"></span>
					</div>				
					<div class="inputtest">
						<span class="leftname">名字：</span>
						<span class="rightinfo"><input type="text" class="input" name="" value="小东"></span>
					</div>
					<div class="inputtest">
						<span class="leftname">电话：</span>
						<span class="rightinfo file"><input type="text" class="input" name="" value="17888888888"/></span>
					</div>
					<div class="inputtest">
						<span class="leftname">岗位：</span>
						<span class="rightinfo"><input type="text" class="input" name="" value="技术部门"/></span>
					</div>
					<div class="revise"><a href="../">确认</a></div>
				</form>
			</div>


			<!-- 已订阅的增值服务  企业用户显示   --> 	<!-- &nbsp;&nbsp;&nbsp;&nbsp;<span class="zhuozhong">*</span> -->
			<div id="zengzhifuwu" class="vipinfo" style="display:none">
				<div class="title"><li>已订阅的增值服务</li></div>
				<table id="TBzzfw" align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TTjc">
 						<td width="150">增值业务名称</td>
						<td width="80">申请状态</td>
						<td width="50">审核人</td>
						<td width="50">操作</td>

					</tr>
					
					<!-- 
					<tr><td><input class="checkbox" type="checkbox" name="ck"></td><td><div>赢创动力科技金融服务平台</div><center>
						<input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td>
						<td><div>申请中</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td>
						<td><div>小东</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td>
						<td><input type="button" class="zqck" onclick="ckzzfw()" value="查看">
							<input type="button" class="btn-typesss" value="删除" onclick="delzzfw(this)"></td></tr>
					<tr><td><input class="checkbox" type="checkbox" name="ck"></td><td><div>赢创动力科技金融服务平台</div><center>
						<input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td>
						<td><div>申请中</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td>
						<td><div>小东</div><center><input type="text" style="display:none; width:85%; height:22px; text-align:center;"></center></td>
						<td><input type="button" class="zqck" onclick="ckzzfw()" value="查看">
							<input type="button" class="btn-typesss" value="删除" onclick="delzzfw(this)"></td></tr>
 					-->
					<div id="type-dialogBox"></div>
						
						
				</table>
				<!-- 
				<table width="980" id="TBszzfw1" align="center" border="0" cellpadding="0" cellspacing="0" style="margin-left: 550px;">
					<tr height="30">
						<td>
							<input type="button" id="CreateTBssszzfw" value="添加" />
							<input type="button" onclick="chkFunzzfw()" value="反选" />
							<input type="button" class="btn-typesss" onclick="delzzfw('chk')" value="多选删除" />
						</td>
					</tr>
				</table>
				 -->
				<script type="text/javascript">
					function CreateTBszzfw(){
						var oTB = document.getElementById("TBzzfw");
						i++;
					}
					function ckzzfw(){
						$("#zengzhifuwuxq").css("display","block");
						$("#zengzhifuwuxq").prevAll(".vipinfo").css("display","none");
						$("#zengzhifuwuxq").nextAll(".vipinfo").css("display","none");
					};
					function delzzfw(o){
						//利用对话框返回的值 （true 或者 false）  
						
					}
					//Delete TR
					function delzzfw(o){	

						

						//利用对话框返回的值 （true 或者 false）
						var oTB = document.getElementById("TBzzfw");
						var oInpt = oTB.getElementsByTagName("input");
						if (o == 'chk'){
							if (confirm("删除的数据将无法被恢复，请您谨慎操作...")) {
								for (var i=1; i<oInpt.length ; i++) {
									if (oInpt[i].type == 'checkbox' && oInpt[i].checked){
										var oRow = oInpt[i].parentNode.parentNode.sectionRowIndex;
										oTB.deleteRow(oRow);
										i--;
									}
								}
							}else{
								return false;
							}
						}else{
								//利用对话框返回的值 （true 或者 false）
							if (confirm("删除的数据将无法被恢复，请您谨慎操作...")) {
								var oDel = o.parentNode.parentNode.sectionRowIndex;
								oTB.deleteRow(oDel);
							}
							else {
								return false;
							}
						}
					}	
					
					
					//Check All
					function chkzzfw(type,o){
						var oInpt = document.getElementsByTagName("input");
						for (var i=0; i<oInpt.length; i++){
							if (oInpt[i].type == "checkbox"){
								oInpt[i].checked = o.checked;
							}
						}
					}
					//Check Fan
					function chkFunzzfw(){
						var oTB = document.getElementById("TBzzfw");
						var oInpt = oTB.getElementsByTagName("input");
						for (var i=1; i<oInpt.length; i++){
							if (oInpt[i].type == "checkbox"){
								if (oInpt[i].checked)
								{
									oInpt[i].checked = false;
								}else{
									oInpt[i].checked = true;
								}
							}
						}
					}
				</script>


			</div>
			<div class="vipinfo" id="zengzhifuwuxq" style="display:none">
				<div class="title"><li>已订阅的增值服务</li></div>

				<div class="inputtest">
					<span class="leftname">增值业务产品编号：</span>
					<span class="rightinfo">888888</span>
				</div>
				<div class="inputtest">
					<span class="leftname">用户编号：</span>
					<span class="rightinfo">666666</span>
				</div>
				<div class="inputtest">
					<span class="leftname">用户名称：</span>
					<span class="rightinfo">赢创动力科技金融服务平台</span>
				</div>
				<div class="inputtest">
					<span class="leftname">申请状态：</span>
					<span class="rightinfo">已申请</span>
				</div>
				<div class="inputtest">
					<span class="leftname">审核人：</span>
					<span class="rightinfo">小东</span>
				</div>
				<div class="inputtest">
					<span class="leftname">录入时间：</span>
					<span class="rightinfo">2016-05-05</span>
				</div>
			</div>
			
			
			
	</div>
</div>





</div>
 <%@ include file="../footer.jsp"%>

</body>
</html>
 