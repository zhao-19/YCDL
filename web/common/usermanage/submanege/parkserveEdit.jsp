<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.winpow.services.common.TreeNode" %>   
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="/resource/css/FZbase.css?${sysversion}">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/newlayer/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/resource/drag/dragImg.js"></script>

<style>
	.td_right{text-align: right;width: 130px;}
	select{height: auto;}
	.table_title{text-align: left;font-weight: bold;font-size:16px;background-color: #dff0d8;}
	.intro{width: 100%;}
</style>
</head>

<body class="FZbPageBody">
<div id="uploadbg">
    <div id="uploadbox"></div>
</div>
<s:form action="/manage/appCommon!saveParkServe.action" id="form" name="form" theme="simple" method="post">
	<table class="table">
       	<tr>
            <td colspan="4" class="table_title">园区服务
            	<s:hidden name="parkserve.pkid"/>
            </td>
        </tr>
       	<tr>
        	<td class="td_right">园区名</td>
            <td style="text-align: left;"><s:textfield theme="simple" name="parkserve.title" id="title" readonly="false"/></td>
        	<td class="td_right"><span class="uploadbtn btn btn-success" reg="image" type="image">园区图(680x245)</span></td>
            <td style="text-align: left;">
				<s:textfield theme="simple" name="parkserve.imgurl" id="imgurl" class="file1" readonly="false" />
				<s:if test="parkserve.imgurl != null">
                    <img src="${parkserve.imgurl }" class="smallpic"/>
                </s:if>
			</td>
        </tr>
        <tr>
        	<td class="td_right">标签(空格分隔)</td>
            <td style="text-align: left;" colspan="3"><s:textfield theme="simple" name="parkserve.label" id="label" readonly="false"/></td>
        </tr>
        <tr>
        	<td class="td_right">租金价格</td>
            <td style="text-align: left;"><s:textfield theme="simple" name="parkserve.price" id="price" readonly="false"/></td>
            <td class="td_right">价格单位</td>
            <td style="text-align: left;"><s:textfield theme="simple" name="parkserve.priceunit" id="priceunit" readonly="false"/></td>
        </tr>
        <tr>
        	<td class="td_right">占地面积(平方米)</td>
            <td style="text-align: left;"><s:textfield theme="simple" name="parkserve.acreage" id="acreage" readonly="false"/></td>
        	<td class="td_right">建成时间</td>
            <td style="text-align: left;">
            	<input id="buildtime" class="Wdate search-query input-small" type="text" name="parkserve.buildtime"
					value="${parkserve.buildtime }" onFocus="WdatePicker()" />
            </td>
        </tr>
        <tr>
        	<td class="td_right">行政区域</td>
            <td style="text-align: left;"><s:textfield theme="simple" name="parkserve.area" id="area" readonly="false"/></td>
        	<td class="td_right">具体地址</td>
            <td style="text-align: left;"><s:textfield theme="simple" name="parkserve.address" id="address" readonly="false"/></td>
        </tr>
        <tr>
            <td class="td_right">是否开放</td>
            <td style="text-align: left;"><s:select list="%{#application.dic.whether.childs}" listKey="id" listValue="name" headerKey="" headerValue="" name="parkserve.enable" id="enable"/></td>
        	<td class="td_right">排序（1-100越大越靠前）</td>
            <td style="text-align: left;"><s:textfield theme="simple" name="parkserve.sort" id="sort" readonly="false"/></td>
        </tr>
          	<tr>
           	<td class="td_right"><a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_black" style="color: blue;">经度(点击获取)(举例：104.072366)</a></td>
            <td style="text-align: left;">
            	<s:textfield theme="simple" name="parkserve.longitude" id="longitude" readonly="false"/>
            </td>
            <td class="td_right">纬度(举例：30.663546)</td>
            <td style="text-align: left;">
            	<s:textfield theme="simple" name="parkserve.latitude" id="latitude" readonly="false"/>
            </td>
          	</tr>
          <tr>
			<td class="td_right"><span class="uploadbtn btn btn-success" reg="image" type="image">地图截图</span></td>
			<td style="text-align: left;">
				<s:textfield theme="simple" name="parkserve.mappic" id="imgurl" class="file1" readonly="false" />
				<s:if test="parkserve.mappic != null">
					<img src="${parkserve.mappic }" class="smallpic"/>
				</s:if>
			</td>
			<td class="td_right">分站</td>
              <td style="text-align: left;">
                <select name="parkserve.substation" id="substation">
				    <option value="${sessionsubcode }" selected="selected">${sessionsubstation }</option>
				</select>
              </td>
		</tr>
		<tr>
			<td style="text-align: right;">
				联系人
			</td>
			<td style="text-align: left;" colspan="3">
				<s:hidden name="parkserve.linkman" id="linkman"></s:hidden>
				<table style="width:100%;">
				       <tbody id="linkmantbody">
				       	<s:iterator value="#request.linkman" status="status">
				        	<tr>
				        		<td class="dnum">姓名：</td>
				        		<td class="td_right"><input type="text" name="linkmanname" value="${name }"/></td>
				        		<td class="dnum"><span style="display: inline-block;width:57px;">电话：</span></td>
				        		<td class="td_right" ><input type="text" name="linkmanmobile" value="${mobile }"/></td>
				        		<td>
				        			<span onclick="linkadd()" class="btn btn-info"><i class="icon-plus icon-white"></i>增加</span>
				        			<span onclick="linkdel(this);" class="btn btn-danger"><i class="icon-remove icon-white"></i>删除</span>
				        		</td>
				        	</tr>
				        </s:iterator>
				       </tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">详情图</td>
			<td style="text-align: left;" colspan="3">
				<s:hidden name="parkserve.detailpic" id="detailpic"></s:hidden>
				<table style="width:100%;">
				       <tbody id="detailpictbody">
				       	<s:iterator value="#request.detail" status="status">
				        	<tr>
				        		<td class="dnum">名称：</td>
				        		<td class="td_right"><input type="text" name="detailname" value="${name }"/></td>
				        		<td class="dnum"><span class="uploadbtn btn btn-success" reg="image" type="zipimg" size="500">图片</span></td>
				        		<td class="td_right">
				        			<input type="text" class="file1" name="detailbigpic" value="${big }"/>
				        			<input type="hidden" class="file2" name="detailsmallpic" value="${small }"/>
				        			<s:if test="big != null">
										<img src="${big }" class="smallpic">
					                </s:if>
				        		</td>
				        		<td>
				        			<span onclick="detailadd()" class="btn btn-info"><i class="icon-plus icon-white"></i>增加</span>
				        			<span onclick="detaildel(this);" class="btn btn-danger"><i class="icon-remove icon-white"></i>删除</span>
				        		</td>
				        	</tr>
				        </s:iterator>
				       </tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">问答</td>
			<td style="text-align: left;" colspan="3">
				<s:hidden name="parkserve.faqs" id="faqs"></s:hidden>
				<table style="width:700px;">
				       <tbody id="faqstbody">
				       	<s:iterator value="#request.faqs" status="status">
				        	<tr>
				        		<td class="dnum">问：</td>
				        		<td class="td_right"><input type="text" name="faqsask" value="${ask }"/></td>
				        		<td>
				        			<span onclick="faqsadd()" class="btn btn-info"><i class="icon-plus icon-white"></i>增加</span>
				        			<span onclick="faqsdel(this);" class="btn btn-danger"><i class="icon-remove icon-white"></i>删除</span>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td class="dnum">答：</td>
				        		<td class="td_right" colspan="2"><textarea class="intro" name="faqsanswer" rows="2">${answer }</textarea></td>
				        	</tr>
				        </s:iterator>
				       </tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">简介</td>
			<td style="text-align: left;" colspan="3">
				<s:textarea name="parkserve.bewrite" style="width:99%;" id="bewrite"></s:textarea>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">详细介绍</td>
			<td style="text-align: left;" colspan="3">
				<s:textarea name="parkserve.content" id="content" style="width:100%;height:400px;visibility:hidden;"></s:textarea>
			</td>
		</tr>
       	<tr>
            <td class="td_right">发布人</td>
            <td style="text-align: left;">${parkserve.userid }</td>
       		<td class="td_right">创建人</td>
            <td style="text-align: left;">${parkserve.inputuser }</td>
       	</tr>
       	<tr>
            <td class="td_right">创建时间</td>
            <td style="text-align: left;">${fn:substring(parkserve.lurushijian, 0, 19)}</td>
       		<td class="td_right">修改时间</td>
            <td style="text-align: left;">${fn:substring(parkserve.lastchgtime, 0, 19)}</td>
       	</tr>
      	<tr>
      		<td colspan="4" style="text-align: center;">
      			<span onclick="submit()" class="btn btn-success"><i class="icon-ok icon-white"></i>保存</span>
      		</td>
        </tr>
	</table>
</s:form>
	
<script type="text/javascript">
	function submit() {
		var submit = 1;
		var linkarr = new Array();
		var dnum = 0;
		$("[name='linkmanname']").each(function(i) {
			var name = $.trim($(this).val());
			var mobile = $.trim($("[name='linkmanmobile']").eq(i).val());
			if (name != "" && mobile != "") {
				var dy = new Object();
				dy.name = name;
				dy.mobile = mobile;
				linkarr[dnum++] = dy;
			} else {
				submit = 0;
			}
		});
		
		var detailarr = new Array();
		dnum = 0;
		$("[name='detailname']").each(function(i) {
			var name = $.trim($(this).val());
			var big = $.trim($("[name='detailbigpic']").eq(i).val());
			var small = $("[name='detailsmallpic']").eq(i).val();
			if (name != "" && big != "") {
				var dy = new Object();
				dy.name = name;
				dy.big = big;
				dy.small = small;
				detailarr[dnum++] = dy;
			} else {
				submit = 0;
			}
		});
		
		var faqsarr = new Array();
		dnum = 0;
		$("[name='faqsask']").each(function(i) {
			var ask = $.trim($(this).val());
			var answer = $.trim($("[name='faqsanswer']").eq(i).val());
			if (ask != "" && answer != "") {
				var dy = new Object();
				dy.ask = ask;
				dy.answer = answer;
				faqsarr[dnum++] = dy;
			} else {
				submit = 0;
			}
		});
		
		var checkobj = ["title", "imgurl", "label", "price", "acreage", "buildtime", "area", "address", "bewrite", "content", "enable", "sort", "longitude", "latitude"]; 
		for (var i = 0;i < checkobj.length; i++) {
			if ($.trim($("[name='parkserve." + checkobj[i] + "']").val()) == "") {
				submit = 0;
			}
		}
		if (submit == 1) {
			$("#linkman").val(JSON.stringify(linkarr));
			$("#detailpic").val(JSON.stringify(detailarr));
			$("#faqs").val(JSON.stringify(faqsarr));
			$("#form").submit();
		} else {
			layer.alert("有输入框未填写，请检查后提交!", {icon: 7, title : '提示'});
		}
	}

	function linkadd() {
		$("#linkmantbody").append("<tr><td class=\"dnum\">姓名：</td><td class=\"td_right\"><input type=\"text\"name=\"linkmanname\"/></td><td class=\"dnum\"><span style=\"display: inline-block;width:57px;\">电话：</span></td><td class=\"td_right\"><input type=\"text\"name=\"linkmanmobile\"/></td><td><span onclick=\"linkadd()\"class=\"btn btn-info\"><i class=\"icon-plus icon-white\"></i>增加</span><span onclick=\"linkdel(this);\"class=\"btn btn-danger\"><i class=\"icon-remove icon-white\"></i>删除</span></td></tr>");
	}
	
	function linkdel(obj) {
		$(obj).parent().parent().remove();
		linkecheck();
	}
	
	function linkecheck() {
		if ($("#linkmantbody tr").length == 0) {
			linkadd();
		}
	}
	
	function detailadd() {
		$("#detailpictbody").append("<tr><td class=\"dnum\">名称：</td><td class=\"td_right\"><input type=\"text\"name=\"detailname\"value=\"${name }\"/></td><td class=\"dnum\"><span class=\"uploadbtn btn btn-success\"reg=\"image\"type=\"zipimg\"  size=\"500\">图片</span></td><td class=\"td_right\"><input type=\"text\"class=\"file1\"name=\"detailbigpic\"value=\"${big }\"/><input type=\"hidden\"class=\"file2\"name=\"detailsmallpic\"value=\"${small }\"/></td><td><span onclick=\"detailadd()\"class=\"btn btn-info\"><i class=\"icon-plus icon-white\"></i>增加</span><span onclick=\"detaildel(this);\"class=\"btn btn-danger\"><i class=\"icon-remove icon-white\"></i>删除</span></td></tr>");
	}
	
	function detaildel(obj) {
		$(obj).parent().parent().remove();
		detailcheck();
	}
	
	function detailcheck() {
		if ($("#detailpictbody tr").length == 0) {
			detailadd();
		}
	}
	
	function faqsadd() {
		$("#faqstbody").append("<tr><td class=\"dnum\">问：</td><td class=\"td_right\"><input type=\"text\"name=\"faqsask\"/></td><td><span onclick=\"faqsadd()\"class=\"btn btn-info\"><i class=\"icon-plus icon-white\"></i>增加</span><span onclick=\"faqsdel(this);\"class=\"btn btn-danger\"><i class=\"icon-remove icon-white\"></i>删除</span></td></tr><tr><td class=\"dnum\">答：</td><td class=\"td_right\"colspan=\"2\"><textarea class=\"intro\"name=\"faqsanswer\"rows=\"6\"></textarea></td></tr>");
	}
	
	function faqsdel(obj) {
		var tr = $(obj).parent().parent();
		tr.next().remove();
		tr.remove();
		faqscheck();
	}
	
	function faqscheck() {
		if ($("#faqstbody tr").length == 0) {
			faqsadd();
		}
	}
	linkecheck();
	detailcheck()
	faqscheck();
</script>



<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="parkserve.content"]', {
			allowFileManager : true,
			filterMode : false,
            afterBlur:function(){this.sync();}
		});
		K('input[name=getHtml]').click(function(e) {
			alert(editor.html());
		});
		K('input[name=isEmpty]').click(function(e) {
			alert(editor.isEmpty());
		});
		K('input[name=getText]').click(function(e) {
			alert(editor.text());
		});
		K('input[name=selectedHtml]').click(function(e) {
			alert(editor.selectedHtml());
		});
		K('input[name=setHtml]').click(function(e) {
			editor.html('<h3>Hello KindEditor</h3>');
		});
		K('input[name=setText]').click(function(e) {
			editor.text('<h3>Hello KindEditor</h3>');
		});
		K('input[name=insertHtml]').click(function(e) {
			editor.insertHtml('<strong>插入HTML</strong>');
		});
		K('input[name=appendHtml]').click(function(e) {
			editor.appendHtml('<strong>添加HTML</strong>');
		});
		K('input[name=clear]').click(function(e) {
			editor.html('');
		});
	});
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
	}
</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/easyUpload/easy-upload.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/easyUpload/easyUpload.js"></script>

</body>
</html>