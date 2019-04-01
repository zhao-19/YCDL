<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css"/>
    <script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">

        KindEditor.ready(function (K) {
            var editor = K.editor({
                allowFileManager: true
            });
            K('#filemanager').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#jigoulogo').val(),
                        clickFn: function (url, title) {
                            K('#jigoulogo').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
            K('#filemanager1').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#tuijianpic').val(),
                        clickFn: function (url, title) {
                            K('#tuijianpic').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
            K('#filemanager2').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#bcard').val(),
                        clickFn: function (url, title) {
                            K('#bcard').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
            K('#filemanager3').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#license').val(),
                        clickFn: function (url, title) {
                            K('#license').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
        });
    </script>
    <style type="text/css">
		.td_right{text-align: right;}
		select{height: auto;}
		.table_title{text-align: left;font-weight: bold;font-size:16px;background-color: #dff0d8;}
		.td_right span{font-size: 25px;color:red;}
	</style>
</head>

<body>
<s:form action="jigou" namespace="/manage" theme="simple" id="form">
    <table class="table table-bordered">
		<tr>
            <td colspan="4" class="table_title">基本信息(投资机构)
				<s:hidden name="e.id"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">机构名称<span>*</span></th>
            <td style="text-align: left;">
                <s:textfield name="e.jigoumingcheng" id="jigoumingcheng" readonly="false"
                             data-rule="机构名称:required;jigoumingcheng;length[1~32]"/>
            </td>
            <th class="td_right">组织机构代码<span>*</span></th>
            <td style="text-align: left;">
                <s:textfield name="e.zzjgdm" id="zzjgdm" readonly="false"
                             data-rule="组织机构代码:required;zzjgdm;length[1~32]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">工商注册地<span>*</span></th>
            <td style="text-align: left;">
                <span class="rightinfo" id="gszcdspan">
	                <select id="gszcd_province" name="e.gszcd_province"><s:property value="e.gszcd_province"/></select>  
	                <select id="gszcd_city" name="e.gszcd_city"><s:property value="e.gszcd_city"/></select>  
	                <select id="gszcd_county" name="e.gszcd_county"><s:property value="e.gszcd_county"/></select>
            	</span>
                		
                		<input type="hidden" id="province" value='<s:property value="e.gszcd_province"/>'/>
                        <input type="hidden" id="city" value='<s:property value="e.gszcd_city"/>'/>
                        <input type="hidden" id="county" value='<s:property value="e.gszcd_county"/>' data-rule="required;gszcd_county"/>
						<input type="hidden" id="custtype" value='productczdfirst'/>

                        <script type="text/javascript">var custtype = 'productczdfirst';</script>	
                        <script src="../../resource/js/area.js"></script>
                        <script type="text/javascript">
                            //var custtype = '<s:property value="userType"/>';
                            _init_area();
                        </script>
            </td>
			<th class="td_right">
				<input type="button" name="filemanager" id="filemanager" value="机构Logo" class="btn btn-success"/><span>*</span>
			</th>
			<td style="text-align: left;">
				<s:textfield type="text" id="jigoulogo" name="e.jigoulogo" ccc="imagesInput" style="width:250px;" data-rule="机构Logo:required;jigoulogo"/>
				<s:if test="e.jigoulogo!=null">
					<a target="_blank" href="${e.jigoulogo }">
						<img style="max-width: 50px;max-height: 50px;" src="${e.jigoulogo }"/>
					</a>
				</s:if>
			</td>
        </tr>
        <tr>
            <th class="td_right">管理资本金<span>*</span></th>
            <td style="text-align: left;" >
                <s:textfield name="e.tz_glzbj" id="tz_glzbj" readonly="false" data-rule="管理资本金:required;tz_glzbj;length[1~500]"/>
            </td>
            <th class="td_right">注册资本(万元)<span>*</span></th>
            <td style="text-align: left;">
                <s:textfield name="e.zhuceziben" id="zhuceziben" readonly="false"
                             data-rule="注册资本(万元):required;zhuceziben;length[1~9]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">投资额度(万元）<span>*</span></th>
            <td style="text-align: left;">
                <s:textfield name="e.tz_touziedu" id="tz_touziedu" readonly="false"
                             data-rule="投资额度:required;tz_touziedu;length[1~100]"/>
            </td>
            <th class="td_right"></th>
            <td style="text-align: left;"></td>
        </tr>
        <tr>

            <th class="td_right">投资行业<span>*</span></th>
            <td style="text-align: left;width: 450px;">
                <input type="checkbox" name="e.tz_touzihangye" value="物流行业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("物流行业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">物流行业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="ＩＴ行业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("ＩＴ行业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">ＩＴ行业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="汽车行业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("汽车行业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">汽车行业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="旅游行业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("旅游行业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">旅游行业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="能源行业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("能源行业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">能源行业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="制造行业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("制造行业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">制造行业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="医疗健康"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("医疗健康") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">医疗健康</span>
				<input type="checkbox" name="e.tz_touzihangye" value="化学工业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("化学工业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">化学工业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="研究咨询"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("研究咨询") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">研究咨询</span>
				<input type="checkbox" name="e.tz_touzihangye" value="教育行业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("教育行业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">教育行业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="传媒娱乐"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("传媒娱乐") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">传媒娱乐</span>
				<input type="checkbox" name="e.tz_touzihangye" value="农林牧渔"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("农林牧渔") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">农林牧渔</span>
				<input type="checkbox" name="e.tz_touzihangye" value="房地产业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("房地产业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">房地产业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="电信及增值"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("电信及增值") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">电信及增值</span>
				<input type="checkbox" name="e.tz_touzihangye" value="互联网络"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("互联网络") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">互联网络</span>
				<input type="checkbox" name="e.tz_touzihangye" value="食品饮料"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("食品饮料") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">食品饮料</span>
				<input type="checkbox" name="e.tz_touzihangye" value="家居建材"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("家居建材") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">家居建材</span>
				<input type="checkbox" name="e.tz_touzihangye" value="金融行业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("金融行业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">金融行业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="投资行业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("投资行业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">投资行业</span>
				<input type="checkbox" name="e.tz_touzihangye" value="连锁经营"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("连锁经营") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">连锁经营</span>
				<input type="checkbox" name="e.tz_touzihangye" value="其他行业"
				<% if(request.getAttribute("e.tz_touzihangye") != null && request.getAttribute("e.tz_touzihangye").toString().indexOf("其他行业") != -1) { %>checked<% } %>>
				<span onclick="checkedThat(this)">其他行业</span>
            </td>
            <th class="td_right">投资阶段<span>*</span></th>
            <td style="text-align: left;">
                <input type="checkbox" name="e.tz_touzijieduanid" value="天使轮"
                       <% if(request.getAttribute("e.tz_touzijieduanid") != null && request.getAttribute("e.tz_touzijieduanid").toString().indexOf("天使轮") != -1) { %>checked<% } %>>
                <span onclick="checkedThat(this)">天使轮</span>
                <input type="checkbox" name="e.tz_touzijieduanid" value="Pre-A轮"
                       <% if(request.getAttribute("e.tz_touzijieduanid") != null && request.getAttribute("e.tz_touzijieduanid").toString().indexOf("Pre-A轮") != -1) { %>checked<% } %>>
                <span onclick="checkedThat(this)">Pre-A轮</span>
                <input type="checkbox" name="e.tz_touzijieduanid" value="A轮"
                       <% if(request.getAttribute("e.tz_touzijieduanid") != null && request.getAttribute("e.tz_touzijieduanid").toString().indexOf("A轮") != -1) { %>checked<% } %>>
                <span onclick="checkedThat(this)">A轮</span>
                <input type="checkbox" name="e.tz_touzijieduanid" value="B轮"
                       <% if(request.getAttribute("e.tz_touzijieduanid") != null && request.getAttribute("e.tz_touzijieduanid").toString().indexOf("B轮") != -1) { %>checked<% } %>>
                <span onclick="checkedThat(this)">B轮</span>
                <input type="checkbox" name="e.tz_touzijieduanid" value="C轮"
                       <% if(request.getAttribute("e.tz_touzijieduanid") != null && request.getAttribute("e.tz_touzijieduanid").toString().indexOf("C轮") != -1) { %>checked<% } %>>
                <span onclick="checkedThat(this)">C轮</span>
                <input type="checkbox" name="e.tz_touzijieduanid" value="D轮"
                       <% if(request.getAttribute("e.tz_touzijieduanid") != null && request.getAttribute("e.tz_touzijieduanid").toString().indexOf("D轮") != -1) { %>checked<% } %>>
                <span onclick="checkedThat(this)">D轮</span>
                <input type="checkbox" name="e.tz_touzijieduanid" value="E轮及以后"
                       <% if(request.getAttribute("e.tz_touzijieduanid") != null && request.getAttribute("e.tz_touzijieduanid").toString().indexOf("E轮及以后") != -1) { %>checked<% } %>>
                <span onclick="checkedThat(this)">E轮及以后</span>
            </td>
        </tr>
        <tr>
            <th class="td_right">办公地址<span>*</span></th>
            <td style="text-align: left;" colspan="3">
                <s:textfield name="e.bangongdizhi" id="bangongdizhi" readonly="false" size="80"
                             data-rule="办公地址:required;bangongdizhi;length[1~64]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">机构简介<span>*</span></th>
            <td style="text-align: left;" colspan="3">
                <s:textarea rows="3" cols="80" name="e.jigoujianjie" id="jigoujianjie" readonly="false"
                            data-rule="机构简介:required;jigoujianjie"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">联系人姓名<span>*</span></th>
            <td style="text-align: left;">
                <s:textfield name="e.xingming" id="xingming" readonly="false" data-rule="联系人姓名:required;xingming;length[1~25]"/>
            </td>
            <th class="td_right">职务<span>*</span></th>
            <td style="text-align: left;">
                <s:textfield name="e.bumenzhiwu" id="bumenzhiwu" readonly="false"
                             data-rule="职务:required;bumenzhiwu;length[1~25]"/>
            </td>
        </tr>
        <tr>
             <th class="td_right">是否认证<span>*</span></th>
             <td style="text-align: left;">
                 <s:select list="%{#application.dic.whether.childs}" listKey="id" id="approve" theme="simple"
                       listValue="name" name="e.approve" label="是否认证" headerKey="" headerValue="" data-rule="是否认证:required;approve"/>
             </td>
             <th class="td_right">认证优先级(越大越靠前)<span>*</span></th>
             <td style="text-align: left;">
              <select id="priority" name="e.priority"></select>
             </td>
         </tr>
         <tr>
            <th class="td_right">阅读次数</th>
            <td style="text-align: left;" >${e.readtimes }</td>
            <th class="td_right"></th>
            <td style="text-align: left;" ></td>
        </tr>
        
		<tr><td colspan="4" class="table_title">其它信息</td></tr>
		<tr>
            <th class="td_right">网址</th>
            <td style="text-align: left;">
                <s:textfield name="e.wangzhi" id="wangzhi" readonly="false" data-rule="网址:wangzhi;length[1~64]" style="width:400px;"/>
            </td>
            <th class="td_right"></th>
            <td style="text-align: left;"></td>
        </tr>
        <tr>
            <th class="td_right">服务内容</th>
            <td style="text-align: left;" colspan="3">
                <s:textarea rows="3" cols="80" name="e.fuwuneirong" id="fuwuneirong" readonly="false"
                            data-rule="服务内容:fuwuneirong;length[1~1024]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">服务案例</th>
            <td style="text-align: left;" colspan="3">
                <s:textarea rows="3" cols="80" name="e.fuwuanli" id="fuwuanli" readonly="false"
                            data-rule="服务案例:fuwuanli;length[1~2048]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">注册时间</th>
            <td style="text-align: left;">
                <input id="zhuceshijian" class="Wdate search-query input-medium" type="text" name="e.zhuceshijian"
                	value="${e.zhuceshijian}" onFocus="WdatePicker()"/>
            </td>
            <th class="td_right">移动电话</th>
            <td style="text-align: left;">
                <s:textfield name="e.yidongdianhua" id="yidongdianhua" readonly="false"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">固定电话</th>
            <td style="text-align: left;">
                <s:textfield name="e.gudingdianhua" id="gudingdianhua" readonly="false"/>
            </td>
            <th class="td_right">Email</th>
            <td style="text-align: left;">
                <s:textfield name="e.email" id="email" readonly="false"/>
            </td>
        </tr>
        
        <tr>

            <th class="td_right">是否推荐</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.sf.childs}" listKey="id" id="shifoutuijian" listValue="name" 
                	name="e.shifoutuijian" headerKey="" headerValue=""/>
            </td>
            <th class="td_right"><input type="button" name="filemanager1" id="filemanager1" value="推荐图片" class="btn btn-success"/></th>
			<td style="text-align: left;">
				<s:textfield type="text" id="tuijianpic" name="e.tuijianpic" ccc="imagesInput" style="width:250px;"/>
				<s:if test="e.tuijianpic!=null">
					<a target="_blank" href="${e.tuijianpic }">
						<img style="max-width: 50px;max-height: 50px;" src="${e.tuijianpic }">
					</a>
				</s:if>
			</td>
        </tr>
        
 		<tr>
			<th class="td_right">注册地编号</th>
			<td style="text-align: left;">
				<s:textfield name="e.zhucediid" id="zhucediid" readonly="false"/>
			</td>
				<th class="td_right"><input type="button" name="filemanager2" id="filemanager2" value="名片" class="btn btn-success"/></th>
				<td style="text-align: left;">
					<s:textfield type="text" id="bcard" name="e.bcard" ccc="imagesInput" style="width:250px;"/>
					<s:if test="e.bcard!=null">
						<a target="_blank" href="${e.bcard }">
							<img style="max-width: 50px;max-height: 50px;" alt="" src="${e.bcard }">
						</a>
					</s:if>
				</td>
		</tr>
 				
		<tr>
            <th class="td_right">用户名</th>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="true"/>
            </td>
            <th class="td_right">机构类型</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.d3fc303b27cb49c396e714b427716fb7.childs}" listKey="id" id="jigouleixingid" listValue="name" 
                	name="e.jigouleixingid" headerKey="" headerValue=""/>
            </td>
         </tr> 
         <tr> 
			<th class="td_right">机构状态</th>
			<td style="text-align: left;">
				<s:textfield name="e.jgzt" id="jgzt" readonly="false"/>
			</td>
			<th class="td_right">基金性质</th>
			<td style="text-align: left;">
				<s:textfield name="e.tz_jijinxingzhi" id="tz_jijinxingzhi" readonly="false"/>
			</td>
        </tr>
        <tr> 
			<th class="td_right">微信</th>
			<td style="text-align: left;">
				<s:textfield name="e.weixin" id="weixin" readonly="false"/>
			</td>
			<th class="td_right">是否完善</th>
			<td style="text-align: left;">
              	<s:select list="%{#application.dic.whether.childs}" listKey="id" id="iscomplete" theme="simple"
                    listValue="name" name="e.iscomplete" label="是否完善" headerKey="" headerValue=""/>
			</td>
        </tr>
        <tr> 
			<th class="td_right">营业范围</th>
			<td style="text-align: left;">
				<s:textfield name="e.businessscope" id="businessscope" readonly="false"/>
			</td>
			<th class="td_right"><input type="button" name="filemanager3" id="filemanager3" value="营业执照" class="btn btn-success"/></th>
			<td style="text-align: left;">
				<s:textfield type="text" id="license" name="e.license" ccc="imagesInput" style="width:250px;"/>
				<s:if test="e.license!=null">
					<a target="_blank" href="${e.license }">
						<img style="max-width: 50px;max-height: 50px;" src="${e.license }">
					</a>
				</s:if>
			</td>
        </tr>
        <tr> 
			<th class="td_right">收款单位开户行</th>
			<td style="text-align: left;">
				<s:textfield name="e.receipt_bank" id="receipt_bank" readonly="false"/>
			</td>
			<th class="td_right">收款单位帐号</th>
			<td style="text-align: left;">
				<s:textfield name="e.receipt_account" id="receipt_account" readonly="false"/>
			</td>
        </tr>
        <tr> 
			<th class="td_right">收款人</th>
			<td style="text-align: left;">
				<s:textfield name="e.receipt_payee" id="receipt_payee" readonly="false"/>
			</td>
			<th class="td_right">联系电话</th>
			<td style="text-align: left;">
				<s:textfield name="e.receipt_phone" id="receipt_phone" readonly="false"/>
			</td>
        </tr>
        <tr> 
			<th class="td_right">公司人数</th>
			<td style="text-align: left;">
				<s:textfield name="e.yuangongshu" id="yuangongshu" readonly="false"/>
			</td>
			<th class="td_right">党员人数</th>
			<td style="text-align: left;">
				<s:textfield name="e.party_num" id="party_num" readonly="false"/>
			</td>
        </tr>
        <tr> 
			<th class="td_right">法人代表是否党员</th>
			<td style="text-align: left;">
				<s:select list="%{#application.dic.whether.childs}" listKey="id" id="is_party" theme="simple"
                       listValue="name" name="e.is_party" label="法人代表是否党员" headerKey="" headerValue=""/>
			</td>
			<th class="td_right">高管人数</th>
			<td style="text-align: left;">
				<s:textfield name="e.lead_num" id="lead_num" readonly="false"/>
			</td>
        </tr>
        <tr> 
			<th class="td_right">高管党员人数</th>
			<td style="text-align: left;">
				<s:textfield name="e.lead_party_num" id="lead_party_num" readonly="false"/>
			</td>
			<th class="td_right">是否设立当支部</th>
			<td style="text-align: left;">
				<s:select list="%{#application.dic.whether.childs}" listKey="id" id="is_party_branch" theme="simple"
                       listValue="name" name="e.is_party_branch" label="是否设立当支部" headerKey="" headerValue=""/>
			</td>
        </tr>
        <tr> 
			<th class="td_right">党支部设立时间</th>
			<td style="text-align: left;">
				<input id="party_branch_time" class="Wdate search-query input-medium" type="text" name="party_branch_time"
                	value="${e.party_branch_time}" onFocus="WdatePicker()"/>
			</td>
			<th class="td_right">上年度年党费收取总额（元）</th>
			<td style="text-align: left;">
				<s:textfield name="e.last_party_cost" id="last_party_cost" readonly="false"/>
			</td>
        </tr>
        <tr> 
			<th class="td_right">是否愿意设立党支部</th>
			<td style="text-align: left;">
				<s:select list="%{#application.dic.whether.childs}" listKey="id" id="will_set_party" theme="simple"
                       listValue="name" name="e.will_set_party" label="是否愿意设立党支部" headerKey="" headerValue=""/>
			</td>
			<th class="td_right">党建增信得分</th>
			<td style="text-align: left;">
				<s:textfield name="e.party_score" id="party_score" readonly="false"/>
			</td>
        </tr>
        <tr>
            <th class="td_right">客户经理</th>
            <td style="text-align: left;" >
                <s:textfield name="e.custmanage" id="custmanage" readonly="false"/>
            </td>

            <th class="td_right">客户经理数据来源</th>
            <td style="text-align: left;" >
                <s:select list="#{'':'','系统分配':'系统分配','主动营销':'主动营销'}" id="custmanagesource" name="e.custmanagesource"
                 cssClass="input-medium" listKey="key" listValue="value"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">录入人</th>
            <td style="text-align: left;" >${e.inputuser }</td>
            <th class="td_right"></th>
            <td style="text-align: left;" ></td>
        </tr>
        <tr>
            <th class="td_right">录入时间</th>
            <td style="text-align: left;" >${e.lurushijian }</td>
            <th class="td_right">修改时间</th>
            <td style="text-align: left;" >${e.lastchgtime }</td>
        </tr>
        
        <tr>
            <td colspan="4" style="text-align: center;">
	             <button method="jigou!insertOrUpdate.action" class="btn btn-success">
	                 <i class="icon-ok icon-white"></i> 保存
	             </button>
            </td>
        </tr>
    </table>
</s:form>
<script>
	var ahtml = "<option value =\"\"></option>";
    for (var i = 1; i <= 100; i ++ ) {
    	ahtml += "<option value =\"" + i + "\">" + i + "</option>";
    }
    $("#priority").html(ahtml);
    $("#priority").val('${e.priority}');
</script>
</body>
</html>
