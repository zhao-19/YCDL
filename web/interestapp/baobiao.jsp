<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>

    <link rel="stylesheet" href="../control/css/zyUpload.css" type="text/css">

    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.7.2.js"></script>
    <!-- 引用核心层插件 -->
    <script type="text/javascript" src="../core/zyFile.js"></script>
    <!-- 引用控制层插件 -->
    <script type="text/javascript" src="../control/js/zyUpload.js"></script>
    <!-- 引用初始化JS -->
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/demo.js"></script>

</head>
<body> 
<script>

    
 

</script>
<!-- 网站头部 -->

<!--内容信息-->
<div class="baobiao">
 
    <div class="bb-right">
        <div class="location">贴息申报信息</div>
        <div class="tjtiexi" onclick="location.href='/interestapp/toAdd.html'">+&nbsp;添加贴息申报</div>
        <table name="tiexitab">
            <tr>
                <th>贷款金额（万）</th>
                <th>放款日期</th>
                <th>到期日期</th>
                <th>补贴计算截止日期</th>
                <th>贷款银行</th>
                <th>审批状态</th>
                <th>操&nbsp;&nbsp;作</th>
            </tr>
          
          
          
         	<s:iterator value="pager.list">
			
	            <tr>
	                <td><s:property value="dkje"/> 万</td>
	                <td><s:date name="fksj" format="yyyy-MM-dd"/>  </td>
	                <td><s:date name="dqsj" format="yyyy-MM-dd"/> </td>
	                <td><s:date name="lxjsjzrq" format="yyyy-MM-dd"/>  </td>
	                <td><s:property value="dkyy"/></td>
	                <td><s:property value="stat"/></td>
	                <td><span class="tx-chakna" onclick="location.href='/interestapp/todetail.html?e.id=<s:property value="id"/>'">查看</span><span class="tx-xiugai" onclick="location.href='/interestapp/tostep1.html?e.id=<s:property value="id"/>'">修改</span></td>
	            </tr>
            
			</s:iterator>
		
		
		
        </table>
    </div>



</div>

</body>
</html>