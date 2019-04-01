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
		
			 
	<div class="vipinfo" id="qiyexinxi">
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




		</div>
	</div>
</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("regiinfo");
 </script>
</body>
</html>
 