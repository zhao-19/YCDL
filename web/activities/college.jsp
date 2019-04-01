<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<%@ page import="com.winpow.core.system.bean.Config"%>
<%@ page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <!--盈创活动style-->
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css" rel="stylesheet" type="text/css" />
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/college.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/index.js"></script>
    <script src="../js/common.js"></script>
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery.min.js"></script>
    <script src="/js/activity.js?${sysversion}"></script>
     
</head>
<body>

<!-- 网站头部  -->
	<%@ include file="../header.jsp"%>








<!--盈创活动banner-->
<div class="cj_college_banner">
      <img src="../image/college/banner.jpg"/>
</div>


 
<!--盈创活动content-->





<div class="cj_college_main">
     <div class="cj_container">
          <div class="cj_college_content">
               <div class="cj_college_content_left">
                    <div class="cj_panel_body">
                         <div class="cj_panel_body_title">
                             精彩培训活动
                         </div>

                         <div class="cj_tab_content">
                              <ul>
                              
                              <!-- -左面的最新活动 -->
                               
        <% for (int i = 0;i<SystemManager.indexPage.getActivitiesList().size();i++) {
       				 Activities a = SystemManager.indexPage.getActivitiesList().get(i);
        		 
                      out.print(" <li>");
                       out.print("   <div class=\"rank_item_image\">");
                       out.print("        <a href=\"\\collegedetail\\"+a.getId()+".html\" ><img src=\""+a.getActivities_image()+"\"/></a>");
                       out.print("    </div>");
                       out.print("    <div class=\"rank_item_text\">");
                       out.print("        <a href=\"\\collegedetail\\"+a.getId()+".html\">\""+a.getActivities_name()+"\"</a>");
                       out.print("    </div>");
                     out.print("  </li>");
                   }  
                       
                                  
				%>
				
				
				
                                 
                              </ul>
                         </div>
                    </div>
               </div>

               <div class="cj_college_content_right">
                   <div class="cj_college_right_box">
                        <div class="cj_college_right_title">
							<s:property value="e.activities_name"/> <!-- 活动名称 -->
                        </div>
                        <div class="cj_college_right_intro">
                             <div class="cj_college_right_intro_item1">
                                 开始时间：<s:property value="e.begintime" /> <input type="hidden" id="activities_name" value="<s:property value="e.activities_name"/>"/>  <input type="hidden" id="activitiid" value="<s:property value="e.id"/>"/>   <input type="hidden" id="flag" value="<s:property value="#request.flag"/>"/> <input type="hidden" id="cellphone" value="<s:property value="#request.cellphone"/>"/> 
                              </div>

                            <div class="cj_college_right_intro_item1">
                                活动地址：<s:property value="e.address"/> <!-- 活动地址 -->
                            </div>

                            <div class="cj_college_right_intro_item1">
                                主办方：<s:property value="e.agenciesname"/> <!--主办方 -->
                            </div>
                   
                            <div class="cj_college_right_intro_item1">
                   主办方嘉宾：  <s:property value="e.activities_guests"/> <!--嘉宾 -->
                            </div>
                   
                   				
           <div class="cj_college_right_intro_item1" id="adapttypediv" >
                                 适用人群：<s:checkboxlist disabled="disable" name="e.adapttype" id="adapttype" list="%{#application.dic.khlx.childs}" listKey="id" listValue="name"  value="#request.e.adapttype.split(',')"  /> 
                            </div>         
                   
     <div class="cj_college_right_intro_item1">
                                 限制人数：<s:property value="e.maxattend"/>人 <!--最大参加人数 --> 
                            </div>
                                 <div class="cj_college_right_intro_item1">
                已报名人数：<s:property value="e.attendcount"/>人
                            </div>
						
						
						  
						 <!-- 是否已经举办过-->
                          <s:if test="#request.acend == 0" >
								<div class="gaizhang1"><img src="../image/box/about_icon31.png" alt=""/></div>
							</s:if> 
							
                            <!-- 是否可以下载附件 -->
                          <s:if test="e.download==1" >
                          
	                                <div class="cj_right_intro_buttom" >
	                            
	                                 <a href="\download.action?id=<s:property value="e.id"/>" >
	                           			         资料下载
	                                 </a>
	                                 
	                                 </div>
							</s:if> 
							<s:else>
                           
                                <div class="cj_right_intro_buttom" style="background: #B7B4B2;" >
                            
                                 <a href="javascript:void(0)" title="当前无资料可以下载" style="background: #B7B4B2;cursor: context-menu;">
                           			     	    资料下载
                                 </a>
                                 
                                 </div>
 							</s:else>
                             <!-- 是否可以报名  最大报名人数大于已经 报名的人数 且 未过期-->
                              <s:if test="e.maxattend > e.attendcount and  e.attend!=0">
                                   
		                               <div class="cj_right_intro_buttom1">
 		             		                       <a href="javascript:void(0)" id="join">
		                             		        我要参加
		                                 </a>
		                            </div>
                            
							</s:if> 
							<s:else>
								 <div class="cj_right_intro_buttom1" style="background: #B7B4B2;">
 		             		                       <a href="javascript:void(0)" title="当前不允许报名" id="attend" style="background: #B7B4B2;cursor: context-menu;">
		                             		        我要参加
		                                 </a>
		                            </div>
							</s:else>
							
							
                      
                                 
                            
                            
                        </div>

                        <div class="activity_box">
                            
  <s:property value="e.activities_detail" escapeHtml="false"/> 

                        </div>
                   </div>
            <!--        <div class="cj_share_box">
                        <img src="../image/college/temp3.jpg"/>
                   </div>
                    -->
               </div>
          </div>

     </div>
</div>

<div class="fixed" id="totop">
    <div class="home">
        <div class="fixed_img">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="../image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>
<style type="text/css">
.fixed{top:auto;bottom:10%!important;height:82px;}
</style>
<script>
	
 
 menu_init("college");

</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>
         
         
         
<!--我要参加弹出框 start-->
<div id="ldksq">
    <div id="ldksq_c" style="transform: none;">
        <div id="ldksq_lose"></div>
        <form action="/college/submit.html" name="indexdksq" id="indexdksq">
            <div class="title"> <p class="c">活动火热报名中，赶紧来参加</p></div>
            <div class="note">最多可添加3人</div>
            <div class="loc">
            	<div class="ifperson">
					<!-- 隐藏的常用报名人员的内容 -->

					<s:iterator value="#request.actList" status="u">
					
						<span><input class="person1" type="checkbox" name="<s:property value='attendname'/>" id="person<s:property value='#u.index' />"  lang="<s:property value='attendcell'/>"  accesskey="<s:property value='attendduty'/>"><s:property value='attendname'/></span>
					</s:iterator>
					
					
				
					
					
            	</div>
            	<div class="ybm">
            		<s:iterator value="#request.appList" status="u">
						 <input class="yinp" type="text"   name="<s:property value="attendname"/>" />
						 <input class="yinp" type="text"   name="<s:property value="attendcell"/>"/>
						 <input class="yinp" type="text"   name="<s:property value="attendduty"/>"/>
					</s:iterator>
				</div>
					
                <table id="tabtrs">
                	<tr  id="numtr1" class="trshow">
                	<td>姓名：</td><td><input class="ip1" type="text"  id="username1"  name="username1"></td>
                	<td>电话：</td><td><input class="ip1" type="text"  id="tel1"   name="tel1"></td>
                	<td>职位：</td><td><input class="ip1" type="text"  id="station1"  name="station1"></td>
                	<td class="more"  id="more">+</td>
                	<input type="hidden" id="delete1val"/>
                	</tr>
                	<tr id="numtr2">
                	<td>姓名：</td><td><input class="ip1" type="text" id="username2" name="username2"></td>
                	<td>电话：</td><td><input class="ip1" type="text" id="tel2" name="tel2"></td>
                	<td>职位：</td><td><input class="ip1" type="text" id="station2" name="station2"></td>
                	<td class="more"  id="delete2">&times;</td>
                	<input type="hidden" id="delete2val"/>
                	</tr>
                	<tr id="numtr3">
                	<td>姓名：</td><td><input class="ip1" type="text" id="username3" name="username3"></td>
                	<td>电话：</td><td><input class="ip1" type="text" id="tel3" name="tel3"></td>
                	<td>职位：</td><td><input class="ip1" type="text" id="station3" name="station3"></td>
                	<td class="more"  id="delete3">&times;</td>
                	<input type="hidden" id="delete3val"/>
                	</tr>
                </table>               
            </div>
            <div class="tj"><input type="button" value="立即报名" name='sgbtn' id="sgbtn" class="tjbtn"/></div>
        </form>
    </div>
</div>
<!--我要参加弹出框 end-->

</body>
</html>