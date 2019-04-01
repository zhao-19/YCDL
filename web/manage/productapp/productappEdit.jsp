<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="../css/massage.css"/>
<script src="../js/jquery.min.js"></script> 
<script src="../js/basemessage.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/layer/layer.js"></script>
<style>
	.td_right{text-align: right;}
	select{height:auto;}
	#ldksq1{display:none;width: 100%;height: 100%;position: fixed;left: 0;top:0;bottom: 0;right: 0;margin:auto;z-index: 9999!important;background:url("../img/lobg_03.png") repeat;}
	#ldksq_c1{background-color: #fff;width: 520px;min-height:140px;/*position: absolute;top:0;left:0;right:0;bottom: 0;*/margin:auto;border-radius: 5px;behavior: url(PIE.htc);padding:10px;}
	#ldksq_lose1{background: url("../img/delete.png") no-repeat;position: absolute;right: 10px;top:10px;width: 16px;height: 16px;cursor: pointer;}
	#ldksq_c1 p{text-align:center;}
	#ldksq_c1 .qx{background:url("..//delete.png") no-repeat;}
</style>
<script type="text/javascript">
	$(function() {
		 $("#username").focus();
	});
	
	
</script>
</head>

<body>
	<s:form action="productapp" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td colspan="3"><s:hidden name="e.id" />
				<s:hidden name="e.prodname" id="prodname"/>
		 		<%-- <input type="hidden" name="taskid" value="${taskid }"/> --%>
				<s:textfield name="e.gszcd_province" id="gszcd_province"   />
				<s:textfield name="e.gszcd_city" id="gszcd_city"  />
				<s:textfield name="e.gszcd_county" id="gszcd_county"   />
				</td>
			</tr>
			<tr style="display:none;">
				<th class="td_right">状态</th>
				<td style="text-align: left;" colspan="3">
				<s:select list="%{#application.dic.zqsqzt.childs}" id="status" listKey="id"  
                            listValue="name" name="e.status" label="申请状态"  
                            headerKey="" headerValue=""   data-rule="申请状态:required;name" />  
				</td>
			 </tr>
			 
			 				 
 				
 								<tr>
				<th class="td_right">申请人</th>
				<td style="text-align: left;">
				
                 
				<s:textfield name="e.userid" id="userid" readonly="true" />
				</td>
				 
			 
				 
				<th class="td_right">产品名称</th>
				<td style="text-align: left;">
 				<s:select list="%{#application.dic.ycdldkcp2.childs}" listKey="id" listValue="name" name="e.prodid" id="prodid"/>   
				<input style="margin-top:-5px!important;height:auto;padding:0px 2px;" onclick="updateproducname();" type="button" value="修改"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业名称</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield name="e.qiyemingcheng" size="80" id="qiyemingcheng" readonly="true" />
				</td>
				 	</tr>
 				
 								<tr>
				<th class="td_right">申请金额(万元)</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield name="e.loanamt" id="loanamt" readonly="true" />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">贷款用途</th>
				<td style="text-align: left;" colspan="3">
				<s:textarea rows="5" cols="80" name="e.loanuser" id="loanuser" readonly="true"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">法人</th>
				<td style="text-align: left;">
				<s:textfield name="e.faren" id="faren" readonly="true" />
				</td>
				 
				<th class="td_right">成立日期</th>
				<td style="text-align: left;">
				<s:textfield name="e.chengliriqi" id="chengliriqi" readonly="true" />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">注册资本(万元)</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhuceziben" id="zhuceziben" readonly="true" />
				</td>
			 
				<th class="td_right">工商注册地</th>
				<td style="text-align: left;">
				<input type="text" readonly="readonly" value="<s:property value='e.gszcd_province'/>&nbsp;<s:property value='e.gszcd_city'/>&nbsp;<s:property value='e.gszcd_county'/>" />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">所属行业</th>
				<td style="text-align: left;">
 				
				<s:select list="%{#application.dic.c9a715e6c1b446c48c1818d80452c3ed.childs}" listKey="id"  
                            listValue="name" name="e.hangyeid" label="所属行业"  
                            headerKey="" headerValue=""    />  
                            
                            
				</td>
			 
				<th class="td_right">专利情况</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhuanli" id="zhuanli" readonly="true"  />
				</td>
				</tr>
 				
 				<%-- <tr>
				<th class="td_right">上年度销售收入(万元)</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastsellincome" id="lastsellincome" readonly="true"  />
				</td>
				 
				<th class="td_right">上年度净利润(万元)</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastimcome" id="lastimcome" readonly="true"  />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">截止上年度银行贷款(万元)</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastloanamt" id="lastloanamt" readonly="true"  />
				</td>
				 
				<th class="td_right">本年度销售收入(万元)</th>
				<td style="text-align: left;">
				<s:textfield name="e.sellincome" id="sellincome" readonly="true"  />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">本年度净利润(万元)</th>
				<td style="text-align: left;">
				<s:textfield name="e.imcome" id="imcome" readonly="true" />
				</td>
				 
				<th class="td_right">本年度银行贷款(万元)</th>
				<td style="text-align: left;">
				<s:textfield name="e.loanamt2" id="loanamt2" readonly="true"  />
				</td>
				</tr> --%>
	</table>
	<table class="table table-condensed table-bordered">
        <thead>
        <tr style="background-color: #dff0d8">
          <th>报表时间</th>
          <th>报表类型</th>
          <th>总资产</th>
          <th>营业收入</th>
          <th>净利润</th>
          <th>纳税总额</th>
          <th>银行借款</th>
          <th>操作</th>
        </tr>
        </thead>
        <s:iterator value="finaList">
            <tr>
				<td>&nbsp;<s:property value="report_time.length()>10?report_time.substring(0,10):''"/></td>
                <td>&nbsp;
					<s:if test="report_type==1">年报</s:if>
					<s:elseif test="report_type==2">半年报</s:elseif>
					<s:elseif test="report_type==3">季报</s:elseif>
					<s:elseif test="report_type==4">月报</s:elseif>
                </td>
                <td>&nbsp;<s:property value="assets"/></td>
                <td>&nbsp;<s:property value="income"/></td>
                <td>&nbsp;<s:property value="net_margin"/></td>
                <td>&nbsp;<s:property value="taxamt"/></td>
                <td>&nbsp;<s:property value="bank_borrowings"/></td>
               	<td><a onclick="showDiv('${id}')">详情</a></td>
            </tr>
        </s:iterator>
    </table>
 	<table class="table table-bordered">							
 			<tr>					
				<th class="td_right">联系人</th>
				<td style="text-align: left;">
				<s:textfield name="e.lianxiren" id="lianxiren" readonly="true"  />
				</td>
				 
				<th class="td_right">联系电话</th>
				<td style="text-align: left;">
				<s:textfield name="e.lianxidianh" id="lianxidianh" readonly="true" />
				</td>
				</tr>
 				
				
 				
 								<tr>
				<th class="td_right">审核人</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield name="e.checkuser" id="checkuser" readonly="true"/>
				</td>
				 
				</tr>
 				
 							 
 				 
				<tr>
					<th class="td_right">备注</th>
					<td style="text-align: left;" colspan="3">
	 				<s:textarea name="e.memo" id="memo"  data-rule="备注:memo;length[1~128]"   rows="3" cols="80"  readonly="false"  />
	 				
					</td>
				</tr>
				<tr>
				<th class="td_right">当前状态</th>
				<td style="text-align: left;"  colspan="3">
				  <%= SystemManager.treeNodeMap.get(request.getAttribute("e.status")).getName() %>
				</td>
				</tr>
 						
				   
			<tr >
				<td colspan="4" style="text-align: center;" >
					<!-- 	<s:if test="e.id=='' or e.id==null">
						<button method="productapp!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
					
						 
					</s:else>
					
				 	<button method="productapp!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>&nbsp;&nbsp;&nbsp;&nbsp;
						-->
						<s:iterator value="#request.buttonlist" var="button" status="st">

                    <span  taskid="${taskid}" buttonid="<s:property value="#button.key" />" class="btn btn-info oper">
                    <i class="icon-ok icon-white "></i>
                    <span>
                        <s:property value="#button.val"/>
                    </span>
                    </span>
                </s:iterator>
						<%-- <span method="productapp!update.action" onclick="statusset('0')"  class="btn btn-danger backstep">
							<i class="icon-ok icon-white"></i> 驳回
						</span>&nbsp;&nbsp;&nbsp;&nbsp;
						
							<span  method="productapp!update.action" onclick="statusset('1')" class="btn btn-info btnnextstep">
							<i class="icon-ok icon-white "></i> 通过
						</span>&nbsp;&nbsp;&nbsp;&nbsp; --%>
				</td>
			</tr>
		</table>
	</s:form>
	
<%-- <!--点击下一步弹出发送短信对话框 start-->
<div id="ldksq">
    <div id="ldksq_c">
        <div id="ldksq_lose"></div>
        <form action="productapp!update.action" name="indexdksq" id="indexdksq" method="post">
        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        <input type="hidden" name="status" id="status2" />
        <input type="hidden" name="memovalue" id="memovalue" />
        <input type="hidden" name="taskid" value="${taskid}"/>
			<input type="hidden" id="phoneNumber" value="<s:property value="#request.custManage.cellPhoneNum"/> ">
			<input type="hidden" id="nickname" value="<s:property value="#request.custManage.nickname"/> ">
        
        <input type="hidden" name="userid" value="<s:property value="e.userid" />"/>
        <p id="tckselect" style="display:none;margin-top: 20px;"><span>贷款产品：</span><span>
        
        <s:select list="%{#application.dic.ycdldkcp.childs}" name="e.prodname"  cssClass="input-medium" 
										listKey="id" listValue="name"  headerKey="" headerValue=""  data-rule="贷款品种:required;daikuanpingz"/>

											
	
										</span></p>
        <p id="tcktel"><span>电话号码：</span><input class="title" type="text"   value="<s:property value="e.lianxidianh" />" name="dianhua" data-rule="短信标题:required;m_title;length[2~22]"></p>
        <p id="tckremark"><span class="msgcontenttype">短信内容：</span><textarea class="duanxin" rows="4" cols="80" name="content" id="msgcontent"   data-rule="短信标题:required;m_remark;length[2~128]">   </textarea></p>
        <p>
        	<button id="ldksq_lose2" type="reset" class="btn btn-inverse"  style="margin-left:20px;">
				<i class="icon-ok icon-white qx"></i> 取消
			</button>
			<button type="submit" class="btn btn-success" style="margin-left:20px;">
				<i class="icon-ok icon-white"></i> 确定
			</button></p>
        </form>
    </div>
</div> --%>
<div id="ldksq">
    <div id="ldksq_c">
        <div id="ldksq_lose"></div>
        <form action="productapp!update.action" name="indexdksq" id="indexdksq" method="post">
        <input type="hidden" name="taskid" id="taskid">
        <input type="hidden" name="buttonid" id="buttonid">
        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        <p id="tckremark"><span class="msgcontenttype">审核意见：</span><textarea class="duanxin" rows="4" cols="80" name="msgcontent" id="msgcontent"   data-rule="短信标题:required;m_remark;length[2~512]">   </textarea></p>
        <p>
            <button id="ldksq_lose2" type="reset" class="btn btn-inverse"  style="margin-left:20px;">
                <i class="icon-ok icon-white qx"></i> 取消
            </button>
            <button type="submit" class="btn btn-success" style="margin-left:20px;">
                <i class="icon-ok icon-white"></i> 确定
            </button></p>
        </form>
    </div>
</div>

<div id="ldksq1">
    <div id="ldksq_c1">
        <div id="ldksq_lose1" onclick="$('#ldksq1,.hidetable').hide();"></div>
        <s:iterator value="finaList">
        <table class="table table-bordered hidetable" id="${id }" style="display: none;">
        <tr>
            <th class="td_right" style="width: 100px">报表类型</th>
            <td style="text-align: left;">
            	<s:if test="report_type==1">年报</s:if>
				<s:elseif test="report_type==2">半年报</s:elseif>
				<s:elseif test="report_type==3">季报</s:elseif>
				<s:elseif test="report_type==4">月报</s:elseif>
            </td>
            <th class="td_right" style="width: 100px">报表时间</th>
            <td style="text-align: left;">${fn:substring(report_time, 0, 10)}</td>
        </tr>
        <tr>
        	<th class="td_right">总资产</th>
            <td style="text-align: left;">${assets }</td>
            <th class="td_right">总负债</th>
            <td style="text-align: left;">${liabilities }</td>
        </tr>
        <tr>
        	<th class="td_right">所有者权益</th>
            <td style="text-align: left;">${owner_equity }</td>
            <th class="td_right">实收资本</th>
            <td style="text-align: left;">${paicl_up }</td>
        </tr>
        <tr>
        	<th class="td_right">未分配利润</th>
            <td style="text-align: left;">${notallot_profit }</td>
            <th class="td_right">银行借款</th>
            <td style="text-align: left;">${bank_borrowings }</td>
        </tr>
        <tr>
        	<th class="td_right">营业收入</th>
            <td style="text-align: left;">${income }</td>
            <th class="td_right">主营业务收入</th>
            <td style="text-align: left;">${main_income }</td>
        </tr>
        <tr>
        	<th class="td_right">应收账款</th>
            <td style="text-align: left;">${should_income }</td>
            <th class="td_right">营业成本</th>
            <td style="text-align: left;">${oper_cost }</td>
        </tr>
        <tr>
        	<th class="td_right">存货</th>
            <td style="text-align: left;">${goods_amt }</td>
            <th class="td_right">流动资产</th>
            <td style="text-align: left;">${flow_assets }</td>
        </tr>
        <tr>
        	<th class="td_right">流动负债</th>
            <td style="text-align: left;">${flow_liabilities }</td>
            <th class="td_right">利润总额</th>
            <td style="text-align: left;">${total_profit }</td>
        </tr>
        <tr>
        	<th class="td_right">净利润</th>
            <td style="text-align: left;">${net_margin }</td>
            <th class="td_right">纳税总额</th>
            <td style="text-align: left;">${taxamt }</td>
        </tr>
        <tr>
        	<th class="td_right">存货周转率</th>
            <td style="text-align: left;"><fmt:formatNumber type="number" value="${goods_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</td>
            <th class="td_right">应收账款周转率</th>
            <td style="text-align: left;"><fmt:formatNumber type="number" value="${income_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</td>
        </tr>
        <tr>
        	<th class="td_right">毛利率</th>
            <td style="text-align: left;"><fmt:formatNumber type="number" value="${margin_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</td>
            <th class="td_right">资产负债率</th>
            <td style="text-align: left;"><fmt:formatNumber type="number" value="${assets_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</td>
        </tr>
        <tr>
        	<th class="td_right">流动比率</th>
            <td style="text-align: left;"><fmt:formatNumber type="number" value="${total_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</td>
            <th class="td_right">速动比率</th>
            <td style="text-align: left;"><fmt:formatNumber type="number" value="${speed_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</td>
        </tr>
        <tr>
        	<td colspan="4" style="text-align: center;">
	        	<button type="button" class="btn btn-success" style="margin-left:20px;" onclick="$('#ldksq1,.hidetable').hide();">
					<i class="icon-remove icon-white"></i>关闭
				</button>
          	</td>
        </tr>
    </table>
    </s:iterator>
    </div>
</div>

<script type="text/javascript">
$('.oper').click(function(){
    $('#msgcontent').val($.trim($(this).children('span').text()));
    $('#taskid').val($(this).attr("taskid"));
    var buttonid = $(this).attr("buttonid");
    $('#buttonid').val(buttonid);
    if(buttonid)
    showDiv1();
    $('#ldksq').show();
})
    function showDiv1() {
    var divName = $("#ldksq_c");
    var top = ($(window).height() - $(divName).height())/3;
    var left = ($(window).width() - $(divName).width())/2;
    var scrollTop = $(document).scrollTop();
    var scrollLeft = $(document).scrollLeft();
    $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();

};
	function showDiv(id) {
   	 	var divName = $("#ldksq_c1");
		var top = ($(window).height() - $(divName).height())/8;
        var left = ($(window).width() - $(divName).width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
        $("#ldksq1,#" + id).show();
	};
	
function updateproducname() {
	layer.confirm("确认修改产品名称？", {
		title:"提示",btn:['确定', '取消'],area: ['300px', '180px']
      }, function(index) {
          layer.close(index);
          $.ajax({
				type : "post",
				url : "productapp!updateproducname.action",
				data : {id: '${e.id}', prodid: $("#prodid").val(), prodname: $("#prodid").find("option:selected").text()},
				dataType : "text",
				success : function(data) {
					if (data == "10001") {
						layer.confirm("修改成功！", {
							title:"提示",icon: 0, btn:['确定'],area: ['300px', '180px']
				        }, function(index) {
				            layer.close(index);
							location.href = "productapp!toEdit.action?e.id=${e.id }";
				        });
					}
				}
			});
      }, function(index) {
          layer.close(index);
      });
}

</script>	
</body>
</html>
