<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.winpow.services.manage.activities.bean.Activities" %>
<%@page import="com.winpow.core.util.StringUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<!DOCTYPE html>
<html>
<head>
    <title>盈创动力</title>
    <link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.dialogbox.css">
    <link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog/jDialog.css">
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>

</head>
<body>
<div id="myConfirm">
	<h4></h4>
	<p><a href="javascript:volid(0);" class="sure" >确认</a><a href="javascript:volid(0);" class="cancel" >取消</a></p>
</div>

<script>
    $(function () {
        //$(".zgezhaoceng").width(body).width();
//		$('.zgezhaoceng').height(body).height();
        //$('.zgezhaoceng').css('left',0);
        //$('.zgezhaoceng').css('top',0);
    });


</script>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
    <div class="show fl">
        <%@ include file="../usercenter/leftnav.jsp" %>
    </div>


    <div class="list fr">
        <div class="rightbox">
            <div id="peixunhuodong" class="vipinfo">
                <div class="title">
                    
                    <li>
                    
                    	<span class="t"><!-- <input type="button" class="an xzw op oprd" value="导出测试按钮"/> --></span>
                    	<span class="daochutishixxxx">下载信息列表</span>
                    	
                    	<%--
                    	<span class="t">企业名称：${name}</span>
	                    <a href="/declare_pj/toFrontAdd.html?type=${type}&t=a">
	                    	<span id="CreateTBpxhd" class="update">新增一条申报补贴</span>
	                    </a>
	                    --%>
	                    
                    </li>
                </div>

                <table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
                
                    <tr class="TT">

                        <td>名称</td>
                        <td>生成日期</td>
                        <td style="width:72px;">状态</td>
                        <td>操作</td>
                    </tr>
                    <s:iterator value="#request.pager.list">
                        <tr>
                            <td><s:property value="fileName"/></td>
                              <td>  <s:date name="LURUSHIJIAN" format="yyyy-MM-dd HH:mm:ss"/> </td>
                             <td>
								<s:if test="status == 1">生成中</s:if>
                                <s:elseif test="status == 2">生成失败</s:elseif>
                                <s:elseif test="status == 3">生成成功</s:elseif>
							</td>
                            <td>
                                <input class="an xzw dcsbcl op oprd"  type="button" value="导出申报资料" title="导出申报资料"  accesskey="<s:property value="status"/>"   lang="<s:property value="id"/>"  >
                            </td>
                        </tr>
                        
                    </s:iterator>

                </table>
				<br/>
				<p style="color:red">
				
					如果下载的文件不能打开，请用2007版（含）以上的Microsoft Word
				</p>

                <script type="text/javascript">
                   
                
                $("#ycacti tr").each(function(){
					var val = $.trim($(this).find("td:eq(1)").html());
					if (val.replace("-", "").substr(0, 6) < 201803) {//10月份之前的不能导出				
						$(this).find(".xzw").attr('disabled',"true");
					}
				});
				
				//导出申报资料(Word)
				var oprds = $("#ycacti .xzw");				
				oprds.each(function(){
					var stateinput= $(this).attr("accesskey");
					if(stateinput != 3){
						$(this).attr("disabled","true");
						$(this).removeClass("op");
					}
					
				});
				
				//导出申报资料链接
				oprds.click(function(){

						var id=$(this).attr("lang");
						location.href="/download.action?number=4&id="+id;
				});

				
				
				

                </script>
            </div>
        </div>
    </div>


</div>
<%@ include file="../footer.jsp" %>
<script type="text/javascript">
    leftnav_init("downloadbt");
</script>
</body>
</html>
 