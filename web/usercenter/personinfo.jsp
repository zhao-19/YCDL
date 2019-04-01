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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/personappinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<body>
<div id="ggts2"></div>
<!-- t有值代表是查看 -->
<input type="hidden" id="backnotice" value="<s:property value="#request.flag"/>">
<input type="hidden" id="t" value="<s:property value="person.t"/>">
<script type="text/javascript">

$(window).load(function(){
	  var backnotice = $("#backnotice").val();
		if(backnotice.length>1){
		     
		         var a = document.getElementById("ggts2");//获取div块对象
		         var Height=document.documentElement.clientHeight;//取得浏览器页面可视区域的宽度
		         var Width=document.documentElement.clientWidth;//取得浏览器页面可视区域的宽度
		         var gao1 = a.offsetHeight;//获取div块的高度值
		         var gao2 = a.offsetWidth;//获取div块的宽度值
		         var Sgao1= (Height - gao1)/2-110+"px";
		         var Sgao2= (Width - gao2)/2+"px";
		         a.style.top=Sgao1;
		         a.style.left=Sgao2;
		        // $("#ggts2").show();
		    ggts2(backnotice);
		}});
	
$(document).ready(function(){
	var t = $("#t").val();//v 查看   u 修改  a 新增
	//alert(t);
	if(t=='v'){
		//表示查询
		$("#personappinfo input,radio,select,textarea,checkbox").attr('disabled',true);
		$(".shenqingdkt").attr("disabled",false);
		$(".shenqingdkthide").hide();
		$("#zqxxxgbtn").hide();
		
	}
	else if(t=='a'){
		//表示新增（在返回没有数据的情况可以新增）
		$(".shenqingdkt").hide();
		$(".shenqingdkthide").show();
		$(".shenqingdkthide").val("提交");
		personappinfo();
	}else if(t=='u'){ 
		//表示修改
		personappinfo();
	}
	$(".upback").click(function(){
		location.href = "/usercenter/getJigouinfo.html?person.t=v";
	});

});


function discriCard(){ 
//获取输入身份证号码 
var UUserCard = $("#orgid").val();
//获取出生日期 
var birthday = UUserCard.substring(6, 10) + "-" + UUserCard.substring(10, 12) + "-" + UUserCard.substring(12, 14);
$(".birthday").eq(0).val(birthday)
//获取性别 
if (parseInt(UUserCard.substr(16, 1)) % 2 == 1) { 
$("#sexman").attr('checked','true');

//是男则执行代码 ... 
} else { 
$("#sexwomen").attr('checked','true');
//是女则执行代码 ... 
} 
} 
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
	height: 20px;
    line-height: 20px;
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
			
			<!-- 债权信息修改    用户为企业时显示    -->
			<div id="zaiquanxinxi-update" class="vipinfo" >
			
					<form id="personappinfo" action="/usercenter/savePersoninfo.html" method="post">
			
				<div class="title"><li><span class="t">工作室信息查看</span><a href="/usercenter/getPersoninfo.html?person.t=u"><span id="CreateTBpxhd" class="update">工作室信息修改</span></a></li></div>
				<input type="hidden" name="person.id" value="<s:property value='person.id'/>"/>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">真实姓名：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" id="person.username" name="person.username" type="text"  value="<s:property value='person.username'/>" /></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">身份证号码：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" id="orgid" name="person.orgid" type="text"  onblur="discriCard()" value="<s:property value='person.orgid'/>"/></span>
				</div>
			<!-- 	<div class="inputtest inputtestl">
					<span class="leftname leftnamel">组织机构代码：</span>
					<span class="rightinfo"><input class="input" name="person.jigou.zzjgdm" type="text" value="<s:property value='person.jigou.zzjgdm'/>"/></span>
				</div> -->
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">性别：<span style="color:red">*</span></span>
					<span class="rightinfo leftnamesex" style="line-height: 38px;"><input class="input rad" id="sexman" name="person.sex" type="radio" value="男"  <%if ("男".equals(((com.winpow.services.manage.person.bean.Person)request.getAttribute("person")).getSex())) { out.print("checked=checked");} %> />男<input  id="sexwomen" class="input rad" name="person.sex" type="radio" value="女"  <%if ("女".equals(((com.winpow.services.manage.person.bean.Person)request.getAttribute("person")).getSex())) { out.print("checked=checked");} %>/>女</span>
				</div>
				<div style="clear:both;" ></div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">出生日期：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input laydate-icon birthday"  name="person.birthday" id="person.birthday" type="text" value="<s:property value='person.birthday.substring(0,10)'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">联系地址：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="person.address" type="text"  value="<s:property value='person.address'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">学历：<span style="color:red">*</span></span> 
					<span class="rightinfo">
						<select class="select" name="person.education" id="person.education">
							<option value=""></option>
							<option value="小学" <%if (("小学").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>小学</option>
							<option value="初中" <%if (("初中").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>初中</option>
							<option value="高中" <%if (("高中").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>高中</option>
							<option value="大学专科" <%if (("大学专科").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>大学专科</option>
							<option value="大学本科" <%if (("大学本科").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>大学本科</option>
							<option value="硕士" <%if (("硕士").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>硕士</option>
							<option value="博士" <%if (("博士").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>博士</option>
						</select>
					</span>
				</div>
				
				<div class="gszcddiv gszcddiv3 ">
					<span class="leftname leftnamel leftnamelt">工作室所在省份：<span style="color:red">*</span></span> 
					<span class="rightinfo" id="gszcdspan">
						<select class="ssx" id="gszcd_province" name="person.person_province"><s:property value="person.person_province"/></select>  
					    <select class="ssx" id="gszcd_city" name="person.person_city" ><s:property value="person.person_city"/></select>  
					    <select class="ssx" id="gszcd_county" name="person.person_county"><s:property value="person.person_county"/></select>
					</span>
					<input type="hidden" id="province" value='<s:property value="person.person_province"/>'/>
					<input type="hidden" id="city" value='<s:property value="person.person_city"/>'/>
					<input type="hidden" id="county" value='<s:property value="person.person_county"/>'/>
					<input type="hidden" id="custtype" value='productczdfirst'/>
					
					<script type="text/javascript">var custtype = 'productczdfirst';</script>
					<script src="../resource/js/area.js"></script>
					<script type="text/javascript">
					//var custtype = '<s:property value="userType"/>';
					_init_area();

					 
					</script>
					
				</div>
				
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">毕业院校：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="person.graduate" type="text"  value="<s:property value='person.graduate'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">专业：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="person.subject" type="text"  value="<s:property value='person.subject'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">自我介绍：<span style="color:red">*</span></span>
					<span class="rightinfo tstextarea"><textarea class="input" name="person.introduce"    ><s:property value='person.introduce'/></textarea></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">工作室介绍：<span style="color:red">*</span></span>
					<span class="rightinfo tstextarea"><textarea class="input" name="person.studio"  ><s:property value='person.studio'/></textarea></span>
				</div>

				<div class="revise" id="zqxxxgbtn" ><input class="shenqingdkt upback" type="button" value="返回"/>&nbsp;&nbsp; <input class="shenqingdkt shenqingdkthide" type="submit" value="保存"/></div>
			</form>
				</div>
							
		</div>	
		
		</div>

</div>
 <%@ include file="../footer.jsp"%>
<script type="text/javascript">
/**/
!function(){
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	laydate({elem: '#person.birthday'});//绑定元素
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
 <script type="text/javascript" >
 	leftnav_init("personinfo");
 </script>
</body>
</html>
 