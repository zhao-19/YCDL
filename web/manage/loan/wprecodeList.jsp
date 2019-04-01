<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.product-name {
	display: inline-block;
	width: 250px;
	overflow: hidden; /*注意不要写在最后了*/
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
.table TD{vertical-align:middle;}
INPUT[type='text']{margin-bottom:0px;}
select{height:auto;}
</style>
<script type="text/javascript">
$(function(){
    $("input:button").click(function() {
        str = $(this).val()=="还款"?"确定":"还款";  
        $(this).val(str);   // 按钮被点击后，在“还款”和“确定”之间切换
        var i = 0;
        var amt ;
        var id ;
        $(this).parent().siblings("td").each(function() {  // 获取当前行的其他单元格
        	if(i==1){
        		id =  $(this).text();
        	}
        	if(i==4) {
        		samt = $(this).text();
        	}
        	if(i==7) {
	            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
	            
	            if(!obj_text.length)   // 如果没有文本框，则添加文本框使之可以还款
	                	$(this).html("<input type='text' value='"+samt+"'>");
	            else   // 如果已经存在文本框，则将其显示为文本框修改的值
	            {
	            	$(this).html(obj_text.val());
	            	var ramt = obj_text.val();
            		//做异步保存
            		retumoney(id ,ramt);
	            }
	                
        	}    
        i= i+1;
        });
    });
});
function retumoney(id ,amt) {
	var _url = "wprecode!retumoney.action?e.id="+id+"&e.r_money="+amt;
	_url =  _url.replace(/\s+/g,"");       

	//var _url = "report!selectOrderSales.action?e.startDate=2012-01&e.endDate=2015-03";
	$.ajax({
	  type: 'POST',
	  url: _url,
	  data: {},
	  dataType:"json",
	  //async:false,
	  success: function(data){
		  
	  }
	});
	return false;
}
</script>



</head>

<body>
	<s:form action="wprecode" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered table-condensed">
			<tr>
				<td style="text-align: right;">公司名称</td>
				<td style="text-align: left;"><s:textfield name="e.compname" cssClass="search-query input-small" id="compname" /></td>


			</tr>
			 
			<tr>
				<td colspan="20">
					<%if(PrivilegeUtil.check(request.getSession(), "wprecode!selectList.action")){%>
						<button method="wprecode!selectList.action" class="btn btn-primary" onclick="selectList(this)">
							<i class="icon-search icon-white"></i> 查询
						</button>
					<%} %>
					
 
					 
				</td>
			</tr>
		</table>

		<table class="table table-bordered table-condensed table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th nowrap="nowrap">编号</th>
				<th>公司名称</th>
				<th>类型</th>
				<th>应还金额</th>
				<th>应还日期</th>
				<th>计算方式</th>
				<th>实还金额</th>
				<th>利率</th>
				<th width="60">操作</th>
			</tr>
			<s:iterator value="pager.list">
				<tr>
					<td><input type="checkbox" name="ids"
						value="<s:property value="id"/>" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="id" /></td>
					 
					<td>&nbsp;<s:property value="compname" /></td>
					<td>&nbsp;<s:property value="type" /></td>
					<td>&nbsp;<s:property value="s_money" /></td>
					<td>&nbsp;<s:property value="s_date" /></td>
					<td>&nbsp;<s:property value="calc_process" /></td>
					<td>&nbsp;<s:property value="r_money" /></td>
					<td>&nbsp;<s:property value="rate" /></td>
					<td ><button class="btn btn-mini btn-warning"><i class="icon-white icon-repeat"></i>还款</button>
					</td>
				</tr>
			</s:iterator>

			<tr>
				<td colspan="70" style="text-align: center;"><%@ include
						file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
		 

	</s:form>
	
 
</body>
</html>
