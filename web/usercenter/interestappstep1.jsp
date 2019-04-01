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
<input type="hidden" value="测试" id="wwwceshi"/>
<!-- t有值代表是查看 -->
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#t").val();
	//alert(t);
	
	if(t=='v'){
		$("#intereststep1").attr("action","/interestapp/tostep2.html");
		$("#intereststep1 input,radio,select,textarea,checkbox").attr('readonly',"readonly");
		$(".nextnotice").hide();
	$(".shenqingdkthide").attr("disabled",false);
		$(".upback").attr("disabled",false);
		//$(".shenqingdkthide").hide();
		$("#copy").attr("id","copy2");
		$("#gbdel").attr("id","gbdel2");
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

function setdfb(num) {
	var num = num.substring(num.length-1);
	var dkje = $("#dkje"+num).val();
	var dbfl = $("#dbfl"+num).val();
	$("#dbf"+num).val(parseFloat(parseFloat(dkje)*(parseFloat(dbfl/100))).toFixed(2));
};


</script>
<style>
.error {
    border: none;
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
			
				<div class="title"><li>贴息申报第一步</li></div>
				
				<input type="hidden" name="e.id" value="<s:property value='e.id'/>"/>
				<input type="hidden" name="t" id="t" value="<s:property value="#request.t"/>">
		 
				<div class="inputtest inputtestl" style="width:100%;">
					<span class="leftname leftnamel">企业名称：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width:618px;"><input style="width:596px;" class="input" name="e.qiyemingcheng" type="text" value="<s:property value='e.qiyemingcheng'/>"/></span>
				</div>
				<div class="inputtest inputtestl" style="width:100%;">
					<span class="leftname leftnamel">办公地址：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width:618px;"><input style="width:596px;" type="text" class="input" name="e.dizhi" value="<s:property value='e.dizhi'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">注册资本：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input ibg" name="e.zhuceziben" type="text"  value="<s:property value='e.zhuceziben'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">成立日期：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.chengliriqi" type="text"  value="<s:property value='e.chengliriqi'/>"/></span>
				</div>
				
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">法定代表人姓名：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input stext" id="faren" name="e.faren"  value="<s:property value='e.faren'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">法定代表人电话：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="e.farentele"  value="<s:property value='e.farentele'/>"/></span>
				</div>

			 
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">负责人姓名：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.fzr" type="text" value="<s:property value='e.fzr'/>"/></span>
				</div>
		 
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" >负责人职务：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input"  name="e.fzrzhiwu" type="text"  value="<s:property value='e.fzrzhiwu'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">负责人电话：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input"  name="e.fzrtele" type="text"  value="<s:property value='e.fzrtele'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">联系人姓名：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.lxr" type="text"  value="<s:property value='e.lxr'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">联系人职务：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.lxrzhiwu" type="text" value="<s:property value='e.lxrzhiwu'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" >联系人电话：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="e.lxrtlle" type="text"  value="<s:property value='e.lxrtlle'/>"/></span>
				</div>
				<div id="dkk" >
				
				
				<s:iterator  value="#request.list" status="index">
				
				<s:if test="#index.index == 0">
					<div class="xkk" lang="firsttr">
				</s:if>
				<s:else>
					<div class="xkk">
				</s:else>
				
				
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">贷款银行：<span style="color:red">*</span></span>
						<span class="rightinfo" ><input class="input iname" name="dkyy<s:property value="#index.index"/>" type="text"  value="<s:property value='dkyy'/>"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">贷款金额：<span style="color:red">*</span></span>
						<span class="rightinfo"><input class="input inumber ibg" name="dkje<s:property value="#index.index"/>" type="text" id="dkje<s:property value="#index.index"/>" value="<s:property value='dkje'/>"/></span>
					</div>
					
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">担保费率（%）：<span style="color:red">*</span></span>
						<span class="rightinfo"><input class="input inumber" onchange="setdfb($(this).attr('name'))"  oninput="setdfb($(this).attr('name'))" id="dbfl<s:property value="#index.index"/>" name="dbfl<s:property value="#index.index"/>" type="text"  value="<s:property value='dbfl'/>"/></span>
					</div>
						<div class="inputtest inputtestl">
						<span class="leftname leftnamel">担保费：<span style="color:red">*</span></span>
						<span class="rightinfo"><input class="input inumber ibg" id="dbf<s:property value="#index.index"/>" name="dbf<s:property value="#index.index"/>" type="text"  value="<s:property value='dbf'/>"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">贷款利率（%）：<span style="color:red">*</span></span>
						<span class="rightinfo"><input type="text" class="input inumber" name="dkll<s:property value="#index.index"/>"  value="<s:property value='dkll'/>"/></span>
					</div>
	
	
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel" style="height:auto;line-height: 18px;">支付利息[2015-10-1到2016-09-30日]：<span style="color:red">*</span></span>
						<span class="rightinfo"><input type="text" class="input inumber ibg" name="zflx<s:property value="#index.index"/>"  value="<s:property value='zflx'/>"/></span>
					</div>
	
	
	
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">放款日期：<span style="color:red">*</span></span>
						<span class="rightinfo"><input type="text" class="input laydate-icon" id="e.fksj<s:property value="#index.index"/>" name="fksj<s:property value="#index.index"/>"  value="<s:property value='fksj.substring(0,10)'/>"/></span>
					</div>
	
	
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">到期日期：<span style="color:red">*</span></span>
						<span class="rightinfo"><input type="text" class="input laydate-icon" name="dqsj<s:property value="#index.index"/>" id="e.dqsj<s:property value="#index.index"/>"  value="<s:property value='dqsj.substring(0,10)'/>"/></span>
					</div>
					<!-- <div style="text-align:right;overflow: hidden;margin-bottom: 10px;clear: both;"><input class="adddel"  type="button" id="copy" value="增加">&nbsp;<input class="addde2" type="button" id="gbdel" value="删除"></div> -->
				</div>
					</s:iterator>
				</div>
				<div style="text-align:right;overflow: hidden;margin-bottom: 10px;clear: both;"><input class="adddel"  type="button" id="copy" value="增加">&nbsp;<input class="addde2" type="button" id="gbdel" value="删除"></div>
				
				
			
			<div class="inputtest inputtestl">
					<span class="leftname leftnamel">股权融资需求：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input ibg" id="e.gqrzds" name="e.gqrzds"  value="<s:property value='e.gqrzds'/>"/></span>
				</div>


				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">债权融资需求：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input ibg" name="e.zqrzds" id="e.zqrzds"  value="<s:property value='e.zqrzds'/>"/></span>
				</div>
				<div class="inputtest inputtestl" style="width:100%;">
					<span class="leftname leftnamel">引入VC/PE情况：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width:618px;"><textarea style="width:596px;" id="vcpetext" class="input" name="e.vcpe" ><s:property value='e.vcpe'/></textarea></span>
				</div>


				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="width: 213px;margin-right: 20px;">第三方评级结果[<a target="_blank" href="/incredetail/22.html">推荐评级机构</a>]：<span style="color:red">*</span></span>
					<span class="rightinfo"  style="width: 156px;"><input type="text" style="width: 139px;" class="input" name="e.dsfxypj"  value="<s:property value='e.dsfxypj'/>"/></span>
				</div>


			<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="height:auto;line-height: 18px;">企业规模[<a target="_blank" href="http://www.miit.gov.cn/newweb/n1146285/n1146352/n3054355/n3057278/n3057286/c3592332/content.html">标准划分参考网址</a>]：<span style="color:red">*</span></span>
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
			

				<div class="revise" id="zqxxxgbtn" >
					<input class="shenqingdkt upback" type="button" value="返回"/>&nbsp;&nbsp;
					<input class="shenqingdkt shenqingdkthide" type="submit" value="下一步"/><span class="nextnotice">&nbsp;&nbsp;(注：点击下一步会保存当前这一步的数据)</span>
				  
				 </div>
			</form>
				</div>
							
		</div>	
		
		</div>

</div>


<script type="text/javascript">

$(window).load(function(){
	
	var lastxkk_iname = $("#dkk").children(".xkk:last").children().find("input[class=input iname]");//为刚刚创建的元素里的class=input iname的input动态添加验证
	lastxkk_iname.each(function(){
		$(this).rules("add", {required :true,maxlength:64, messages: {required:"请输入",maxlength:"64字符以内"} });
	});
	var lastxkk_inumbers = $("#dkk").children(".xkk:last").children().find("input[class=input inumber]");//为刚刚创建的元素里的class=input inumber的input动态添加验证
		lastxkk_inumbers.each(function(){
			$(this).rules("add", {required :true,number :true,maxlength:18, messages: {required :"请输入",number:"请填写数字",maxlength:"18字符以内"} });
	});
	var lastxkk_inumbers = $("#dkk").children(".xkk:last").children().find("input[class=input inumber ibg]");//为刚刚创建的元素里的class=input inumber的input动态添加验证
		lastxkk_inumbers.each(function(){
			$(this).rules("add", {required :true,number :true,maxlength:18, messages: {required :"请输入",number:"请填写数字",maxlength:"18字符以内"} });
	});
	var lastxkk_laydates = $("#dkk").children(".xkk:last").children().find("input[class=input laydate-icon]");
		lastxkk_laydates.each(function(){
		$(this).rules("add", {required :true,isDate :true, messages: {required :"请输入",isDate:"请正确输入"} })
	});




//贷款银行到到期日期的8个元素的增加和删除
	$(".adddel").click(function(){
		var xkks = $("#dkk").children(".xkk");
		var nownum = xkks.length;//现在要添加的元素名称的序号
		xkks.eq(0).clone(true).appendTo($("#dkk")).attr("lang","");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
//		xkks.eq(0).clone(true).insertAfter($(this).parent().parent()).attr("lang","");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
		
		var lastxkk_inputs = $("#dkk").children(".xkk:last").children().find("input");//找到大框框下的最后一个元素里面的所有input
//		var lastxkk_inputs = $(this).parent().parent().next().children().find("input");//找到大框框下的最后一个元素里面的所有input
		
		lastxkk_inputs.each(function(){
			//var reg=/^[^a-zA-Z0-9]$/g;//匹配字符串中的非字母【即中文和数字】
			//var thisnewstr=$(this).attr("name").replace(reg,"");//把匹配到的中文和数字替换为空
			var thisnewstr = $(this).attr("name").substring(0,$(this).attr("name").length-1);
			$(this).attr("name",thisnewstr+nownum);//把去掉数字序号的得到的字符串重新加一个序号付给name
			$(this).attr("id",thisnewstr+nownum);//同事赋给id
			if($(this).attr("value")=="增加" || $(this).attr("value")=="删除"){
				
			}else{
				$(this).attr("value","");
			}
		});
		
		var lastxkk_iname = $("#dkk").children(".xkk:last").children().find("input[class=input iname]");//为刚刚创建的元素里的class=input iname的input动态添加验证
			lastxkk_iname.each(function(){
				$(this).rules("add", {required :true,maxlength:64, messages: {required:"请输入",maxlength:"64字符以内"} });
		});
		var lastxkk_inumbers = $("#dkk").children(".xkk:last").children().find("input[class=input inumber]");//为刚刚创建的元素里的class=input inumber的input动态添加验证
			lastxkk_inumbers.each(function(){
				$(this).rules("add", {required :true,number :true,maxlength:18, messages: {required :"请输入",number:"请填写数字",maxlength:"18字符以内"} });
		});
		var lastxkk_inumbers = $("#dkk").children(".xkk:last").children().find("input[class=input inumber ibg]");//为刚刚创建的元素里的class=input inumber的input动态添加验证
			lastxkk_inumbers.each(function(){
				$(this).rules("add", {required :true,number :true,maxlength:18, messages: {required :"请输入",number:"请填写数字",maxlength:"18字符以内"} });
		});
		var lastxkk_laydates = $("#dkk").children(".xkk:last").children().find("input[class=input laydate-icon]");
			lastxkk_laydates.each(function(){
			$(this).rules("add", {required :true,isDate :true, messages: {required :"请输入",isDate:"日期格式如：2016-08-12"} })
		});



		

			
		
		//alert(xkks.length);
	});



	
	//给大框框下所有的日期input框动态添加日期事件	
	var dkk_inamex = $("#dkk input[class=input laydate-icon]");
		dkk_inamex.live('click',function(){
		var naowdate = $(this).attr("id");
		laydate({elem: '#'+naowdate});//绑定元素
	});
		
	//由于有validate验证，如何事先填写错误，就会加error样式，所以此时还需要动态调用一下date控件
	var dkk_inamex2 = $("#dkk input[class=input laydate-icon error]");
		dkk_inamex2.live('click',function(){
		var naowdate2 = $(this).attr("id");
		laydate({elem: '#'+naowdate2});//绑定元素
	});

	//删除
	/*$(".addde2").click(function(){
		var parent = $(this).parent().parent();
		var parent_lang = parent.attr("lang");
		if(parent_lang!="firsttr"){
			parent.remove();
		}
		
	});*/

	//删除
	$("#gbdel").click(function(){
		var prev = $("#dkk").children(".xkk:last");
		var firsttr = prev.attr("lang");
		if(firsttr!="firsttr"){
			prev.remove();
		}
		
	});



});
















!function(){
var textmrz = "投资机构：\r\n投资金额：\r\n出让比例：";
var vcpetext = $("#vcpetext").val();

if(!vcpetext){
	$("#vcpetext").val(textmrz);

}

	
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	//laydate({elem: '#e.fksj0'});//绑定元素
	//laydate({elem: '#e.dqsj0'});//绑定元素
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
 