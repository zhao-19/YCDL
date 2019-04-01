<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@page import="com.winpow.services.manage.activities.bean.Activities" %>
<%@page import="com.winpow.core.util.StringUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
   <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/jquery-1.11.3.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_delimg.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>

    <link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css"/>

    <script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
    <script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>

    <script>
        KindEditor.ready(function (K) {
            var editor = K.editor({
                allowFileManager: false
            });


            K('#filemanager').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#logo').val(),
                        clickFn: function (url, title) {
                            K('#logo').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });

            K('#logo').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#logo').val(),
                        clickFn: function (url, title) {
                            K('#logo').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
        });
    </script>

</head>
<body>
<!--公共提示框-->
<!-- 
	<div class="ggts"></div> -->
<div id="ggts2"></div>



<!-- t有值代表是查看 -->
<input type="hidden" id="backnotice" value="${msg}">
<input type="hidden" id="backnoticebzf" value="${buttonType}">
<!-- <input type="hidden" id="t" value="<s:property value="t"/>"> -->
<input type="hidden" id="t" value="${t}"/>
<script type="text/javascript">

    $(window).load(function () {

        var typekjcxbt = $("#type").val();
        if(typekjcxbt=='kjcxbt'){var typeleibie = 2;}else{typeleibie = 1;}
        var backnotice = $("#backnotice").val();
        var backnoticebzf = $("#backnoticebzf").val();
        if (backnotice == 'success') {
            if(backnoticebzf=='1'){
	            ggts2("数据保存成功！");
	            setTimeout(function(){
	    			window.location="/declare_btz/selectAllList.html?leibie="+typeleibie+"&type="+typekjcxbt+"&init=y";
	   			},1500);
		    }
		    if(backnoticebzf=='2'){
		    	ggts2("数据提交成功！");
		    	setTimeout(function(){
	    			window.location="/declare_btz/selectAllList.html?leibie="+typeleibie+"&type="+typekjcxbt+"&init=y";
	   			},1500);
		    }
	    }
	    if (backnotice == 'erro') {
	    	if(backnoticebzf=='1'){
	            ggts2("数据保存失败！");
		    }
		    if(backnoticebzf=='2'){
		    	ggts2("数据提交失败！");
		    }
	    
	    }

        var t = $("#t").val();//v 查看   u 修改  a 新增
        //alert(t);
        if (t == 'v') {
            //表示查询
            $("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
            $(".baocun").hide();
        }
        else if (t == 'a') {
            //表示新增（在返回没有数据的情况可以新增）

            //qiyeappinfo();//调用验证
        } else if (t == 'u') {
            //表示修改
            //$("#qiyeappinfo").attr("action","/usercenter/updateQiyeinfo.html");

            //qiyeappinfo();//调用验证
        }

        //点击保存,不验证isNotNull
        $('.baocun').click(function(){
            $('#buttonType').val('1');
        
            if(DataCheck.isLength()){

                if(DataCheck.isInt()){

                    if(DataCheck.isFint()){

                        if( DataCheck.isZint()){

                            if(DataCheck.isZuzhi()){

                                if(DataCheck.isPhone()){

                                    if(DataCheck.isEmail()){

                                        if(DataCheck.idCard()){
                                            //alert("可以保存!");
                                            //判断上传文件
                                            //alert(checkfilehidden(true))
                                            //return;
                                            buttonDefaultValue = $(this).val();
                                                countDown(this,5);
                                                nativeNum("isBankZint");//还原为数字
											$("#form1").submit();//改变链接并提交
                                        }else{
                                            alert("不可以保存!");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });
        



 		//点击提交
        $('.tijiao').click(function(){
            $('#buttonType').val('2');

            if(DataCheck.isNotNull()){

                if(DataCheck.isLength()){

                    if(DataCheck.isInt()){

                        if(DataCheck.isFint()){

                            if( DataCheck.isZint()){

                                if(DataCheck.isZuzhi()){

                                    if(DataCheck.isPhone()){

                                        if(DataCheck.isEmail()){
                                        
                                        if(DataCheck.isBankZint()){

                                            if(DataCheck.idCard()){
                                                //alert("可以提交!");
                                                if(!checkEachNeedDate("form1")){return;}                                                
	                                            //判断上传文件
	                                            if(checkfilehidden(true)){
	                                            buttonDefaultValue = $(this).val();
                                                countDown(this,5);
                                                nativeNum("isBankZint");//还原为数字
	                                            	$("#form1").submit();//改变链接并提交
	                                            }else{
	                                            	//alert("提交失败!");
	                                             	return;
	                                            }
	                                           
												
	                                        }else{
	                                            alert("不可以提交!");
	                                        }
	                                        
	                                        }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });




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

            <!-- 债权信息修改    用户为企业时显示    -->
            <div id="zaiquanxinxi-update" class="vipinfo">

                <form id="form1" action="/declare_btz/saveBTZ.html" method="post">

                    <div class="title">
                        <li><span class="t">${policy_name }</span></li>
                    </div>
                    <input type="hidden" name="buttonType" id="buttonType">
                    <input type="hidden" name="id" id="id" value="<s:property value="e.id"/> ">
                    <input type="hidden" value="<s:property value='e.leibie'/>" name="leibie">
                    <input type="hidden" value="${type}" name="type" id="type">
                    <input type="hidden" lang="企业基本情况表的id" name="rele_id" value="<s:property value='e.rele_id'/>"/>
                    <input type="hidden" lang="用户号" name="userid" value="<s:property value='e.userid'/>"/>
                    <input type="hidden" lang="删除图片时ajax提交的地址" id="url" value="/interestapp/deletepic.html"/>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">企业名称：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="企业名称" isLength="[0,64]"  class="input" id="qiyemingcheng" name="qiyemingcheng" type="text"
                                                       value="<s:property value='e.qiyemingcheng'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">成立日期：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input class="input stext laydate-icon needDate" readonly="readonly" id="clri"
                                                       name="clri" type="text"
                                                       value="<s:property value='e.clri.substring(0,10)'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl" style="width:100%;">
                        <span class="leftname leftnamel">主营业务：<span style="color:red">*</span></span>
                        <span class="rightinfo" style="width:619px;" ><textarea style="width:596px;" isNotNull="主营业务" isLength="[0,1024]"  type="textarea" class="input" name="zyyw"
                                                       value=""><s:property value='e.zyyw'/></textarea></span>
                    </div>
              

                    <%--<div class="inputtest inputtestl inputtestlrow">--%>
                    <%--<span class="leftname leftnamel" style="width: 240px;">三证合一代码：<span--%>
                    <%--style="color:red">*</span></span>--%>
                    <%--<span class="rightinfo" style="width: 400px;"><input style="width: 492px;"--%>
                    <%--class="input inputrow" name="zzjgdm"--%>
                    <%--type="text"--%>
                    <%--value="<s:property value='zzjgdm'/>"/></span>--%>
                    <%--</div>--%>
                    <div class="inputtest inputtestl inputtestlrow ">
                        <span class="leftname leftnamel" style="width:139px;">注册地址：<span style="color:red">*</span></span>
                        <span class="rightinfo" style="width:618px;"><input style="width:374px;" isNotNull="注册地址" isLength="[0,64]" class="input" id="dizhi" name="dizhi" type="text"
                                                       value="<s:property value='e.dizhi'/>"/>&nbsp;&nbsp;(与营业执照上的注册地址相同)</span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">国地税缴纳机关：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="国地税缴纳机关" isLength="[0,64]" class="input" name="gdsjnjg" type="text"
                                                       value="<s:property value='e.gdsjnjg'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">统计关系所在地：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="统计关系所在地" isLength="[0,64]"  class="input" name="tjgxszd" type="text"
                                                       value="<s:property value='e.tjgxszd'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">所属产业：<span style="color:red">*</span></span>
					<span class="rightinfo">
                        <select isNotNull="所属产业" readonly="readonly"  name="e.sscy" class="select">
                            <option></option>
                            <%-- <c:if test="${e.leibie == 1}">
                                <c:forEach items="${applicationScope.dic.sscy1.childs}" var="datas">
                                    <option value="${datas.id}"
                                            <c:if test="${e.sscy == datas.id}">selected</c:if>>${datas.name}</option>
                                </c:forEach>
                            </c:if>
                            <c:if test="${e.leibie == 2}">
                                <c:forEach items="${applicationScope.dic.sscy.childs}" var="datas">
                                    <option value="${datas.id}"
                                            <c:if test="${e.sscy == datas.id}">selected</c:if>>${datas.name}</option>
                                </c:forEach>
                            </c:if> --%>
                             <c:forEach items="${applicationScope.dic.sscynew.childs}" var="datas">
                             <option value="${datas.id}"
                                      <c:if test="${e.sscy == datas.id}">selected</c:if>>${datas.name}</option>
                             </c:forEach>
                        </select>
					</span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">负责人：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="负责人" isLength="[0,16]" class="input" name="fzr" type="text"
                                                       value="<s:property value='e.fzr'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">负责人职务：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="负责人职务" isLength="[0,8]" class="input" name="fzrzw" type="text"
                                                       value="<s:property value='e.fzrzw'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">法定代表人手机：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="法定代表人手机" isPhone="法定代表人手机" isLength="[0,11]"  class="input" id="fzrsj" name="fzrsj" type="text"
                                                       value="<s:property value='e.fzrsj'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">联系人：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="联系人" isLength="[0,16]" class="input" name="lxr" type="text"
                                                       value="<s:property value='e.lxr'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">联系人职务：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="联系人职务" isLength="[0,8]" class="input" name="lxrzw" type="text"
                                                       value="<s:property value='e.lxrzw'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">联系人手机：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="联系人手机" isPhone="联系人手机" isLength="[0,11]"  class="input" name="lxrsj" type="text"
                                                       value="<s:property value='e.lxrsj'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">申请金额：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="企业申请金额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]" class="input ibg" name="qysqje" type="text"
                                                       value="<s:property value='e.qysqje'/>"/></span>
                    </div>

                    <%--<input type="hidden" lang="系统计算金额/建议支持金额" name="xtjsje" value="<s:property value='xtjsje '/>"/>--%>
                    <%--<div class="inputtest inputtestl">--%>
                    <%--<span class="leftname leftnamel">审核状态：<span style="color:red">*</span></span>--%>
                    <%--<span class="rightinfo">--%>
                    <%--<select class="select" readonly="readonly" name="status" id="status">--%>
                    <%--<option value=""></option>--%>
                    <%--<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120" <%--%>
                    <%--if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120").equals(request.getAttribute("qylx"))) {--%>
                    <%--out.print("selected=selected");--%>
                    <%--}--%>
                    <%--%>>审批中</option>--%>
                    <%--<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121" <%--%>
                    <%--if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121").equals(request.getAttribute("qylx"))) {--%>
                    <%--out.print("selected=selected");--%>
                    <%--}--%>
                    <%--%>>审批通过</option>--%>
                    <%--<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122" <%--%>
                    <%--if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122").equals(request.getAttribute("qylx"))) {--%>
                    <%--out.print("selected=selected");--%>
                    <%--}--%>
                    <%--%>>驳回</option>--%>
                    <%--</select>--%>
                    <%--</span>--%>
                    <%--</div>--%>
                    <p class="jiange">投资机构明细（<span style="font-weight:bold;">需上传投资机构营业执照</span>）</p>
                    <div id="dkk">
                        <c:if test="${fn:length(e.declareBTZCoreList) > 0}">
                            <c:forEach items="${e.declareBTZCoreList}" var="datas" varStatus="status">
                                <input type="hidden" name="declareBTZCoreList[${status.index}].id" value="${datas.id}">
                                <div class="xkk" lang="firsttr">
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">机构名称：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="机构名称" isLength="[0,64]" class="input iname"
                                                               id="declareBTZCoreList[${status.index}].jgmc"
                                                               name="declareBTZCoreList[${status.index}].jgmc"
                                                               type="text"
                                                               value="${datas.jgmc}"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">机构三证合一代码：<span
                                                style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="机构名称" isLength="[0,32]" isZuzhi="机构三证合一代码" class="input iname"
                                                               id="declareBTZCoreList[${status.index}].jgzzjgdm"
                                                               name="declareBTZCoreList[${status.index}].jgzzjgdm"
                                                               type="text"
                                                               value="${datas.jgzzjgdm}"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">机构主营业务：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="机构主营业务" isLength="[0,256]"  class="input iname"
                                                               id="declareBTZCoreList[${status.index}].jgzyyw"
                                                               name="declareBTZCoreList[${status.index}].jgzyyw"
                                                               type="text"
                                                               value="${datas.jgzyyw}"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">投资金额：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="机构投资金额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"  class="input inumber ibg"
                                                               id="declareBTZCoreList[${status.index}].jgtzje"
                                                               name="declareBTZCoreList[${status.index}].jgtzje"
                                                               type="text" value="${datas.jgtzje}"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">机构所占股份(%)：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="机构所占股份" isZint="机构所占股份" isLength="[0,18]" class="input inumber"
                                                               id="declareBTZCoreList[${status.index}].jgszgf"
                                                               name="declareBTZCoreList[${status.index}].jgszgf"
                                                               type="text" value="${datas.jgszgf}"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">投资是否到账：<span style="color:red">*</span></span>
                                <span class="rightinfo"><select isNotNull="投资是否到账" class="select" id="declareBTZCoreList[${status.index}].tzsfdz"
                                                                name="declareBTZCoreList[${status.index}].tzsfdz" type="text"
                                                                value="<s:property value='tzsfdz'/>">
                                                               <option value=""></option>
                                                               <option value="是" <c:if test="${datas.tzsfdz == '是'}">selected</c:if> >是</option>
                                                               <option value="否" <c:if test="${datas.tzsfdz == '否'}">selected</c:if>>否</option>
                                                        </select></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">到账时间：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input class="input laydate-icon needDate"
                                                               id="declareBTZCoreList[${status.index}].dzsj"
                                                               readonly="readonly"
                                                               name="declareBTZCoreList[${status.index}].dzsj"
                                                               type="text"
                                                               value="<fmt:parseDate value="${datas.dzsj}" var="date1" pattern="yyyy-MM-dd"/><fmt:formatDate value="${date1}" pattern="yyyy-MM-dd"/>"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">工商变更时间：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input class="input laydate-icon needDate" readonly="readonly"
                                                               id="declareBTZCoreList[${status.index}].gsbgsj"
                                                               name="declareBTZCoreList[${status.index}].gsbgsj"
                                                               type="text"
                                                               value="<fmt:parseDate value="${datas.gsbgsj}" var="date2" pattern="yyyy-MM-dd"/><fmt:formatDate value="${date2}" pattern="yyyy-MM-dd"/>"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">机构是否备案：<span style="color:red">*</span></span>
							<span class="rightinfo ifbeian">
                                <select isNotNull="机构是否备案" id="declareBTZCoreList[${status.index}].jgsfba" name="declareBTZCoreList[${status.index}].jgsfba" readonly="readonly"  class="select iselect">
                                    <option></option>
                                    <c:forEach items="${applicationScope.dic.sf.childs}" var="sfs">
                                        <option value="${sfs.id}"
                                                <c:if test="${datas.jgsfba == sfs.id}">selected</c:if>>${sfs.name}</option>
                                    </c:forEach>
                                </select>
							</span>
                                    </div>
                                    <div class="inputtest inputtestl beianshijian">
                                        <span class="leftname leftnamel">机构备案时间：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input class="input laydate-icon" readonly="readonly"
                                                               id="declareBTZCoreList[${status.index}].jgbasj"
                                                               name="declareBTZCoreList[${status.index}].jgbasj"
                                                               type="text"
                                                               value="<fmt:parseDate value="${datas.jgbasj}" var="date3" pattern="yyyy-MM-dd"/><fmt:formatDate value="${date3}" pattern="yyyy-MM-dd"/>"/></span>
                                    </div>

                                    <div style="text-align:right;overflow: hidden;margin-bottom: 10px;clear: both;">
                                        <input
                                                class="adddel" type="button" name="adddel" value="增加">&nbsp;<input name="addde2"  class="addde2"
                                                                                                     type="button"
                                                                                                     value="删除" onclick="deleteCore(this, ${datas.id})"></div>
                                </div>

                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(e.declareBTZCoreList) <= 0}">
                            <div class="xkk" lang="firsttr">
                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">机构名称：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="企业名称" isLength="[0,64]" class="input iname" id="jgmc"
                                                               name="declareBTZCoreList[0].jgmc" type="text"
                                                               value="<s:property value='jgmc'/>"/></span>
                                </div>
                                <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">机构三证合一代码：<span
                                                style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="机构三证合一代码" isLength="[0,32]" isZuzhi="机构三证合一代码" class="input iname" id="jgzzjgdm"
                                                               name="declareBTZCoreList[0].jgzzjgdm"
                                                               type="text"
                                                               value="<s:property value='jgzzjgdm'/>"/></span>
                                </div>
                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">机构主营业务：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="机构主营业务" isLength="[0,256]" class="input iname" id="jgzyyw"
                                                               name="declareBTZCoreList[0].jgzyyw" type="text"
                                                               value="<s:property value='jgzyyw'/>"/></span>
                                </div>
                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">投资金额：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="机构投资金额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]" class="input inumber ibg" id="jgtzje"
                                                               name="declareBTZCoreList[0].jgtzje"
                                                               type="text" value="<s:property value='jgtzje'/>"/></span>
                                </div>
                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">机构所占股份(%)：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="机构所占股份" isZint="机构所占股份" isLength="[0,18]" class="input inumber" id="jgszgf"
                                                               name="declareBTZCoreList[0].jgszgf"
                                                               type="text" value="<s:property value='jgszgf'/>"/></span>
                                </div>
                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">投资是否到账：<span style="color:red">*</span></span>
                                <span class="rightinfo"><select isNotNull="投资是否到账" class="select" id="tzsfdz"
                                                               name="declareBTZCoreList[0].tzsfdz" type="text"
                                                               value="<s:property value='tzsfdz'/>">
                                                               <option value=""></option>
                                                               <option value="是">是</option>
                                                               <option value="否">否</option>
                                                        </select></span>
                                </div>
                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">到账时间：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input class="input laydate-icon needDate" id="dzsj" readonly="readonly"
                                                               name="declareBTZCoreList[0].dzsj" type="text"
                                                               value="<s:property value='dzsj'/>"/></span>
                                </div>
                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">工商变更时间：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input class="input laydate-icon needDate" readonly="readonly"
                                                               id="gsbgsj" name="declareBTZCoreList[0].gsbgsj"
                                                               type="text"
                                                               value="<s:property value='gsbgsj'/>"/></span>
                                </div>
                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">机构是否备案：<span style="color:red">*</span></span>
							<span class="rightinfo ifbeian">
                                <s:select isNotNull="机构是否备案"  list="%{#application.dic.sf.childs}" listKey="id"
                                          listValue="name" name="declareBTZCoreList[0].jgsfba"
                                          headerKey="" headerValue="" cssClass="select iselect"/>
							</span>
                                </div>
                                <div class="inputtest inputtestl beianshijian">
                                    <span class="leftname leftnamel">机构备案时间：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input class="input laydate-icon" readonly="readonly"
                                                               id="jgbasj" name="declareBTZCoreList[0].jgbasj"
                                                               type="text"
                                                               value="<s:property value='jgbasj'/>"/></span>
                                </div>
                                
                                
                                <div class="inputtest inputtestl" style="width:100%;margin-left:10px;">
                               		<span style="color:red;font-weight:bold;font-size: 15px;">如您不知您的机构是否备案，可前往<a href="http://gs.amac.org.cn/amac-infodisc/res/pof/fund/index.html" target="_blank" style="color:blue;">【中国证券投资基金业协会】</a>查询。</span>
                                </div>

                                <div style="text-align:right;overflow: hidden;margin-bottom: 10px;clear: both;">
                                    <input
                                            class="adddel" type="button" name="adddel"  id="copy" value="增加">&nbsp;<input
                                        class="addde2"
                                        name="addde2"
                                        type="button"
                                        id="gbdel"
                                        value="删除" onclick="deleteCore(this, 0)"></div>

                            </div>
                        </c:if>
                    </div>
                    <!--
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" id="jgzyyw" name="jgzyyw" type="text"  value="<s:property value='jgzyyw'/>" /></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" id="jgzyyw" name="jgzyyw" type="text"  value="<s:property value='jgzyyw'/>" /></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" id="jgzyyw" name="jgzyyw" type="text"  value="<s:property value='jgzyyw'/>" /></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">审计报告扫描件（需全省排名前50或者全国排名前100的会计师事务所出具）：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" id="jgzyyw" name="jgzyyw" type="text"  value="<s:property value='jgzyyw'/>" /></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" id="jgzyyw" name="jgzyyw" type="text"  value="<s:property value='jgzyyw'/>" /></span>
				</div>
				 -->

                    <p class="jiange">上传文件清单</p>

                    <div class="baobiao">
                     <div class="box-img">
                        <s:iterator value="#request.li" status="index" var="material">
                         	<div class="upwk">
			                    <div class="ck-img upspan" lang="picnum${index.index + 1}"  id="upspan${index.index + 1}" 
			                    	accesskey="${material.key }" index="${index.index + 1}">
			                    	<div class="nrk">
			                    	<span class="n nums${index.index + 1}">0</span>
			                    	<div id="picnum${index.index + 1}" class="picimg upspan${index.index + 1}">
			               		        <s:iterator value="#request.list" var="files">
			                				<s:if test="leixing==#material.key">
				                				 <div class="div"><div class="img"><img accesskey="${files.picurl }" lang="${files.id }" src="/image/pdf.jpg"></div></div>
			                			 	</s:if>	
			                			</s:iterator>
			                        </div>
			                        <span class="delimg">编辑</span>
			                        </div>
			                        <div class="t">${material.value }</div>
			                    </div>
			                    
			                     <!-- 如果是贷款贴息则输出利息清单的下载地址 -->
			                    <s:if test="'aaaaaaaaaaaaaaaaaaaaaaaaatplx406'==#material.key">
			                     <div class="s s2"><a  href="/files/toList.html" target="_blank">模板下载</a></div>
                			 	</s:if>	
                			 	
                			 	 <!-- 如果是申请报告 -->
			                    <s:if test="'aaaaaaaaaaaaaaaaaaaaaaaaatplx202'==#material.key">
			                     <div class="s s2"><a  href="/files/toList.html" target="_blank">模板下载</a></div>
                			 	</s:if>	
                			 	
                			 	<!-- 如果是中小微企业证明 
                                <s:if test="'aaaaaaaaaaaaaaaaaaaaaaaaatplx410'==#material.key">
                                 <div class="s s2"><a  href="/files/toList.html" target="_blank">模板下载</a></div>
                                </s:if> -->
                                
                                <!-- 如果是中小微企业证明 -->
                                <s:if test="'aaaaaaaaaaaaaaaaaaaaaaaaatplx410'==#material.key">
                                 <div class="s s2">
                                  <%
                                        if (SystemManager.YANGBEN.get("aaaaaaaaaaaaaaaaaaaaaaaaatplx410") != null) {
                                            out.print("<a href=\"");
                                            out.print(SystemManager.YANGBEN.get("aaaaaaaaaaaaaaaaaaaaaaaaatplx410"));
                                            out.print("\" target=\"_blank\">查看样本</a>");
                                        } else {
                                            out.print("<a target=\"_blank\">暂无样本</a>");
                                        }
                                    %>
                                 </div>
                                </s:if> 
			                </div>
	                    </s:iterator>
                     </div>
                 </div>

                    <div class="revise" id="zqxxxgbtn">
                        <input class="shenqingdkt baocun" lang="<s:property value='rele_id'/>" type="button"
                               value="保存"/>&nbsp;&nbsp;
                        <input class="shenqingdkt tijiao" type="button" value="提交"/>
                    </div>

                </form>
            </div>

        </div>

    </div>

</div>

<script type="text/javascript" src="../plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="../plupload/Public/js/sucaihuo.js"></script>
<script type="text/javascript">

//加载页面时有值就显示，
	//全部根据触发条件 是否备案条件来写逻辑
	//网页加载完时，如果”是否备案“的值为是，则让它后面一个元素显示，且给后面这个元素的子元素input框加上一个“isNotNull"属性,加上时间判断class类 needDate
	//如果为否，则不做任何处理
	
	var ifbeian = $(".ifbeian select");
    var beianshijian = $(".beianshijian .rightinfo input");
    
    //”是否备案“change事件如果值为是，则让它后面一个元素显示，且给后面这个元素的子元素input框加上一个“isNotNull"属性,加上时间判断class类 needDate
    //如果为否，则让它后面一个元素隐藏，赋值为空，且给后面这个元素的子元素input框取消一个“isNotNull"属性，取消时间判断class类 needDate
    
    //1.change事件
    ifbeian.each(function(){
    	$(this).change(function(){
			//alert($(this).val());
			var beianshijian =  $(this).parent().parent().next();
    		if($(this).val()=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa004'){
	    		beianshijian.show();
	    		beianshijian.children().find("input").addClass("needDate");
	    	}else{
	    		beianshijian.hide();
	    		beianshijian.children().find("input").removeClass("needDate").val("");
	    	}
	    });
    	
    });
    
    //2.网页加载完
    $(function(){
    	//alert(33);
    	ifbeian.each(function(){
    		
    		var beianshijian =  $(this).parent().parent().next();
	    	if($(this).val()=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa004'){
	    		beianshijian.show();
	    		beianshijian.children().find("input").addClass("needDate");
	    	}else{
	    		beianshijian.hide();
	    		beianshijian.children().find("input").removeClass("needDate").val("");
	    	}
    	
    	});
    });
    
    


    var t = $("#t").val();
    if (t != 'v') {
 	$(".upspan").each(function(){
 	var index = $(this).attr('index'); 
 	$(this).find(".nums" + index).html($(this).find(".img").size());
	var path = "/goodaaa.action?uptarget=" + $(this).attr('id') + "&leixing=" + $(this).attr('accesskey')
			 + "&id=${e.id}" + "&table=${table_name}";
    var uploaderupspan = new plupload.Uploader({//创建实例的构造方法
        runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
        browse_button: 'upspan' + index, // 上传按钮
        multi_selection: true,
        url: path, //远程上传地址
        flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
        silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
        filters: {
            max_file_size: '100mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
            mime_types: [//允许文件上传类型
                {title: "files", extensions: "pdf"}
            ]
        },
        multi_selection: true, //true:ctrl多文件上传, false 单文件上传
        init: {
            FilesAdded: function(up, files) { //文件上传前
                if ($("#picnum" + index).children(".div").length > 10) {
                    alert("您上传的文件太多了！");
                    uploaderupspan.destroy();
                } else {
                    var li = '';
                    plupload.each(files, function(file) { //遍历文件
                        li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                    });
                    $("#picnum" + index).append(li);
                    eachimg("picnum" + index);
                    uploaderupspan.start();
                }
            },
            UploadProgress: function(up, file) { //上传中，显示进度条
         		var percent = file.percent;
                $("#" + file.id).find('.bar').css({"width": percent + "%"});
                $("#" + file.id).find(".percent").text(percent + "%");
            },
            FileUploaded: function(up, file, info) { //文件上传成功的时候触发
               var data = eval("(" + info.response + ")");
                var percent = file.percent;

                if (data.error != '0') {
                    alert(data.error);
                    $("#" + file.id + "").remove();
                } else {
                    if (data.type == 1) {
                        $("#" + file.id).html("<div class='img'><img accesskey='" + data.reducepath + "' lang='" + data.id + "' src='" + data.pic + "'/></div>");
                        $("#" + file.id).append("<input type='hidden' value='" + data.id + "' name='fileIds'>");
                    } else {
                        $("#" + file.id).html("<div class='img'><img accesskey='" + data.pic + "' lang='" + data.id + "' src='" + data.reducepath + "'/></div>");
                        $("#" + file.id).append("<input type='hidden' value='" + data.id + "' name='fileIds'>");
                    }
                    eachimg("picnum2");
                }
            },
            Error: function(up, err) { //上传出错的时候触发
                alert(err.message);
            }
        }
    });
    uploaderupspan.init();
 });

    }
    //每次上传完时调取这个排列图片的left的函数
    function eachimg(target) {
        var target = "#" + target;
        var left = 0;
        var picimgs = $(target + " .div");
        //去除先提交情况下的提示框
        var qsc = $(target).parent().parent().children('.qsc');
        if (qsc) {
            qsc.remove()
        }

        picimgs.each(function (i, v) {
            left = i * 8;
            picimgs.eq(i).attr("style", "left:" + left + "px");
            $(this).parent().prev("span").html(i + 1);
        });

    }

    //点击保存按钮时检查每个文件框是否都已经传值
    function checkfilehidden() {
        var picimgupspan = $(".upspan");
        var ifreturn = 0;
        var tolength = picimgupspan.length;
        picimgupspan.each(function (i, v) {
            var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
            var ifqsc = $(this).children(".qsc").attr("class");//提示未上传的情况再提交不能再加提示了
            var picval = picimgss.attr("class");

            //if((i+1)<tolength && (i+1) != 2 && (i+1) != 3 && (i+1) != 4){
            if ((i + 1) <= tolength) {
                if (!picval) {
                    if (!ifqsc) {
                        $(this).append("<div class='qsc'>请上传文件！</div>");
                    }
                    ifreturn = 1;
                }
            }

        });
        if (ifreturn) {
            return false;
        }else{
        	return true;
        }
    }


    //刷新时，如果有图片还是要把left位置从新固定一下
    $(document).ready(function () {

        var lefts = 0;
        var picimgupspan = $(".upspan");


        picimgupspan.each(function () {
            var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
            picimgss.each(function (i, v) {
                lefts = i * 8;
                picimgss.eq(i).attr("style", "left:" + lefts + "px");
                $(this).parent().prev("span").html(i + 1);
            });

        })

    })
</script>


<%@ include file="../footer.jsp" %>
<script type="text/javascript">
//    var type = $('#type').val();
//    leftnav_init(type);
    leftnav_init("allbt");
</script>

<%@ include file="tanchudel.jsp" %>

<script type="text/javascript">

    $(window).load(function () {

//贷款银行到到期日期的8个元素的增加和删除
        $(".adddel").click(function () {
            var xkks = $("#dkk").children(".xkk");
            var nownum = xkks.length;//现在要添加的元素名称的序号

            var newElement = xkks.eq(0).clone(true).appendTo($("#dkk")).attr("lang", "");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
//		xkks.eq(0).clone(true).insertAfter($(this).parent().parent()).attr("lang","");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
            newElement.find('input[type=text]').each(function() {
                $(this).val('');
            })
            var lastxkk_inputs = $("#dkk").children(".xkk:last").children().find("input[type=text]");//找到大框框下的最后一个元素里面的所有input
//		var lastxkk_inputs = $(this).parent().parent().next().children().find("input");//找到大框框下的最后一个元素里面的所有input

		var lastxkk_inputs_buttons = $("#dkk").children(".xkk:last").children().find("input[type=button]");
		lastxkk_inputs_buttons.eq(1).attr('onclick',"deleteCore(this, 0)");

            lastxkk_inputs.each(function () {
                //var reg=/^[^a-zA-Z0-9]$/g;//匹配字符串中的非字母【即中文和数字】
                //var thisnewstr=$(this).attr("name").replace(reg,"");//把匹配到的中文和数字替换为空
                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if(nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }
                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
                if ($(this).attr("value") == "增加" || $(this).attr("value") == "删除") {

                } else {
                    $(this).attr("value", "");
                }
            });

            var lastxkk_selects = $("#dkk").children(".xkk:last").children().find("select");

            lastxkk_selects.each(function () {
                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if(nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }

                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
            });



            //alert(xkks.length);
        });


        //给大框框下所有的日期input框动态添加日期事件
        var dkk_inamex = $("#dkk input[class='input laydate-icon needDate']");
        dkk_inamex.live('click', function () {
            var naowdate = $(this).attr("id");
            laydate({elem: '#' + naowdate});//绑定元素
        });

        //由于有validate验证，如何事先填写错误，就会加error样式，所以此时还需要动态调用一下date控件
        var dkk_inamex2 = $("#dkk input[class='input laydate-icon needDate error']");
        dkk_inamex2.live('click', function () {
            var naowdate2 = $(this).attr("id");
            laydate({elem: '#' + naowdate2});//绑定元素
        });

        //删除当前这个小框
        /*$(".addde2").click(function () {
            var parent = $(this).parent().parent();
            var parent_lang = parent.attr("lang");
            if (parent_lang != "firsttr") {
                parent.remove();
            }

            $("#dkk").children(".xkk").each(function (nownum) {
                var lastxkk_inputs = $(this).children().find("input");//找到大框框下的最后一个元素里面的所有input

                lastxkk_inputs.each(function () {
                    var nameParentStrs = $(this).attr("name").split('.')[0];
                    var nameStrs = $(this).attr("name").split('.')[1];
                    var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);
                    $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                });

                var lastxkk_selects = $(this).children().find("select");

                lastxkk_selects.each(function () {
                    var nameParentStrs = $(this).attr("name").split('.')[0];
                    var nameStrs = $(this).attr("name").split('.')[1];

                    var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                    $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                    $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
                });
            })

            var lastxkk_laydates = $("#dkk").children(".xkk:last").children().find("input[class='input laydate-icon needDate']");
            lastxkk_laydates.each(function () {
                $(this).rules("add", {
                    required: true,
                    isDate: true,
                    messages: {required: "请输入", isDate: "日期格式如：2016-08-12"}
                })
            });
        });*/

        //删除最后一个小框
        /*$("#gbdel").click(function(){
         var prev = $("#dkk").children(".xkk:last");
         var firsttr = prev.attr("lang");
         if(firsttr!="firsttr"){
         prev.remove();
         }

         });*/


    });


    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#clri'});//绑定元素
        laydate({elem: '#dzsj'});//绑定元素
        laydate({elem: '#gsbgsj'});//绑定元素
        laydate({elem: '#jgbasj'});//绑定元素
    }();

    //日期范围限制
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };

    var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas; //结束日选好后，充值开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);

    //自定义日期格式
    laydate({
        elem: '#test1',
        format: 'YYYY年MM月DD日',
        festival: true, //显示节日
        choose: function (datas) { //选择日期完毕的回调
            alert('得到：' + datas);
        }
    });

    //日期范围限定在昨天到明天
    laydate({
        elem: '#hello3',
        min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
        max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
    });
    
    
	var objbl = '';
	var objid = '';
    function deleteCore(obj, id) {
  		objbl = obj;
  		objid = id;
	   	$("#delSure").show();
		$("#delSure h4").html("确定要删除此栏申报？");//显示，停留，隐藏
		$("#delSure .delsure").html('确定');
	    $("#delSure .delcancel").html('取消');
    }
    
    
    	$("#delSure .delsure").click(function(){
	    	$("#delSure").hide();
	    	var parent = $(objbl).parent().parent();
			var xkks = $("#dkk").children(".xkk");
			    //alert(xkks.length+"**");
			if (id != 0 && xkks.length>1) {
					//alert(objid+"&&");
		            $.post('/declare_btz/deleteCore.html',{ id : objid }, function (data) {
		
		                if (data.msg == 'erro'){
		                    alert("删除失败，请稍后再尝试！");
		                } else {
		                	//alert("删除成功！");
		                    removeCore(objbl);return false;
		                }
		            }, 'json');
		    }else if(id != 0 && xkks.length==1){
		        	ggts2('至少留一栏！');return;
		        	
		    }else if(id == 0 && xkks.length>1){
		            removeCore(objbl);return false;
		            
	        }else if(id == 0 && xkks.length==1){
		            ggts2('至少留一栏！');return false;
	        }

			
		});
       $("#delSure .delcancel").click(function(){$("#delSure").hide();return false;});
    
    


    function removeCore(obj) {
    	//alert(3);
    	//2重新排序
        var parent = $(objbl).parent().parent();
        //1删除该栏
    	parent.remove();
        var xkks = $("#dkk").children(".xkk");
        $("#dkk").children(".xkk").each(function (nownum) {
            var lastxkk_inputs = $(this).children().find("input");//找到大框框下的最后一个元素里面的所有input

            lastxkk_inputs.each(function () {

                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if(nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }
                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);
                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);
            });

            var lastxkk_selects = $(this).children().find("select");

            lastxkk_selects.each(function () {
                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if(nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }
                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
            });
        })

        var lastxkk_laydates = $("#dkk").children(".xkk:last").children().find("input[class=input laydate-icon]");
        lastxkk_laydates.each(function () {
            $(this).rules("add", {
                required: true,
                isDate: true,
                messages: {required: "请输入", isDate: "日期格式如：2016-08-12"}
            })
        });
    }
</script>

</body>
</html>
 