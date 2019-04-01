<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html PUBLIC “-//W3C//DTD XHTML 1.0 Transitional//EN” “http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd”>
<html xmlns=”http://www.w3.org/1999/xhtml”>
<head lang="en">
    <title></title>
    <link rel="stylesheet"  href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet"  href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet"  href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiaod.css"/>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/validate_expand.js"></script>
<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/validate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	initValidator();
});
</script>
<style>
fieldset{border:1px solid #d6d6d6!important;    padding: 20px;;}
	.fsf{height:50px;width:569px;margin:0 auto;;margin-top: 20px;}
        .fsf span{padding:8px 20px;border:1px solid #FF8000;}
        .fsf hr{width:100px;height:1px;border:1px solid #FF8000;display: inline-block;
            background-color: #FF8000;margin:0 -4px;margin-bottom: 6px;margin-left:-1px;}
            .demo table td select{border:1px solid #ddd;min-width:200px;float:left;padding:10px;}
.demo{width:481;margin:50px 10px 0 250px;}
.demo table td{vertical-align:top;}
.demo .tdLabel{border:1px dolid red;height：none;}
.demo table .tdcon{text-align:right;width:160px;padding:5px 0 0 0;height:20px;}
.demo table tr{margin-top:50px;height:60px;}
.demo table .stext{border:solid 1px #ddd;font-size:12px;
width:190px;float:left;margin-top:1px;padding:10px;}
 /*tipinfo */
.tipinfo{float:left;}
.tipinfo font.error{background:url("../image/unchecked.jpg") no-repeat left;padding-left:17px;color:#eb0000;width:300px;display:block;}
.tipinfo font.valid{background:url("../image/checked.gif") no-repeat left;width:14px;height:13px;overflow:hidden;padding:0;margin:10px 0 0 5px;display:inline-block;} 
            
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
 .ck-info .valid_message{
    color: red;
    position: relative;
    text-align:right;
    left: 140px;
    top: -38px;
    height:8px;
    display:block;
  }
.baobiao22 {max-width:700px;min-width:481px;margin-top: 10px;text-align: center;}
.baobiao22 tr{height:30px;}
.baobiao22 {border-right:1px solid #b1b1b1;border-bottom:1px solid #b1b1b1;}
.baobiao22 td{min-width:80px;border-left:1px solid #b1b1b1;border-top:1px solid #b1b1b1;overflow: hidden;height:1px;line-height:50px;}
  .baobiao22 input{width:90px;height:30px;margin-top:10px;}
  /*/interestapp!updatestep2.action*/
  
  .step{width:573px;height:50px;margin:0 auto;margin-top:20px;margin-bottom:30px;}
.step .sp{width:122px;font-size:20px;height:48px;line-height:50px;text-align:center;float:left;border:1px solid #FF8000;}
.step .line{width:100px;height:2px;background-color:#FF8000;border:none;margin-top:24px;float: left;overflow:hidden;}
.step .hover{color:#FFf;;background-color:#FF8000;}
</style>

</head>
<body>


<!-- 网站头部 -->

<!--内容信息-->
<div class="baobiao">

    <form id="thisForm" method="post" action="/interestapp!updatestep3.action" style="display: block;">
        <fieldset style="display: block;">
        
<div class="step">
	<div class="sp ">基本信息</div>
	<div class="line"></div>
	<div class="sp hover">信息详情</div>
	<div class="line"></div>
	<div class="sp">资料上传</div>
</div>


<div class="demo">
	
	<table width="100%">
		<tr>
			<td class="tdcon">主营业务：</td>
			<td>			 <input type="hidden" name="e.id" value='<s:property value="e.id"/>' />
			
				<input class="stext" type='text' name="e.zhuyingyewu"  value='<s:property value="e.zhuyingyewu"/>' id="zhuyingyewu" />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">所属产业：</td>
			<td>
			<select name="e.sscy" >
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa110">新一代信息技术</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa111">生物产业</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa112">高端装备制造产业</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa113">节能环保产业</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa114">其他</option>
               </select> 			
			</td>
		</tr>
		<tr>
			<td class="tdcon">企业类型：</td>
			<td>
			<select name="e.qylx" >
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120">国有</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121">民营</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122">外资</option>
               <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa123">其他</option>
               </select> 			
			</td>
		</tr>
		<tr>
			<td class="tdcon">统计关系所在地：</td>
			<td>
				<input class="stext" type="text" name="e.tjgxszd" id="tjgxszd" value='<s:property value="e.tjgxszd"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">国税缴纳关系所在地：</td>
			<td>
				<input class="stext" type="text" name="e.gsjngxszd" id="gsjngxszd" value='<s:property value="e.gsjngxszd"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">地税缴纳关系所在地：</td>
			<td>
				<input class="stext" type="text" name="e.dsjngxszd" id="dsjngxszd" value='<s:property value="e.dsjngxszd"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">银行信用等级：</td>
			<td>
				<input class="stext" type="text" name="e.yhxydj" id="yhxydj" value='<s:property value="e.yhxydj"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">资产总额（万）：</td>
			<td>
				<input class="stext" type="text" name="e.zcze" id="zcze" value='<s:property value="e.zcze"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">负债总额（万）：</td>
			<td>
				<input class="stext" type="text" name="e.fzze" id="fzze" value='<s:property value="e.fzze"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">出口创汇总额：</td>
			<td>
				<input class="stext" type="text" name="e.ckchze" id="ckchze" value='<s:property value="e.ckchze"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">产品市场占有率：</td>
			<td>
				<input class="stext" type="text" name="e.cpsczyl" id="cpsczyl" value='<s:property value="e.cpsczyl"/>' />
				<div class="tipinfo"></div>
			</td>
		</tr>
			<table class="baobiao22" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td rowspan="4" style="text-align: center;padding-top:100px;">经营情况</td>
                    <td>年&nbsp;&nbsp;&nbsp;&nbsp;份</td>
                    <td>销售收入</td>
                    <td>利润</td>
                    <td>税收总额</td>
                </tr>
                <tr>
                    <td><s:property value="e.thirdyear"/>年</td>
                    <td><input type="text"  name="e.thirdsell"   value='<s:property value="e.thirdsell"/>'/></td>
                    <td><input type="text"  name="e.thirdinte"   value='<s:property value="e.thirdinte"/>'/></td>
                    <td><input type="text"  name="e.thirdtax"  value='<s:property  value="e.thirdtax"/>'/></td>
                </tr>
                <tr>
                    <td><s:property value="e.thirdyear+1"/>年</td> 
                   
                    <td><input type="text" name="e.secondsell" value='<s:property  value="e.secondsell"/>'/></td>
                    <td><input type="text" name="e.secondinte" value='<s:property  value="e.secondinte"/>'/></td>
                    <td><input type="text" name="e.secondtax"  value='<s:property value="e.secondtax"/>'/></td>
                </tr>
                <tr>
                    <td><s:property value="e.thirdyear+2"/>年(预计)</td>
                    <td><input type="text" name="e.firstsell" value='<s:property value="e.firstsell"/>'/></td>
                    <td><input type="text" name="e.firstinte" value='<s:property value="e.firstinte"/>'/></td>
                    <td><input type="text" name="e.firsttax" value='<s:property value="e.firsttax"/>'/></td>
                </tr>
            </table>

		 
				
	</table>
		        <input type="button" name="previous" class="previous action-button juzhong1" onclick="location.href='/interestapp/tostep1.html?e.id=<s:property value="e.id"/>'"
               style="position: relative;left: -20px;" value="上一步" />
    <input type="submit" name="submit" class="submit action-button juzhong"
           style="position: relative;left: -10px;" value="下一步" style="margin-left: 430px;"/>
</div>
        </fieldset>

    </form>

</div>

</body>
</html>
