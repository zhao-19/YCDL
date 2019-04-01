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
    <table class="table table-bordered">
    	<s:if test="tbotherorg.id!=''">
	    	<tr>
	            <td colspan="4" class="table_title">其它机构</td>
	        </tr>
	    	<tr>
	            <th class="td_right">机构名称</th>
	            <td style="text-align: left;">${tbotherorg.org_name }</td>
	            <th class="td_right">机构类型</th>
	            <td style="text-align: left;" class="ecoselect">
	            	<s:select list="%{#application.dic.otherorgtype.childs}" listKey="id" headerKey="" headerValue=""
	            		listValue="name" name="tbotherorg.org_type" theme="simple"/>
	            </td>
	        </tr>
	        <tr>
	            <th class="td_right">组织机构代码</th>
	            <td style="text-align: left;">${tbotherorg.org_credit_id }</td>
	            <th class="td_right">工商注册地</th>
	            <td style="text-align: left;">${tbotherorg.gszcd_province }&nbsp;${tbotherorg.gszcd_city }&nbsp;${tbotherorg.gszcd_county }</td>
	        </tr>
	        <tr>
	            <th class="td_right">注册资本</th>
	            <td style="text-align: left;">${tbotherorg.regist_amt }万元</td>
	            <th class="td_right">办公地址</th>
	            <td style="text-align: left;">${tbotherorg.org_address }</td>
	        </tr>
	        <tr>
	            <th class="td_right">主营业务</th>
	            <td style="text-align: left;">${tbotherorg.org_info }</td>
	            <th class="td_right">联系人</th>
	            <td style="text-align: left;">${tbotherorg.org_linkman }</td>
	        </tr>
	        <tr>
	            <th class="td_right">联系人职位</th>
	            <td style="text-align: left;">${tbotherorg.org_linkduty }</td>
	            <th class="td_right">联系人电话</th>
	            <td style="text-align: left;">${tbotherorg.org_linkcellphone }</td>
	        </tr>
	        <tr>
	            <th class="td_right">联系人邮箱</th>
	            <td style="text-align: left;">${tbotherorg.org_linkemail }</td>
	            <th class="td_right">客户经理</th>
	            <td style="text-align: left;">${tbotherorg.custmanage }</td>
	        </tr>
	        <tr>
	            <th class="td_right">录入时间</th>
	            <td style="text-align: left;">${fn:substring(tbotherorg.inputtime, 0, 19)}</td>
	            <th class="td_right">录入人</th>
	            <td style="text-align: left;">${tbotherorg.inputuser }</td>
	        </tr>
	        <tr>
	            <th class="td_right">修改时间</th>
	            <td style="text-align: left;">${fn:substring(tbotherorg.lastchgtime, 0, 19)}</td>
	            <th class="td_right"></th>
	            <td style="text-align: left;"></td>
	        </tr>
        </s:if>
    	<tr>
            <td colspan="4" class="table_title">保险公司数据报送</td>
        </tr>
        <tr>
            <th class="td_right">机构名称</th>
            <td style="text-align: left;">${e.org_name }</td>
            <th class="td_right">数据时点</th>
            <td style="text-align: left;">${e.time_port}</td>
        </tr>
        <tr>
            <th class="td_right">员工数</th>
            <td style="text-align: left;">${e.staff_count}</td>
            <th class="td_right">网点数</th>
            <td style="text-align: left;">${e.branche_count }</td>
        </tr>
        <tr>
            <th class="td_right">全年保费收入</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.insurance_income }" pattern="#,#00.00#"/>万元</td>
            <th class="td_right">全年保险赔付</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.insurance_payment }" pattern="#,#00.00#"/>万元</td>
        </tr>
        <tr>
            <th class="td_right">高新区企业保额</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.sum_insurance }" pattern="#,#00.00#"/>万元</td>
            <th class="td_right">营业收入</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.business_income }" pattern="#,#00.00#"/>万元</td>
        </tr>
        <tr>
            <th class="td_right">净利润</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.profit }" pattern="#,#00.00#"/>万元</td>
            <th class="td_right">固定资产折旧</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.fixed_assets }" pattern="#,#00.00#"/>万元</td>
        </tr>
        <tr>
            <th class="td_right">无形资产摊销</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.intangible_assets }" pattern="#,#00.00#"/>万元</td>
            <th class="td_right">人员薪酬及福利</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.salaries }" pattern="#,#00.00#"/>万元</td>
        </tr>
        <tr>
            <th class="td_right">增值税</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.added_tax }" pattern="#,#00.00#"/>万元</td>
            <th class="td_right">所得税</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.income_tax }" pattern="#,#00.00#"/>万元</td>
        </tr>
        <tr>
            <th class="td_right">其他税金及附加</th>
            <td style="text-align: left;"><fmt:formatNumber value="${e.other_tax }" pattern="#,#00.00#"/>万元</td>
            <th class="td_right">审核状态</th>
            <td style="text-align: left;"><% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("e.status")); if( o != null){out.print(o.getName());}%></td>
        </tr>
        <tr>
            <th class="td_right">填报人姓名</th>
            <td style="text-align: left;">${e.contact_name}</td>
            <th class="td_right">填报人职务</th>
            <td style="text-align: left;">${e.contact_duty}</td>
        </tr>
        <tr>
        	<th class="td_right">填报人手机</th>
            <td style="text-align: left;">${e.contact_tele }</td>
            <th class="td_right">负责人手机</th>
            <td style="text-align: left;">${e.leader_tele }</td>
        </tr>
        <tr>
            <th class="td_right">录入时间</th>
            <td style="text-align: left;">${fn:substring(e.inputtime, 0, 19)}</td>
            <th class="td_right">录入人</th>
            <td style="text-align: left;">${e.inputuser }</td>
        </tr>
        <tr>
            <th class="td_right">修改时间</th>
            <td style="text-align: left;">${fn:substring(e.lastchgtime, 0, 19)}</td>
            <th class="td_right"></th>
            <td style="text-align: left;"></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                    <a href="tbjrbx!chengeStatus.action?id=${e.id}&status=aaaaaaaaaaaaaaaaaaaaaaaaaaaaa084" class="btn btn-danger">
                        <i class="icon-remove icon-white"></i> 驳回
                    </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="tbjrbx!chengeStatus.action?id=${e.id}&status=aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083" class="btn btn-info">
                        <i class="icon-ok icon-white"></i> 通过
                    </a>
            </td>
        </tr>
    </table>
<script type="text/javascript">
    $(".ecoselect").each(function(){
		$(this).html($(this).find("select option:selected").text());
	});
</script>
</body>
</html>