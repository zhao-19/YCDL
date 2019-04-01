<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.core.oscache.Dynamic"%>
<%@page import="com.winpow.services.manage.news.bean.News"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.services.manage.guquan.bean.Guquan"%>
<%@page import="com.winpow.services.manage.product.bean.Product"%>
<%@page import="com.winpow.services.manage.jigou.bean.Jigou"%>


<!DOCTYPE html>
<html>
<head>



<style type="text/css">
.alert123{
/* 	padding: 10px; */
	margin-bottom: 5px;margin-top: 10px;margin-right: -15px;
}
.product_css{
	height: 200px;border: 0px solid #ccc;
}
.left_product{
	font-size: 12px;max-height: 35px;overflow: hidden;text-overflow: ellipsis;-o-text-overflow: ellipsis;
}
img{border: 0px;}

.thumbnail_css{
	border-color: red;
}

.centerImageCss{
	width: 289px;
	height: 190px;
}
.title {
	display: block;
	width: 280px;
	overflow: hidden; /*注意不要写在最后了*/
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
body{
	padding-top: 0px;
  	padding-bottom: 0px;
	font-size: 12px;
    	font-family: 微软雅黑, Verdana, sans-serif, 宋体; 
}



 
</style>

<script>
 
</script>
</head>
<body>
<table>
****树形菜单				
			<tr >
				<td>机构图片：</td><td> <img style="max-width: 50px;max-height: 50px;"  src="<%=SystemManager.indexPage.getJigou().getTuijianpic() %>"> </td>
				<td>机构名称：</td><td><%=SystemManager.indexPage.getJigou().getJigoumingcheng() %></td>
				<td>机构简介：</td><td><%=SystemManager.indexPage.getJigou().getJigoujianjie() %></td>
			</tr>
			
			<tr >
				<td>债权图片：</td><td> <img style="max-width: 50px;max-height: 50px;"  src="<%=SystemManager.indexPage.getProduct().getTuijianpic() %>"> </td>
				<td>债权名称：</td><td><%=SystemManager.indexPage.getProduct().getProdid() %></td>
				<td>债权简介：</td><td><%=SystemManager.indexPage.getProduct().getProdname() %></td>
			</tr>
			
			<tr >
				<td>股权图片：</td><td><%=SystemManager.indexPage.getGuquan().getTuijianpic() %></td>
				<td>股权名称：</td><td><%=SystemManager.indexPage.getGuquan().getMingcheng() %></td>
				<td>股权简介：</td><td><%=SystemManager.indexPage.getGuquan().getJianjie() %></td>
			</tr>
			<tr >
				<td>增值图片：</td><td><%=SystemManager.indexPage.getIncre().getTuijianpic() %></td>
				<td>增值名称：</td><td><%=SystemManager.indexPage.getIncre().getIncrename() %></td>
				<td>增值简介：</td><td><%=SystemManager.indexPage.getIncre().getIncredescrip() %></td>
			</tr>
			</table>
			
			
<br/><br/><br/>
<table>
****数据量
<tr>
<td>
企业数：<%=SystemManager.indexPage.getHisdata().getHistcomp() %>
</td>
<td>
债权融资额：<%=SystemManager.indexPage.getHisdata().getHistloanamt() %>
</td>
<td>
项目融资数：<%=SystemManager.indexPage.getHisdata().getHistcomp() %>
</td>
<td>
合作投资机构数：<%=SystemManager.indexPage.getHisdata().getHistvccount() %>
</td>
</tr>
</table>
<table>

 <tr>
<td>****融资交易</td>
</tr> 
<% for (int i = 0;i<SystemManager.indexPage.getDynamicList().size();i++) {
					Dynamic d = SystemManager.indexPage.getDynamicList().get(i);
					out.print("<tr>");
					 out.print("<td>状态："+d.getDystatus()+"</td>");
					 out.print("<td>主键："+d.getKey()+"</td>");
					 out.print("<td>动态类型："+d.getDytype()+"</td>");
					 out.print("<td>公司名称："+d.getCompName()+"</td>");
					 out.print("<td>时间："+d.getDytime()+"</td>");
					 out.print("<td>时间："+d.getDytime()+"</td>");
					out.print("</tr>");

				}%>
 <tr>
<td>盈创资讯</td>
</tr>
 
 
<% for (int i = 0;i<SystemManager.indexPage.getNewsList().size();i++) {
					News n = SystemManager.indexPage.getNewsList().get(i);
					out.print("<tr>");
					
					 out.print("<td>标题："+n.getTitle()+"</td>");
					 out.print("<td>发布时间："+n.getSendtime()+"</td>");
					out.print("</tr>");

				}%>
 



<tr>
<td>****盈创活动</td>
</tr>

<% for (int i = 0;i<SystemManager.indexPage.getActivitiesList().size();i++) {
					Activities a = SystemManager.indexPage.getActivitiesList().get(i);
					out.print("<tr>");
					
					 out.print("<td>活动名称："+a.getActivities_name()+"</td>");
					 out.print("<td>活动时间："+a.getBegintime()+"</td>");
					 out.print("<td>活动地点："+a.getAddress()+"</td>");
					 out.print("<td>发布日期："+a.getLurushijian()+"</td>");
					 
					out.print("</tr>");

				}%>





<tr>
<td>****债权融资</td>
</tr>

<% for (int i = 0;i<SystemManager.indexPage.getProductList().size();i++) {
					Product p = SystemManager.indexPage.getProductList().get(i);
					out.print("<tr>");
					
					 out.print("<td>贷款产品："+p.getProdname()+"</td>");
					 out.print("<td>合作银行：");
					 String arrays[] = p.getBanks().split(",");
					 for(int j=0;j<arrays.length;j++){
					 	out.print(SystemManager.treeNodeMap.get(arrays[j]).getName());
					 }
					  out.print("</td>");
					 out.print("<td>还款方式："+p.getRetutype()+"</td>");
					 out.print("<td>贷款额度："+p.getLoanamt()+"到"+p.getLoanamtmax()+"</td>");
					 out.print("<td>贷款期限："+p.getLoanterm()+"到"+p.getLoantermmax()+"</td>");
					 out.print("<td>贷款利率："+p.getLoanrate()+"</td>");
					out.print("</tr>");

				}%>
				
				
				
				
				
				


<tr>
<td>****股权融资</td>
</tr>

<% for (int i = 0;i<SystemManager.indexPage.getGuquanList().size();i++) {
					Guquan g = SystemManager.indexPage.getGuquanList().get(i);
					out.print("<tr>");
					
					 out.print("<td>项目名称："+g.getMingcheng()+"</td>");
					 out.print("<td>融资阶段："+g.getRongzhijieduan()+"</td>");
					 out.print("<td>项目阶段："+g.getXiangmuzhuangtai()+"</td>");
					 out.print("<td>融资额度："+g.getRongziedu()+"</td>");
					 out.print("<td>出让比例："+g.getCrgqbl()+"</td>");
					out.print("</tr>");

				}%>




<tr>
<td>****增值业务</td>
</tr>

<% for (int i = 0;i<SystemManager.indexPage.getGuquanList().size();i++) {
					Guquan g = SystemManager.indexPage.getGuquanList().get(i);
					out.print("<tr>");
					
					 out.print("<td>项目名称："+g.getMingcheng()+"</td>");
					 out.print("<td>融资阶段："+g.getRongzhijieduan()+"</td>");
					 out.print("<td>项目阶段："+g.getXiangmuzhuangtai()+"</td>");
					 out.print("<td>融资额度："+g.getRongziedu()+"</td>");
					 out.print("<td>出让比例："+g.getCrgqbl()+"</td>");
					out.print("</tr>");

				}%>





<tr>
<td>****投资机构</td>
</tr>

<% for (int i = 0;i<SystemManager.indexPage.getJigouList().size();i++) {
					Jigou j = SystemManager.indexPage.getJigouList().get(i);
					out.print("<tr>");
					
					 out.print("<td>机构名称："+j.getJigoumingcheng()+"</td>");
					 out.print("<td>机构联系人："+j.getXingming()+"</td>");
					 out.print("<td>机构简介："+j.getJigoujianjie()+"</td>");
					out.print("</tr>");

				}%>


</table>
 
</body>
</html>
