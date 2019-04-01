<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
        <link rel="stylesheet" href="../css/massage.css"/>
    <style>
		.td_right{text-align: right;width: 130px;}
		select{height: auto;}
		.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/artDialog/art_dialog1.js"></script>
	<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
</head>
<body>
<s:form action="tbsbcommon!chengeStatus.action" namespace="/" method="post" theme="simple" id="commonForm">
	<input type="hidden" name="status" value="${e.status }" id="status"/>
	<input type="hidden" name="id" value="${e.id }"/>
	<input type="hidden" name="num" value="${e.num }"/>
	<input type="hidden" name="sendMsg" id="sendMsg"/>
    <table class="table table-bordered">
    	<tr>
            <td colspan="4" class="table_title">政策申报</td>
        </tr>
        <tr>
           <th class="td_right" style="width: 200px">政策名称<a href="javascript:void(0);" onclick="toCodeEdit();">（查看基本情况表）</a></th>
           <td style="text-align: left;">${e.policy_name}</td>
           <th class="td_right" style="width: 200px">用户名</th>
           <td style="text-align: left;">${e.userid }</td>
        </tr>
        <tr>
           <th class="td_right">大类名称</th>
           <td style="text-align: left;">${e.toptype_name}</td>
           <th class="td_right">分类名称</th>
           <td style="text-align: left;">${e.type_name }</td>
        </tr>
        <tr>
           <th class="td_right">批次</th>
           <td style="text-align: left;">${e.pichi}</td>
          <th class="td_right">申请金额（万元）</th>
           <td style="text-align: left;">${e.qysqje }</td>
        </tr>
       <s:if test="#request.e.num == 2">
            <tr>
	           <th class="td_right">外汇资金池归集量（万元）</th>
	           <td style="text-align: left;">${e.pool_amount}</td>
	           <th class="td_right">跨境结算量（万元）</th>
	           <td style="text-align: left;">${e.settlement_amount }</td>
        	</tr>
        </s:if>
        <s:if test="#request.e.num == 3">
        	<tr>
	           <th class="td_right">证券代码</th>
	           <td style="text-align: left;">${e.stock_code}</td>
	           <th class="td_right">证券简称</th>
	           <td style="text-align: left;">${e.stock_short }</td>
        	</tr>
            <tr>
	           <th class="td_right">挂牌时间</th>
	           <td style="text-align: left;">${e.pool_amount}</td>
	           <th class="td_right">挂牌板块</th>
	           <td style="text-align: left;" class="ecoselect">
	           <s:select list="%{#application.dic.settlementamount.childs}" listKey="id" headerKey="" headerValue="" 
            		listValue="name" name="#request.e.settlement_amount" theme="simple"/>
	           </td>
        	</tr>
        </s:if>
        <tr>
           <th class="td_right">审核状态</th>
            <td style="text-align: left;" class="ecoselect">
            	<s:select list="%{#application.dic.zqsqzt.childs}" listKey="id" headerKey="" headerValue="" 
            		listValue="name" name="#request.e.status" theme="simple"/>
            </td>
            <th class="td_right">录入人</th>
            <td style="text-align: left;">${e.inputuser }</td>
        </tr>
        <tr>
         	<th class="td_right">录入时间</th>
            <td style="text-align: left;">${fn:substring(e.lurushijian, 0, 19)}</td>
            <th class="td_right">修改时间</th>
            <td style="text-align: left;">${fn:substring(e.lastchgtime, 0, 19)}</td>
        </tr>
        </table>
		<!-- 限售股减持特殊字表↓ -->
		<s:if test="#request.policy.id=='26b1b473c0d246d1900f3f0dd90ab650'">        
	        <table class="table table-condensed">
		        <thead>
		        <tr style="background-color: #dff0d8">
		            <th>用户号</th>
		           	<th>申请人姓名</th>
		            <th>身份证号</th>
		            <th>担任职务</th>
		            <th>限售股减持股数</th>
		            <th>交易价格（元/股）</th>
		            <th>因减持而缴纳的个人所得税（万元）</th>
		        </tr>
		        </thead>
		        <s:iterator value="#request.xsglist">
		            <tr>
		                <td>&nbsp;<s:property value="userid"/></td>
		                <td>&nbsp;<s:property value="appname"/></td>
		                <td>&nbsp;<s:property value="idcard"/></td>
		                <td>&nbsp;<s:property value="duty"/></td>
		                <td>&nbsp;<s:property value="xsgcount"/></td>
		                <td>&nbsp;<s:property value="price"/></td>
		                <td>&nbsp;<s:property value="incometax"/></td>
		            </tr>
		        </s:iterator>
		    </table>
        </s:if>
        <table class="table table-bordered">
        <s:iterator value="#request.li" status="index" var="material">
	 		<tr>
	            <th class="td_right">${material.value }</th>
	            <td colspan="3">
	                <s:iterator value="#request.list" status="index" var="files">
	                    <s:if test="leixing==#material.key">
	                    	<a href="${files.picurl }" target="_blank"><img style="max-width: 70px;max-height: 70px;" src="/image/pdf.jpg"></a>
	                    </s:if>
	                </s:iterator>
	            </td>
	        </tr>
        </s:iterator>
        
        <tr>
           <th class="td_right">资料是否完整</th>
           <td style="text-align: left;" colspan="3">
           <s:select list="%{#application.dic.sf.childs}" listKey="id"
                          listValue="name" name="#request.e.zlsfwz" label="资料是否完整"
                          headerKey="" headerValue=""/>
           </td>
        </tr>
        <tr>
           <th class="td_right">备注</th>
           <td style="text-align: left;" colspan="3">
           <textarea rows="3" maxlength="512" cols="80" name="memo">${e.memo}</textarea>
           </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
            		<a href="javascript:void(0);" onclick="commonsubmit(0);" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="javascript:void(0);" onclick="checkmsg(2);" class="btn btn-danger">
                        <i class="icon-remove icon-white"></i> 驳回
                    </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="javascript:void(0);" onclick="checkmsg(1);" class="btn btn-info">
                        <i class="icon-ok icon-white"></i> 通过
                    </a>
            </td>
        </tr>
    </table>
    <div id="ldksq">
        <div id="ldksq_c">
            <div id="ldksq_lose"></div>
            <p id="tcktel">
	            <span>电话号码：</span>
	            <input class="title" style="width: 380px;" type="text" value="${e.lxrsj}" name="dianhua">
	        </p>
            <p id="tckremark">
            	<span class="msgcontenttype">短信内容：</span>
            	<textarea style="width: 380px;" class="duanxin" rows="4" cols="120" name="content" id="msgcontent"></textarea>
            </p>
            <p>
                <button id="ldksq_lose2" type="reset" class="btn btn-inverse" style="margin-left:20px;">
                    <i class="icon-ok icon-white qx"></i> 取消
                </button>
                <button class="btn btn-success" style="margin-left:20px;" onclick="commonsubmit(1);">
                    <i class="icon-ok icon-white"></i> 确定
                </button>
            </p>
        </div>
    </div>
    <s:hidden name="issave" id="issave"/>
    <input type="hidden" name="qiyemingcheng" id="qiyemingcheng" value="${e.qiyemingcheng}">
    <input type="hidden" name="userid" id="userid" value="${e.userid}">
    <input type="hidden" name="policyid" id="policyid" value="${e.policy_id}">
</s:form>  
<div id="stateTemp"></div> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/newlayer/layer.js"></script>
<script type="text/javascript">
	$(".ecoselect").each(function(){
		$(this).html($(this).find("select option:selected").text());
	});
	function checkmsg(num){
		$("#issave").val("0");
		if (num == 1) {
			var content = "${e.lxr}您好，${e.qiyemingcheng}申请的${e.policy_name}获得成都高新区财政金融局初审通过，请根据操作手册说明从系统导出资料，双面打印并胶装，签字盖章后交到锦城大道539号盈创动力大厦A座五楼且带上财务章（用于收据盖章）。如有疑问请联系申报通知中对应的联系人。";
            $(".msgcontenttype").html('短信内容：');
            $("#msgcontent").val(content);
            $("#stateTemp").html("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083");
		} else if (num == 2) {
            $(".msgcontenttype").html('驳回原因：');
            var content = "${e.lxr}您好，很遗憾${e.qiyemingcheng}申请的${e.policy_name}未获得成都高新区财政金融局初审通过，原因：xxxxxxxxxxxxxxxxxxxx。如有疑问请联系申报通知中对应的联系人。";
            $("#msgcontent").val(content);
            $("#stateTemp").html("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa084");
		}
		$("#ldksq").show();
		var divName = $("#ldksq_c");
        var top = ($(window).height() - $(divName).height()) / 2;
        var left = ($(window).width() - $(divName).width()) / 2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        $(divName).css({position: 'absolute', 'top': top, left: left + scrollLeft}).show();
	}
	
	function commonsubmit(num){
		if (num == 1) {
			$("#status").val($("#stateTemp").html());
			$("#sendMsg").val(1);
		} else if (num == 0) {
			$("#sendMsg").val(0);
		}
		$("#commonForm").submit();
	}
	
	function toCodeEdit() {
		var type = '${usertype}';
		if (type == "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001" ) {
			url = "declare_base!toEdit.action?e.userid=${e.userid}&e.pichi=${e.pichi}";
		} else if (type == "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003" || type == "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008") {
			url = "tbsbbasejg!toEdit.action?e.userid=${e.userid}&e.pichi=${e.pichi}";
		} else {
			return;
		}
        layer.open({
            title: '基本情况表',
            type: 2,
            skin: 'layui-layer-lan',
            area: ['800px', '500px'],
            fix: false, //不固定
            maxmin: false,
            content: url
        });
		
    }
	

    $("#ldksq_lose,#ldksq_lose2").click(function () {
        $("#ldksq").hide();
    });
</script>
</body>
</html>