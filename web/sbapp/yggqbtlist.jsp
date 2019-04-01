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


<%@page import="com.winpow.services.manage.zhengceshenbao.bean.Zhengceshenbao"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.dialogbox.css">
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog/jDialog.css"
          type="text/css">
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
                <script type="text/javascript"
	src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_download.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>

    <%--art弹出框js--%>
    <script type="text/javascript" src="/js/artDialog/art_dialog.js"></script>
    <script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
</head>
<body>
<div id="myConfirm">
    <h4></h4>
    <p><a href="javascript:volid(0);" class="sure">确认</a><a href="javascript:volid(0);" class="cancel">取消</a></p>
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

                        <span class="t">员工股权补贴申报信息</span>
                        <span class="daochutishi"></span>
                        
                        


<% if(SystemManager.SBLIST!=null) {
				
				for(int i=0;i<SystemManager.SBLIST.size();i++ ){
				
				Zhengceshenbao sb  = SystemManager.SBLIST.get(i);
					if("11".equals(sb.getId())) {
						
						if("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa005".equals(sb.getShifoukaifang())) {
						%>
						<span id="CreateTBpxhd" class="update" style="background: #B7B4B2;cursor: context-menu;">未开放</span>
						
						<%
						}else {
						%>
						
						
                        <s:if test="#request.msg == 'erro'">

                            <a href="javascript:msg.info('您已申报此补贴申请，不能重复申请同一个补贴！');">
                                <span id="CreateTBpxhd" class="update">申报补贴</span>
                            </a>

                        </s:if>
                        <s:else>
                            <s:if test="#request.isBase == 1">
                                <a href="/declare_yggqjl/toFrontAdd.html?type=${type}&t=a">
                                    <span id="CreateTBpxhd" class="update">申报补贴</span>
                                </a>
                            </s:if>
                            <s:else>
                                <a href="javascript:void(0);"
                                   onclick='return myConfirm("你还为填写企业基本情况表，需先填写后才可申报！","立即填报","取消","/declare_yggqjl/toFrontAdd.html?type=${type}");'>
                                    <span id="CreateTBpxhd" class="update">申报补贴</span>
                                </a>
                            </s:else>
                        </s:else>
							 
 
						<%
						
						}
					}
					
				}
			
			} %>
					
					
					
					
                    </li>

                </div>

                <table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr class="TT">

                        <td>用户号</td>
                        <td>录入日期</td>
                        <td style="width:72px;">状态</td>
                        <td>操作</td>
                    </tr>
                    <s:iterator value="#request.pager.list">

                        <tr>
                            <td><s:property value="userid"/></td>
                                <%--<td>&nbsp;<s:property value="lurushijian"/></td>--%>
                            <td><fmt:parseDate value="${lurushijian}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${date}" pattern="yyyy-MM-dd "/>
                            </td>
                            <td><% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("status"));
                                if (o != null) {
                                    out.print(o.getName());
                                }%></td>

                            <td>
                                <input class="an xg op  opl" lang="<s:property value="id"/>" type="button" value=""
                                       class="pxhdjs">
                                <input class="an ck op opr" type="button" value="" lang="<s:property value="id"/>">
                                    <%--<input class="an xzp op oprd"  type="button" value="" onclick="location.href='declare_yggqjl/exportPDF.html?id=<s:property value="id"/>'"  title="导出pdf"  >--%>
                                <input class="an xzw op oprd" type="button" value=""
                                       msg="${type}" title="导出申报资料" lang="<s:property value="id"/>">

                            </td>
                        </tr>
                    </s:iterator>


                </table>

                <script type="text/javascript">
                    //只有‘未提交’才可以修改
                    var opls = $("#ycacti .opl");
                    var oprs = $("#ycacti .opr");
                    opls.each(function () {
                        var stateinput = $(this).parent().prev().html();
                        if (stateinput != "未提交" && stateinput != "驳回") {
                            $(this).attr("disabled", "true");
                            $(this).removeClass("op").addClass("padd");
                            //$(this).next().attr("disabled","false");
                            //$(this).next().removeClass("op");
                        }


                    });
                    $(".showh").hover(function () {
                        $(this).children("span").show();
                    }, function () {
                        $(this).children("span").hide();
                    });

                    //修改
                    opls.click(function () {

                        var id = $(this).attr("lang");
                        location.href = "/declare_yggqjl/toFrontEdit.html?id=" + id;
                    });
                    //查看
                    oprs.click(function () {

                        var id = $(this).attr("lang");
                        location.href = "/declare_yggqjl/toFrontEdit.html?id=" + id + "&t=v";
                    });


                    //导出申报资料
                    var oprds = $("#ycacti .oprd");
                    oprds.each(function () {
                        var stateinput = $(this).parent().prev().html();
                        if (stateinput != "审批通过") {
                            $(this).attr("disabled", "true");
                            $(this).removeClass("op").addClass("padd2");
                        }

                    });


                    //导出资料跳转链接
                    oprds.click(function () {
                        var id = $(this).attr("lang");
                        location.href = "#";
                    });

                    //导出申报资料(Word)
                    var oprds = $("#ycacti .xzw");
                    oprds.each(function () {
                        var stateinput = $(this).parent().prev().html();
                        if (stateinput != "审批通过") {
                            $(this).attr("disabled", "true");
                            $(this).removeClass("op").addClass("padd3");
                        }

                    });


                </script>
            </div>
        </div>
    </div>


</div>
<%@ include file="../footer.jsp" %>
<script type="text/javascript">
    leftnav_init("yggqbt");
</script>
<%@ include file="tanchudownload.jsp" %>
</body>
</html>
 