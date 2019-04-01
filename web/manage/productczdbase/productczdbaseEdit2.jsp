<%@page import="com.winpow.services.manage.catalog.bean.Catalog"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />

<style>
#insertOrUpdateMsg{
border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;
background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;
}
select{height:auto;}
</style>


<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="../css/progressBar.css"/>
<link rel="stylesheet" href="../css/massage.css"/>
<script src="../js/jquery.min.js"></script> 
<script src="../js/message2.js"></script> 
 

</head>

<body>
 <s:form action="productczdbase!update.action" id="form" name="form" namespace="/manage" theme="simple"   method="post">
 
	<div class="navbar navbar-inverse" >
		<div id="insertOrUpdateMsg">
			<s:property value="#session.insertOrUpdateMsg"/>
			<%request.getSession().setAttribute("insertOrUpdateMsg", "");//列表页面进行编辑文章的时候,需要清空信息 %>
		</div>
	</div>
	
	<span id="pifeSpan" class="input-group-addon" style="display:none"><%=SystemManager.systemSetting.getImagerootpath()%></span>
 

		 
		 <!-- 流程进度条 -->
	 <div class="project-screening">
		<div class="project-screening-yellow"></div>
		<div class="select-1-yellow"></div>
		<div  id="step1" class="screening-select select-1 current"><span>1</span><a href="javascript:void(0)">初审通过</a></div>
		<div  id="step2"  class="screening-select select-2" selval="4,6"><span>2</span><a href="javascript:void(0)" >资料审查通过</a></div>
		<div  id="step3"  class="screening-select select-3" selval="6,7"><span>3</span><a href="javascript:void(0)">项目评审会评审通过</a></div>
		<div  id="step4"  class="screening-select select-4" selval="7,10"><span>4</span><a href="javascript:void(0)" >担保公司审批通过</a></div>
		<div  id="step5"  class="screening-select select-5" selval="10,-1"><span>5</span><a href="javascript:void(0)" >银行审批通过</a></div>
		<div  id="step6"  class="screening-select select-6" selval="10,-1"><span>6</span><a href="javascript:void(0)" >金融办审批通过</a></div>
		<div  id="step7"  class="screening-select select-7" selval="10,-1"><span>7</span><a href="javascript:void(0)" >银行放贷成功</a></div>
	</div>

	<script type="text/javascript">
    $(document).ready(function(){
        var step = "<s:property value='e.status'/>";
        if(step==0){
        	
        }else if(step == 10){
        	step = 1;
        }else if(step == 20){
        	step = 1;
        }else if(step == 30){
        	step = 2;
        }else if(step == 40){
        	step = 3;
        }else if(step == 50){
        	step = 4;
        }else if(step == 60){
        	step = 5;
        }else if(step == 70){
        	step = 6;
        }else if(step == 80){
        	step = 7;
        }else{
        	step =1;
        }
        
        for(var i=1;i<=step;i++){
            refresh(i);
        }
        
    });

    function refresh(value){
            var _parent = $("#step"+value+"");
        var _postX = _parent.position().left+65;
        _parent.siblings(".screening-select").removeClass("current");

        _parent.siblings(".project-screening-yellow").animate({ width: _postX }, 300);

        _parent.siblings(".select-1-yellow").animate({ left: _postX -75 }, 300,function(){
            _parent.addClass("redbg");
            _parent.prevAll(".screening-select").addClass("redbg");
            _parent.addClass("current");
        });

        //_parent.nextAll().removeAttr("style");
    }
    </script>
		 
		 
		 
		 	<div style="text-align: center;margin-bottom:20px;">
			<div id="updateMsg"><font color='red'><s:property value="updateMsg" /></font></div>
			<s:if test="e.id=='' or e.id==null">
				<button method="productczdbase!insert.action" class="btn btn-success">
					<i class="icon-ok icon-white"></i> 新增
				</button>
			</s:if> 
			<s:else>
				用户ID：<span class="badge badge-success"><s:property value="e.id"/></span>
				<button method="productczdbase!update.action" class="btn btn-success" >
					<i class="icon-ok icon-white"></i> 保存
				</button>
 
			 
			</s:else>
			<!-- <button type="button" class="btn btn-danger" id="backstep" style="margin-left:20px;">
					<i class="icon-ok icon-error"></i> 驳回
			</button>
			<button type="button" class="btn btn-info btnnextstep" style="margin-left:20px;">
					<i class="icon-ok icon-white"></i> 下一步
			</button> -->
		<!-- <input type="button" class="btnnextstep"  value="下一步"> -->	
		</div>
		
		
		
		<div id="tabs">
		
			<ul>
				   <li><a href="#tabs-1">基本信息</a></li>
				 
 
			</ul>
			
			 
		<div id="tabs-1">
				 <table class="table table-bordered">
		 
			 
			  <tr >
				<td colspan="4" style="background-color: #dff0d8" >	
				&nbsp;关键信息
				</td>
			</tr>
			 					 
			  	<tr>
				<th class="td_right">贷款品种</th>
				<td style="text-align: left;">  
		        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
				
				<s:select list="#{'成长贷':'成长贷','壮大贷':'壮大贷','新创贷':'新创贷','开行统借统还贷款':'开行统借统还贷款','口行统借统还贷款':'口行统借统还贷款'}" id="daikuanpingz" name="e.daikuanpingz"  cssClass="input-medium" 
						listKey="key" listValue="value"  headerKey="" headerValue=""  data-rule="贷款品种:required;daikuanpingz"/>
				
				</td>
			 
				<th class="td_right">申请贷款期限（月）</th>
				<td style="text-align: left;">
				<s:textfield name="e.daikuanqixian"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="daikuanqixian" readonly="false" data-rule="申请贷款期限:required;daikuanqixian;length[1~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">贷款银行</th>
				<td style="text-align: left;">
							
				<s:select list="#{'国家开发银行':'国家开发银行','进出口银行':'进出口银行','盈创动力分配银行':'盈创动力分配银行','成都银行科技支行':'成都银行科技支行','成都银行高新支行':'成都银行高新支行','盈创动力分配银行':'盈创动力分配银行','成都银行营业部':'成都银行营业部','成都银行华兴支行':'成都银行华兴支行','成都银行高新支行':'成都银行高新支行','成都银行琴台支行':'成都银行琴台支行','成都银行金河支行':'成都银行金河支行','成都银行长顺支行':'成都银行长顺支行','成都银行锦江支行':'成都银行锦江支行','成都银行成华支行':'成都银行成华支行','成都银行武侯支行':'成都银行武侯支行','成都银行德盛支行':'成都银行德盛支行','成都银行青羊支行':'成都银行青羊支行','成都银行高升桥支行':'成都银行高升桥支行','成都银行金牛支行':'成都银行金牛支行','成都银行沙湾支行':'成都银行沙湾支行','成都银行体育场路支行':'成都银行体育场路支行','成都银行科技支行':'成都银行科技支行','成都银行双流支行':'成都银行双流支行','工行高新支行':'工行高新支行'}" id="daikuanyinhang" name="e.daikuanyinhang"  cssClass="input-medium" 
													listKey="key" listValue="value"  headerKey="" headerValue=""  data-rule="贷款银行:required;daikuanyinhang"/>
					
					
				</td>
			 
				<th class="td_right">担保公司</th>
				<td style="text-align: left;">


					<s:select list="#{'无':'无','成都中小担':'成都中小担','成都高投担':'成都高投担'}" id="danbaogongsi" name="e.danbaogongsi"  cssClass="input-medium" 
										listKey="key" listValue="value"  headerKey="" headerValue="" data-rule="担保公司:required;danbaogongsi;length[1~32]" />
		
						</td>
				</tr>
 			<!-- <tr>
				<th class="td_right">金融信用情况<br/>（有无银行贷款违约情况）</th>
				<td style="text-align: left;" colspan="3" >
				<s:textarea rows="3" cols="90" name="e.jinrongxinyong" id="jinrongxinyong" readonly="false" data-rule="金融信用情况:required;jinrongxinyong;length[1~2000]"/>
				</td>
			 </tr>
 				
 								<tr>
				<th class="td_right">公共信用情况<br/>（有无法院强制执行、<br/>税务稽查、工商执法、<br/>环保事故、安全生产事故<br/>等情况）</th>
				<td style="text-align: left;" colspan="3">
				<s:textarea rows="2" cols="80" name="e.gonggongxinyong" id="gonggongxinyong" readonly="false" data-rule="公共信用情况:required;gonggongxinyong;length[1~2000]"/>
				
				</td>
				</tr>	 -->	
				
				<tr>
				
				<th class="td_right">申请金额(万元)</th>
				<td style="text-align: left;">
				<s:textfield name="e.shenqingjine"   id="shenqingjine" readonly="false" data-rule="申请金额:required;shenqingjine;length[1~8]"/>
				</td>
				</tr>
				<tr>
				<th class="td_right">综合评价</th>
				<td style="text-align: left;" colspan="3">
				<s:textarea rows="2" cols="80" name="e.zhonghepingjia" id="zhonghepingjia" readonly="false" data-rule="综合评价:required;gonggongxinyong;length[1~2000]"/>
				
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">申请人</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield name="e.userid" id="userid" readonly="false" data-rule="申请人:required;userid;length[1~32]"/>
				</td>
			 
				 
				</tr>
 				
 				
 				
			  <tr >
				<td colspan="4" style="background-color: #dff0d8" >	
				&nbsp;审批信息
				</td>
			</tr>
			
 								<tr>
				<th class="td_right">企业名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false" data-rule="企业名称:required;qiyemingcheng;length[2~128]"/>
				</td>
		 	
		 	
		 	
					
				<th class="td_right">成立时间</th>
				<td style="text-align: left;">
 					<input id="d4311" class="Wdate search-query input-small" type="text" name="e.chengliriqi"
					value="<s:property value="e.chengliriqi" />"
					onFocus="WdatePicker()" />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">注册地</th>
				<td style="text-align: left;" colspan="3">
 				<s:textfield name="e.gszcd_province" id="gszcd_province" readonly="true"/>
				<s:textfield name="e.gszcd_city" id="gszcd_city"  readonly="true"/>
				<s:textfield name="e.gszcd_county" id="gszcd_county"   readonly="true"/>
				 
				</td>
				</tr>
 				
 				<!-- 				<tr>
				<th class="td_right">办公地址</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield name="e.bgdz" id="bgdz" readonly="false"  style="width: 80%;" data-rule="办公地址:required;bgdz;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">注册资本(万)</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield name="e.zhuceziben" id="zhuceziben" readonly="false" data-rule="注册资本:required;zhuceziben;length[1~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">生产地址</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield name="e.scdz" id="scdz" readonly="false" style="width: 80%;" data-rule="生产地址:required;scdz;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">法人代表</th>
				<td style="text-align: left;">
				<s:textfield name="e.faren" id="faren" readonly="false" data-rule="法人代表:required;faren;length[1~8]"/>
				</td>
		 
				<th class="td_right">身份证号码</th>
				<td style="text-align: left;">
				<s:textfield name="e.sfzhm" id="sfzhm" readonly="false" data-rule="身份证号码:required;sfzhm;length[1~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">联系人</th>
				<td style="text-align: left;">
				<s:textfield name="e.lianxiren" id="lianxiren" readonly="false" data-rule="联系人:required;lianxiren;length[2~16]"/>
				</td>
		 
				<th class="td_right">职务</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhiwu" id="zhiwu" readonly="false" data-rule="职务:required;zhiwu;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">电话（手机）</th>
				<td style="text-align: left;">
				<s:textfield name="e.dianhua" id="dianhua" readonly="false" data-rule="电话/传真:required;dianhua;length[2~16]"/>
				</td>
		 
				<th class="td_right">电子邮件</th>
				<td style="text-align: left;">
				<s:textfield name="e.dianzhiyoujian" id="dianzhiyoujian" readonly="false" data-rule="电子邮件:required;dianzhiyoujian;length[1~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">客户类型</th>
				<td style="text-align: left;">
				
				<s:select list="%{#application.dic.zcdkhlx.childs}" listKey="id"  
                            listValue="name" name="e.kehuleixing" label="客户类型"  
                            headerKey="" headerValue="" />  
                            
				</td>
			 
				<th class="td_right">业务来源</th>
				<td style="text-align: left;">

		<s:select list="%{#application.dic.czdywly.childs}" listKey="id"  
                            listValue="name" name="e.yewulaiyuan" label="客户类型"  
                            headerKey="" headerValue="" />  
                            
 				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">主营业务</th>
				<td style="text-align: left;" colspan="3">
				<s:textarea rows="2" cols="80" name="e.zhuyingyewu" id="zhuyingyewu" readonly="false" data-rule="主营业务:required;zhuyingyewu;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">兼营业务</th>
				<td style="text-align: left;" colspan="3">
				<s:textarea rows="2" cols="80" name="e.jianyingywu" id="jianyingywu" readonly="false" data-rule="兼营业务:required;jianyingywu;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">主营产品</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield   style="width: 80%;" name="e.zhuyingchanpin" id="zhuyingchanpin" readonly="false" data-rule="主营产品:required;zhuyingchanpin;length[1~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">兼营产品</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield   style="width: 80%;"  name="e.jianyingchanpin" id="jianyingchanpin" readonly="false" data-rule="兼营产品:required;jianyingchanpin;length[1~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业相关资质证书</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield   style="width: 80%;"  name="e.zhizhizhegnshu" id="zhizhizhegnshu" readonly="false" data-rule="企业相关资质证书:required;zhizhizhegnshu;length[1~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">专利个数</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhuanligeshu"   onkeyup="value=value.replace(/[^\d]/g,'')"  id="zhuanligeshu" readonly="false" data-rule="专利个数:required;zhuanligeshu;length[0~4]"/>
				</td>
			 
				<th class="td_right">行业归属</th>
				<td style="text-align: left;">
 				
				<s:select list="%{#application.dic.cdzhygs.childs}" listKey="id"  
                            listValue="name" name="e.hangyeguishu" label="行业归属"  
                            headerKey="" headerValue="" />  
                            
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业性质</th>
				<td style="text-align: left;">
						<s:select list="%{#application.dic.qylx.childs}" listKey="id"  
                            listValue="name" name="e.qiyexingzhi" label="行业归属"  
                            headerKey="" headerValue="" /> 
                            
 				</td>
			 
				<th class="td_right">员工总数</th>
				<td style="text-align: left;">
				<s:textfield name="e.yuangongshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="yuangongshu" readonly="false" data-rule="员工总数:required;yuangongshu;length[1~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">技术开发人员总数</th>
				<td style="text-align: left;">
				<s:textfield name="e.jishurenyuanshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="jishurenyuanshu" readonly="false" data-rule="技术开发人员总数:required;jishurenyuanshu;length[1~8]"/>
				</td>
		 
				<th class="td_right">硕士及以上人数</th>
				<td style="text-align: left;">
				<s:textfield name="e.shuoshirenshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="shuoshirenshu" readonly="false" data-rule="硕士及以上人数:required;shuoshirenshu;length[1~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">管理人员人数</th>
				<td style="text-align: left;">
				<s:textfield name="e.guanliyuanrenshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="guanliyuanrenshu" readonly="false" data-rule="管理人员人数:required;guanliyuanrenshu;length[1~8]"/>
				</td>
	 
				<th class="td_right">大专以上人数</th>
				<td style="text-align: left;">
				<s:textfield name="e.dazhuanrenshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="dazhuanrenshu" readonly="false" data-rule="大专以上人数:required;dazhuanrenshu;length[1~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">其中本科学历人数</th>
				<td style="text-align: left;">
				<s:textfield name="e.benkerenshu"   onkeyup="value=value.replace(/[^\d]/g,'')"  id="benkerenshu" readonly="false" data-rule="其中本科学历人数:required;benkerenshu;length[1~8]"/>
				</td>
				 
				<th class="td_right">中高级技术职称人数</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhonggaojirenshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="zhonggaojirenshu" readonly="false" data-rule="中高级技术职称人数:required;zhonggaojirenshu;length[1~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">本科以上人数</th>
				<td style="text-align: left;">
				<s:textfield name="e.benkeyishangrenshu"   onkeyup="value=value.replace(/[^\d]/g,'')"  id="benkeyishangrenshu" readonly="false" data-rule="本科以上人数:required;benkeyishangrenshu;length[1~8]"/>
				</td>
	 
				<th class="td_right">申请金额</th>
				<td style="text-align: left;">
				<s:textfield name="e.shenqingjine"   id="shenqingjine" readonly="false" data-rule="申请金额:required;shenqingjine;length[1~8]"/>
				</td>
				</tr>
 				
 							
 								<tr>
				<th class="td_right">贷款用途</th>
				<td style="text-align: left;" colspan="3">
				<s:textarea rows="2" cols="80" name="e.daikuanyongtu" id="daikuanyongtu" readonly="false" data-rule="贷款用途:required;daikuanyongtu;length[2~128]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">与贷款用途相关的项目情况</th>
				<td style="text-align: left;" colspan="3">
				<s:textarea rows="2" cols="80" name="e.xiangmuqingkuang" id="xiangmuqingkuang" readonly="false" data-rule="与贷款用途相关的项目情况:required;xiangmuqingkuang;length[2~1512]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">还款来源</th>
				<td style="text-align: left;" colspan="3">
				<s:textarea rows="2" cols="80" name="e.huankuanlaiyuan" id="huankuanlaiyuan" readonly="false" data-rule="还款来源:required;huankuanlaiyuan;length[2~128]"/>
				</td>
				</tr> -->
 				<!-- 
 								<tr>
				<th class="td_right">贷款联系人</th>
				<td style="text-align: left;">
				<s:textfield name="e.lianxiren2" id="lianxiren2" readonly="false" data-rule="联系人2:required;lianxiren2;length[2~16]"/>
				</td>
		 
				<th class="td_right">贷款联系人电话</th>
				<td style="text-align: left;">
				<s:textfield name="e.lianxidianh2" id="lianxidianh2" readonly="false" data-rule="联系电话2:required;lianxidianh2;length[2~16]"/>
				</td>
				</tr> -->
 				<!-- 	<tr>
				<th class="td_right">审批状态</th>
				<td style="text-align: left;">
				<s:textfield name="e.status" id="status" readonly="false" data-rule="审批状态:required;status;length[2~4]"/>
				</td> 
		 
				</tr>-->	
 				
 								<tr>
				<th class="td_right">录入时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="true" />
				</td>
			 
				<th class="td_right">录入人</th>
				<td style="text-align: left;">
				<s:textfield name="e.inputuser" id="inputuser" readonly="true"  />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">最后修改时间</th>
				<td style="text-align: left;"  >
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="true"  />
				</td>
				
				
				<th class="td_right">审核人</th>
				<td style="text-align: left;">
				<s:textfield name="e.checkuser"  readonly="true" />
				</td>
				</tr>
 				
 								
				   
		</table>
			</div>
	
		</div>
			
		 
 </s:form>
 

<script type="text/javascript">

var custtype = '<s:property value="userType"/>';
</script>

<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
<script src="<%=request.getContextPath() %>/resource/js/area.js"></script>



<script type="text/javascript">
  
var Gid  = document.getElementById ;
 

$(function() {
	$( "#tabs" ).tabs({
		//event: "mouseover"
	});
	//alert($("#insertOrUpdateMsg").html());
	if($("#insertOrUpdateMsg").html()!='' && $("#insertOrUpdateMsg").html().trim().length>0){
		$("#insertOrUpdateMsg").slideDown(1000).delay(1500).slideUp(1000);
	}
	
	
	$("#removePife").click(function(){
		clearRootImagePath();
	});
}); 
</script>

<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script> 
 
	 
 <!--点击下一步弹出发送短信对话框 start-->
<div id="ldksq">
    <div id="ldksq_c">
        <div id="ldksq_lose"></div>
        <form action="productczdbase!donextstep.action" name="indexdksq" id="indexdksq" method="post">
        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        <input type="hidden" name="e.status" id="status" value="<s:property value="e.status" />"/>
        <input type="hidden" name="e.userid" value="<s:property value="e.userid" />"/>
        <p><span>电话号码：</span><input class="title" type="text"   value="<s:property value="e.dianhua" />" name="e.dianhua" data-rule="短信标题:required;m_title;length[2~22]"></p>
        <p><span class="msgcontenttype">短信内容：</span><textarea class="duanxin" rows="4" cols="80" name="e.content" id="msgcontent"   data-rule="短信标题:required;m_remark;length[2~64]">   </textarea></p>
        <p>
        	<button id="ldksq_lose2" type="reset" class="btn btn-inverse"  style="margin-left:20px;">
				<i class="icon-ok icon-white qx"></i> 取消
			</button>
			<button type="botton" class="btn btn-success" style="margin-left:20px;">
				<i class="icon-ok icon-white"></i> 确定
			</button></p>
        </form>
    </div>
</div>

 <!--驳回
<div id="bhdksq">
    <div id="bhdksq_c">
        <div id="bhdksq_lose"></div>
        <form action="productczdbase!backstep.action" name="indexbhdksq" id="indexbhdksq" method="post">
        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        <input type="hidden" name="e.status" value="<s:property value="e.status" />"/>
        <input type="hidden" name="e.userid" value="<s:property value="e.userid" />"/>
        <p><span>电话号码：</span><input class="title" type="text"   value="<s:property value="e.dianhua" />" name="e.dianhua" data-rule="短信标题:required;m_title;length[2~22]"></p>
        <p><span>驳回原因：</span><textarea  rows="4" cols="80" name="e.content"   data-rule="短信标题:required;m_remark;length[2~64]">   </textarea></p>
        <p>
        	<button id="bhdksq_lose2" type="reset" class="btn btn-inverse"  style="margin-left:20px;">
				<i class="icon-ok icon-white qx"></i> 取消
			</button>
			<button type="botton" class="btn btn-success" style="margin-left:20px;">
				<i class="icon-ok icon-white"></i> 确定
			</button></p>
        </form>
    </div>
</div>
-->
</body>
</html>
