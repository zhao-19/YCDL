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
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer.js"></script>
    
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/updateproductappinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<body>&nbsp; 
<!-- t有值代表是查看 -->
<input type="hidden" id="t" value="<s:property value="productapp.t"/>">
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#t").val();
	//alert(t);
	if(t=='v'){
		$("#updateproductappinfo input,radio,select,textarea,checkbox").attr("readonly",true);
		$(".shenqingdkt").attr("disabled",false);
		$(".shenqingdkthide").hide();
		$(".shenqingdkttijiao").hide();
	}else{
		updateproductappinfo();
		$(".shenqingdkthide").click(function(){
			//保存
			$("#updateproductappinfo").attr("action","/usercenter/saveProductappinfo.html");
		});
		$(".shenqingdkttijiao").click(function(){
			//提交
			$("#updateproductappinfo").attr("action","/usercenter/submitProductapp.html");
		});
		

	}
	
	
	
	
	$(".upback").click(function(){
		location.href = "/usercenter/getProductapplist2.html";
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
			
			<form id="updateproductappinfo" action="/usercenter/updateProductappinfo.html" method="post">
			
				<div class="title"><li>贷款基础资料</li></div>
				<input type="hidden" name="productapp.id" value="${productapp.id }"/>
				<input type="hidden" name="taskid" value="${taskid }"/>
				<input type="hidden" name="productapp.prodname" id="prodname" value="${productapp.prodname }"/>
				<input type="hidden" name="buttonid" id="buttonid" value="${buttonid }">
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">申请人：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="productapp.userid" type="text"  readonly="readonly" value="<s:property value='productapp.userid'/>" /></span>
				</div>
				<div class="inputtest inputtestl" id="ifkaiorkou">
					<span class="leftname leftnamel">产品名称：<span style="color:red">*</span></span>
					<span class="rightinfo selectli">
						<s:select list="#{'0201010003':'成长贷','0201010004':'壮大贷','0201010005':'新创贷','0201010006':'园保贷','0201010047':'期权贷'}" 
							listKey="key" listValue="value" name="productapp.prodid" id="prodid" onchange="setprodid(this);"/>
					</span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">企业名称：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="productapp.qiyemingcheng" type="text" value="<s:property value='productapp.qiyemingcheng'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">申请金额（万元）：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="productapp.loanamt" type="text"  value="<s:property value='productapp.loanamt.intValue()'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">贷款用途：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="productapp.loanuser" type="text"  value="<s:property value='productapp.loanuser'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">法定代表人：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="productapp.faren" value="<s:property value='productapp.faren'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">成立日期：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input stext laydate-icon" id="chengliriqi" name="productapp.chengliriqi"  value="<s:property value='productapp.chengliriqi'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">注册资本(万元)：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="productapp.zhuceziben"  value="<s:property value='productapp.zhuceziben'/>"/></span>
				</div>

				<div class="gszcddiv">
					<span class="leftname leftnamel">工商注册地：<span style="color:red">*</span></span> 
					<span class="rightinfo" id="gszcdspan">
						<select class="ssx" id="gszcd_province" name="productapp.gszcd_province"><s:property value="productapp.gszcd_province"/></select>  
					    <select class="ssx" id="gszcd_city" name="productapp.gszcd_city" ><s:property value="productapp.gszcd_city"/></select>  
					    <select class="ssx" id="gszcd_county" name="productapp.gszcd_county"><s:property value="productapp.gszcd_county"/></select>
					</span>
					<input type="hidden" id="province" value='<s:property value="productapp.gszcd_province"/>'/>
					<input type="hidden" id="city" value='<s:property value="productapp.gszcd_city"/>'/>
					<input type="hidden" id="county" value='<s:property value="productapp.gszcd_county"/>'/>
					<input type="hidden" id="custtype" value='productczdfirst'/>
					<script type="text/javascript">var custtype = 'productczdfirst';</script>
					<script src="../resource/js/area.js"></script>
					<script type="text/javascript">
					_init_area();

					
				
					//初始化
					//change(0);
					</script>
					
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">所属行业：<span style="color:red">*</span></span> 
					<span class="rightinfo">
						<select class="select" name="productapp.hangyeid" id="fasdf">
							<option value="">-请选择-</option>
								 <option value="07c03490e7684357a5987df50f37bd8b" <%if (("07c03490e7684357a5987df50f37bd8b").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>物流行业</option>
								<option value="137793478df9420984f81f2779b00bbb" <%if (("137793478df9420984f81f2779b00bbb").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>ＩＴ行业</option>
								<option value="16ea7663dd1143e6b1e923ee39af6238" <%if (("16ea7663dd1143e6b1e923ee39af6238").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>汽车行业</option>
								<option value="4bf0ee4adaa04c73940ae4f9b940b008" <%if (("4bf0ee4adaa04c73940ae4f9b940b008").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>其他行业</option>
								<option value="4f603cfd18e44ada8d7d3f0bcdeaaebb" <%if (("4f603cfd18e44ada8d7d3f0bcdeaaebb").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>旅游行业</option>
								<option value="520d8eac872e453a81049b4f12a15934" <%if (("520d8eac872e453a81049b4f12a15934").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>能源行业</option>
								<option value="583678e290a548abb4cd1ccda8448cc3" <%if (("583678e290a548abb4cd1ccda8448cc3").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>制造行业</option>
								<option value="5b366288961a47bdb3a0aedcf0f9f8fa" <%if (("5b366288961a47bdb3a0aedcf0f9f8fa").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>医疗健康</option>
								<option value="5c95443347794b2e8e39c94fea453cb1" <%if (("5c95443347794b2e8e39c94fea453cb1").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>化学工业</option>
								<option value="621a385c93f94580831814bbad4ec5e6" <%if (("621a385c93f94580831814bbad4ec5e6").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>研究咨询</option>
								<option value="66287346fd924ab08bd447f2ab99443a" <%if (("66287346fd924ab08bd447f2ab99443a").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>教育行业</option>
								<option value="67b1f13ab5d54f929b5e610076e02a58" <%if (("67b1f13ab5d54f929b5e610076e02a58").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>传媒娱乐</option>
								<option value="73317fb74630465d88056f84d0b1e785" <%if (("73317fb74630465d88056f84d0b1e785").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>农林牧渔</option>
								<option value="7a74a5afc1f94ffea16b6c54acea5b31" <%if (("7a74a5afc1f94ffea16b6c54acea5b31").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>房地产业</option>
								<option value="7b65958a27db481ba25157c31870258b" <%if (("7b65958a27db481ba25157c31870258b").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>电信及增值</option>
								<option value="8e3d1c95e9ba449dbecfe8434f9a20cc" <%if (("8e3d1c95e9ba449dbecfe8434f9a20cc").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>互联网络</option>
								<option value="8ff85aabe0c349edbb3d7da17fc14203" <%if (("8ff85aabe0c349edbb3d7da17fc14203").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>食品饮料</option>
								<option value="cd1f63f3d3de431e96814f6a8efeb5a4" <%if (("cd1f63f3d3de431e96814f6a8efeb5a4").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>家居建材</option>
								<option value="db191b4f4ed146e89db90655650efdf8" <%if (("db191b4f4ed146e89db90655650efdf8").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>金融行业</option>
								<option value="eb2b59709bd646da8e2566afd34a09d6" <%if (("eb2b59709bd646da8e2566afd34a09d6").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>投资行业</option>
								<option value="f9c910cd1cad4fe9ba9c04c9766a9de2" <%if (("f9c910cd1cad4fe9ba9c04c9766a9de2").equals(request.getAttribute("productapp.hangyeid"))) { out.print("selected=selected");} %>>连锁经营</option>
								 
						</select>
					</span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">专利个数：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="productapp.zhuanli" type="text" value="<s:property value='productapp.zhuanli'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">贷款联系人：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="productapp.lianxiren" type="text"  value="<s:property value='productapp.lianxiren'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">联系电话（手机）：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="productapp.lianxidianh"  value="<s:property value='productapp.lianxidianh'/>"/></span>
				</div>

				<div class="revise" id="zqxxxgbtn" ><input class="shenqingdkt upback" type="button" value="返回"/>&nbsp;&nbsp;
				  <s:if test="#request.buttonlist==null" >
				  <input class="shenqingdkt shenqingdkttijiao" type="submit" value="提交"/>
				  </s:if>
				  <s:else>
				  <s:iterator value="#request.buttonlist" var="button" status="st">
<input type="button" class="shenqingdkt oper" lang="<s:property value="id"/>" buttonid="<s:property value="#button.key" />"    name="czdsteponetijiao" value="<s:property value="#button.val"/>"></td>
                    
                </s:iterator>
                </s:else>
                </div>
			</form>
				</div>
							
		</div>	
		
		</div>

</div>


<script type="text/javascript">
function setprodid() {
	$("#prodname").val($("#prodid").find("option:selected").text());
}
setprodid();
if ('${productapp.prodid }' == '' && '${productapp.prodname }' != '') {
	$("#prodid option:contains('${productapp.prodname }')").attr("selected",true);
}
$('.oper').click(function(){
                    $('#buttonid').val($(this).attr("buttonid"));
                    console.log($('#buttonid').val());
                    $("#updateproductappinfo").attr("action","/usercenter/submitProductapp.html");
                    $("#updateproductappinfo").submit();
                })
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
 	leftnav_init("debtsinfo");
 </script>
</body>
</html>
 