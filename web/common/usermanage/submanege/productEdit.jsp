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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css"  type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/base.css"  type="text/css">
    <link rel="stylesheet" href="/resource/css/FZbase.css?${sysversion}">
    <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/manage2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery.blockUI.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resource/bootstrap/js/bootstrap.min.js"></script>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/themes/default/default.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/newlayer/layer.js"></script>
<style type="text/css">
	#ldksq{display: none;width: 100%;height: 100%;position: fixed;left: 0;top: 0;bottom: 0;right: 0;margin: auto;z-index: 9999 !important;background: url("../img/lobg_03.png") repeat;}
	#ldksq_c{background-color: #fff;width: 95%;min-height: 410px;/*position: absolute;top:0;left:0;right:0;bottom: 0;*/margin: auto;border-radius: 5px;behavior: url(PIE.htc);padding: 10px;}
	#ldksq_c p{text-align: center;}
	#ldksq_c .qx{background: url("../img/delete.png") no-repeat;}
	#ldksq_c form{margin: 0;padding-top: 10px;}
	#ldksq_c input.title, textarea.duanxin{width: 240px;}
	.pbczdbaseTitle{font-size: 20px;text-align: left !important;}
	.pbczdbaseTable{height: 320px;width: 100%;overflow: auto;}
	.ke-dialog-default, .ke-dialog{top: 50%;}
	#shyj{display:none;width: 100%;height: 100%;position: fixed;left: 0;top:0;bottom: 0;right: 0;margin:auto;z-index: 9999!important;background:url("../img/lobg_03.png") repeat;}
	#shyj_c{background-color: #fff;width: 520px;min-height:140px;/*position: absolute;top:0;left:0;right:0;bottom: 0;*/margin:auto;border-radius: 5px;behavior: url(PIE.htc);padding:10px;}
	#shyj_lose{background: url("../img/delete.png") no-repeat;position: absolute;right: 10px;top:10px;width: 16px;height: 16px;cursor: pointer;}
	#shyj_c p{text-align:center;}
	#shyj_c .qx{background:url("../img/delete.png") no-repeat;}
	#shyj_c form{margin:0;padding-top: 10px;}
	#shyj_c input.title,textarea.duanxin{width:240px;}
	
	 .table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
	#custTable a{color: blue;font-size: 10px;}
	.custmsg{color: red;}
	label{display: inline;}
</style>
<script type="text/javascript">
var editor2;
     KindEditor.ready(function(K) {
         editor2 = K.create('textarea[id="increcontenttext"]', {
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
     KindEditor.ready(function(K) {
    	    var editor = K.editor({
    	        allowFileManager : true
    	    });

    	    
    	K('#filemanager1').click(function() {
    	        editor.loadPlugin('image', function() {
    	            editor.plugin.imageDialog({
    	                insertfile : K('#picture').val(),
    	                clickFn : function(url, title) {
    	                    K('#picture').val(url);
    	                    editor.hideDialog();
    	                }
    	            });
    	            });
    	    });
    	    K('#filemanager2').click(function() {
    	        editor.loadPlugin('image', function() {
    	            editor.plugin.imageDialog({
    	                insertfile : K('#logo').val(),
    	                clickFn : function(url, title) {
    	                    K('#logo').val(url);
    	                    editor.hideDialog();
    	                }
    	            });
    	        });
    	    });
    	    K('#filemanager3').click(function() {
                editor.loadPlugin('image', function() {
                    editor.plugin.imageDialog({
                        insertfile : K('#logo2').val(),
                        clickFn : function(url, title) {
                            K('#logo2').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
    	    K('#filemanager4').click(function() {
                editor.loadPlugin('image', function() {
                    editor.plugin.imageDialog({
                        insertfile : K('#logo3').val(),
                        clickFn : function(url, title) {
                            K('#logo3').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
    	    
     });
</script>   
</head>

<body class="FZbPageBody">
<s:form action="/manage/appGoods!update.action" id="form" name="form" theme="simple" method="post">
    <div style="text-align: center;margin-bottom: 10px;">
	      	用户ID：<span class="badge badge-success"></span>
	       <button  class="btn btn-info" onclick="summitform();">
	           <i class="icon-ok icon-white"></i> 保存
	       </button>
    </div>

    <div id="tabs">

        <ul>
            <c:if test="${type ==3}"><li><a href="#tabs-1">债权产品</a></li></c:if>
            <c:if test="${type ==2}"><li><a href="#tabs-2">中介服务</a></li></c:if>
            <c:if test="${type ==1}"><li><a href="#tabs-3">企业发布</a></li></c:if>
            <li><a href="#tabs-4">用户信息</a></li>
        </ul>
        <c:if test="${type ==3}">
        <div id="tabs-1">
            <table class="table table-bordered">

            <tr style="display: none;">
                <th>id</th>
                <td colspan="3"><s:textfield name="product.id"
                        id="product.id" /></td>
            </tr>

            <tr style="display: none;">
                <th class="td_right">产品编号（八位数字）<i>*</i></th>
                <td style="text-align: left;"><s:textfield name="product.prodid"
                        id="prodid" readonly="false"
                        data-rule="产品编号:required;prodid;length[8~8]" /></td>
               </tr>
            <tr>
                <th class="td_right">产品名称<i>*</i></th>
                <td style="text-align: left;" colspan="3"><s:textfield name="product.prodname"
                        id="prodname" readonly="false"
                        data-rule="产品名称:required;prodname;length[2~32]" /></td>
            </tr>
            <tr>
                        <th class="td_right">优先级 (整数，数字越大优先级越高)<i>*</i></th>
                        <td style="text-align: left;" colspan="3"><s:textfield name="product.sort"
                                id="sort" readonly="false"
                                data-rule="优先级:required;sort;Integer" /></td>
                    </tr>
            <tr>
                <th class="td_right">担保方式</th>
                <td style="text-align: left;" colspan="3" class="labelType2">
                    <s:checkboxlist
                        name="product.loangur" id="loangur" list="%{#application.dic.dkdbfs.childs}"
                        listKey="id" listValue="name"  
                        value="#request.product.loangur.split(',')" />
                </td>
            </tr>




            <tr>
                <th class="td_right">贷款期限（月）<i>*</i></th>
                <td style="text-align: left;"><s:textfield name="product.loanterm"
                        id="loanterm" readonly="false" 
                        data-rule="贷款期限:required;loanterm;integer" /></td>

                <th class="td_right">最大贷款期限（月）<i>*</i></th>
                <td style="text-align: left;"><s:textfield name="product.loantermmax"
                        id="loantermmax" readonly="false" 
                        data-rule="最大贷款期限:required;integer;length[1~9]" /></td>

            </tr>

            <tr>
                <th class="td_right">贷款金额（万元）（最多保留1位小数）</th>
                <td style="text-align: left;">
                <s:textfield name="product.loanamt" value="%{product.loanamt}"
                        id="loanamt" readonly="false" 
                        onblur="checkNumber2(this);" />
                        </td>
                        
                <th class="td_right">最大贷款金额（万元）（整数）<i>*</i></th>
                <td style="text-align: left;"><s:textfield name="product.loanamtmax"
                        id="loanamtmax" readonly="false" 
                        data-rule="最大贷款金额:required;integer;length[1~9]" /></td>

            </tr>

            <tr  style="display:none">
                <th class="td_right">是否贴息</th>
                <td style="text-align: left;"><s:select
                        list="%{#application.dic.whether.childs}" listKey="id" listValue="name"
                        name="product.loanbonus" id="loanbonus" value="#request.product.loanbonus" />
                </td>

                <th class="td_right">贴息比例（%）<i>*</i></th>
                <td style="text-align: left;"><s:textfield name="product.bonusper"
                        id="bonusper" readonly="false"
                        data-rule="贴息比例:required;int;length[1~32]" /> %</td>

            </tr>

            <tr>
                <th class="td_right">还款方式<i>*</i></th>
                <td style="text-align: left;"><s:textfield
                        name="product.retutype" id="retutype" readonly="false"
                        data-rule="还款方式:required;retutype;length[2~32]" /></td>
                        
                        
                <th class="td_right">适用地区
                    <br>
                    <span>*如果是只能是本区的企业申请则不填，如果是全市的企业都能申请则选择全市，其他选择全省</span>
                </th>
                <td style="text-align: left;" colspan="3">
                	<s:select list="%{#application.dic.usedistrict.childs}" listKey="id" headerKey="" headerValue="" 
           		listValue="name" name="product.usedistrict" id="usedistrict"/>
           		</td>    
            </tr>
            <tr>
                <th class="td_right">贷款利率（年）</th>
                <td style="text-align: left;"><s:textfield name="product.loanrate"
                        id="loanrate" readonly="false" onblur="checkNumber(this);"
                         /> %</td>



                <th class="td_right">适用地区（用空格分隔）<i>*</i></th>
                <td style="text-align: left;"><s:textfield name="product.loanarea"
                        id="loanarea" readonly="false"
                        data-rule="适用地区:required;loanarea;length[2~16]" /></td>
            </tr>

            <tr>
                <th class="td_right">担保费</th>
                <td style="text-align: left;"><s:textfield
                        name="product.guaranteefee" id="guaranteefee" readonly="false"
                         onblur="checkNumber(this);"/> %</td>
                <th class="td_right">平台服务费</th>
                <td style="text-align: left;"><s:textfield
                        name="product.servicecharge" id="servicecharge" readonly="false"
                       onblur="checkNumber(this);"/> %</td>
            </tr>
            <tr hidden="true">
                <th class="td_right">总成本</th>
                <td style="text-align: left;" colspan="3"><s:textfield name="product.totalcost"
                        id="totalcost" readonly="true"
                        /> %</td>
            </tr>

            <tr>
                <th class="td_right">合作银行</th>
                <td style="text-align: left;"><s:select 
                        name="product.banks" id="banks" list="%{#request.bankMap}" headerKey="" headerValue="-请选择-"
                        value="#request.product.banks" /></td>
                <th class="td_right">申请次数赋值<i>*</i>
                    <br>
                    <span>*产品申请次数为输入数值与该平台申请次数总和</span>
                      <br>
                    <span>*通常填写0</span>
                </th>
                <td style="text-align: left;">
                	<s:textfield name="product.applytimes" id="applytimes" readonly="false"
                                data-rule="申请次数赋值:required;applytimes;Integer"/>
                </td>
            </tr>
            
            <tr>
                <th class="td_right">是否推荐（PC）</th>
                <td style="text-align: left;"><s:select
                        list="%{#application.dic.whether.childs}" listKey="id" listValue="name"
                        name="product.shifoutuijian" id="shifoutuijian"
                        value="#request.product.shifoutuijian" /></td>
                <th class="td_right">是否发布（APP）</th>
                <td style="text-align: left;"><s:select
                        list="%{#application.dic.whether.childs}" listKey="id" listValue="name"
                        name="product.openstat" id="openstat" value="#request.product.openstat" />
                </td>
            </tr>

            <tr hidden="true">
                    <td class="td_right"><span class="leftname leftnamel"><input
                            type="button" name="filemanager1" id="filemanager1" value="推荐图片（300*300）"
                            class="btn btn-info" /></span></td>
                    <td style="text-align: left;"><span class="rightinfo"><input
                            readonly="readonly" type="text" class="input" id="picture"
                            name="product.tuijianpic" value="<s:property value='product.tuijianpic'/>" />
                    </span>
                    <s:if test="product.tuijianpic!=null">
                            <a target="_blank" href="<s:property value="product.tuijianpic" />">
                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='product.tuijianpic'/>">
                            </a>
                        </s:if></td>
            </tr>
            
            <tr>
                <th class="td_right">产品类型<i>*</i></th>
                <td style="text-align: left;"><s:select
                        list="%{#application.dic.loanstype.childs}" listKey="id" listValue="name" headerKey="" headerValue="-请选择-"
                        name="product.product_type" id="product_type"
                        value="#request.product.product_type" 
                        data-rule="产品类型:required;product_type;length[2~256]" /></td>

                <th class="td_right">发布类型<i>*</i></th>
                <td style="text-align: left;"><s:select
                        list="%{#application.dic.publishtype.childs}" listKey="id" listValue="name" headerKey="" headerValue="-请选择-"
                        name="product.rele_type" id="rele_type" value="#request.product.rele_type" 
                        data-rule="发布类型:required;rele_type;length[2~256]"/>
                </td>

            </tr>
            
            <!--       <tr>
                <th class="td_right">是否推荐</th>
                <td style="text-align: left;" colspan="3">
                
                <s:select list="%{#application.dic.whether.childs}" listKey="id"  
                                listValue="name"  name="e.shifoutuijian"   id="shifoutuijian"   onchange="changetuijian()"  value="#request.e.shifoutuijian"   />   
                </td>
                </tr>
                
                 <tr>
             
                    
                <td style="text-align: left;" colspan="4">
                    <input type="button" name="filemanager" value="推荐图片" class="btn btn-info"/>
                    <s:textfield type="text" id="tuijianpic" name="e.tuijianpic" ccc="imagesInput" style="width: 600px;" 
                    data-rule="小图;required;maxPicture;"/>
                    <s:if test="e.tuijianpic!=null">
                        <a target="_blank" href="<%=SystemManager.systemSetting.getImagerootpath()%><s:property value="e.tuijianpic" />">
                           <img style="max-width: 50px;max-height: 50px;" alt="" src="<%=SystemManager.systemSetting.getImagerootpath()%><s:property value="e.tuijianpic" />">
                        </a>
                    </s:if>
                </td>
                
             
                </tr>
             -->

            <tr>
                <th class="td_right">贷款条件（用空格分隔）<i>*</i></th>
                <td style="text-align: left;" colspan="3"><s:textarea rows="6"
                        cols="100" name="product.loancondition" id="loancondition"
                        readonly="false"
                        data-rule="贷款条件:required;loancondition;length[2~1024]" /></td>
            </tr>
            <tr>
                <th class="td_right">产品特点（用空格分隔）<i>*</i></th>
                <td style="text-align: left;" colspan="3"><s:textarea rows="6"
                        cols="100" name="product.productdetail" id="productdetail"
                        readonly="false"
                        data-rule="产品特点:required;productdetail;length[2~1024]" /></td>
            </tr>
            <tr>
                <th class="td_right">发布银行描述<i>*</i>
                    <br>
                    <span>*格式为：xxx银行xx支行如，成都银行科技支行</span>
                </th>
                <td style="text-align: left;"><s:textfield
                        name="product.description" id="description" readonly="false"
                        data-rule="发布银行描述:required;description;length[2~256]" />
                       <span onclick="getlnglat();" style="cursor:pointer;color:blue;">自动获取经纬度</span>
                 </td>
                <th class="td_right">流程编号
                    <br>
                    <span>*请联系盈创动力对应的工作人员，由工作人员分配流程编号</span>
                </th>
                <td style="text-align: left;">
                	<s:textfield name="product.flowno" id="productflowno" />
                </td>
            </tr>
            <tr>
                <th class="td_right">标签(空格分隔)<i>*</i></th>
                <td style="text-align: left;" colspan="3"><s:textfield
                        name="product.biaoqian" size="64" id="biaoqian" readonly="false"
                        data-rule="标签:required;biaoqian;length[2~64]" /></td>
            </tr>

            <tr style="display: none;">
                <th class="td_right">分站</th>
                <td style="text-align: left;" colspan="3">
                	<select name="product.substation" id="substation">
					    <option value="${sessionsubcode }" selected="selected">${sessionsubstation }</option>
					</select>
                </td>
            </tr>
            
            <!--<tr>-->
                <!--<th class="td_right"><a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_black" style="color: blue;">经度(点击获取)(举例：104.072366)</a></th>-->
                <!--<td style="text-align: left;">-->
                	<!--<s:textfield name="product.longitude" id="longitude" readonly="false" data-rule="经度:longitude;length[0~128]" />-->
                <!--</td>-->
                <!--<th class="td_right">纬度(举例：30.663546)</th>-->
                <!--<td style="text-align: left;">-->
                	<!--<s:textfield name="product.latitude" id="latitude" readonly="false" data-rule="纬度:lnglat;length[0~128]" />-->
                <!--</td>-->
            <!--</tr>-->
            
            <%-- <c:if test="${product.rele_type ne '11801' }">
            <tr>
                <th class="td_right">发布机构id</th>
                <td style="text-align: left;"><s:textfield name="product.rele_bankid"
                        id="goodsreleid" 
                        readonly = "true" /></td>

                <th class="td_right">发布人id</th>
                <td style="text-align: left;"><s:textfield name="product.rele_userid"
                        id="goodsreleuserid" 
                        readonly = "true" /></td>
            </tr>
        
            <tr>
                <th class="td_right">数据来源</th>
                <td style="text-align: left;"><s:select
                        list="%{#application.dic.datasources.childs}" listKey="id" listValue="name"
                        name="product.datasource" id="datasource" value="#request.product.datasource" />
                </td>

                <th class="td_right">app发布编号</th>
                <td style="text-align: left;"><s:textfield name="product.appid"
                        id="goodsappid" 
                        readonly = "true" />
                       <c:if test="${product.appid eq '' or empty product.appid }">
                        <s:a href="javascript:getAppList(3)" cssClass="btn btn-info" id="selectPbczdbase">请选择</s:a>
                        </c:if>
                        </td>

            </tr>
            </c:if> --%>
            
            

        </table>
        </div>
        </c:if>
        <c:if test="${type ==2}">
        <div id="tabs-2">
             <table class="table table-bordered">

            <tr style="display: none;">
                <th>id</th>
                <td><s:textfield name="incre.id"
                        id="incre.id"/></td>
            </tr>

            <tr style="display: none;">
                <th class="td_right">产品编号</th>
                <td style="text-align: left;" colspan="3"><s:textfield
                        name="incre.increid" id="increid" readonly="false"
                        data-rule="产品编号:required;increid;length[8~8]" /></td>
            </tr>

            <tr>
                <th class="td_right">增值业务名称(不超过10个字)</th>
                <td style="text-align: left;" colspan="3"><s:textfield
                        name="incre.increname" size="50" id="increname" readonly="false"
                        data-rule="增值业务名称:required;increname;length[2~10]" /></td>

            </tr>
            <tr>
                        <th class="td_right">优先级 (整数，数字越大优先级越高)</th>
                        <td style="text-align: left;" ><s:textfield name="incre.sort"
                                id="sort" readonly="false"
                                data-rule="优先级:required;sort;Integer" /></td>
                <th class="td_right">标签（逗号分隔）</th>
                <td style="text-align: left;"><s:textfield name="incre.label"
                        id="goodslabel" data-rule="标签:required;label"/></td>
            </tr>
            <tr>
               <th class="td_right">分类</th>
               <td style="text-align: left;">
                <s:select list="%{#application.dic.incretype.childs}" listKey="id" headerKey="" headerValue="" 
           		listValue="name" name="incre.cretype" id="goodscretype" onchange="subclass(0);" data-rule="分类:required;cretype"/> 
                </td>
                <th class="td_right">二级分类</th>
               	<td style="text-align: left;">
	                <s:select list="%{#application.dic.incregrade.childs}" id="incregrade" class="typeclass" listKey="id" headerKey="" headerValue="" listValue="name"/> 
	           		<s:select list="%{#application.dic.increfinance.childs}" id="increfinance" class="typeclass" listKey="id" headerKey="" headerValue="" listValue="name"/> 
	           		<s:select list="%{#application.dic.increlaw.childs}" id="increlaw" class="typeclass" listKey="id" headerKey="" headerValue="" listValue="name"/>
	           		<s:select list="%{#application.dic.increknow.childs}" id="increknow" class="typeclass" listKey="id" headerKey="" headerValue="" listValue="name"/>
	           		<s:select list="%{#application.dic.increinsure.childs}" id="increinsure" class="typeclass" listKey="id" headerKey="" headerValue="" listValue="name"/>
	           		<s:select list="%{#application.dic.incretalent.childs}" id="incretalent" class="typeclass" listKey="id" headerKey="" headerValue="" listValue="name"/>
	           		<s:select list="%{#application.dic.increplan.childs}" id="increplan" class="typeclass" listKey="id" headerKey="" headerValue="" listValue="name"/>
	           		<s:select list="%{#application.dic.increother.childs}" id="increother" class="typeclass" listKey="id" headerKey="" headerValue="" listValue="name"/>
                </td>
            </tr>       
                    
             
            <tr>
            
                <td style="text-align: left;"><input type="button"
                    name="filemanager1" id="filemanager1" value="产品图标（300*300）" class="btn btn-info" /></td>
                     <td style="text-align: left;" colspan="3"><s:textfield
                        type="text" id="picture" name="incre.picture" ccc="imagesInput"
                        style="width: 300px;margin-bottom:0px;" readonly="true"
                        data-rule="小图;required;maxPicture;" /> 
                        <s:if test="incre.picture!=null">
                            <a target="_blank" href="<s:property value="incre.picture" />">
                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='incre.picture'/>">
                            </a>
                        </s:if>
                    </td>

            </tr>
            

            <tr>
                <th class="td_right">增值业务描述(不超过20个字)</th>
                <td style="text-align: left;" colspan="3"><s:textfield
                        name="incre.incredescrip" id="incredescrip" size="50" readonly="false"
                        data-rule="增值业务描述:required;incredescrip;length[2~20]" /></td>
            </tr>

            <tr>
                <th class="td_right">价格（元）</th>
                <td style="text-align: left;" colspan="3"><s:textfield
                        name="incre.increprice" id="increprice" readonly="false"
                        onkeyup="value=value.replace(/[^\d]/g,'')"
                        data-rule="价格:required;amt;increprice;money" /></td>
            </tr>

            <tr style="display:none">
                <th class="td_right">内容(不用这个框框了)</th>
                <td style="text-align: left;" colspan="3"><s:textarea rows="5"
                        cols="80" name="incre.increcomtent" id="increcomtent" readonly="false" />
                </td>
            </tr>


            <tr>
                <th class="td_right">内容</th>
                <td style="text-align: left;" colspan="3"><s:textarea
                        name="incre.increcontenttext" rows="3" cols="80"
                        style="width:100%;height:400px;" id="increcontenttext"
                        readonly="false" /></td>
            </tr>


            <tr>
                <th class="td_right">是否推荐(首页只展示推荐的产品且最近修改的排序在前)</th>
                <td style="text-align: left;" colspan="3"><s:select
                        list="%{#application.dic.whether.childs}" listKey="id" listValue="name"
                        name="incre.shifoutuijian" id="shifoutuijian"
                        onchange="changetuijian()" value="#request.incre.shifoutuijian" /></td>
            </tr>

            <tr>
                <th class="td_right">点击量</th>
                <td style="text-align: left;"><s:textfield name="incre.browsecount"
                        id="browsecount" readonly="true" /></td>

                <th class="td_right">关注量</th>
                <td style="text-align: left;"><s:textfield name="incre.markcount"
                        id="markcount" readonly="true" /></td>
            </tr>
            <tr>
                <th class="td_right">录入时间</th>
                <td style="text-align: left;"><s:textfield name="incre.lurushijian"
                        id="lurushijian" readonly="true" /></td>

                <th class="td_right">录入人</th>
                <td style="text-align: left;"><s:textfield name="incre.inputuser"
                        id="inputuser" readonly="true" /></td>
            </tr>

            <tr>
                <th class="td_right">最后修改时间</th>
                <td style="text-align: left;" colspan="3"><s:textfield
                        name="incre.lastchgtime" id="lastchgtime" readonly="true" /></td>
            </tr>
            <tr>
                <th class="td_right">数据来源</th>
                <td style="text-align: left;" colspan="3"><s:select
                        list="%{#application.dic.datasources.childs}" listKey="id" listValue="name"
                        name="incre.datasource" id="datasource" value="#request.incre.datasource" /></td>
               
            </tr>
            <tr style="display: none;">
                <th class="td_right" style="display: none;">app发布编号</th>
                <td style="text-align: left;" style="display: none;" colspan="3"><s:textfield name="incre.appid"
                        id="goodsappid" readonly="true" />
                        <c:if test="${incre.appid eq '' or empty incre.appid }">
                        <s:a href="javascript:getAppList(2)" cssClass="btn btn-info" id="selectPbczdbase">请选择</s:a>
                        </c:if>
                </td>
            </tr>
            <tr style="display: none;">
                <th class="td_right">企业id</th>
                <td style="text-align: left;"><s:textfield name="incre.releid"
                        id="goodsreleid" readonly="true" /></td>

                <th class="td_right">发布人id</th>
                <td style="text-align: left;"><s:textfield name="incre.releuserid"
                        id="goodsreleuserid" readonly="true" /></td>
            </tr>
            <tr style="display: none;">
                <th class="td_right">审核人</th>
                <td style="text-align: left;">
                	<s:textfield name="incre.verifier" id="goodsverifier" />
                </td>
                 <th class="td_right">流程编号</th>
                <td style="text-align: left;">
                	<s:textfield name="incre.flowno" id="goodsflowno" />
                </td>
            </tr>
            <tr>
                <th class="td_right">分站</th>
                <td style="text-align: left;">
                	<select name="incre.substation" id="goodssubstation">
					    <option value="${sessionsubcode }" selected="selected">${sessionsubstation }</option>
					</select>
                </td>
                <th class="td_right"></th>
                <td style="text-align: left;"></td>
            </tr>
            
            <tr style="display: none;">
                <th class="td_right"><a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_black" style="color: blue;">经度(点击获取)(举例：104.072366)</a></th>
                <td style="text-align: left;">
                	<s:textfield name="incre.longitude" id="increlongitude" readonly="false" data-rule="经度:increlongitude;length[0~128]" />
                </td>
                <th class="td_right">纬度(举例：30.663546)</th>
                <td style="text-align: left;">
                	<s:textfield name="incre.latitude" id="increlatitude" readonly="false" data-rule="纬度:increlatitude;length[0~128]" />
                </td>
            </tr>
            <tr>
                <th class="td_right">是否参加活动</th>
                <td style="text-align: left;">
                	<s:select
                        list="%{#application.dic.whether.childs}" listKey="id" listValue="name" headerKey="" headerValue=""
                        name="incre.joinactivity" id="joinactivity" value="#request.incre.joinactivity" />
                </td>
                <th class="td_right">活动价</th>
                <td style="text-align: left;">
                	<s:textfield
                        name="incre.activityprice" id="activityprice" readonly="false"
                        onkeyup="value=value.replace(/[^\d]/g,'')"
                        data-rule="活动价:amt;activityprice;money" />
                	
                </td>
            </tr>
            <tr>
                    <td class="td_right"><span class="leftname leftnamel"><input
                            type="button" name="filemanager2" id="filemanager2"
                            value="详情图片1（720*288）" class="btn btn-info" /></span></td>
                    <td style="text-align: left;" colspan="3"><span class="rightinfo"><input
                            readonly="readonly" type="text" class="input" id="logo"
                            name="incre.imgdetail1" value="<s:property value='incre.imgdetail.split(",")[0]'/>" 
                            data-rule="详情图片:required;imgdetail1;length[2~256]" /> app详情页产品图片
                    </span>
                    <s:if test="incre.imgdetail!=null">
                            <a target="_blank" href="<s:property value="incre.imgdetail.split(',')[0]" />">
                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='incre.imgdetail.split(",")[0]'/>">
                            </a>
                        </s:if>
                    </td>
            </tr>
            <tr>
                    <td class="td_right"><span class="leftname leftnamel"><input
                            type="button" name="filemanager3" id="filemanager3"
                            value="详情图片2（720*288）" class="btn btn-info" /></span></td>
                    <td style="text-align: left;" colspan="3"><span class="rightinfo"><input
                            readonly="readonly" type="text" class="input" id="logo2"
                            name="incre.imgdetail2" value="<s:property value='incre.imgdetail.split(",")[1]'/>" /> app详情页产品图片
                    </span>
                    <s:if test="incre.imgdetail!=null">
                            <a target="_blank" href="<s:property value="incre.imgdetail.split(',')[1]" />">
                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='incre.imgdetail.split(",")[1]'/>">
                            </a>
                        </s:if>
                    </td>
            </tr>
            <tr>
                    <td class="td_right"><span class="leftname leftnamel"><input
                            type="button" name="filemanager4" id="filemanager4"
                            value="详情图片3（720*288）" class="btn btn-info" /></span></td>
                    <td style="text-align: left;" colspan="3"><span class="rightinfo"><input
                            readonly="readonly" type="text" class="input" id="logo3"
                            name="incre.imgdetail3" value="<s:property value='incre.imgdetail.split(",")[2]'/>" /> app详情页产品图片
                    </span>
                    <s:if test="incre.imgdetail!=null">
                            <a target="_blank" href="<s:property value="incre.imgdetail.split(',')[2]" />">
                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='incre.imgdetail.split(",")[2]'/>">
                            </a>
                        </s:if>
                    </td>
            </tr>

        </table>
        </div>
        </c:if>

<c:if test="${type ==1}">
		<div id="tabs-3">
                <table class="table table-bordered">

                    <tr style="display: none;">
                        <th>id</th>
                        <td colspan="3"><s:textfield name="pcgoods.pkid"
                        id="pcgoods.pkid" /></td>
                    </tr>

                    <tr>
                        <th class="td_right">类型</th>
                        <td style="text-align: left;" colspan="3"><s:select
                                list="%{#request.genreType}" name="pcgoods.genre" id="genre"
                                value="pcgoods.genre" readonly="false" /></td>
                    </tr>


                    <tr>
                        <th class="td_right">名称</th>
                        <td style="text-align: left;" colspan="3"><s:textfield name="pcgoods.title"
                                id="title" readonly="false"
                                data-rule="标题:required;prodid;length[1~16]" /></td>
                    </tr>
                    <tr>
                        <th class="td_right">优先级 (整数，数字越大优先级越高)</th>
                        <td style="text-align: left;" colspan="3"><s:textfield name="pcgoods.sort"
                                id="sort" readonly="false"
                                data-rule="优先级:required;sort;Integer" /></td>
                    </tr>
                    <tr>
                        <th class="td_right">简单描述</th>
                        <td style="text-align: left;" colspan="3"><s:textarea
                                name="pcgoods.bewrite" id="bewrite" readonly="false" rows="3"
                                cols="80" data-rule="简单描述:required;bewrite;length[1~255]" /></td>
                    </tr>
                    <tr>
                        <th class="td_right">详细介绍</th>
                        <td style="text-align: left;" colspan="3"><s:textarea
                        name="pcgoods.content" rows="3" cols="80"
                        style="width:100%;height:400px;" id="increcontenttext"
                        readonly="false" /></td>
                    </tr>
                    <tr>
                        <th class="td_right">所属行业</th>
                        <td style="text-align: left; " colspan="3"><s:select
                                list="%{#application.dic.c9a715e6c1b446c48c1818d80452c3ed.childs}" listKey="id" listValue="name"
                                name="industry" id="industry" value="pcgoods.industry"
                                readonly="false" /></td>
                    </tr>
                    <tr>
                        <th class="td_right">产品价格(元)</th>
                        <td style="text-align: left;" colspan="3"><s:textfield name="pcgoods.price"
                                id="price" readonly="false" onkeyup="value=value.replace(/[^\d]/g,'')"
                                data-rule="产品价格:required;price;money" /></td>
                    </tr>
                    <tr>
                            <td class="td_right"><span class="leftname leftnamel"><input
                                    type="button" name="filemanager1" id="filemanager1"
                                    value="详情图片1（720*288）" class="btn btn-info" /></span></td>
                            <td style="text-align: left;" colspan="3"><span class="rightinfo"><input
                                    readonly="readonly" type="text" class="input" id="picture"
                                    name="pcgoods.imgurl1" value="<s:property value='pcgoods.imgurl.split(",")[0]'/>" 
                                    data-rule="详情图片:required;imgurl1;length[2~256]"/> app详情页产品图片 </span>
                            <s:if test="pcgoods.imgurl!=null">
	                            <a target="_blank" href="<s:property value="pcgoods.imgurl.split(',')[0]" />">
	                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='pcgoods.imgurl.split(",")[0]'/>">
	                            </a>
                            </s:if>
                            </td>
                    </tr>
                    <tr>
                            <td class="td_right"><span class="leftname leftnamel"><input
                                    type="button" name="filemanager3" id="filemanager3"
                                    value="详情图片2（720*288）" class="btn btn-info" /></span></td>
                            <td style="text-align: left;" colspan="3"><span class="rightinfo"><input
                                    readonly="readonly" type="text" class="input" id="logo2"
                                    name="pcgoods.imgurl2" value="<s:property value='pcgoods.imgurl.split(",")[1]'/>" /> app详情页产品图片 </span>
                            <s:if test="pcgoods.imgurl!=null">
                                <a target="_blank" href="<s:property value="pcgoods.imgurl.split(',')[1]" />">
                                    <img style="max-width: 50px;max-height: 50px;" src="<s:property value='pcgoods.imgurl.split(",")[1]'/>">
                                </a>
                            </s:if>
                            </td>
                    </tr>
                    <tr>
                            <td class="td_right"><span class="leftname leftnamel"><input
                                    type="button" name="filemanager4" id="filemanager4"
                                    value="详情图片3（720*288）" class="btn btn-info" /></span></td>
                            <td style="text-align: left;" colspan="3"><span class="rightinfo"><input
                                    readonly="readonly" type="text" class="input" id="logo3"
                                    name="pcgoods.imgurl3" value="<s:property value='pcgoods.imgurl.split(",")[2]'/>" /> app详情页产品图片 </span>
                            <s:if test="pcgoods.imgurl!=null">
                                <a target="_blank" href="<s:property value="pcgoods.imgurl.split(',')[2]" />">
                                    <img style="max-width: 50px;max-height: 50px;" src="<s:property value='pcgoods.imgurl.split(",")[2]'/>">
                                </a>
                            </s:if>
                            </td>
                    </tr>
                    <tr>
                            <td class="td_right"><span class="leftname leftnamel"><input
                                    type="button" name="filemanager2" id="filemanager2"
                                    value="列表图片（300*180）" class="btn btn-info" /></span></td>
                            <td style="text-align: left;" colspan="3"><span class="rightinfo"><input
                                    readonly="readonly" type="text" class="input" id="logo"
                                    name="pcgoods.prologo" value="<s:property value='pcgoods.prologo'/>" /> </span>
                                    <s:if test="pcgoods.prologo!=null">
                            <a target="_blank" href="<s:property value="pcgoods.prologo" />">
                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='pcgoods.prologo'/>">
                            </a>
                            </s:if>
                                    </td>
                    </tr>
                    
                    <tr>
                        <th class="td_right"><a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_black" style="color: blue;">经纬度(点击获取)</a></th>
                        <td style="text-align: left;" colspan="3">
                        	<s:textfield name="pcgoods.lnglat" id="lnglat" readonly="false" data-rule="经纬度:lnglat;length[0~128]" /></td>
                    </tr>

                    <tr>
                        <th class="td_right">数据来源</th>
                        <td style="text-align: left;"><s:select
                                list="%{#application.dic.datasources.childs}" listKey="id" listValue="name"
                                name="pcgoods.data_source" id="data_source"
                                value="#request.pcgoods.data_source" /></td>

                        <th class="td_right">app发布编号</th>
                        <td style="text-align: left;"><s:textfield name="pcgoods.appid"
                                id="goodsappid" readonly="true" />
                                <c:if test="${pcgoods.appid eq '' or empty pcgoods.appid}">
                            <s:a href="javascript:getAppList(1)" cssClass="btn btn-info" id="selectPbczdbase">请选择</s:a>
                            </c:if></td>
                    </tr>
                    <tr>
                        <th class="td_right">企业id</th>
                        <td style="text-align: left;"><s:textfield name="pcgoods.releid"
                                id="goodsreleid" readonly="true" /></td>

                        <th class="td_right">发布人id</th>
                        <td style="text-align: left;"><s:textfield
                                name="pcgoods.releuserid" id="goodsreleuserid" readonly="true" /></td>
                    </tr>
                    <tr>
                        <th class="td_right">创建时间</th>
                        <td style="text-align: left;" colspan="3"><s:textfield
                                name="pcgoods.createdate" id="createdate" readonly="true" /></td>
                    </tr>
                    <tr>
                        <th class="td_right">创建人</th>
                        <td style="text-align: left;" colspan="3"><s:textfield
                                name="pcgoods.createby" id="createby" readonly="true" /></td>
                    </tr>
                    <tr>
                        <th class="td_right">最后修改人</th>
                        <td style="text-align: left;" colspan="3"><s:textfield
                                name="pcgoods.updateby" id="updateby" readonly="true" /></td>
                    </tr>
                    <tr>
                        <th class="td_right">最后修改时间</th>
                        <td style="text-align: left;" colspan="3"><s:textfield
                                name="pcgoods.updatedate" id="updatedate" readonly="true" /></td>
                    </tr>
                </table>
            </div>
        </c:if>

        
        <div id="tabs-4">
        	<c:choose>  
   			<c:when test="${type == 3 || type == 2}"> 
   				<table class="table table-condensed">
                <thead>
	                <tr>
	                    <td colspan="5" class="table_title">搜索用户</td>
	                </tr>
	                <tr>
	                    <th class="td_right">请输入用户名搜索添加用户：</th>
	                    <td style="text-align: left;" colspan="4">
	                    	<input type="text" id="queryqiye" onchange="queryqiyes();"/>
	                    	
	                    	<button  class="btn btn-info" onclick="queryqiyes();">
					           <i class="icon-search icon-white"></i>搜索
					        </button>
	                    </td>
	                </tr>
                </thead>
                <tbody id="queryqiyethead"></tbody>
              </table>
              
              <table id="qiyeTable" class="table table-condensed">
                <thead>
                <tr>
                    <td colspan="7" class="table_title">已添加用户</td>
                </tr>
                <tbody id="queryqiyetbody">
                <s:iterator value="custsList" var="culi">
                <tr>
                    <th class="td_right">用户名</th>
                    <td style="text-align: left;">
                    	<input type="hidden" name="cust.userid" value="${culi.userid }"/>
                    	<input type="hidden" name="cust.f_id" value="${culi.f_id }"/>
                        ${culi.userid }
                    </td>
                    <th class="td_right">手机号</th>
                    <td style="text-align: left;">
                        ${culi.cellphone }
                    </td>
                    <th class="td_right">企业名称</th>
                    <td style="text-align: left;">
                        ${culi.qiyename }
                    </td>
                    <td>
                    	<button class='btn btn-danger delqiyebutton' onclick='delqiyes(this);'><i class='icon-remove-sign icon-white'></i>删除</button>
                    </td>
                </tr>
                </s:iterator>
                </tbody>
              </table>
              
              
		   	</c:when>  
		   	<c:otherwise> 
        	
             <table id="custTable" class="table table-condensed">
                <s:iterator value="custsList">
                    <tbody>
                     <tr>
                        <td colspan="4" class="table_title">
                            <input type="hidden" name="cust.id" value="${id }"/>
                            <input type="hidden" name="cust.pid" value="${pid }"/>
                            <input type="hidden" name="cust.userid" value="${userid }"/>
                            用户信息<span class="custlength">1</span>&nbsp;
                            <a href="javascript:void(0);" onclick="custdel(this);">删除</a>
                        </td>
                    </tr>
                    <tr>
                        <th class="td_right">手机号<span style="color:red">*</span></th>
                        <td style="text-align: left;">
                            <input name="cust.cellphone" onblur="checkcust(this);" value="${cellphone }"/>
                        </td>
                        <th class="td_right">客户类型<span style="color:red">*</span></th>
                        <td style="text-align: left;">
                            <select name="cust.usertype" onchange="custtypechange(this);" value="${usertype }">
                                <option value=""></option>
                                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001">企业客户</option>
                                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003">投资机构</option>
                                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008">其它机构</option>
                                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002">个人用户</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                    	<th class="td_right">姓名<span style="color:red">*</span></th>
                        <td style="text-align: left;">
                            <input name="cust.username" value="${username }"/>
                        </td>
                    
                    	<th class="td_right">职位<span style="color:red">*</span></th>
                        <td style="text-align: left;">
                           	<input name="cust.position" value="${position }"/>
						</td>
                    </tr>
                    
                    <tr>
                    	<th class="td_right">邮箱</th>
                        <td style="text-align: left;">
                            <input name="cust.email" value="${email }"/>
                        </td>
                    	<th class="td_right"></th><td style="text-align: left;"></td>
                    </tr>
                    </tbody>
               </s:iterator>
            </table>
            <div><a href="javascript:void(0);" class="btn btn-info" onclick="addcust()"><i class="icon-plus icon-white"></i>添加用户</a></div>
            <br/><br/>
            <table id="qiyeTable" class="table table-condensed">
                <tr>
                    <td colspan="4" class="table_title">企业信息<input type="hidden" name="qiye.pk_qiyeid" value="${qiye.pk_qiyeid }"/></td>
                </tr>
                <tr>
                    <th class="td_right">组织机构代码<span style="color:red">*</span></th>
                    <td style="text-align: left;">
                        <input name="qiye.zzjgdm" onblur="checkqiye(this);" value="${qiye.zzjgdm }"/>
                    </td>
                    <th class="td_right">企业名称<span style="color:red">*</span></th>
                    <td style="text-align: left;">
                        <input name="qiye.qiyemingcheng" value="${qiye.qiyemingcheng }"/>
                    </td>
                </tr>
              </table>
              
              </c:otherwise>  
		</c:choose> 
        </div>
        
 
    </div>
  <div id="shyj">
    <div id="shyj_c">
        <div id="shyj_lose"></div>
        <form action="productapp!operate.action" name="indexdksq" id="indexdksq" method="post">
        <input type="hidden" name="method" id="method">
        <input type="hidden" name="taskid" id="taskid">
        <input type="hidden" name="buttonid" id="buttonid">
        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        <p id="tckremark"><span class="msgcontenttype">审核意见：</span><textarea class="duanxin" rows="4" cols="80" name="msgcontent" id="msgcontent"   data-rule="短信标题:required;m_remark;length[2~512]">   </textarea></p>
        <p>
            <button id="shyj_lose2" type="reset" class="btn btn-inverse"  style="margin-left:20px;">
                <i class="icon-ok icon-white qx"></i> 取消
            </button>
            <button type="submit" id="shyjsubmit" method="productapp!operate.action" class="btn btn-info" style="margin-left:20px;">
                <i class="icon-ok icon-white"></i> 确定
            </button></p>
        </form>
    </div>
</div>
 <div id="ldksq">
        <div id="ldksq_c">
            <input type="hidden" name="e.id" value="<s:property value="e.id" />" />
            <p class="pbczdbaseTitle">
                app端未在pc端发布数据:<span style="margin-left: 20px;">输入产品标题进行模糊筛选：</span><input
                    onkeypress="if (event.keyCode == 13)  return false" type="text"
                    value="" style="margin-left: 20px; margin-bottom: 0;" />
                <button type="button" class="shaixuan btn btn-info"
                    style="margin-left: 20px;">
                    <i class="icon-ok icon-white"></i> 筛选
                </button>
            </p>
            <div class="pbczdbaseTable">

                <table id="pbczdbaseTablec" class="table table-bordered table-hover">

                    <thead>
                        <tr style="background-color: #dff0d8">
                            <th width="20"></th>
                            <th>pkid</th>
                            <th>类别</th>
                            <th>申请人</th>
                            <th>标题</th>
                            <th>审核状态</th>
                            <th>审核人</th>
                            <th>最后修改时间</th>
                        </tr>
                    </thead>
                    <tbody id="dataBody">

                    </tbody>


                </table>

            </div>
            <p>
                <button id="ldksq_lose2" type="reset" class="btn btn-inverse"
                    style="margin-left: 20px;">
                    <i class="icon-ok icon-white qx"></i> 取消
                </button>
                <button id="btn-infook" type="button" class="btn btn-info"
                    style="margin-left: 20px;">
                    <i class="icon-ok icon-white"></i> 确定
                </button>
            </p>
        </div>
    </div>
      
    
<script type="text/javascript"> 
$("#shyj_lose").click(function(){
    $("#shyj").hide();
});
$("#shyj_lose2").click(function(){
    $("#shyj").hide();
});
$("#shyjsubmit").click(function(){
	 var type = '${type}';
	 if(type =="3") {
		 $("#method").val("productczdbase!selectGZLList.action?init=y")
		    }
	    if(type =="2") {
	    	$("#method").val("incre!selectList.action?init=y")
		    }
	    if(type =="1") {
            $("#method").val("appGoods!selectList.action?init=y")
            }
	$("#indexdksq").submit();
    
});

/* $('.oper').click(function(){
    $('#msgcontent').val($.trim($(this).children('span').text()));
    $('#taskid').val($(this).attr("taskid"));
    var buttonid = $(this).attr("buttonid");
    $('#buttonid').val(buttonid);
    if(buttonid)
    showDiv1();
    $('#shyj').show();
}) */
function showDiv1() {
    var divName = $("#shyj_c");
    var top = ($(window).height() - $(divName).height())/3;
    var left = ($(window).width() - $(divName).width())/2;
    var scrollTop = $(document).scrollTop();
    var scrollLeft = $(document).scrollLeft();
    $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();

};
                    function getAppList(querytype) {
                 //1.查询之后返回到当前
                 $.post("appGoods!selectAppProducts.action",{"querytype":querytype},function(data) {
                    var dataObj = eval("("+ data+ ")");
                    var htmlStr = "";
                    $.each(dataObj,function(k,v) {
                    	var a = typeof(v.review_id) == "undefined" ? "" : v.review_id;
                    	var b = typeof(v.update_at) == "undefined" ? "" : v.update_at;
                    	
                    	
                        htmlStr += '<tr>'
                        + '<th width="20"><input lang="'+v.pkid+'" type="radio" name="dataCheckBox"  user="'+v.userid+'" qiye="'+v.qiyeid+'"/>'
                        + '</th><th>'+ v.pkid+ '</th>'+ '<th>'+ v.genre+ '</th>'
                        + '<th>'+ v.userid+ '</th>'+ '<th class="sxmc">'+ v.title+ '</th>'
                        + '<th>'+ v.chstatus+ '</th>'+ '<th>'+ a + '</th>'+'<th>'+ b + '</th>'
                        $("#dataBody").html(htmlStr);
                        });

                                        $("#ldksq").show();
                                        var divName = $("#ldksq_c");
                                        var top = ($(window).height() - $(
                                                divName).height()) / 2;
                                        var left = ($(window).width() - $(
                                                divName).width()) / 2;
                                        var scrollTop = $(document).scrollTop();
                                        var scrollLeft = $(document)
                                                .scrollLeft();
                                        $(divName).css({
                                            position : 'absolute',
                                            'top' : top,
                                            left : left + scrollLeft
                                        }).show();
                 });
                    }
                    $("#ldksq_lose2").click(function() {
                        $("#ldksq").hide();
                    });
                    $("#btn-infook").click(function() {
                        var appTag = getDataIds();
                        $("#goodsappid").val(appTag.attr("lang"));
                        $("#goodsreleuserid").val(appTag.attr("user"));
                        $("#goodsreleid").val(appTag.attr("qiye"));
                        //             alert(strid+"***"+pshid);return;
                        // 保存数据
                        // 设置数据
                        $("#ldksq").hide();

                        return;
                    });
                    $(".shaixuan").click(function(){
                        var shaixuanInput = $(this).prev().val();
                        //alert(shaixuanInput);
                        var reg = new RegExp(shaixuanInput);
                        $("#dataBody tr th.sxmc").each(function(){
                            
                            if(!($(this).html().match(reg))){
                                $(this).parent().hide();
                            }else{
                                $(this).parent().show();
                            }
                        });
                        
                    });
                    function getDataIds() {
                        var dataTag = $("#dataBody input[name=dataCheckBox]:checked");
                        return dataTag;
                    }
                    
                </script>

</s:form>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
<script type="text/javascript">
//通用按钮的提交表单事件
$("form").on("valid.form", function(e,form){
});
function checkNumber(obj){
	var val = $.trim($(obj).val());
	var re = /^[0-9]+.?[0-9]*$/; //判断字符串是否为数字 //判断正整数 /^[1-9]+[0-9]*]*$/ 
	   if (!re.test(val)) {
		    obj.value = "0";
		    alert("请输入数字");
		    return false;
		    }
};
function checkNumber2(obj){
    var val = $.trim($(obj).val());
    var re = /^[0-9]+.?[0-9]?$/; //判断字符串是否为数字 //判断正整数 /^[1-9]+[0-9]*]*$/ 
       if (!re.test(val)) {
            obj.value = "0";
            alert("请输入数字,最多保留1位小数");
            return false;
            }
};
function addcust() {
    var html = "<tbody><tr><td colspan=\"4\" class=\"table_title\"><input type=\"hidden\" name=\"cust.id\"/><input type=\"hidden\" name=\"cust.pid\"/><input type=\"hidden\" name=\"cust.userid\"/>用户信息<span class=\"custlength\"></span>&nbsp;<a href=\"javascript:void(0);\" onclick=\"custdel(this);\">删除</a></td></tr>";
    html += "<tr><th class=\"td_right\">手机号<span style=\"color:red\">*</span></th><td style=\"text-align: left;\"><input name=\"cust.cellphone\" onblur=\"checkcust(this);\"/></td>";
    html += "<th class=\"td_right\">客户类型<span style=\"color:red\">*</span></th><td style=\"text-align: left;\"><select name=\"cust.usertype\" onchange=\"custtypechange(this);\"><option value=\"\"></option>";
    html += "<option value=\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001\">企业客户</option><option value=\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003\">投资机构</option><option value=\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008\">其它机构</option><option value=\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002\">个人用户</option></select></td></tr>";
    html += "<tr><th class=\"td_right\">姓名<span style=\"color:red\">*</span></th><td style=\"text-align: left;\"><input name=\"cust.username\"/></td><th class=\"td_right\">职位<span style=\"color:red\">*</span></th><td style=\"text-align: left;\">";
	html += "<input name=\"cust.position\"/></td></tr>";
	html += "<tr><th class=\"td_right\">邮箱</th><td style=\"text-align: left;\"><input name=\"cust.email\"/></td><th class=\"td_right\"></th><td style=\"text-align: left;\"></td></tr></tbody>";
    $("#custTable").append(html);
    custlength();
    custtypechange($("select[name='cust.usertype']:first"));
}

if ($.trim($("#custTable").html()) == "") {
    addcust();
} else {
    $("select[name='cust.usertype']").each(function(){
        $(this).val($(this).attr("value"));
    });
}

function custlength() {
    $(".custlength").each(function(i){
        $(this).html(i + 1);
    });
}
function custdel(obj) {
    $(obj).parents('tbody').remove();
    custlength();
}
var submitcheck = true;

function summitform() {
	$(".custmsg").remove();
    submitcheck = true
    var type = '${type}';
    var zcdk = false;
    if (type != "3" && type != "2") {
	    var cust = new Array();
	    var custlen = $(".custlength").length;
	    if (custlen == 0) {
	        layer.alert("请添加用户。", {icon: 2, title : '提示', offset: ['20%', '35%']});
	        return;
	    }
	    for (var i = 0; i < $(".custlength").length; i++ ) {
	        var data = new Object();
	        cust[i] = data;
	    }
	    var field = new Array("id", "userid", "usertype", "cellphone", "pid", "username", "position", "email");
	    var fcheck = new Array("0", "0", "2", "3", "0", "2", "2", "4");
	    for (var i = 0; i < field.length; i++) {
	        $("[name='cust." + field[i] + "']").each(function(j){
	            cust[j][field[i]] = checkPara(this, fcheck[i]);
	        });
	    }
	    
	    var qiye = new Object();
	    var field2 = new Array("pk_qiyeid", "zzjgdm", "qiyemingcheng");
	    var fcheck2 = new Array("0", "1", "2");
	    for (var i = 0; i < field.length; i++) {
	        qiye[field2[i]] = checkPara($("[name='qiye." + field2[i] + "']"), fcheck2[i]);
	    }
    } else {
    	if (type == "3" && $('#product_type').val() != "10101" && $("#queryqiyetbody input[name='cust.userid']").length == 0) {
    		layer.alert("请添加用户。", {icon: 2, title : '提示', offset: ['20%', '35%']});
	        return;
    	}
    	if (type == "2" && $("#queryqiyetbody input[name='cust.userid']").length == 0) {
    		layer.alert("请添加用户。", {icon: 2, title : '提示', offset: ['20%', '35%']});
	        return;
    	}
    	var cust = new Array();
    	for (var i = 0; i < $("#queryqiyetbody input[name='cust.userid']").length; i++ ) {
	        var data = new Object();
	        cust[i] = data;
	    }
        var field = new Array("userid", "f_id");
	    for (var i = 0; i < field.length; i++) {
	        $("#queryqiyetbody input[name='cust." + field[i] + "']").each(function(j){
	            cust[j][field[i]] = $(this).val();
	        });
	    }
    }
    if (type == "3"){
    var product = new Object();
    var field3 = new Array("id", "prodid", "prodname", "loanterm", "loantermmax", "loanamt", "loanamtmax", "retutype", "loanrate", "loanarea", "banks", "shifoutuijian","applytimes", "tuijianpic", 
             "loancondition", "productdetail", "biaoqian", "openstat", "product_type", "rele_type", "rele_bankid", "rele_userid", "datasource", "appid", "description", "guaranteefee", "servicecharge", "totalcost", "sort","flowno", "substation", "longitude", "latitude","usedistrict");
    for (var i = 0; i < field3.length; i++) {
        product[field3[i]] = $.trim($("[name='product." + field3[i] + "']").val());
    }
    var lg = $("[name='product.loangur']");
    for (k in lg) {
        if(lg[k].checked) {
            if(product["loangur"] =='' || product["loangur"] == null){
            	product["loangur"]=lg[k].value
            	}else {
                product["loangur"]+=','+lg[k].value
                };
            }
        }
    checkNum($("[name='product.loanrate']"));
    
    checkNum($("[name='product.guaranteefee']"));
    checkNum($("[name='product.servicecharge']"));
    }
    if (type == "2"){
    var incre = new Object();
    var field4 = new Array("id", "increid", "increname", "picture", "incredescrip", "increprice", "increcomtent", "increcontenttext", "shifoutuijian", "browsecount", "markcount", "lurushijian", "inputuser", "lastchgtime", 
            "datasource", "appid", "releid", "releuserid", "sort", "label", "cretype", "subclass", "verifier", "flowno", "substation", "longitude", "latitude", "joinactivity", "activityprice");
    for (var i = 0; i < field4.length; i++) {
        incre[field4[i]] = $.trim($("[name='incre." + field4[i] + "']").val());
    }
    var imgdetail1 = $.trim($("[name='incre.imgdetail1']").val());
    var imgdetail2 = $.trim($("[name='incre.imgdetail2']").val());
    var imgdetail3 = $.trim($("[name='incre.imgdetail3']").val());
    if (imgdetail1 != null || imgdetail2 != "")
        incre["imgdetail"]= imgdetail1;
    if (imgdetail2 != null && imgdetail2 != ""){
        if(incre["imgdetail"] != null && imgdetail2 != "") {
            incre["imgdetail"]= incre["imgdetail"]+','+imgdetail2;
        }else {
            incre["imgdetail"] = imgdetail2;
        }
    }
    if (imgdetail3 != null && imgdetail3 != ""){
        if(incre["imgdetail"] != null && imgdetail3 != "") {
            incre["imgdetail"]= incre["imgdetail"]+','+imgdetail3;
        }else {
            incre["imgdetail"] = imgdetail3;
        }
    }
    }
    if (type == "1"){
        var pcgoods = new Object();
        var field5 = new Array("pkid", "title", "bewrite", "genre", "content", "price", "prologo", "data_source", "appid", "releid", "releuserid", "sort", "lnglat");
        for (var i = 0; i < field5.length; i++) {
            pcgoods[field5[i]] = $.trim($("[name='pcgoods." + field5[i] + "']").val());
        }
        var imgurl1 = $.trim($("[name='pcgoods.imgurl1']").val());
        var imgurl2 = $.trim($("[name='pcgoods.imgurl2']").val());
        var imgurl3 = $.trim($("[name='pcgoods.imgurl3']").val());
        if (imgurl1 != null || imgurl1 != "")
            pcgoods["imgurl"]= imgurl1;
        if (imgurl2 != null && imgurl2 != ""){
            if(pcgoods["imgurl"] != null && imgurl2 != "") {
                pcgoods["imgurl"]= pcgoods["imgurl"]+','+imgurl2;
            }else {
                pcgoods["imgurl"] = imgurl2;
            }
        }
        if (imgurl3 != null && imgurl3 != ""){
            if(pcgoods["imgurl"] != null && imgurl3 != "") {
                pcgoods["imgurl"]= pcgoods["imgurl"]+','+imgurl3;
            }else {
                pcgoods["imgurl"] = imgurl3;
            }
        }
        }
    if (submitcheck) {
        var para = new Object();
        para.scust = JSON.stringify(cust);
        para.sqiye = JSON.stringify(qiye);
        para.sproduct =JSON.stringify(product);
        para.sincre = JSON.stringify(incre);
        para.spcgoods = JSON.stringify(pcgoods);
        para.type = type;
        $.ajax({
            type: 'post',
            url: "/usermanage/saveProductAllData.html",
            data: para,
            dataType:"json",
            success: function(data){
                layer.alert(data.msg, {icon: 1, title : '提示', offset: ['20%', '35%']});
            }
        });
    } else {
        layer.alert("验证失败，请检查后重新提交", {icon: 2, title : '提示', offset: ['20%', '35%']});
    }
}
function checkNum (obj) {
	var val = $.trim($(obj).val());
    var err = "<span class='custmsg'>请正确输入</span>";
    var re = /^[0-9]+.?[0-9]*$/;
    if (!re.test(val)) {
    	$(obj).after(err);
    	submitcheck = false;
         return false;
         }
}
function checkPara (obj, num) {
    var val = $.trim($(obj).val());
    var err = "<span class='custmsg'>请检查后重新提交</span>";
    if (num == 1) { // 组织机构代码
        var zzjgdm = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;
        if (val == "" || !zzjgdm.test(val)) {
            $(obj).after(err);
            submitcheck = false;
        }
    } else if (num == 2) {  //不为空
        if (val == "") {
            $(obj).after(err);
            submitcheck = false;
        }
    } else if (num == 3) {  // 手机号
        var mobile = /^((0\d{2,3}-\d{7,8})|(1[3456789]\d{9}))$/;
        if (val.length != 11 || !mobile.test(val)) {
            $(obj).after(err);
            submitcheck = false;
        }
    } else if (num == 4) {  // 邮箱 可以为空
        var email = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(.[a-zA-Z0-9_-]+)+$/;
        if (val != "" && !email.test(val)) {
            $(obj).after(err);
            submitcheck = false;
        }
    }
    return val;
}
function custtypechange(obj) {
    $("select[name='cust.usertype']").each(function(){
        $(this).val($(obj).val());
    });
}
function checkcust(obj){
    var val = $.trim($(obj).val());
    if (val == "") {
        return;
    }
    $.ajax({
        type: 'post',
        url: "/manage/cust!checkcust.action",
        data: {"userid" : val},
        dataType: "json",
        success: function(data){
            if (data.msg != "succ") {
                if (confirm(data.msg)) { 
                    $(obj).parents('tbody').find("input[name='cust.id']").val(data.id);
                    $(obj).parents('tbody').find("input[name='cust.cellphone']").val(data.cellphone);
                    $(obj).parents('tbody').find("input[name='cust.email']").val(data.email);
                    $(obj).parents('tbody').find("input[name='cust.userid']").val(data.userid);
                    $(obj).parents('tbody').find("input[name='cust.pid']").val(data.pid);
                    $(obj).parents('tbody').find("input[name='cust.username']").val(data.username);
                    $(obj).parents('tbody').find("input[name='cust.position']").val(data.position);
                    var usertype = $(obj).parents('tbody').find("select[name='cust.usertype']");
                    usertype.val(data.usertype);
                    custtypechange(usertype);
                    if (typeof(data.pk_qiyeid) != "undefined") {
                        $("input[name='qiye.pk_qiyeid']").val(data.pk_qiyeid);
                        $("input[name='qiye.zzjgdm']").val(data.zzjgdm);
                        $("input[name='qiye.qiyemingcheng']").val(data.qiyemingcheng);
                    }
                }
            } else {
                $(obj).parents('tbody').find("input[name='cust.id']").val("");
            }
        }
    });
}
function checkqiye(obj){
    var val = $.trim($(obj).val());
    if (val == "") {
        return;
    }
    $.ajax({
        type: 'post',
        url: "/manage/cust!checkzzjgdm.action",
        data: {"zzjgdm" : val},
        dataType:"json",
        success: function(data){
            if (data.msg != "succ") {
                if (confirm(data.msg)) { 
                    $("[name='qiye.pk_qiyeid']").val(data.pk_qiyeid);
                    $("[name='qiye.zzjgdm']").val(data.zzjgdm);
                    $("[name='qiye.qiyemingcheng']").val(data.qiyemingcheng);
                }
            } else {
                $("[name='qiye.pk_qiyeid']").val("");
            }
        }
    });
}
    $(function () {
        $("#tabs").tabs({
        });
        var ht = $("#insertOrUpdateMsg").html();
        if (typeof(ht) == "undefined") { 
			ht = "";
		}
        if (ht != '' && ht.length > 0) {
            $("#insertOrUpdateMsg").slideDown(1000).delay(1500).slideUp(1000);
        }
        //selectDefaultCatalog();
        $("#removePife").click(function () {
            clearRootImagePath();
        });
    });
    
    function subclass(num){
    	var cretype = $("#goodscretype").val();
    	$(".typeclass").hide().attr("name", "");
    	var verifier = "houyl";
    	var obj = $("#increother");
    	if (cretype == "12501") {
    		obj = $("#incregrade");
    		verifier = "wangwenjia";
    	} else if (cretype == "12502") {
    		obj = $("#increfinance");
    		verifier = "mass";
    	} else if (cretype == "12503") {
    		obj = $("#increlaw");
    		verifier = "liyanhui";
    	} else if (cretype == "12504") {
    		obj = $("#increknow");
    		verifier = "duanran";
    	} else if (cretype == "12505") {
    		obj = $("#increinsure");
    		verifier = "panjingyuan";
    	} else if (cretype == "12506") {
    		obj = $("#incretalent");
    		verifier = "yanglanxin";
    	} else if (cretype == "12507") {
    		obj = $("#increplan");
    		verifier = "yanglanxin";
    	} else if (cretype == "12508") {
    		obj = $("#increother");
    		verifier = "houyl";
    	}
    	obj.attr("name", "incre.subclass").show();
    	if (num == 0) {
    		$("#goodsverifier").val(verifier);
    	} else {
    		obj.val('${incre.subclass}');
    	}
    }
    subclass(1);
</script>

<script type="text/javascript">
function queryqiyes() {
	var queryqiye = $("#queryqiye").val();
	if (queryqiye == "") {
		return;
	}
	$.ajax({
		type : "post",
		url : "/usermanage/productQueryQiye.html",
		data : {userid : queryqiye},
		dataType : "json",
		success : function(data) {
			var html = new Array();
	    	for (var i = 0; i < data.length; i ++ ) {
	    		var row = data[i];
	    		html.push("<tr>");
	    		html.push("	<th class='td_right'>用户名</th>");
	    		html.push("	<td style='text-align: left;'>");
	    		html.push("		<input type='hidden' name='cust.userid' value='" + row.userid + "'/>");
	    		html.push("		<input type='hidden' name='cust.f_id' value='" + row.f_id + "'/>");
	    		html.push("		" + row.userid);
	    		html.push("	</td>");
	    		html.push("	<th class='td_right'>手机号</th>");
	    		html.push("	<td style='text-align: left;'>" + row.cellphone + "</td>");
	    		html.push("	<th class='td_right'>企业名</th>");
	    		html.push("	<td style='text-align: left;'>" + row.qiyename + "</td>");
	    		html.push("	<td>");
	    		html.push("		<button class='btn btn-info addqiyebutton' onclick='addqiyes(this);'><i class='icon-search icon-white'></i>添加</button>");
	    		html.push("		<button class='btn btn-danger delqiyebutton' onclick='delqiyes(this);' style='display:none;'><i class='icon-remove-sign icon-white'></i>删除</button>");
	    		html.push("	</td>");
	    		html.push("</tr>");
	    	}
			$("#queryqiyethead").html(html.join(""));
		}
	});
}

function addqiyes(obj) {
	$("#queryqiyetbody").append($(obj).parents("tr"));
	$("#queryqiyetbody .addqiyebutton").hide();
	$("#queryqiyetbody .delqiyebutton").show();
}

function delqiyes(obj) {
	$(obj).parents("tr").remove();
}

function getlnglat(){
	var address = $.trim($("input[name='product.description']").val());
	if (address == "") {
		alert("请输入发布银行描述！");
		return;
	}
	$.ajax({
		type : "post",
		url : "/manage/user!getlnglat.action",
		data : {address : address},
		dataType : "json",
		success : function(data) {
			if (data.status == 0) {
				$("input[name='product.longitude']").val(data.result.location.lng);
				$("input[name='product.latitude']").val(data.result.location.lat);
			}
		}
	});
}

</script>

</body>
</html>
