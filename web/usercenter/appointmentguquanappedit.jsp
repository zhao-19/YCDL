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
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/intereststep1.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<body>
<!-- t有值代表是查看 -->
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#t").val();
	//alert(t);
	
	if(t=='v'){
		$("#intereststep1").attr("action","/interestapp/tostep2.html");
		$("#intereststep1 input,radio,select,textarea,checkbox").attr('readonly',"readonly");
	$(".shenqingdkthide").attr("disabled",false);
		$(".upback").attr("disabled",false);
		//$(".shenqingdkthide").hide();
	}else{
		intereststep1();
	}
	
	$(".upback").click(function(){
	//	返回上一步
		var id=$(this).attr("lang");
		//location.href="/productczdbase/tostep2.html?e.id="+id+"&e.t="+t;
		location.href="/interestapp/selectList.html";
	});

});

function setdfb() {
	var dkje = $("#dkje").val();
	var dbfl = $("#dbfl").val();
	$("#dbf").val(parseFloat(parseFloat(dkje)*(parseFloat(dbfl/100))).toFixed(5));
};


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
	<%@ include file="../header.jsp"%>





<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="leftnav.jsp"%>
	</div>


	<div class="list fr">
		<div class="rightbox">
			
			<!-- 贴息申报    -->
			<div id="zaiquanxinxi-update" class="vipinfo" >
			
					<form id="intereststep1" action="/interestapp/insert.html" method="post">
			
				<div class="title"><li>已预约的股权信息（修改）</li></div>
				
				<input type="hidden" name="e.id" value="<s:property value='e.id'/>"/>
				<input type="hidden" name="t" id="t" value="<s:property value="#request.t"/>">
		 
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">项目图片：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.picture" type="text" value="<s:property value='e.picture'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">项目名称：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.mingcheng" type="text" value="<s:property value='e.mingcheng'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">核心竞争力：<span style="color:red">*</span></span>
					<span class="rightinfo"><textarea class="input" name="e.hexinjzl" type="text"  value="<s:property value='e.hexinjzl'/>"></textarea></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">项目/产品简介:<span style="color:red">*</span></span>
					<span class="rightinfo"><textarea class="input" name="e.jianjie" type="text"  value="<s:property value='e.jianjie'/>"></textarea></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">项目计划书：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="e.insertfile" value="<s:property value='e.insertfile'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">首页图片(179*248)：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input stext" id="faren" name="e.tuijianpic"  value="<s:property value='e.tuijianpic'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">详细页小图(606*398)：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="e.leftpic"  value="<s:property value='e.leftpic'/>"/></span>
				</div>

			 
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">详细页宽图(990*384)：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.detailpic" type="text" value="<s:property value='e.detailpic'/>"/></span>
				</div>
		 
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">行业：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.hangye" type="text"  value="<s:property value='e.hangye'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">融资额度（万元）：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.rongziedu" type="text"  value="<s:property value='e.rongziedu'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="width: 170px">融资阶段(天使轮、A轮、B轮、C轮)：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 170px"><input class="input" style="width: 170px" name="e.rongzhijieduan" type="text"  value="<s:property value='e.rongzhijieduan'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="width: 170px">出让股权比例(%)：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 170px"><input class="input" style="width: 170px" name="e.crgqbl" type="text" value="<s:property value='e.crgqbl'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="width: 170px">项目所处阶段：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 170px">
						<s:select list="%{#request.xmscjdlist}" listKey="id" 
						listValue="name" name="e.xiangmuzhuangtai" label="项目所处阶段"  
	                    headerKey="" headerValue="" />  
					</span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="width: 170px">融资状态：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 170px">
						<s:select list="%{#request.xmrzztlist}" listKey="id"  
                            listValue="name" name="e.rongzizhuangtai" label="融资状态"  
                            headerKey="" headerValue="" />  
					</span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">标签：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.biaoqian" type="text" id="dkje" value="<s:property value='e.biaoqian'/>"/></span>
				</div>
				
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">附件名：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" onchange="setdfb()" id="dbfl" name="e.fujianming" type="text"  value="<s:property value='e.fujianming'/>"/></span>
				</div>
					<div class="inputtest inputtestl">
					<span class="leftname leftnamel">附件路径：<span style="color:red">*</span></span>
					<span class="rightinfo"><input  class="input" id="dbf" name="e.fujianlujing" type="text"  value="<s:property value='e.fujianlujing'/>"/></span>
				</div><%--
				



				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">放款日期：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input laydate-icon" id="e.fksj" name="e.fksj"  value="<s:property value='e.fksj'/>"/></span>
				</div>


				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">到期日期：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input laydate-icon" name="e.dqsj" id="e.dqsj"  value="<s:property value='e.dqsj'/>"/></span>
				</div>
			
			<div class="inputtest inputtestl">
					<span class="leftname leftnamel">股权融资需求(万)：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" id="e.gqrzds" name="e.gqrzds"  value="<s:property value='e.gqrzds'/>"/></span>
				</div>


				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">债权融资需求(万)：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="e.zqrzds" id="e.zqrzds"  value="<s:property value='e.zqrzds'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">引入vcpe情况：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="e.vcpe"  value="<s:property value='e.vcpe'/>"/></span>
				</div>


				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="width: 146px;margin-right: 20px;">第三方信用评级结果：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="e.dsfxypj"  value="<s:property value='e.dsfxypj'/>"/></span>
				</div>


			<div class="inputtest inputtestl">
					<span class="leftname leftnamel">企业规模：<span style="color:red">*</span></span>
					<span class="rightinfo">
						<select class="select" name="e.qygm"  >
			                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa090" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa090").equals(request.getAttribute("e.qygm"))) { out.print("selected=selected");} %>>大</option>
			                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa091" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa091").equals(request.getAttribute("e.qygm"))) { out.print("selected=selected");} %>>中</option>
			                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa092" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa092").equals(request.getAttribute("e.qygm"))) { out.print("selected=selected");} %>>小</option>
			                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa093" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa093").equals(request.getAttribute("e.qygm"))) { out.print("selected=selected");} %>>微型</option>
		               </select> 
					</span>
			</div>
			
			<div class="inputtest inputtestl">
					<span class="leftname leftnamel">统计关系情况：<span style="color:red">*</span></span>
					<span class="rightinfo">
						<select class="select" name="e.tjgxqk" >
			               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa100" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa100").equals(request.getAttribute("e.tjgxqk"))) { out.print("selected=selected");} %>>未达到上规入库条件</option>
			               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa101" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa101").equals(request.getAttribute("e.tjgxqk"))) { out.print("selected=selected");} %>>已达到上规入库条件、且已提交入库申请</option>
			               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa102" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa102").equals(request.getAttribute("e.tjgxqk"))) { out.print("selected=selected");} %>>已达到上规入库条件、但未提交入库申请</option>
			               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa103" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa103").equals(request.getAttribute("e.tjgxqk"))) { out.print("selected=selected");} %>>已进入高新区统计表</option>
        				</select> 
					 </span>
			</div>
			

				--%><div class="revise" id="zqxxxgbtn" >
					<input class="shenqingdkt upback" type="button" value="返回"/>&nbsp;&nbsp;
					<input class="shenqingdkt shenqingdkthide" type="submit" value="下一步"/>&nbsp;&nbsp; 
				 </div>
			</form>
				</div>
							
		</div>	
		
		</div>

</div>


<script type="text/javascript">
!function(){
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	laydate({elem: '#e.fksj'});//绑定元素
	laydate({elem: '#e.dqsj'});//绑定元素
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
 	leftnav_init("appointmentguquanlist");
 </script>
</body>
</html>