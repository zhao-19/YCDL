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
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/productczdqtxx.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
</head>
<body>
<!-- t有值代表是查看 -->
<input type="hidden" id="t" value="<s:property value="e.t"/>">
<input type="hidden" id="backnotice" value="<s:property value="#request.flag"/>">
	<div id="ggts2"></div>

<script type="text/javascript">
$(document).ready(function(){


  var backnotice = $("#backnotice").val();
	if(backnotice=='1'){
	     
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
	    ggts2('暂存成功');
	}  
	
	var t = $("#t").val();
	if(t=='v'){
		$("#productczdqtxx input,radio,select,textarea,checkbox").attr('disabled',true).parent().addClass("nohover");
		$("#czdsteponesbt").attr("disabled",false);
		$("#czdsteponesave").attr("disabled",false);
		var id = $("#czdsteponesbt").attr("lang");
		$("#productczdqtxx").attr("action","/productczdbase/selectList.html");
		$("#czdsteponesbt").attr("value","返回");
		$("#czdsteponetijiao").remove();
		$("#czdsteponesbt_zc").hide();
		
		/* $("#czdsteponesbt").click(function(){
			var id=$(this).attr("lang");
			//点击下一步 链接是第七步
			location.href="/productczdbase/tostep8.html?id="+id+"&e.t="+t;
		}); */
		
	}else{
		$("#czdsteponetijiao").click(function(){
		
			
			//点击提交按钮，是改变form表单的action，且提交
			productczdqtxx();
			
			});	
		//点击暂存按钮移除错误节点，改变form表单的id,提交form表单
		$("#czdsteponesbt_zc").click(function(){
			$(".error").remove();
	       $("#productczdqtxx").attr("action","/productczdbase!updatestep7.action");
			$("#productczdqtxx").submit();
		});


		
		
	}
	$("#czdsteponesave").click(function(){
	//	返回上一步
		var id=$(this).attr("lang");
		location.href="/productczdbase/tostep6.html?id="+id+"&e.t="+t;
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
    #ycacti tr td {padding:0}
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
				<div class="title"><li><span class="t">复审第七步（共七步）：其它信息</span> </li></div>

				<form action="/productczdbase!submit.action" id="productczdqtxx" name="czdsteptwo" method="post">
 				<table id="ycacti"  name="bzgc"  class="ycactifs"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr>
 						<td colspan="4" >2016年度情况<input type="hidden"  name="qtxx.id"    value="<s:property value='qtxx.id'/>">
 						<input type="hidden"  name="e.id"    value="<s:property value='e.id'/>">
 						<input type="hidden"  name="e.t"    value="<s:property value='e.t'/>">
  						
 						</td>
					</tr>
				
					<tr>
 						<td style="width:110px;float:left;">研发费用(万元)</td>
 						<td  class="input"><input type="text"  name="qtxx.yanfafeiyong"  style="width: 244px;margin-left: 5px;" value="<s:property value='qtxx.yanfafeiyong'/>"></td>
						<td style="width:107px;float:left;">销售收入(万元)</td>
						<td  class="input"><input type="text"  name="qtxx.xiaoshoufeiyong" style="width: 244px;margin-left: 5px;"  value="<s:property value='qtxx.xiaoshoufeiyong'/>"></td>
					</tr>
					
					<tr>
						<td style="width:110px;float:left;">研发人员(人)</td>
 						<td  class="input" colspan="3"><input type="text"  name="qtxx.yanfarenyuan"  style="width: 244px;margin-left: 5px;" value="<s:property value='qtxx.yanfarenyuan'/>"></td>
						
					 </tr>
					 
					 <tr><td colspan="4">三年借款/还款</td></tr>
					
					<tr>
 						<td style="width:134px;">三年累计借款(万元)</td>
 						<td  class="input"><input type="text"  name="qtxx.sannianleijijiekuan"  style="width: 244px;margin-left:5px;" value="<s:property value='qtxx.sannianleijijiekuan'/>"></td>
						<td style="width:134px;">三年累计归还(万元)</td>
						<td  class="input"><input type="text"  name="qtxx.sannianleijiguihuan" style="width: 244px;margin-left:5px;"  value="<s:property value='qtxx.sannianleijiguihuan'/>"></td>
					</tr>
					
					
					<tr>
 						<td class="trleft" colspan="4" >知识产权/标准</td>
					</tr>
					<tr>
 						<td colspan="4" class="input trleft">
	 						<input class="check"  type="checkbox" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa250".indexOf(((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx)request.getAttribute("qtxx")).getZhishichanquan1())>0) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa250" id="zhishichanquan1"  name="qtxx.zhishichanquan1">发明
	 						<input class="check"  type="checkbox" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa251".indexOf(((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx)request.getAttribute("qtxx")).getZhishichanquan1())>0) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa251"  name="qtxx.zhishichanquan1">实用新型
	 						<input class="check"  type="checkbox" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa252".indexOf(((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx)request.getAttribute("qtxx")).getZhishichanquan1())>0) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa252"  name="qtxx.zhishichanquan1">外观专利
	 						<input class="check"  type="checkbox" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa253".indexOf(((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx)request.getAttribute("qtxx")).getZhishichanquan1())>0) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa253"  name="qtxx.zhishichanquan1">软件著作权
	 						<input class="check"  type="checkbox" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa254".indexOf(((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx)request.getAttribute("qtxx")).getZhishichanquan1())>0) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa254"  name="qtxx.zhishichanquan1">行业标准等
 						</td>
					</tr>
					<tr>
 						<td class="input trleft zscqnum" colspan="4" >
	 						<span>发明数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.zhishichanquan2_0'/>" readonly="readonly" id="zhishichanquan2_0"  name="qtxx.zhishichanquan2_0">
	 						<span>实用新型数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.zhishichanquan2_1'/>" readonly="readonly"    name="qtxx.zhishichanquan2_1">
	 						<span>外观专利数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.zhishichanquan2_2'/>" readonly="readonly"    name="qtxx.zhishichanquan2_2">
	 						<span>软件著作权数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.zhishichanquan2_3'/>" readonly="readonly"    name="qtxx.zhishichanquan2_3">
	 						<span>行业标准等数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.zhishichanquan2_4'/>"  readonly="readonly"   name="qtxx.zhishichanquan2_4">
 						</td>
					</tr>
					<tr>
 						<td class="input trleft" colspan="4" >
 						<textarea id ="zlnullst" class="trleft"  name="qtxx.zhishichanquan3"><s:property value='qtxx.zhishichanquan3'/></textarea>
 						</td>
					</tr>
					
					<tr>
 						<td class="trleft" colspan="4" >权威认定</td>
					</tr>
					<tr>
 						<td colspan="4" class="input trleft" >
	 						<input class="check"  type="checkbox" <%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa260")){ out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa260" id="quanweirending1"  name="qtxx.quanweirending1">A-高企
	 						<input class="check"  type="checkbox" <%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa261")){ out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa261"  name="qtxx.quanweirending1">A-双软
	 						<input class="check"  type="checkbox" <%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa262")){ out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa262"  name="qtxx.quanweirending1">A-集成电路
	 						<input class="check"  type="checkbox" <%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa263")){ out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa263"  name="qtxx.quanweirending1">B-CE
	 						<input class="check"  type="checkbox" <%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa264")){ out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa264"  name="qtxx.quanweirending1">B-CMMI
	 						<input class="check"  type="checkbox" <%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa265")){ out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa265"  name="qtxx.quanweirending1">B-GMP
	 						<input class="check"  type="checkbox" <%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa266")){ out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa266"  name="qtxx.quanweirending1">C-IS01400
	 						<input class="check"  type="checkbox" <%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa267")){ out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa267"  name="qtxx.quanweirending1">C-OHSMSISO
	 						<input class="check"  type="checkbox" <%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa268")){ out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa268"  name="qtxx.quanweirending1">C-18000
	 						<input class="check"  type="checkbox" <%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa269")){ out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa269"  name="qtxx.quanweirending1">C-ISO22000
 						</td>
					</tr>
				 	<tr style="display:none">
 						<td class="input trleft zscqnum" colspan="4" >
	 						<span>A-高企数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.quanweirending2_0'/>" readonly="readonly"  name="qtxx.quanweirending2_0">
	 						<span>A-双软数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.quanweirending2_1'/>" readonly="readonly"    name="qtxx.quanweirending2_1">
	 						<span>A-集成电路数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.quanweirending2_2'/>" readonly="readonly"    name="qtxx.quanweirending2_2">
	 						<span>B-CE数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.quanweirending2_3'/>" readonly="readonly"    name="qtxx.quanweirending2_3">
	 						<span>B-CMMI数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.quanweirending2_4'/>"  readonly="readonly"   name="qtxx.quanweirending2_4">
	 						<span>B-GMP数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.quanweirending2_5'/>"  readonly="readonly"   name="qtxx.quanweirending2_5">
	 						<span>C-ISO1400数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.quanweirending2_6'/>"  readonly="readonly"   name="qtxx.quanweirending2_6">
	 						<span>C-OHSMSISO数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.quanweirending2_7'/>"  readonly="readonly"   name="qtxx.quanweirending2_7">
	 						<span>C-18000数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.quanweirending2_8'/>"  readonly="readonly"   name="qtxx.quanweirending2_8">
	 						<span>C-ISO22000数量：</span><input class="num"   type="text"  value="<s:property value='qtxx.quanweirending2_9'/>"  readonly="readonly"   name="qtxx.quanweirending2_9">
 						</td>
					</tr>  
					<tr>
 						<td class="input trleft" colspan="4" >其他：
 						<textarea id ="zlnullst" class="trleft"  name="qtxx.quanweirending3"><s:property value='qtxx.quanweirending3'/></textarea>
 						</td>
					</tr>
					<tr>
 						<td class="trleft" colspan="4" >技术应用情况（技术应用的市场前景）</td>
					</tr>
					<tr>
 						<td class="input trleft" colspan="4" >
 						<textarea id ="shichangqianjing" class="trleft"  name="qtxx.shichangqianjing"><s:property value='qtxx.shichangqianjing'/></textarea>
 						</td>
					</tr>
					<tr>
 						<td class="trleft" colspan="4" >行业情况及企业简介</td>
					</tr>
					<tr>
 						<td class="input trleft" colspan="4" >
 						<textarea id ="fazhanqianjing" class="trleft"  name="qtxx.fazhanqianjing"><s:property value='qtxx.fazhanqianjing'/></textarea>
 						</td>
					</tr>
				 	<tr>
 						<td class="trleft" colspan="4" >主要产品介绍</td>
					</tr>
					<tr>
 						<td class="input trleft" colspan="4" >
 						<textarea id ="zhuyaochanpingjieshao" class="trleft"  name="qtxx.zhuyaochanpingjieshao"><s:property value='qtxx.zhuyaochanpingjieshao'/></textarea>
 						</td>
					</tr>
					<tr>
 						<td class="trleft" colspan="4" >产品竞争力</td>
					</tr>
					<tr>
 						<td class="input trleft" colspan="4" >
 						<textarea id ="chanpinjingzhengli" class="trleft"  name="qtxx.chanpinjingzhengli"><s:property value='qtxx.chanpinjingzhengli'/></textarea>
 						</td>
					</tr>
					<tr>
 						<td class="trleft" colspan="4" >高管团队（教育背景及学历、行业从业经历等）</td>
					</tr>
					<tr>
 						<td class="input trleft" colspan="4" >
 						<textarea id ="gaoguantuandui" class="trleft"  name="qtxx.gaoguantuandui"><s:property value='qtxx.gaoguantuandui'/></textarea>
 						</td>
					</tr>
					<tr>
 						<td class="trleft" colspan="4" >市场拓展的前景</td>
					</tr>
					<tr>
 						<td class="input trleft" colspan="4" >
 						<textarea id ="tuozhanqianjing" class="trleft"  name="qtxx.tuozhanqianjing"><s:property value='qtxx.tuozhanqianjing'/></textarea>
 						</td>
					</tr>
					
					<tr class="tijiao">
						<td colspan="4"><input type="button"  id="czdsteponesave" lang="<s:property value="id"/>"   name="czdsteponesave"  value="上一步"/>&nbsp;&nbsp;&nbsp;<input type="button"  id="czdsteponesbt_zc"  lang="<s:property value="id"/>"   name="czdsteponesbt" value="暂存"/>&nbsp;&nbsp;&nbsp;  <input type="submit"  id="czdsteponetijiao" lang="<s:property value="id"/>"    name="czdsteponetijiao" value="提交"></td>
					</tr>
			
				</table>
				
				</form>
			 			
			 
				<script type="text/javascript">

//判断浏览器是不是ie  
var NV = {};
var UA = navigator.userAgent.toLowerCase();
try
{
	NV.name=document.all?'ie':
	(UA.indexOf("firefox")>0)?'firefox':
	(UA.indexOf("chrome")>0)?'chrome':
	window.opera?'opera':"C:/Users/50750/Desktop/browsercheck.jsp"
	window.openDatabase?'safari':
	'unkonw';
}catch(e){};
try
{
	NV.version=(NV.name=='ie')?UA.match(/msie ([\d.]+)/)[1]:
	(NV.name=='firefox')?UA.match(/firefox\/([\d.]+)/)[1]:
	(NV.name=='chrome')?UA.match(/chrome\/([\d.]+)/)[1]:
	(NV.name=='opera')?UA.match(/opera.([\d.]+)/)[1]:
	(NV.name=='safari')?UA.match(/version\/([\d.]+)/)[1]:
	'0';
}catch(e){};
try
{
	NV.shell=(UA.indexOf('360ee')>-1)?'360极速浏览器':
	(UA.indexOf('360se')>-1)?'360安全浏览器':
	(UA.indexOf('se')>-1)?'搜狗浏览器':
	(UA.indexOf('aoyou')>-1)?'遨游浏览器':
	(UA.indexOf('theworld')>-1)?'世界之窗浏览器':
	(UA.indexOf('worldchrome')>-1)?'世界之窗极速浏览器':
	(UA.indexOf('greenbrowser')>-1)?'绿色浏览器':
	(UA.indexOf('qqbrowser')>-1)?'QQ浏览器':
	(UA.indexOf('baidu')>-1)?'百度浏览器':
	'未知或无壳';
}catch(e){}
//alert(NV.name);
/*
document.write('<div><p>浏览器UA='+UA+
'</p><p>浏览器名称='+NV.name+
'</p><p>浏览器版本='+NV.version+
'</p><p>浏览器外壳='+NV.shell+'</p></div>');*/
//对于ie浏览器版本为6,7,8的建议使用IE9.0以上版本，强烈建议使用chrome谷歌和360安全浏览器，火狐等常用浏览器





				
			
				
				//知识产权checkbox选中时，对应的数量添加可编辑样式
				var zscqbox = $('.check');    
				var zscqnum = $('.num'); 
					zscqnum.css({'max-height':'20px','margin':'5px'});
					zscqbox.each(function(i,v){
						zscqbox.eq(i).change(function(){
				    		if(zscqbox.eq(i).is(":checked")){
				    			zscqnum.eq(i).attr('readonly',false).css({'color':'#333','border':"1px solid #777"});
				    		}else{
				    			zscqnum.eq(i).val(0).attr('readonly',true).css({'color':'#ccc','border':'0'});
				    		}
				    	});
				    });
					zscqnum.change(function(){
						var fornum = $(this).val();
						var thisenme = $(this).prev().text();
						
							thisenme=thisenme.substring(0,thisenme.length-1);
							if((NV.name)=='ie'){
								var strs = thisenme+":<br/>";
								for(var i=1;i<=fornum;i++){
									strs+=i+"：<br/>";
								}
							}else{
								var strs = thisenme+":\r\n";
								for(var i=1;i<=fornum;i++){
									strs+=i+"：\r\n";
								}

							}
							
							
							
							//var sp = $("<span>"+strs+"</span>");
							var zlnulist =$(this).parent().parent().next().find("textarea");
							//zlnulist.append(sp);return;
							var zlnullstv = zlnulist.val();
							var zlnullstval = zlnulist.val()+strs;
							/* if(zlnullstv.length<1){
								var reszlnullstval = zlnullstval.substring(0,zlnullstval.length-0);
							}else{
								var reszlnullstval = zlnullstval.substring(0,zlnullstval.length-2);
							} */
								//$("#zlnullst").html(reszlnullstval);
								zlnulist.html(zlnullstval);
					});
					
				
				
					//企业主要产品增加和删除
					$("#gbadd").click(function(){
						var tr =$("<tr><td class='input'  ><input type='text'  value=''  name='Beidanbaoren'></td><td class='input'  ><input type='text'  value=''  name='Danbaoyue'></td><td class='input' ><input type='text'  value=''  name='Danbaofangshi'></td><td class='input' ><input type='text'  value=''  name='Kaishiriqi'></td><td class='input' ><input type='text'  value=''  name='Daoqiriqi'></td></tr>");
						tr.insertBefore($(this).parent().parent());
					});
					$("#gbdel").click(function(){
						var prev = $(this).parent().parent().prev();
						var firsttr = prev.attr("lang");
						if(firsttr!="firsttr"){
							prev.remove();
						}
						
					});
					
					
			 	</script>
			</div>
			</div>
			</div>

</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("redebtsinfo");
 </script>
</body>
</html>
 