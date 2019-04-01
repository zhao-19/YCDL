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
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/intereststep2.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<body>
<!-- t有值代表是查看 -->
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#t").val();
	//alert(t);
	
	if(t=='v'){
		$("#intereststep2 input,radio,select,textarea,checkbox").attr('readonly','readonly');
		$(".shenqingdkthide").attr("disabled",false);
		$(".upback").attr("disabled",false);
		$(".nextnotice").hide();
		//$(".shenqingdkthide").hide();
	}else{
		intereststep2();
	}
	
	$(".upback").click(function(){
		//第二步 返回上一步
		var id = $("#id").val()
		location.href="/interestapp/tostep1.html?id="+id+"&t="+t;
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
    .cle{clear:both;}
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
			
			<!-- 债权信息修改    用户为企业时显示    -->
			<div id="zaiquanxinxi-update" class="vipinfo" >
			
					<form id="intereststep2" action="/interestapp/updatestep2.html" method="post">
			
				<div class="title"><li>贴息申报第二步</li></div>
				
				<input type="hidden" name="e.id" id="id" value="<s:property value='e.id'/>"/>
		 		<input type="hidden" id="t" name="t" value="<s:property value="#request.t"/>">
		 
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">主营业务：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.zhuyingyewu" type="text" value="<s:property value='e.zhuyingyewu'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">所属产业：<span style="color:red">*</span></span>
					<span class="rightinfo">
						<select class="select" name="e.sscy" >
					 
		               <option <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa110".equals(request.getAttribute("e.sscy"))) { out.print("selected=selected");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa110">新一代信息技术</option>
		               <option <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa111".equals(request.getAttribute("e.sscy"))) { out.print("selected=selected");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa111">生物产业</option>
		               <option <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa112".equals(request.getAttribute("e.sscy"))) { out.print("selected=selected");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa112">高端装备制造产业</option>
		               <option <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa113".equals(request.getAttribute("e.sscy"))) { out.print("selected=selected");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa113">节能环保产业</option>
		               <option <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa114".equals(request.getAttribute("e.sscy"))) { out.print("selected=selected");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa114">其他</option>
		               </select> 
				</span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">企业类型：<span style="color:red">*</span></span>
					<span class="rightinfo">
					<select class="select" name="e.qylx" >
               <option <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120".equals(request.getAttribute("e.qylx"))) { out.print("selected=selected");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120">国有</option>
               <option <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121".equals(request.getAttribute("e.qylx"))) { out.print("selected=selected");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121">民营</option>
               <option <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122".equals(request.getAttribute("e.qylx"))) { out.print("selected=selected");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122">外资</option>
               <option <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa123".equals(request.getAttribute("e.qylx"))) { out.print("selected=selected");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa123">其他</option>
               </select> 
					</span>
				</div>
				
				
				
				
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">统计关系所在地：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="e.tjgxszd" value="<s:property value='e.tjgxszd'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="width: 146px;margin-right: 20px;">国税缴纳关系所在地：</span>
					<span class="rightinfo"><input type="text" class="input stext" id="gsjngxszd" name="e.gsjngxszd"  value="<s:property value='e.gsjngxszd'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="width: 146px;margin-right: 20px;">地税缴纳关系所在地：</span>
					<span class="rightinfo"><input type="text" class="input" name="e.dsjngxszd"  value="<s:property value='e.dsjngxszd'/>"/></span>
				</div>
				
				<%--

			 
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">银行信用等级：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.yhxydj" type="text" value="<s:property value='e.yhxydj'/>"/></span>
				</div>
		 
				--%>
				
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="height:auto;line-height: 18px;">资产总额[截止2015-12-31]：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input ibg" name="e.zcze" type="text"  value="<s:property value='e.zcze'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="height:auto;line-height: 18px;">负债总额[截止2015-12-31]：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input ibg" name="e.fzze" type="text"  value="<s:property value='e.fzze'/>"/></span>
				</div>
				<!--<div class="inputtest inputtestl">
				 	<span class="leftname leftnamel" style="width: 146px;margin-right: 20px;">出口创汇总额（万）：<span style="color:red">*</span></span> 
					<span class="rightinfo"><input class="input" name="e.ckchze" type="text"  value="<s:property value='e.ckchze'/>"/></span>
				</div>
				-->
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="width: 146px;margin-right: 20px;">产品市场占有率(%)：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input"name="e.cpsczyl" type="text"  value="<s:property value='e.cpsczyl'/>"/></span>
				</div>
				
				
				
				
				
				
				<div class="jyqkdiv">
					<div class="left"><span>经营情况：<span style="color:red">*</span></span></div>
					<div class="right">
						<div class="cle">
							<div class="ceil t"><span>年&nbsp;份</span></div>
							<div class="ceil t"><span>销售收入(万)</span></div>
							<div class="ceil t"><span>利&nbsp;润(万)</span></div>
							<div class="ceil t r" style="width:256px;"><span>税收总额[企业所得税,增值税,营业税](万)</span></div>
						</div>
						
						<div class="cle">
							<div class="ceil t"><span><s:property value="e.thirdyear"/>年</span></div>
							<div class="ceil"><input type="text"  name="e.thirdsell"   value='<s:property value="e.thirdsell"/>'/></div>
							<div class="ceil"><input type="text"  name="e.thirdinte"   value='<s:property value="e.thirdinte"/>'/></div>
							<div class="ceil r" style="width:256px;"><input style="width:252px;" type="text"  name="e.thirdtax"  value='<s:property  value="e.thirdtax"/>'/></div>
						</div>
						
						<div class="cle">
							<div class="ceil t"><span><s:property value="e.thirdyear+1"/>年</span></div>
							<div class="ceil"><input type="text" name="e.secondsell" value='<s:property  value="e.secondsell"/>'/></div>
							<div class="ceil"><input type="text" name="e.secondinte" value='<s:property  value="e.secondinte"/>'/></div>
							<div class="ceil r" style="width:256px;"><input style="width:252px;" type="text" name="e.secondtax"  value='<s:property value="e.secondtax"/>'/></div>
						</div>
						
						<div class="cle">
							<div class="ceil b t"><span><s:property value="e.thirdyear+2"/>年(预计)</span></div>
							<div class="ceil b"><input type="text" name="e.firstsell" value='<s:property value="e.firstsell"/>'/></div>
							<div class="ceil b"><input type="text" name="e.firstinte" value='<s:property value="e.firstinte"/>'/></div>
							<div class="ceil b r" style="width:256px;"><input style="width:252px;" type="text" name="e.firsttax" value='<s:property value="e.firsttax"/>'/></div>
						</div>
					</div>
				</div>
				
				
 				<div class="revise" id="zqxxxgbtn" >
					<input class="shenqingdkt upback"   type="button" value="上一步"/>&nbsp;&nbsp;
					<input class="shenqingdkt shenqingdkthide" lang=""  type="submit" value="下一步"/><span class="nextnotice">&nbsp;&nbsp;(注：点击下一步会保存当前这一步的数据)</span>
				 </div>

			</form>
				</div>
							
		</div>	
		
		</div>

</div>


<script type="text/javascript">
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
 	leftnav_init("interestapp2");
 </script>
</body>
</html>
 