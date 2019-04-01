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
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/productczdqtdkqk.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>	
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
</head>
<body>
<!-- t有值代表是查看 -->
<input type="hidden" id="t" value="<s:property value="e.t"/>">
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#t").val();
	if(t=='v'){
		$("#productczdqtdkqk input,radio,select,textarea,checkbox").attr('disabled',true).parent().addClass("nohover");
		$("#czdsteponesbt").attr("disabled",false);
		$("#czdsteponesave").attr("disabled",false);
		var id = $("#czdsteponesbt").attr("lang");
		$("#productczdqtdkqk").attr("action","/productczdbase/tostep6.html?e.id="+id+"&e.t="+t);
		/* $("#czdsteponesbt").click(function(){
			var id=$(this).attr("lang");
			//点击下一步 链接是第五步
			location.href="/productczdbase/tostep6.html?id="+id+"&e.t="+t;
		}); */
		$(".nextnotice").hide();
	}else{
		productczdqtdkqk();
	}
	$("#czdsteponesave").click(function(){
	//	返回上一步
		var id=$(this).attr("lang");
		location.href="/productczdbase/tostep4.html?id="+id+"&e.t="+t;
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
    .ycactifs tr td input {width:145px;}
</style>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>





<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="../usercenter/leftnav.jsp"%>
	</div>


	<div class="list fr">
		<div class="rightbox">
			
			
			<!--债权融资 -->
			<div id="peixunhuodong" class="vipinfo" >
				<div class="title"><li><span class="t">复审第五步（共七步）：贷款情况</span> </li></div>

				<form action="/productczdbase!updatestep5.action?e.id=${e.id}&e.t=${e.t}&taskid=${taskid}" id="productczdqtdkqk" name="czdsteptwo" method="post">
				<p class="ptitle"><span  class="trleft" >截止目前贷款情况</span><%-- <span class="trright" >计量单位：万元</span> --%></p>
				<table id="ycacti" name="gdqk"  class="ycactifs gdqkinputs zqrztable"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TT"  lang="firsttr">
 						<td  >债权银行</td>
 						<td >贷款金额（万元）</td>
						<td  >贷款方式</td>
						<td  >借款日期</td>
						<td  >到期日期</td>
					</tr>
					<s:iterator value="#request.qtdkqkList" status="index">
					<tr class="trorder">
 						<td class="input"  ><input type="text" class="iname"  name="zhaiquanyinhang<s:property value="#index.index"/>"  value="<s:property value='zhaiquanyinhang'/>"></td>
 						<td class="input"  ><input type="text" class="inumber"  name="daikuanyue<s:property value="#index.index"/>"  value="<s:property value='daikuanyue'/>"></td>
 						<td class="input"  ><input type="text" class="iname"  name="daikuanfangshi<s:property value="#index.index"/>"  value="<s:property value='daikuanfangshi'/>"></td>
 						<td class="input"  ><input type="text" class="laydate-icon idate" id="jiekuanriqi<s:property value="#index.index"/>"  name="jiekuanriqi<s:property value="#index.index"/>"  value="<s:property value='jiekuanriqi'/>"></td>
 						<td class="input"  ><input type="text" class="laydate-icon idate" id="daoqiriqi<s:property value="#index.index"/>"  name="daoqiriqi<s:property value="#index.index"/>"  value="<s:property value='daoqiriqi'/>"></td>
					</tr>
					</s:iterator>
					
					<tr >
						<td colspan="5"><input type="button"  id="gbdel"   name="gbdel"  value="删除"><input type="button"  id="gbadd"  name="gbadd"  value="增加"></td>
					</tr>
					
					<tr class="tijiao">
						<td colspan="5"><input type="button"  id="czdsteponesave" lang="<s:property value="id"/>"    name="czdsteponesave"  value="上一步">&nbsp;&nbsp;&nbsp;<input type="submit"  id="czdsteponesbt"  lang="<s:property value="id"/>"    name="czdsteponesbt" value="下一步"><span class="nextnotice">&nbsp;&nbsp;(注：点击下一步会保存当前这一步的数据)</span></td>
					</tr>
			
				</table>
				
				</form>
			 
			 
			 			
			 
				<script type="text/javascript">
				
				//日期控件
				!function(){
					laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
					laydate({elem: '#jiekuanriqi0'});//绑定元素
					laydate({elem: '#daoqiriqi0'});//绑定元素
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
				
				
				$(window).load(function(){
					jQuery.validator.addMethod("isNum", function(value, element) {       
					    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
					    return this.optional(element) || (num.test(value));       
					}, "请正确填写数字");
					
					var gdqkinputs_iname = $(".gdqkinputs input[class=iname]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true, messages: {required:"请输入"} })
					});
					var gdqkinputs_iname = $(".gdqkinputs input[class=inumber]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true,isNum :true, messages: {required :"请输入",isNum:"请填写数字"} })
					});
					var gdqkinputs_iname = $(".gdqkinputs input[class=laydate-icon idate]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true,isDate :true, messages: {required :"请输入",isDate:"请正确输入"} })
					});					
				});
				
				
				jQuery.validator.addMethod("isNum", function(value, element) {       
				    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
				    return this.optional(element) || (num.test(value));       
				}, "请正确填写数字");
				
					//企业主要产品增加和删除
					$("#gbadd").click(function(){
						//先查询前面有几个装变化数据的tr
						var curtabdatatr_num = $(this).parent().parent().parent().children(".trorder").length;
						
						var tr =$("<tr class='trorder'><td class='input'  ><input type='text'  value='' class='iname'  name='zhaiquanyinhang"+curtabdatatr_num+"'></td><td class='input'  ><input type='text'  value='' class='inumber'  name='daikuanyue"+curtabdatatr_num+"'></td><td><input type='text'  value='' class='iname' name='daikuanfangshi"+curtabdatatr_num+"'></td><td class='input' ><input type='text'  value='' class='laydate-icon idate' id='jiekuanriqi"+curtabdatatr_num+"' name='jiekuanriqi"+curtabdatatr_num+"'></td><td class='input' ><input type='text'  value='' class='laydate-icon idate' id='daoqiriqi"+curtabdatatr_num+"' name='daoqiriqi"+curtabdatatr_num+"'></td></tr>");
						tr.insertBefore($(this).parent().parent());
						
						var gdqkinputs_iname = $(".gdqkinputs input[class=iname]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true, messages: {required:"请输入"} })
						});
						var gdqkinputs_iname = $(".gdqkinputs input[class=inumber]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,isNum :true, messages: {required :"请输入",isNum:"请填写数字"} })
						});
						var gdqkinputs_iname = $(".gdqkinputs input[class=laydate-icon idate]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,isDate :true, messages: {required :"请输入",isDate:"请正确输入"} })
						});
						
						
					});
					
					//动态添加日期控件
					var gdqkinputs_inamex = $(".gdqkinputs input[class=laydate-icon idate]");
							gdqkinputs_inamex.live('click',function(){
							var naowdate = $(this).attr("id");
							laydate({elem: '#'+naowdate});//绑定元素
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
 	leftnav_init("debtsinfo");
 </script>
</body>
</html>
 