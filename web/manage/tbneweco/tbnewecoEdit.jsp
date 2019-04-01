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
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/artDialog/art_dialog1.js"></script>
	<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
    <style>
		.td_right{text-align: right;width: 130px;}
		select{height: auto;}
		.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
    </style>
</head>
<body>
<s:form action="" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
    	<tr>
            <td colspan="4" class="table_title">新经济企业入库</td>
        </tr>
        <tr>
            <th class="td_right">企业名称</th>
            <td style="text-align: left;">${e.qiyemingcheng }</td>
            <th class="td_right">新经济领域</th>
            <td style="text-align: left;" class="ecoselect">
            	<s:select list="%{#application.dic.newecofield.childs}" disabled="true" listKey="id" headerKey="" headerValue="" 
            		listValue="name" name="e.new_eco_field" />
            </td>
        </tr>
        <tr>
            <th class="td_right">所属行业</th>
            <td style="text-align: left;" class="ecoselect">
            	<s:select list="%{#application.dic.hangyeid.childs}" disabled="true" listKey="id" headerKey="" headerValue="" 
            		listValue="name" name="e.hangyeid" />
            </td>
            <th class="td_right">企业人数</th>
            <td style="text-align: left;">${e.yuangongshu }</td>
        </tr>
        <tr>
            <th class="td_right">企业法人</th>
            <td style="text-align: left;">${e.legal_person}</td>
            <th class="td_right">科技活动人员数</th>
            <td style="text-align: left;">${e.science_num}</td>
        </tr>
        <tr>
            <th class="td_right">2016年研发投入</th>
            <td style="text-align: left;">${e.rdinput2016}万元</td>
            <th class="td_right">2015营业收入</th>
            <td style="text-align: left;">${e.incom2015}万元</td>
        </tr>
        <tr>
            <th class="td_right">2015利润</th>
            <td style="text-align: left;">${e.profit2015}万元</td>
            <th class="td_right">2015税收</th>
            <td style="text-align: left;">${e.taxamt2015}万元</td>
        </tr>
         <tr>
            <th class="td_right">2016营业收入</th>
            <td style="text-align: left;">${e.incom2016}万元</td>
            <th class="td_right">2016利润</th>
            <td style="text-align: left;">${e.profit2016}万元</td>
        </tr>
         <tr>
            <th class="td_right">2016税收</th>
            <td style="text-align: left;">${e.taxamt2016}万元</td>
            <th class="td_right">2017营业收入</th>
            <td style="text-align: left;">${e.incom2017}万元</td>
        </tr>
        <tr>
            <th class="td_right">2017利润</th>
            <td style="text-align: left;">${e.profit2017}万元</td>
            <th class="td_right">2017税收</th>
            <td style="text-align: left;">${e.taxamt2017}万元</td>
        </tr>
        <tr>
            <th class="td_right">企业估值</th>
            <td style="text-align: left;">${e.valuation}万元</td>
            <th class="td_right">是否高新技术企业</th>
            <td style="text-align: left;" id="high_tech">${e.high_tech}</td>
        </tr>
        <tr>
            <th class="td_right">是否上规入库</th>
            <td style="text-align: left;" id="inbase">${e.inbase}</td>
            <th class="td_right">成立时间</th>
            <td style="text-align: left;">${fn:substring(e.chengliriqi, 0, 10)}</td>
        </tr>
        <tr>
            <th class="td_right">经营地址</th>
            <td style="text-align: left;" colspan="3">${e.dizhi}</td>
        </tr>
        <tr>
            <th class="td_right">注册地址</th>
            <td style="text-align: left;" colspan="3">${e.address}</td>
        </tr>
        <tr>
            <th class="td_right">主营业务</th>
            <td style="text-align: left;" colspan="3">${e.zhuyingyewu}</td>
        </tr>
        <tr>
            <th class="td_right">主要产品</th>
            <td style="text-align: left;" colspan="3">${e.main_product}</td>
        </tr>
        <tr>
            <th class="td_right">创投机构投资情况</th>
            <td style="text-align: left;" colspan="3">${e.invest_status}</td>
        </tr>
        <tr>
            <th class="td_right">备注</th>
            <td style="text-align: left;" colspan="3">${e.memo }</td>
        </tr>
        <tr>
            <th class="td_right">审核状态</th>
            <td style="text-align: left;"><% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("e.status")); if( o != null){out.print(o.getName());}%></td>
        	<th class="td_right">录入人</th>
            <td style="text-align: left;">${e.inputuser}</td>
        </tr>
        <tr>
            <th class="td_right">联系人</th>
            <td style="text-align: left;">${e.xingming}</td>
            <th class="td_right">联系方式</th>
            <td style="text-align: left;">${e.yidongdianhua}</td>
        </tr>
        <tr>
        <th class="td_right">电子邮箱</th>
            <td style="text-align: left;">${e.email}</td>
            <th class="td_right">录入时间</th>
            <td style="text-align: left;">${fn:substring(e.inputtime, 0, 19)}</td>
        </tr>
        <tr>
            <th class="td_right">最后修改时间</th>
            <td style="text-align: left;">${fn:substring(e.lastchgtime, 0, 19)}</td>
            <th class="td_right"></th>
            <td style="text-align: left;"></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                    <a href="tbneweco!chengeStatus.action?id=${e.id}&status=aaaaaaaaaaaaaaaaaaaaaaaaaaaaa084" class="btn btn-danger">
                        <i class="icon-remove icon-white"></i> 驳回
                    </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="tbneweco!chengeStatus.action?id=${e.id}&status=aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083" class="btn btn-info">
                        <i class="icon-ok icon-white"></i> 通过
                    </a>
            </td>
        </tr>
    </table>
    </s:form>
<script type="text/javascript">
	var arr = [[1,"是"],[0,"否"]];
	var inbase = '${e.inbase }';
	var high_tech = '${e.high_tech }';
	for (var i = 0; i < arr.length; i++ ) {
		if (inbase != '' && arr[i][0] == inbase) {
			$("#inbase").html(arr[i][1]);
		}
		if (high_tech != '' && arr[i][0] == high_tech) {
			$("#high_tech").html(arr[i][1]);
		}
	}
	$(".ecoselect").each(function(){
		$(this).html($(this).find("select option:selected").text());
	});
</script>
</body>
</html>