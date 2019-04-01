<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.winpow.services.common.TreeNode" %>   
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/newlayer/layer.js"></script>
<style>
.table_title{text-align: left;font-weight: bold;font-size:16px;background-color: #dff0d8;}
</style>
</head>

<body>
<s:form action="/manage/appCommon!saveNews.action" id="form" name="form" theme="simple" method="post">
	<table class="table table-bordered">
        	<tr>
	            <td colspan="4" class="table_title">党建征信详情</td>
	        </tr>
        	<tr>
	        	<td class="td_right">产品名称</td>
	            <td style="text-align: left;">${party.chanpingmingcheng }</td>
	        	<td class="td_right">评议时间</td>
	            <td style="text-align: left;">${party.shijian }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">企业名称</td>
	            <td style="text-align: left;">${party.qiyemingcheng }</td>
	        	<td class="td_right">申请额度</td>
	            <td style="text-align: left;">${party.shenqingjine }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">前年收入</td>
	            <td style="text-align: left;">${party.xiaoshoushouru16 }</td>
	        	<td class="td_right">去年收入</td>
	            <td style="text-align: left;">${party.xiaoshoushouru17 }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">前年利润总额</td>
	            <td style="text-align: left;">${party.lirunzonge16 }</td>
	        	<td class="td_right">去年利润总额</td>
	            <td style="text-align: left;">${party.lirunzonge17 }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">员工数</td>
	            <td style="text-align: left;">${party.yuangongshu }</td>
	        	<td class="td_right">党员数</td>
	            <td style="text-align: left;">${party.party_num }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">法定代表人是否党员</td>
	            <td style="text-align: left;">${party.is_party }</td>
	        	<td class="td_right">高管人数</td>
	            <td style="text-align: left;">${party.lead_num }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">高管党员人数</td>
	            <td style="text-align: left;">${party.lead_party_num }</td>
	        	<td class="td_right">是否设立党支部</td>
	            <td style="text-align: left;">${party.is_party_branch }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">设立党支部时间</td>
	            <td style="text-align: left;">${party.party_branch_time }</td>
	        	<td class="td_right">上年度年党费收取总额（元）</td>
	            <td style="text-align: left;">${party.last_party_cost }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">是否愿意设立党支部</td>
	            <td style="text-align: left;">${party.will_set_party }</td>
	        	<td class="td_right">评议得分</td>
	            <td style="text-align: left;">${party.score }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">放款额度</td>
	            <td style="text-align: left;">${party.amt }</td>
	        	<td class="td_right">放款时间</td>
	            <td style="text-align: left;">${party.begindate }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">党建增信得分</td>
	            <td style="text-align: left;"><%-- <input id="pscore" type="text" value="${party.party_score }"/> --%>${party.party_score }</td>
	            <td class="td_right"></td>
	            <td style="text-align: left;"></td>
	        </tr>
	        <tr>
      		<%-- <td colspan="6">
      			<span onclick="saveParty()" class="btn btn-success" id="psave"><i class="icon-ok icon-white"></i>保存</span>&nbsp;&nbsp;&nbsp;&nbsp;
      			<span onclick="history.back(-1);" class="btn btn-info"><i class="icon-chevron-left icon-white"></i>返回</span>
      		</td> --%>
        </tr>
	</table>
</s:form>
	
<script type="text/javascript">
	var qiyeid = '${party.qiyeid}';
	function saveParty(){
		if (qiyeid == "") {
			layer.alert('未关联到企业，无法保存评议得分!', {icon: 7, title : '提示'});
			return;
		}
		var pscore = $.trim($("#pscore").val());
		if (pscore == "") {
			layer.alert('请填写评议得分!', {icon: 7, title : '提示'});
			return;
		}
		$.ajax({
			type: 'post',
			url: "qiye!savePartyScore.action",
			data: {"qiyeid": qiyeid, "pscore": pscore},
			dataType:"text",
			success: function(data){
				layer.confirm(data, {
					title:"提示",btn:['确定'],area: ['200px', '200px']
		        }, function(index) {
		            layer.close(index);
		            if ($.trim(data) == "保存成功！") {
						location.reload();
					}
		        });
			}
		});
	}
	if (qiyeid == "") {
		$("#pscore, #psave").attr('disabled', true);
	}
</script>	

</body>
</html>