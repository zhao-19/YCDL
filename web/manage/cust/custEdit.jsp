<%@page import="com.winpow.services.manage.catalog.bean.Catalog" %>
<%@page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>

    <link rel="stylesheet"
          href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css"/>

    <style>
		#insertOrUpdateMsg{border: 0px solid #aaa; margin: 0px; position: fixed; top: 0; width: 100%; background-color: #d1d1d1; display: none; height: 30px; z-index: 9999; font-size: 18px; color: red;} select{height: auto;}
		#tabs-6 input{width:104px;margin: 10px 0px;}
		#tabs-6 select{width:117px;margin: 10px 0px;}
		#tabs-6 td{vertical-align: middle;}
		.n-ok .n-icon{margin-top: 12px;}
		.iframeChild .layui-layer-content,.iframeChild iframe {height:100%;}
    </style>


    <script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>

    <script>
        KindEditor.ready(function (K) {
            var editor = K.editor({
            	 allowFileManager : true
            });
            K('input[name=filemanager4]').click(function () {
                var imagesInputObj = $(this).parent().children("input[ccc=imagesInput]");
                editor.loadPlugin('image', function() {
                    editor.plugin.imageDialog({
                        insertfile : imagesInputObj.val(),
                        clickFn : function(url, title) {
                        	imagesInputObj.val(url);
                            editor.hideDialog();
                        }
                    });
                    });
            });
            K('input[name=filemanager2]').click(function () {
                var imagesInputObj = $(this).parent().children("input[ccc=imagesInput]");
                editor.loadPlugin('image', function() {
                    editor.plugin.imageDialog({
                        insertfile : imagesInputObj.val(),
                        clickFn : function(url, title) {
                            imagesInputObj.val(url);
                            editor.hideDialog();
                        }
                    });
                    });
            });
            K('input[name=filemanager3]').click(function () {
                var imagesInputObj = $(this).parent().children("input[ccc=imagesInput]");
                editor.loadPlugin('image', function() {
                    editor.plugin.imageDialog({
                        insertfile : imagesInputObj.val(),
                        clickFn : function(url, title) {
                            imagesInputObj.val(url);
                            editor.hideDialog();
                        }
                    });
                    });
            });
        });
        KindEditor.ready(function(K) {
            var editor2 = K.create('textarea[id="increcontenttext"]', {
                allowFileManager : true,
                afterBlur:function(){this.sync();}
            });
            K('input[name=getHtml]').click(function(e) {
                alert(editor2.html());
            });
            K('input[name=isEmpty]').click(function(e) {
                alert(editor2.isEmpty());
            });
            K('input[name=getText]').click(function(e) {
                alert(editor2.text());
            });
            K('input[name=selectedHtml]').click(function(e) {
                alert(editor2.selectedHtml());
            });
            K('input[name=setHtml]').click(function(e) {
                editor2.html('<h3>Hello KindEditor</h3>');
            });
            K('input[name=setText]').click(function(e) {
                editor2.text('<h3>Hello KindEditor</h3>');
            });
            K('input[name=insertHtml]').click(function(e) {
                editor2.insertHtml('<strong>插入HTML</strong>');
            });
            K('input[name=appendHtml]').click(function(e) {
                editor2.appendHtml('<strong>添加HTML</strong>');
            });
            K('input[name=clear]').click(function(e) {
                editor2.html('');
            });
        });
    </script>


</head>

<body>
<s:form action="/manage/cust!update.action" id="form" name="form" theme="simple" method="post">
    <div class="navbar navbar-inverse">
        <div id="insertOrUpdateMsg">
            <s:property value="#session.insertOrUpdateMsg"/>
            <%request.getSession().setAttribute("insertOrUpdateMsg", "");//列表页面进行编辑文章的时候,需要清空信息 %>
        </div>
    </div>

    <span id="pifeSpan" class="input-group-addon"
          style="display:none"><%=SystemManager.systemSetting.getImagerootpath()%></span>
    <input type="hidden" value="<s:property value="e.id"/>" id="productID"/>
    <input type="hidden" value="<s:property value="e.catalogID"/>" id="catalogID"/>


    <div style="text-align: center;">
        <div id="updateMsg"><font color='red'><s:property value="updateMsg"/></font></div>
            用户ID：<span class="badge badge-success"><s:property value="e.id"/></span>
            <button type="submit" class="btn btn-success">
                <i class="icon-ok icon-white"></i> 保存
            </button>
    </div>


    <div id="tabs">

        <ul>
            <li><a href="#tabs-1">基本信息</a></li>
            <li><a href="#tabs-3">个人信息</a></li>
            <s:if test='userType=="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001"'>
                <li><a href="#tabs-2">企业信息</a></li>
                <li><a href="#tabs-6">财务信息</a></li>
            </s:if>
           
            <s:if test='userType=="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003"'>
                <li><a href="#tabs-4">机构信息</a></li>
            </s:if>
            <s:if test='userType=="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008"'>
                <li><a href="#tabs-5">其它机构</a></li>
            </s:if>
            <s:else>

            </s:else>
        </ul>


        <div id="tabs-1">
            <table class="table table-condensed">
                <tr style="display:none;">
                    <th colspan="2">id</th>
                    <td colspan="2"><s:hidden name="e.id"/></td>
                </tr>
                <tr>
                    <th class="td_right">用户名</th>
                    <td style="text-align: left;">
                        <s:textfield name="e.userid" id="userid" readonly="true"/>
                        <input style="margin-left: 10px;" type="button" value="重置密码" onclick="resetpassword();"/>
                    </td>
                    <th class="td_right"></th>
                    <td style="text-align: left;">
                        <input style="margin-left: 10px;" type="button" value="子账号管理" onclick="custchild();"/>
                    </td>
                </tr>

                <tr>


                    <th class="td_right">密码错误次数</th>
                    <td style="text-align: left;" colspan="3">
                        <s:textfield name="e.errorcount" id="errorcount" readonly="false"/>
                    </td>
                </tr>

                <tr>
                    <th class="td_right">客户类型</th>
                    <td style="text-align: left;">
                            <s:select list="%{#request.usertypelist}" id="usertype" listKey="id"
                                      listValue="name" name="e.usertype" label="客户类型"
                                      headerKey="" headerValue=""/>
                        <input style="margin-left: 10px;" type="button" value="修改客户类型" onclick="modifyusertype();"/>
                    </td>

                    <th class="td_right">手机号码</th>
                    <td style="text-align: left;">
                        <s:textfield name="e.cellphone" id="cellphone" readonly="false"/>
                        <input style="margin-left: 10px;" type="button" value="修改手机号" onclick="modifycellphone();"/>
                    </td>
                </tr>
                <tr>
                    <th class="td_right">邮箱</th>
                    <td style="text-align: left;">

                        <s:textfield name="e.email" id="email" readonly="false" size="32" maxlength="32"/>
                    </td>

                    <th class="td_right">是否注销</th>
                    <td style="text-align: left;">
                        <s:select list="%{#application.dic.whether.childs}" listKey="id" id="custdisable"
                                  listValue="name" name="e.disable" label="状态" headerKey="" headerValue=""
                        />
                        <input style="margin-left: 10px;" type="button" value="修改注销状态" onclick="disablecust();"/>
                    </td>

                </tr>

                <tr>
                    <th class="td_right">客户经理</th>
                    <td style="text-align: left;" colspan="3"> 
                        <s:textfield name="e.custmanage" id="custmanage" readonly="false"/>
                    </td>

                   <%--  <th class="td_right">是否审核</th>
                    <td style="text-align: left;">
                        <s:select list="%{#request.status2list}" listKey="id"
                                  listValue="name" name="e.status2" label="状态"/>
                    </td> --%>
                </tr>
                <tr>
                    <th class="td_right">禁言时间</th>
                    <td style="text-align: left;">
                        <input id="forbidend" class="Wdate search-query input-small" type="text" name="e.forbidend"
						value="${fn:substring(e.forbidend, 0, 10)}" onFocus="WdatePicker()" />
						<input style="margin-left: 10px;" type="button" value="修改禁言时间" onclick="forbidendcust();"/>
                    </td>
                    <th class="td_right"></th>
                    <td style="text-align: left;"></td>
                </tr>

                <tr>
                    <th class="td_right">新增时间</th>
                    <td style="text-align: left;">
                        <s:property value="e.adddate"/>

                    </td>

                    <th class="td_right">上次登录时间</th>
                    <td style="text-align: left;">
                        <s:property value="e.lastlogintime"/>

                    </td>
                </tr>
                <tr>
                    <th class="td_right">数据来源</th>
                    <td style="text-align: left;" colspan="3">
                        <s:property value="e.custmanagesource"/>
                    </td>
                </tr>

            </table>
        </div>

 <!-- 个人 -->
       <%--  <s:if test='userType=="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002"'> --%>

            <div id="tabs-3">


                <table class="table table-condensed">

                    <tr style="display:none;">
                        <th class="td_right">用户编号</th>
                        <td style="text-align: left;">
                        	<s:hidden name="person.id"/>
                            <s:textfield name="person.userid" id="userid" readonly="false"/>
                        </td>

                        <th class="td_right"></th>
                        <td style="text-align: left;">
                            
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">头像</th>
                        <td style="text-align: left;" colspan="3">
                            <img src="${person.headimg }" style="max-height: 300px;"/>
                                    <br/>
                            <input type="button" name="filemanager3" value="上传头像（300*300）" class="btn btn-success"/>
                            <s:textfield type="text" id="headimg" name="person.headimg" ccc="imagesInput"
                                         style="width: 600px;"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">姓名</th>
                        <td style="text-align: left;">
                            <s:textfield name="person.username" id="username" readonly="false"/>
                        </td>
                        <th class="td_right">学历</th>
                        <td style="text-align: left;">
                            <s:textfield name="person.education" id="education" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">用户类型</th>
                        <td style="text-align: left;">
                            <s:select list="%{#application.dic.persontype.childs}" listKey="id" id="persontype"
                                  listValue="name" name="person.persontype" label="状态" headerKey="" headerValue=""/>
                        </td>

                        <th class="td_right">联系地址</th>
                        <td style="text-align: left;">
                            <s:textfield name="person.address" id="address" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">所在机构</th>
                        <td style="text-align: left;">
                            <s:textfield name="person.org" id="org" readonly="false"/>
                        </td>

                        <th class="td_right">标签(空格分隔)</th>
                        <td style="text-align: left;">
                            <s:textfield name="person.label" id="label" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">行业</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textarea rows="2" cols="80" name="person.profession" id="profession" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">个人简介</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textarea rows="3" cols="80" name="person.introduce" id="introduce" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">详细介绍</th>
                        <td style="text-align: left;width: 82%;" colspan="3">
                        	<s:textarea
                        name="person.investment" rows="3" cols="80"
                        style="width:100%;height:400px;" id="increcontenttext"
                        readonly="false" />
                        </td>
                    </tr>
                    <s:if test='person.headimg!=null && person.headimg!=""'>
                    <tr>
                        <th class="td_right">点赞数</th>
                        <td style="text-align: left;"><s:textfield name="person.likenum" id="likenum" readonly="false"/></td>
                        <th class="td_right"></th>
                        <td style="text-align: left;"></td>
                    </tr>
					<tr style="background-color: lightgray;">
                        <th class="td_right">是否认证</th>
                        <td style="text-align: left;">
                            <s:select list="%{#application.dic.whether.childs}" listKey="id" id="approve" theme="simple"
                                  listValue="name" name="person.approve" label="是否认证" headerKey="" headerValue=""
                        	/>
                        </td>
                        <th class="td_right">认证优先级(越大越靠前)</th>
                        <td style="text-align: left;">
	                        <select id="priority" name="person.priority"></select>
	                        <input style="margin-left: 10px;" type="button" value="保存认证信息" onclick="saveApprove();"/>
                        </td>
                    </tr>
					</s:if>
                   <%--  <tr>
                        <th class="td_right">身份证号码</th>
                        <td style="text-align: left;">
                            <s:textfield name="person.orgid" id="orgid" readonly="false"/>
                        </td>

                        <th class="td_right">性别</th>
                        <td style="text-align: left;">
                            <s:textfield name="person.sex" id="sex" readonly="false"/>
                        </td>
                    </tr> --%>

                   <%--  <tr>
                        <th class="td_right">出生日期</th>
                        <td style="text-align: left;">
                            <input id="birthday" class="Wdate search-query input-small" type="text" name="person.birthday"
								value="${fn:substring(person.birthday, 0, 10)}" onFocus="WdatePicker()"/>
                        </td>

                        <th class="td_right">联系地址</th>
                        <td style="text-align: left;">
                            <s:textfield name="person.address" id="address" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">学历</th>
                        <td style="text-align: left;">
                            <s:textfield name="person.education" id="education" readonly="false"/>
                        </td>

                        <th class="td_right">毕业院校</th>
                        <td style="text-align: left;">
                            <s:textfield name="person.graduate" id="graduate" readonly="false"/>
                        </td>
                    </tr> --%>

                    <tr style="display: none;">
                        <th class="td_right">所在地</th>
                        <td style="text-align: left;">
                            <select id="person_province" name="person.person_province"><s:property
                                    value="person.person_province"/></select>  
                            <select id="person_city" name="person.person_city"><s:property
                                    value="person.person_city"/></select>  
                            <select id="person_county" name="person.person_county"><s:property
                                    value="person.person_county"/></select>
                        </td>

                    </tr>
                    
                    <%-- <tr>
                        <th class="td_right">用户类型</th>
                        <td style="text-align: left;">
                            <s:select list="%{#application.dic.persontype.childs}" listKey="id" id="persontype"
                                  listValue="name" name="person.persontype" label="状态" headerKey="" headerValue=""
                        	/>
                        </td>

                        <th class="td_right"></th>
                        <td style="text-align: left;"></td>
                    </tr>
                    
                    <tr>
                        <th class="td_right">是否认证</th>
                        <td style="text-align: left;">
                            <s:select list="%{#application.dic.whether.childs}" listKey="id" id="approve" theme="simple"
                                  listValue="name" name="person.approve" label="是否认证" headerKey="" headerValue=""
                        	/>
                        </td>
                        <th class="td_right">认证优先级</th>
                        <td style="text-align: left;">
	                        <select id="priority" name="person.priority"></select>
	                        <input style="margin-left: 10px;" type="button" value="保存认证信息" onclick="saveApprove();"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">自我介绍</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textarea rows="3" cols="80" name="person.introduce" id="introduce" readonly="false"/>

                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">工作室介绍</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textarea rows="3" cols="80" name="person.studio" id="studio" readonly="false"/>

                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">擅长行业</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textarea rows="3" cols="80" name="person.profession" id="profession" readonly="false"/>

                        </td>
                    </tr> --%>
                </table>
            </div>
        <%-- </s:if> --%>


        <!-- 企业 -->
        <s:if test='userType=="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001"'>
            <div id="tabs-2">
                <table class="table table-condensed">

                    <tr style="display:none;">
                        <th colspan="2">qiye.pk_qiyeid</th>
                        <td colspan="2"><s:hidden name="qiye.pk_qiyeid"/></td>
                        <th class="td_right">用户ID</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.userid" id="userid" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
						<th class="td_right">组织机构代码（统一社会信用代码）</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.zzjgdm" id="aazzjgdm" readonly="false" onblur="qiyeCheckCreditId(this);"/>
                        </td>

                        <th class="td_right">企业名称</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.qiyemingcheng" id="qiyemingcheng" readonly="false"/>
                        </td>

                       
                    </tr>

                    <tr>
                        <th class="td_right">办公(经营)地址</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.dizhi" id="dizhi" readonly="false"/>
                        </td>

                        <th class="td_right">注册资本(万元)</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.zhuceziben" id="zhuceziben" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">法人代表姓名</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.faren" id="faren" readonly="false"/>
                        </td>

                        <th class="td_right">工商注册地</th>
                        <td style="text-align: left;">
                            <select id="gszcd_province" name="qiye.gszcd_province"><s:property
                                    value="qiye.gszcd_province"/></select>  
                            <select id="gszcd_city" name="qiye.gszcd_city"><s:property
                                    value="qiye.gszcd_city"/></select>  
                            <select id="gszcd_county" name="qiye.gszcd_county"><s:property
                                    value="qiye.gszcd_county"/></select>
                        </td>
                    </tr>

                    <tr>
		 				<th class="td_right">成立日期</th>
                        <td style="text-align: left;">

                            <input id="chengliriqi" class="Wdate search-query input-small" type="text"
                                   name="qiye.chengliriqi"
                                   value="<s:property value="qiye.chengliriqi" />"
                                   onFocus="WdatePicker()"/>
                        </td>
                        <th class="td_right">企业性质</th>
                        <td style="text-align: left;">

                            <s:select list="%{#application.dic.qylx.childs}" listKey="id"
                                      listValue="name" name="qiye.qiyexingzhiid" label="申请状态"
                                      headerKey="" headerValue=""/>

                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">所属行业</th>
                        <td style="text-align: left;">
                            <s:select list="%{#application.dic.c9a715e6c1b446c48c1818d80452c3ed.childs}" listKey="id"
                                      listValue="name" name="qiye.hangyeid" label="所属行业"
                            />
                        </td>

                        <th class="td_right">所处阶段</th>
                        <td style="text-align: left;">
                            <s:select list="%{#application.dic.e677910075c6406db2f9311f808dd63d.childs}" listKey="id"
                                      listValue="name" name="qiye.suchujieduanid" label="所处阶段"
                            />

                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">经营范围</th>
                        <td colspan="3">
                            <s:textarea name="qiye.jingyingfanwei" rows="3" cols="80" id="jingyingfanwei"
                                        readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">企业基本介绍</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textarea name="qiye.qiyejieshao" rows="3" cols="80" id="qiyejieshao" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">主营业务</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textarea name="qiye.zhuyingyewu" rows="3" cols="80" id="zhuyingyewu" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">企业认证</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.qiyerenzheng" id="qiyerenzheng" readonly="false"/>
                        </td>

                        <th class="td_right">员工数（人）</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.yuangongshu" id="yuangongshu" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">大专以上技术人员数（人）</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.dazhuanrenshu" id="dazhuanrenshu" readonly="false"/>
                        </td>

                        <th class="td_right">从事研发人数（人）</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.yanfarenshu" id="yanfarenshu" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">本科以上占管理比例%</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.bkzglbl" id="bkzglbl" readonly="false"/>%
                        </td>

                        <th class="td_right">无上市计划</th>
                        <td style="text-align: left;">
                            <s:select list="%{#application.dic.sf.childs}" listKey="id" listValue="name"
                                      name="qiye.shangshijihua" label="有无上市计划"/>

                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">企业logo</th>
                        <td style="text-align: left;" colspan="3">
                            <input type="button" name="filemanager2" value="LOGO" class="btn btn-success"/>
                            <s:textfield type="text" id="logo" name="qiye.logo" ccc="imagesInput"
                                         style="width: 600px;margin-bottom:0px;"/>
                            <s:if test="qiye.logo!=null">
                                <a target="_blank" href="<s:property value="qiye.logo" />">
                                    <img style="max-width: 50px;max-height: 50px;" alt=""
                                         src="<s:property value="qiye.logo" />">
                                </a>
                            </s:if>
                        </td>

                    </tr>

                    <tr>

                        <th class="td_right">网址</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textfield name="qiye.wangzhi" size="80" id="wangzhi" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">联系人姓名</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.xingming" id="xingming" readonly="false"/>
                        </td>

                        <th class="td_right">职务</th>
                        <td style="text-align: left;">
                            <s:textfield name="qiye.bumenzhiwu" id="bumenzhiwu" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">移动电话</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textfield name="qiye.yidongdianhua" id="yidongdianhua" readonly="false"/>
                        </td>


                    </tr>


                </table>
            </div>

		<!-- 财务信息 -->
			<div id="tabs-6">
				<div style="background-color: #dff0d8;padding: 4px 5px;">财务情况（万元）</div>
				<table class="table table-condensed" style="width: auto;">
					<tr style="display: none;">
						<td><ol></ol></td>
						<s:iterator value="finaList" var="tbfinareport" status="sta">
 							<td><input type="hidden"  name="finareport.id"  value="${id }"><input type="hidden"  name="finareport.userid"  value="${userid }"></td> 
 						</s:iterator>
					</tr>
					<tr>
					   <td><ol>报表类型</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input">
                				<select class="select" name="tbfinareport.report_type${sta.index }" value="${report_type }">
									<option value="1">年报</option>
									<option value="2">半年报</option>
									<option value="3">季报</option>
									<option value="4">月报</option>
								</select>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>报表时间</ol></td>
					   	
        				<s:iterator value="finaList" var="tbfinareport" status="sta">
						   	<c:if test='${report_type==1}'>
						   		<td class="input"><input type="text" name="tbfinareport.report_time${sta.index }" value="${fn:substring(report_time, 0, 4)}" readonly="readonly" class="inputexcept"/></td>
						   	</c:if>
						   	<c:if test='${report_type!=1}'>
								<td class="input"><input type="text" name="tbfinareport.report_time${sta.index }" value="${fn:substring(report_time, 0, 7)}" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM',isShowClear:false,readOnly:true})"/></td>					   	
						   	</c:if>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>总资产</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.assets${sta.index }" value="${assets }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>总负债</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.liabilities${sta.index }" value="${liabilities }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>所有者权益</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.owner_equity${sta.index }" value="${owner_equity }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>实收资本</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.paicl_up${sta.index }" value="${paicl_up }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>未分配利润</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.notallot_profit${sta.index }" value="${notallot_profit }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>银行借款 </ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.bank_borrowings${sta.index }" value="${bank_borrowings }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>营业收入 </ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.income${sta.index }" value="${income }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>主营业务收入 </ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.main_income${sta.index }" value="${main_income }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>应收账款</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.should_income${sta.index }" value="${should_income }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>营业成本</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.oper_cost${sta.index }" value="${oper_cost }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>存货</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.goods_amt${sta.index }" value="${goods_amt }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>流动资产</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.flow_assets${sta.index }" value="${flow_assets }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>流动负债</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.flow_liabilities${sta.index }" value="${flow_liabilities }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>利润总额</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.total_profit${sta.index }" value="${total_profit }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>净利润</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.net_margin${sta.index }" value="${net_margin }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>纳税总额</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input type="text" name="tbfinareport.taxamt${sta.index }" value="${taxamt }" onkeyup="value=value.replace(/[^\d^\.]/g,'')"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>存货周转率</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><fmt:formatNumber type="number" value="${goods_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%
                				<input type="hidden" name="tbfinareport.goods_rate${sta.index }" value="${goods_rate }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>应收账款周转率</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><fmt:formatNumber type="number" value="${income_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%
                				<input type="hidden" name="tbfinareport.income_rate${sta.index }" value="${income_rate }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>毛利率</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><fmt:formatNumber type="number" value="${margin_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%
                				<input type="hidden" name="tbfinareport.margin_rate${sta.index }" value="${margin_rate }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>资产负债率</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><fmt:formatNumber type="number" value="${assets_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%
                				<input type="hidden" name="tbfinareport.assets_rate${sta.index }" value="${assets_rate }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>流动比率</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><fmt:formatNumber type="number" value="${total_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%
                				<input type="hidden" name="tbfinareport.total_rate${sta.index }" value="${total_rate }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>速动比率</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><fmt:formatNumber type="number" value="${speed_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%
                				<input type="hidden" name="tbfinareport.speed_rate${sta.index }" value="${speed_rate }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td><ol>状态</ol></td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input">
                			<s:if test="#tbfinareport.status==0">不完整</s:if>
                			<s:if test="#tbfinareport.status==1">完整</s:if>
                			</td>
        				</s:iterator>
					</tr>
				</table>
				<script type="text/javascript">
					$("select[name^='tbfinareport.report_type']").each(function(){
						$(this).val($(this).attr("value"));
					});
					$("#tabs-6 input,#tabs-6 select").attr('disabled', true);
				</script>
			</div>
        </s:if>

        <!-- 机构 -->
        <s:if test='userType=="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003"'>

            <div id="tabs-4">
                <table class="table table-condensed">


                    <tr style="display:none;">
                        <th class="td_right">机构ID</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.id" id="id" readonly="false"/>
                        </td>

                        <th class="td_right">用户ID</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.userid" id="userid" readonly="false"/>
                        </td>


                    </tr>

                    <tr>
                    	<th class="td_right">组织机构代码</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.zzjgdm" id="zzjgdm" readonly="false" onblur="qiyeCheckCreditId(this);"/>
                        </td>
                    
                        <th class="td_right">机构名称</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.jigoumingcheng" id="jigoumingcheng" readonly="false"/>
                        </td>
                        
                    </tr>
                    <tr>
                    </tr>
                    
                    <tr>
                        <th class="td_right">是否认证</th>
                        <td style="text-align: left;">
                            <s:select list="%{#application.dic.whether.childs}" listKey="id" id="jigouapprove" theme="simple"
                                  listValue="name" name="jigou.approve" label="是否认证" headerKey="" headerValue=""
                        	/>
                        </td>
                        <th class="td_right">认证优先级(越大越靠前)</th>
                        <td style="text-align: left;">
	                        <select id="jigoupriority" name="jigou.priority"></select>
	                        <input style="margin-left: 10px;" type="button" value="保存认证信息" onclick="savejigouApprove();"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">注册时间</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.zhuceshijian" id="zhuceshijian" readonly="false"/>
                        </td>

                        <th class="td_right">注册资本(万元)</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.zhuceziben" id="zhuceziben" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">工商注册地</th>
                        <td style="text-align: left;" colspan="3">
                            <select id="jigou_province" name="jigou.gszcd_province"><s:property
                                    value="jigou.gszcd_province"/></select>  
                            <select id="jigou_city" name="jigou.gszcd_city"><s:property
                                    value="jigou.gszcd_city"/></select>  
                            <select id="jigou_county" name="jigou.gszcd_county"><s:property
                                    value="jigou.gszcd_county"/></select>
                        </td>

                    </tr>
                    <tr>
                        <th class="td_right">机构简介</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textarea rows="3" cols="80" name="jigou.jigoujianjie" id="jigoujianjie" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">办公地址</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textfield name="jigou.bangongdizhi" id="bangongdizhi" readonly="false" size="80"/>
                        </td>

                    </tr>
                    <tr>

                        <th class="td_right">机构Logo</th>


                        <td style="text-align: left;" colspan="3">
                            <input type="button" name="filemanager4" value="LOGO（720*288）" class="btn btn-success"/>
                            <s:textfield type="text" id="jigoulogo" name="jigou.jigoulogo" ccc="imagesInput"
                                         style="width: 600px;"/>
                            <s:if test="jigou.jigoulogo!=null">
                                <a target="_blank" href="<s:property value="jigou.jigoulogo" />">
                                    <img style="max-width: 50px;max-height: 50px;" alt=""
                                         src="<s:property value="jigou.jigoulogo" />">
                                </a>
                            </s:if>
                        </td>


                    </tr>

                    <tr>
                        <th class="td_right">机构状态</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.jgzt" id="jgzt" readonly="false"/>
                        </td>

                        <th class="td_right">网址</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.wangzhi" id="wangzhi" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">管理资本金</th>
                        <td style="text-align: left;" colspan="3">
                            <s:textfield name="jigou.tz_glzbj" id="tz_glzbj" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">投资行业</th>
                        <td style="text-align: left;width:451px">
                            <input type="checkbox" name="jigou.tz_touzihangye" value="物流行业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("物流行业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">物流行业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="ＩＴ行业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("ＩＴ行业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">ＩＴ行业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="汽车行业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("汽车行业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">汽车行业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="旅游行业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("旅游行业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">旅游行业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="能源行业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("能源行业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">能源行业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="制造行业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("制造行业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">制造行业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="医疗健康"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("医疗健康") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">医疗健康</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="化学工业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("化学工业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">化学工业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="研究咨询"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("研究咨询") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">研究咨询</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="教育行业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("教育行业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">教育行业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="传媒娱乐"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("传媒娱乐") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">传媒娱乐</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="农林牧渔"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("农林牧渔") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">农林牧渔</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="房地产业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("房地产业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">房地产业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="电信及增值"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("电信及增值") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">电信及增值</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="互联网络"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("互联网络") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">互联网络</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="食品饮料"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("食品饮料") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">食品饮料</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="家居建材"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("家居建材") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">家居建材</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="金融行业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("金融行业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">金融行业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="投资行业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("投资行业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">投资行业</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="连锁经营"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("连锁经营") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">连锁经营</span>
                            <input type="checkbox" name="jigou.tz_touzihangye" value="其他行业"
                                   <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("其他行业") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">其他行业</span>
                        </td>

                        <th class="td_right">投资阶段</th>
                        <td style="text-align: left;">
                            <input type="checkbox" name="jigou.tz_touzijieduanid" value="天使轮"
                                   <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("天使轮") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">天使轮</span>
                            <input type="checkbox" name="jigou.tz_touzijieduanid" value="Pre-A轮"
                                   <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("Pre-A轮") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">Pre-A轮</span>
                            <input type="checkbox" name="jigou.tz_touzijieduanid" value="A轮"
                                   <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("A轮") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">A轮</span>
                            <input type="checkbox" name="jigou.tz_touzijieduanid" value="B轮"
                                   <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("B轮") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">B轮</span>
                            <input type="checkbox" name="jigou.tz_touzijieduanid" value="C轮"
                                   <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("C轮") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">C轮</span>
                            <input type="checkbox" name="jigou.tz_touzijieduanid" value="D轮"
                                   <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("D轮") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">D轮</span>
                            <input type="checkbox" name="jigou.tz_touzijieduanid" value="E轮及以后"
                                   <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("E轮及以后") != -1) { %>checked<% } %>>
                            <span onclick="checkedThat(this)">E轮及以后</span>
                        </td>
                    </tr>

                    <tr>

                        <th class="td_right">投资额度(万元）</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.tz_touziedu" id="tz_touziedu" readonly="false"/>
                        </td>

                        <th class="td_right">联系人姓名</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.xingming" id="xingming" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">职务</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.bumenzhiwu" id="bumenzhiwu" readonly="false"/>
                        </td>

                        <th class="td_right">移动电话</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.yidongdianhua" id="yidongdianhua" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">固定电话</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.gudingdianhua" id="gudingdianhua" readonly="false"/>
                        </td>

                        <th class="td_right">Email</th>
                        <td style="text-align: left;">
                            <s:textfield name="jigou.email" id="email" readonly="false"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="td_right">名片上传</th>
                        <td style="text-align: left;" colspan="3">
                            <a target="_blank" href="<s:property value="jigou.bcard" /> ">
                                <img style="max-width: 50px;max-height: 50px;" alt="" src="<s:property value="jigou.bcard" /> ">
                            </a>
                        </td>
                    </tr>
                </table>
            </div>
        </s:if>
        
        <!-- 其它机构 -->
        <s:if test='userType=="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008"'>

            <div id="tabs-5">
                <table class="table table-condensed">
                    <tr style="display:none;">
                        <th></th><td style="text-align: left;">
                            <s:textfield name="tbotherorg.id" id="id" readonly="false"/>
                        </td><th></th><td></td>
                    </tr>
                    <tr>
                    	<th class="td_right">组织机构代码</th>
                        <td style="text-align: left;">
                            <s:textfield name="tbotherorg.org_credit_id" id="org_credit_id" readonly="false" onblur="qiyeCheckCreditId(this);"/>
                        </td>
                        <th class="td_right">机构名称</th>
                        <td style="text-align: left;">
                            <s:textfield name="tbotherorg.org_name" id="org_name" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">机构类型</th>
                        <td style="text-align: left;">
                        	<s:select cssClass="input-medium" list="%{#application.dic.otherorgtype.childs}" listKey="id" headerKey="" headerValue="" 
            					listValue="name" name="tbotherorg.org_type" id="org_type"/>
                        </td>
                        <th class="td_right">注册资本(万元)</th>
                        <td style="text-align: left;">
                            <s:textfield name="tbotherorg.regist_amt" id="regist_amt" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">工商注册地</th>
                        <td style="text-align: left;" colspan="3">
                            <select id="gszcd_province" name="tbotherorg.gszcd_province"><s:property value="tbotherorg.gszcd_province"/></select>  
                            <select id="gszcd_city" name="tbotherorg.gszcd_city"><s:property value="tbotherorg.gszcd_city"/></select>  
                            <select id="gszcd_county" name="tbotherorg.gszcd_county"><s:property value="tbotherorg.gszcd_county"/></select>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">办公地址</th>
                        <td style="text-align: left;">
                            <s:textfield name="tbotherorg.org_address" id="org_address" readonly="false"/>
                        </td>

                        <th class="td_right">主营业务</th>
                        <td style="text-align: left;">
                            <s:textarea name="tbotherorg.org_info" rows="3" cols="80" id="org_info" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">联系人</th>
                        <td style="text-align: left;">
                            <s:textfield name="tbotherorg.org_linkman" id="org_linkman" readonly="false"/>
                        </td>
						<th class="td_right">联系人职位</th>
                        <td style="text-align: left;">
                            <s:textfield name="tbotherorg.org_linkduty" id="org_linkduty" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">联系人电话</th>
                        <td style="text-align: left;">
                            <s:textfield name="tbotherorg.org_linkcellphone" id="org_linkcellphone" readonly="false"/>
                        </td>
						<th class="td_right">联系人邮箱</th>
                        <td style="text-align: left;">
                            <s:textfield name="tbotherorg.org_linkemail" id="org_linkemail" readonly="false"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">客户经理</th>
                        <td style="text-align: left;">
                            <s:textfield name="tbotherorg.custmanage" id="custmanage" readonly="false"/>
                        </td>
						<th class="td_right"></th>
                        <td style="text-align: left;">
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">所属局</th>
                        <td style="text-align: left;">
                        	<select name="tbotherorg.bureau" id="otherbureau" onchange="setotheroffice();"></select>
                        </td>
						<th class="td_right">所属处</th>
                        <td style="text-align: left;">
                        	<select name="tbotherorg.office" id="otheroffice"></select>
                        </td>
                    </tr>
                </table>
            </div>
        </s:if>
        <s:else>

        </s:else>

    </div>


</s:form>
<script type="text/javascript">
	var bureauoffice = null;
	function setotheroffice() {
		var bval = $("#otherbureau").val();
		if ($("#otherbureau").val() != "") {
			for (var i = 0; i < bureauoffice.length; i ++ ){
				var da = bureauoffice[i];
				if (da.code == bval) {
					var officehtml = "<option value=''></option>";
					for (var j = 0; j < da.list.length; j ++ ){
						var d = da.list[j];
						officehtml += "<option value='" + d.code + "'>" + d.name + "</option>";
					}
					$("#otheroffice").html(officehtml);
				}
			}
		}
	}
	if ('${e.usertype}' == 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008') {
		$.ajax({
			type: 'post',
			url: "/app/appworkflow!getbureauoffice.action",
			dataType:"json",
			success: function(data){
				bureauoffice = data.data;
				var bureauhtml = "<option value=''></option>";
				for (var i = 0; i < data.data.length; i ++ ){
					var da = data.data[i];
					bureauhtml += "<option value='" + da.code + "'>" + da.name + "</option>";
				}
				$("#otherbureau").html(bureauhtml);
				$("#otherbureau").val('${tbotherorg.bureau}');
				setotheroffice();
				$("#otheroffice").val('${tbotherorg.office}');
			}
		});
	}
</script>


<script type="text/javascript">

    var custtype = '<s:property value="userType"/>';
</script>

<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
<script src="<%=request.getContextPath() %>/resource/js/area.js"></script>


<script type="text/javascript">

    var custtype = '<s:property value="userType"/>';


    _init_area();


    //控制省市县初始化被选中


    var pro = '';
    var city = '';
    var county = '';


    if (custtype == 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001') { //企业
        pro = '<s:property value="qiye.gszcd_province"/>';
        city = '<s:property value="qiye.gszcd_city"/>';
        county = '<s:property value="qiye.gszcd_county"/>';

    } else if (custtype == 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002') {//个人
        pro = '<s:property value="person.person_province"/>';
        city = '<s:property value="person.person_city"/>';
        county = '<s:property value="person.person_county"/>';
    } else if (custtype == 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003') {//机构
        pro = '<s:property value="jigou.gszcd_province"/>';
        city = '<s:property value="jigou.gszcd_city"/>';
        county = '<s:property value="jigou.gszcd_county"/>';
    } else if (custtype == 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008') {//其它机构
        pro = '<s:property value="tbotherorg.gszcd_province"/>';
        city = '<s:property value="tbotherorg.gszcd_city"/>';
        county = '<s:property value="tbotherorg.gszcd_county"/>';
    }


    var opt0 = ["省份", "地级市", "市、县级市"];//初始值
    if (pro != null && pro != 'undefine' && pro != '') {
        opt0[0] = pro;
    }
    if (city != null && city != 'undefine' && city != '') {
        opt0[1] = city;
    }
    if (county != null && county != 'undefine' && county != '') {
        opt0[2] = county;
    }
    //初始化
    change(0);


    var Gid = document.getElementById;


    $(function () {
        $("#tabs").tabs({
            //event: "mouseover"
        });
        //alert($("#insertOrUpdateMsg").html());
        if ($("#insertOrUpdateMsg").html() != '' && $("#insertOrUpdateMsg").html().trim().length > 0) {
            $("#insertOrUpdateMsg").slideDown(1000).delay(1500).slideUp(1000);
        }

        selectDefaultCatalog();

        $("#removePife").click(function () {
            clearRootImagePath();
        });
    });
    //删除图片主路径
    function clearRootImagePath(picInput) {
        var _pifeSpan = $("#pifeSpan").text();
        var _imgVal = picInput.val();
        //console.log("1===>_imgVal = "+_imgVal);
        //if(_imgVal && _imgVal.length>0 && _imgVal.indexOf(_pifeSpan)==0){
        //picInput.val(_imgVal.substring(_pifeSpan.length));
        //console.log("2===>"+_imgVal.indexOf("/attached/"));
        picInput.val(_imgVal.substring(_imgVal.indexOf("/attached/")));

        //}
    }
    function deleteImageByImgPaths() {
        if ($("input:checked").size() == 0) {
            alert("请选择要删除的图片！");
            return false;
        }
        return confirm("确定删除选择的图片吗?");
    }

    function selectDefaultCatalog() {
        var _catalogID = $("#catalogID").val();
        if (_catalogID != '' && _catalogID > 0) {
            //$("#catalogSelect").attr("value",_catalogID);
            $("#catalogSelect").val(_catalogID);
        }
    }

</script>

<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
    var editor1;
    var editor2;
    var editor3;
    var editor4;
    //var HTMLeditor =["e.productargHTML","e.packagelistHTML","e.serviceHTML","e.productHTML"];
    //var editors = new Array[HTMLeditor.length];
    KindEditor.ready(function (K) {
        //for(var i=0;i<HTMLeditor.length;i++) {
        //	//console.log("=HTMLeditor["+i+"]===> "+HTMLeditor[i]);
        editor1 = K.create('textarea[name="e.productargHTML"]', {
            allowFileManager: true
        });
        editor2 = K.create('textarea[name="e.packagelistHTML"]', {
            allowFileManager: true
        });
        editor3 = K.create('textarea[name="e.serviceHTML"]', {
            allowFileManager: true
        });
        editor4 = K.create('textarea[name="e.productHTML"]', {
            allowFileManager: true
        });
        K('input[name=getHtml]').click(function (e) {
            alert(editor1.html());
        });
        K('input[name=isEmpty]').click(function (e) {
            alert(editor1.isEmpty());
        });
        K('input[name=getText]').click(function (e) {
            alert(editor1.text());
        });
        K('input[name=selectedHtml]').click(function (e) {
            alert(editor1.selectedHtml());
        });
        K('input[name=setHtml]').click(function (e) {
            editor1.html('<h3>Hello KindEditor</h3>');
        });
        K('input[name=setText]').click(function (e) {
            editor1.text('<h3>Hello Kindeditor1</h3>');
        });
        K('input[name=insertHtml]').click(function (e) {
            editor1.insertHtml('<strong>插入HTML</strong>');
        });
        K('input[name=appendHtml]').click(function (e) {
            editor1.appendHtml('<strong>添加HTML</strong>');
        });
        K('input[name=clear]').click(function (e) {
            editor.html('');
        });

        //	editors[i] = editor;
        //}
    });

    function addTrFunc() {
        var cc = $("#firstTr").clone();
        $("#firstTr").after(cc);

        cc.find("a").show();
    }

    function removeThis(t) {
        $(t).parent().parent().remove();
        return false;
    }
</script>

<script>
    KindEditor.ready(function (K) {
        var editor = K.editor({
            fileManagerJson: '<%=request.getContextPath() %>/resource/kindeditor-4.1.7/jsp/file_manager_json.jsp'
        });
        K('input[name=filemanager]').click(function () {
            var imagesInputObj = $(this).parent().children("input[ccc=imagesInput]");
            editor.loadPlugin('filemanager', function () {
                editor.plugin.filemanagerDialog({
                    viewType: 'VIEW',
                    dirName: 'image',
                    clickFn: function (url, title) {
                        //K('#picture').val(url);
                        //alert(url);
                        imagesInputObj.val(url);
                        editor.hideDialog();
                        clearRootImagePath(imagesInputObj);//$("#picture"));
                    }
                });
            });
        });

    });

    //复选框点击字的时候选中
    function checkedThat(obj){
        var check = $(obj).prev();

        if(check.prop("checked")) {
            check.prop("checked", false);
        } else {
            check.prop("checked", true);
        }
    }
    
    function resetpassword() {
	    if (confirm("确认重置密码？")) {
	    	$.ajax({
				type: 'post',
				url: "/manage/cust!resetpassword.action",
				data: {"id": '${e.id}'},
				dataType:"json",
				success: function(data){
					if (data.msg = "succ") {
						alert("密码重置成功，新密码是：【" + data.pass + "】。");
					} else {
						alert(data.msg)
					}
				}
			});
	    }
    }
    
    function modifycellphone() {
	    if (confirm("确认修改手机号？")) {
	    	var cellphone = $("#cellphone").val();
		    if (! /^1\d{10}$/.test(cellphone)) {
		    	alert("手机号格式不正确"); 
		    	return;
		    }
	    	$.ajax({
				type: 'post',
				url: "/manage/cust!modifycellphone.action",
				data: {"id": '${e.id}',"cellphone": cellphone},
				dataType:"json",
				success: function(data){
					if (data.msg = "succ") {
						alert("手机号修改成功!");
					} else {
						alert(data.msg)
					}
				}
			});
	    }
    }
    
    function modifyusertype() {
	    if (confirm("确认修改用户类型？")) {
	    	var usertype = $("#usertype").val();
		    if (usertype == "") {
		    	alert("用户类型为空！"); 
		    	return;
		    }
	    	$.ajax({
				type: 'post',
				url: "/manage/cust!modifyusertype.action",
				data: {"id": '${e.id}',"usertype": usertype, "userid" : '${e.userid}'},
				dataType:"json",
				success: function(data){
					if (data.msg = "succ") {
						alert("用户类型修改成功!");
						location.href = "/manage/cust!toEdit.action?e.id=${e.id}";
					} else {
						alert(data.msg)
					}
				}
			});
	    }
    }
    
    function disablecust() {
	    if (confirm("确认修改注销状态？")) {
	    	var custdisable = $("#custdisable").val();
		    if (custdisable == "") {
		    	alert("注销状态为空！"); 
		    	return;
		    }
	    	$.ajax({
				type: 'post',
				url: "/manage/cust!disablecust.action",
				data: {"id": '${e.id}',"disable": custdisable},
				dataType:"json",
				success: function(data){
					if (data.msg = "succ") {
						alert("注销状态修改成功!");
					} else {
						alert(data.msg)
					}
				}
			});
	    }
    }
    
    function forbidendcust() {
	    if (confirm("确认修改禁言时间？")) {
	    	var forbidendcust = $("#forbidend").val();
		    if (forbidendcust == "") {
		    	alert("禁言时间为空！"); 
		    	return;
		    }
	    	$.ajax({
				type: 'post',
				url: "/manage/cust!forbidendcust.action",
				data: {"id": '${e.id}',"forbidend": forbidendcust},
				dataType:"json",
				success: function(data){
					if (data.msg = "succ") {
						alert("禁言时间修改成功!");
					} else {
						alert(data.msg)
					}
				}
			});
	    }
    }
    
    function saveApprove() {
	    if (confirm("确认保存认证信息？")) {
	    	var priority = $("#priority").val();
	    	var approve = $("#approve").val();
		    if (approve == "" || priority == "") {
		    	alert("请输入认证信息！"); 
		    	return;
		    }
	    	$.ajax({
				type: 'post',
				url: "/manage/cust!saveApprove.action",
				data: {"id": '${person.id}',"approve": approve,"priority": priority,"userid": '${e.userid}'},
				dataType:"json",
				success: function(data){
					if (data.msg = "succ") {
						alert("认证信息修改成功!");
					} else {
						alert(data.msg)
					}
				}
			});
	    }
    }
    
    function savejigouApprove() {
	    if (confirm("确认保存认证信息？")) {
	    	var priority = $("#jigoupriority").val();
	    	var approve = $("#jigouapprove").val();
		    if (approve == "" || priority == "") {
		    	alert("请输入认证信息！"); 
		    	return;
		    }
	    	$.ajax({
				type: 'post',
				url: "/manage/cust!savejigouApprove.action",
				data: {"id": '${jigou.id}',"approve": approve,"priority": priority,"userid": '${e.userid}'},
				dataType:"json",
				success: function(data){
					if (data.msg = "succ") {
						alert("认证信息修改成功!");
					} else {
						alert(data.msg)
					}
				}
			});
	    }
    }
    
    var ahtml = "<option value =\"\"></option>";
    for (var i = 1; i <= 100; i ++ ) {
    	ahtml += "<option value =\"" + i + "\">" + i + "</option>";
    }
    $("#priority,#jigoupriority").html(ahtml)
    $("#priority").val('${person.priority}');
    $("#jigoupriority").val('${jigou.priority}');
    
    function custchild() {
    	layer.open({
            title: '子账号管理',
            type: 2,
            skin: 'layui-layer-lan iframeChild',
            area: ['600px', '350px'],
            offset: ['15%', '25%'],
            fix: false, //不固定
            maxmin: false,
            content: "/manage/cust!custchild.action?id=${e.id}"
        });
    }
    
    function qiyeCheckCreditId(obj){
    	var dm = $.trim($(obj).val());
    	if (dm == "") {
    		return;
    	}
    	$.ajax({
			type: 'post',
			url: "/manage/cust!checkadminzzjgdm.action",
			data: {"zzjgdm": dm, "usertype": '${e.usertype}', "f_id": '${e.f_id}'},
			dataType:"json",
			success: function(data){
				if (data.msg != "succ") {
					if (confirm(data.msg)) {
						$.ajax({
							type: 'post',
							url: "/manage/cust!releqiye.action",
							data: {"pk_qiyeid": data.pk_qiyeid, "custid": '${e.id}'},
							dataType:"json",
							success: function(data1){
								alert(data1.msg);
								location.href = "/manage/cust!toEdit.action?e.id=${e.id}";
							}
						});
					}
				}
			}
		});
    }
    if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
	}
</script>


</body>
</html>
