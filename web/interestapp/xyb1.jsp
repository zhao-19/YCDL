<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>

<!DOCTYPE html PUBLIC “-//W3C//DTD XHTML 1.0 Transitional//EN” “http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd”>
<html xmlns=”http://www.w3.org/1999/xhtml”>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/validate_expand.js"></script>
<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/validate.js"></script>
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	initValidator();
	
});
</script>

<style>
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
fieldset{border:1px solid #d6d6d6!important;    padding: 20px;;}
	.fsf{height:50px;width:569px;margin:0 auto;margin-top: 20px;}
        .fsf span{padding:8px 20px;border:1px solid #FF8000;}
        .fsf hr{width:100px;height:1px;border:1px solid #FF8000;display: inline-block;
            background-color: #FF8000;margin:0 -4px;margin-bottom: 6px;margin-left:-1px;}
  
  .ck-info .valid_message{
    color: red;
    position: relative;
    text-align:right;
    left: 140px;
    top: -38px;
    height:8px;
    display:block;
  }
.aaa{margin-left:200px;}
.demo table td select{border:1px solid #ddd;min-width:200px;float:left;;padding: 10px;
    font-size: 12px;}
.demo{width:481px;margin:0 auto;margin-top:50px }
.demo table td{vertical-align:top;}
.demo .tdLabel{border:1px dolid red;height：none;}
.demo table .tdcon{text-align:right;width:160px;padding:5px 0 0 0;height:20px;}
.demo table tr{margin-top:50px;height:60px;}
.demo table .stext{border:solid 1px #ddd;font-size:12px;
padding:10px;width:200px;float:left;margin-top:1px;}
/* tipinfo */
.tipinfo{float:left;}
.tipinfo font.error{background:url("../image/unchecked.jpg") no-repeat left;padding-left:17px;color:#eb0000;width:300px;display:block;}
.tipinfo font.valid{background:url("../image/checked.gif") no-repeat left;width:14px;height:13px;overflow:hidden;padding:0;margin:10px 0 0 5px;display:inline-block;} 


/* Button base */
.Button{
	position:relative;
	display:inline-block;
	padding:.45em .825em .45em;
	text-align:center;
	line-height:1em; 
	border:1px solid transparent;
	cursor:pointer; 
	 
	border-radius:.3em; 
	-moz-border-radius:.3em; 
	-webkit-border-radius:.3em; 
	
	-moz-transition-property:color, -moz-box-shadow, text-shadow; 
	-moz-transition-duration:.05s; 
	-moz-transition-timing-function:ease-in-out; 
	-webkit-transition-property:color, -webkit-box-shadow, text-shadow; 
	-webkit-transition-duration:.05s; 
	-webkit-transition-timing-function:ease-in-out; 
	
	box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35); 
	-moz-box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35); 
	-webkit-box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35);
}

.Button:hover {text-decoration:none;}
.Button strong {position:relative; z-index:2;}

.Button{
	display:block;border:1px solid;opacity:1;
	
	border-radius:.3em;
	-moz-border-radius:.3em;
	-webkit-border-radius:.3em;
	
	box-shadow:inset 0 1px rgba(255,255,255,0.35);
	-moz-box-shadow:inset 0 1px rgba(255,255,255,0.35);
	-webkit-box-shadow:inset 0 1px rgba(255,255,255,0.35);
	
	-moz-transition-property:opacity;
	-moz-transition-duration:0.5s;
	-moz-transition-timing-function:ease-in-out;
	-webkit-transition-property:opacity;
	-webkit-transition-duration:0.5s;
	-webkit-transition-timing-function:ease-in-out;
}

.Button:hover span{
	-moz-transition-property:opacity;
	-moz-transition-duration:0.05s;
	-moz-transition-timing-function:linear;
	-webkit-transition-property:opacity;
	-webkit-transition-duration:0.05s;
	-webkit-transition-timing-function:linear;
}
.Button:active span{
	-moz-transition:none;
	-webkit-transition:none;
}

/* Blue Button */
.BlueButton{color:#fcf9f9; text-shadow:0 -1px rgba(34,25,25,0.5);}
.BlueButton:hover {color:#fff; text-shadow:0 -1px rgba(34,25,25,0.3);}
.BlueButton:active {color:#f2f0f0; text-shadow:0 -1px rgba(34,25,25,0.6);}

.BlueButton{
	border-color:#015E91;
	background-color:#3693D5;
	background:-moz-linear-gradient(center top , #54B1EB, #47A0E0 50%, #419FE1 50%, #3683D5);
	background:-o-linear-gradient(top left, #54B1EB, #47A0E0 50%, #419FE1 50%, #3683D5);
	background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#54B1EB), to(#47A0E0), color-stop(.5,#419FE1),color-stop(.5,#3683D5));
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#54B1EB', endColorstr='#3683D5');
}

.BlueButton:hover{
	border-color:#0366AD;
	background-color:#3EA1D6;
	background:-moz-linear-gradient(center top, #5EB4EA, #61A1EE 50%, #59A5EB 50%, #3691E6);
	background:-o-linear-gradient(top left, #5EB4EA, #61A1EE 50%, #59A5EB 50%, #3691E6);
	background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#5EB4EA), to(#61A1EE), color-stop(.5,#59A5EB),color-stop(.5,#3691E6));
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5EB4EA', endColorstr='#3691E6');
}

.BlueButton:active{
	border-color:#013B6A;
	background-color:#3089C8;
	background:-moz-linear-gradient(center top, #4B9CDD, #4189D5 50%, #3D8BD3 50%, #3093C8);
	background:-o-linear-gradient(top left, #4B9CDD, #4189D5 50%, #3D8BD3 50%, #3093C8);
	background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#4B9CDD), to(#4189D5), color-stop(.5,#3D8BD3),color-stop(.5,#3093C8));
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4B9CDD', endColorstr='#3093C8');
}

.BlueButton.Button18:hover{
	box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
	-moz-box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
	-webkit-box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
}
.BlueButton.Button18:active{
	box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);
	-moz-box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);
	-webkit-box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);	
} 
.fs-title {
    font-size: 20px;
    text-transform: uppercase;
    color: #2C3E50;
    margin-top: -40px;
    margin-bottom: 40px;
}
.fs-subtitle {
    font-weight: normal;
    font-size: 13px;
    color: #666;
    margin-bottom: 20px;
}
.action-button {
    width: 100px;
    background: #ffab2c;
    font-weight: bold;
    color: white;
    border: 0 none;
    /*border-radius: 1px;*/
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 5px;
    margin-top: 40px;
    margin-left: 40px;
    
}
.juzhong {
   text-align: center;
}
.juzhong1 {
       margin-left: 100px;
}
.action-button:hover, #msform .action-button:focus {
    box-shadow: 0 0 0 2px white, 0 0 0 3px #ffaf34;
}

.step{width:573px;height:50px;margin:0 auto;margin-top:20px;margin-bottom:30px;}
.step .sp{width:122px;font-size:20px;height:48px;line-height:50px;text-align:center;float:left;border:1px solid #FF8000;}
.step .line{width:100px;height:2px;background-color:#FF8000;border:none;margin-top:24px;float: left;overflow:hidden;}
.step .hover{color:#FFf;;background-color:#FF8000;}
#thisForm{width:100%;}
</style>


</head>
<body>


<!-- 网站头部 -->

<!--内容信息-->
<div class="baobiao">


<form id="thisForm" method="post" action="/interestapp!insert.action">
<fieldset style="display: block;border:none;">

<div class="step">
	<div class="sp hover">基本信息</div>
	<div class="line"></div>
	<div class="sp">信息详情</div>
	<div class="line"></div>
	<div class="sp">资料上传</div>
</div>




<div class="demo">
	
	<table width="100%">
		
		
		<tr>
			<td class="tdcon">企业名称：</td>
			<td>       
			 <input type="hidden" name="e.id" value='<s:property value="e.id"/>' />
				<input class="stext" type='text' name="e.qiyemingcheng"  value='<s:property value="e.qiyemingcheng"/>' id="qiyemingcheng" />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">注册资本：</td>
			<td>
				<input class="stext" type="text" name="e.zhuceziben" id="zhuceziben" value='<s:property value="e.zhuceziben"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">成立日期：</td>
			<td>
				<input class="stext laydate-icon" name="e.chengliriqi" id="chengliriqi" value='<s:property value="e.chengliriqi"/>' />
				<div class="tipinfo"></div>			
			</td>
		</tr>
		<tr>
			<td class="tdcon">办公地址：</td>
			<td>
				<input class="stext" type='text' name="e.dizhi" id="dizhi" value='<s:property value="e.dizhi"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">法定代表人姓名：</td>
			<td>
				<input class="stext" type='text' name="e.faren" id="faren" value='<s:property value="e.faren"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">法定代表人电话：</td>
			<td>
				<input class="stext" type='text' name="e.farentele" id="farentele" value='<s:property value="e.farentele"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">负责人姓名：</td>
			<td>
				<input class="stext" type='text' name="e.fzr" id="fzr" value='<s:property value="e.fzr"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">负责人职务：</td>
			<td>
				<input class="stext" type='text' name="e.fzrzhiwu" id="fzrzhiwu" value='<s:property value="e.fzrzhiwu"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">负责人电话：</td>
			<td>
				<input class="stext" type='text' name="e.fzrtele" id="fzrtele" value='<s:property value="e.fzrtele"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">联系人姓名：</td>
			<td>
				<input class="stext" type='text' name="e.lxr" id="lxr" value='<s:property value="e.lxr"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">联系人职务：</td>
			<td>
				<input class="stext" type='text' name="e.lxrzhiwu" id="lxrzhiwu" value='<s:property value="e.lxrzhiwu"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">联系人电话：</td>
			<td>
				<input class="stext" type='text' name="e.lxrtlle" id="lxrtlle" value='<s:property value="e.lxrtlle"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">贷款银行：</td>
			<td>
				<input class="stext" type='text' name="e.dkyy" id="dkyy" value='<s:property value="e.dkyy"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">贷款金额（万）：</td>
			<td>
				<input class="stext" type='text' name="e.dkje" id="dkje" value='<s:property value="e.dkje"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">贷款利率：</td>
			<td>
				<input class="stext" type='text' name="e.dkll" id="dkll" value='<s:property value="e.dkll"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">支付利息：</td>
			<td>
				<input class="stext" type='text' name="e.zflx" id="zflx" value='<s:property value="e.zflx"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">放款日期：</td>
			<td>
 				<input class="stext laydate-icon" name="e.fksj" id="fksj"  value='<s:property value="e.fksj.substring(0.10)"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">到期日期：</td>
			<td>
				<input class="stext laydate-icon" name="e.dqsj" id="dqsj" value='<s:property value="e.dqsj"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">引入vcpe情况：</td>
			<td>
				<input class="stext" type='text' name="e.vcpe" id="vcpe" value='<s:property value="e.vcpe"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">第三方信用评级结果：</td>
			<td>
				<input class="stext" type='text' name="e.dsfxypj" id="" value='<s:property value="e.dsfxypj"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">企业规模：</td>
			<td>
			<select name="e.qygm" >
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa090">大</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa091">中</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa092">小</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa093">微型</option>
               </select> 			
			</td>
		</tr>
		<tr>
			<td class="tdcon">企业规模：</td>
			<td>
			<select name="e.tjgxqk" >
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa100">未达到上规入库条件</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa101">已达到上规入库条件、且已提交入库申请</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa102">已达到上规入库条件、但未提交入库申请</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa103">已进入高新区统计表</option>
               </select> 			
			</td>
		</tr>
		 
				
	</table>
		        <input type="button" name="previous" class="previous action-button juzhong1" onclick="javascript:window.location='/interestapp/selectList.html'"
               style="position: relative;left: -20px;" value="返回" />
    <input type="submit" id="nextstep" name="submit" class="submit action-button juzhong"
           style="position: relative;left: -10px;" value="下一步" style="margin-left: 430px;"/>
</div>
    



</fieldset>
</form>
<script type="text/javascript">
!function(){
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	laydate({elem: '#chengliriqi'});//绑定元素
	laydate({elem: '#fksj'});//绑定元素
	laydate({elem: '#dqsj'});//绑定元素
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

</body>
</html>
