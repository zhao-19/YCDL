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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/newlayer/layer.js"></script>
<style>
.td_right{text-align: right;width: 130px;}
select{height: auto;}
.table_title{text-align: left;font-weight: bold;font-size:16px;background-color: #dff0d8;}

.hotnum{padding: 0px;margin: 0px;width: 10px;}
.dynum{padding: 0px;margin: 0px;width: 10px;}
.dnum{padding: 0px;margin: 0px;width: 10px;}
.hottable tr td,.movetable td{box-sizing:border-box;-webikt-box-sizing:border-box;-moz-box-sizing:border-box;}
.hottable tr td:nth-child(1){width:10%;}
.hottable tr td:nth-child(2){width:70%;}
.hottable tr td:nth-child(3){width:20%;text-align: center;}
.movetable tbody tr td:nth-child(odd){width:8%;text-align: center;}
.movetable tbody tr td:nth-child(5){vertical-align: middle;}
.movetable tbody tr td:nth-child(even){width:38%;}
.movetable tbody tr td.oper span{padding:5px 7px;}
.movetable tbody tr:nth-child(3n+1) td:first-child{background:#f9f9f9;}
.movetable tbody tr:first-child td:nth-child(2) input{width:88%;}
.movetable tbody tr td textarea{width:96%;}
.dtitle,.hotTitle{width:76%;}
.r{color: red;}
</style>
</head>

<body>
<s:form action="/manage/appCommon!saveNews.action" id="form" name="form" theme="simple" method="post">
	<table class="table table-bordered">
        	<tr>
	            <td colspan="5" class="table_title">每日资讯
	            	<s:hidden name="news.pkid"/>
	            	<s:hidden name="news.detail" id="newsdetail"/>
	            </td>
	        </tr>
        	<tr>
	        	<td class="td_right">资讯时间</td>
	            <td style="text-align: left;"><s:textfield theme="simple" name="news.newstime" id="newstime" readonly="false"/></td>
	        	<td class="td_right">标签</td>
	            <td style="text-align: left;"><s:textfield theme="simple" name="news.label" id="times" readonly="false"/></td>
	        	<td style="width: 160px;" rowspan="4"><div id="qrcode"></div></td>
	        </tr>
	        <tr>
	        	<td class="td_right">是否可见</td>
	            <td style="text-align: left;">
	            	<s:select list="%{#application.dic.whether.childs}" listKey="id" listValue="name" name="news.enable" id="enable"/>
            	</td>
            	<td class="td_right">阅读次数</td>
	            <td style="text-align: left;">${news.times }</td>
           	</tr>
	        <tr>
	            <td class="td_right">创建时间</td>
	            <td style="text-align: left;">${fn:substring(news.lurushijian, 0, 19)}</td>
	       		<td class="td_right">创建人</td>
	            <td style="text-align: left;">${news.inputuser }</td>
	       	</tr>
	        <tr>
	        	<td class="td_right">修改时间</td>
	            <td style="text-align: left;">${fn:substring(news.lastchgtime, 0, 19)}</td>
	            <td class="td_right">是否推送</td>
	            <td style="text-align: left;"><s:select list="%{#application.dic.whether.childs}" listKey="id" listValue="name" name="push" id="push"/></td>
	        </tr>
	</table>
</s:form>
<table class="table table-bordered movetable">
	<thead>
      	<tr>
           <td colspan="6" class="table_title">金融动态</td>
       </tr>
       </thead>
       <tbody id="dynamictbody">
        <s:iterator value="#request.dynamic" status="status">
        	<tr>
        		<td class="dnum">标题(<span class="dynum">${status.count }</span>)<span class='r'>*</span></td><td class="td_right">
        		<input class="dtitle" type="text" value="${title }"/>
        	
        		</td><td class="dnum">标签<span class='r'>*</span></td>
        		<td class="td_right"><input class="dtag" type="text" value="${tag }"/></td>
        		<td class="oper" rowspan="3"><span onclick="deldy(this);" class="btn btn-danger"><i class="icon-remove icon-white"></i>删除</span></td>
        	</tr>
        	<tr>
        		<td class="dnum">作者</td>
        		<td class="td_right"><input class="dauthor" type="text" value="${dauthor }"/></td>
        		<td class="dnum">来源</td>
        		<td class="td_right" ><input class="dsource" type="text" value="${dsource }"/> </td>
        	</tr>
        	<tr>
        		<td class="dnum">简介<span class='r'>*</span></td>
				<td class="td_right" colspan='3'><textarea class="intro"  rows="6">${intro }</textarea></td>
        	</tr>
		</s:iterator>
       </tbody>
     	<tfoot>
      	<tr>
      		<td colspan="6">
      			<span onclick="adddy()" class="btn btn-info"><i class="icon-plus icon-white"></i>增加</span>&#12288;&#12288;
      			<span onclick="saveNews()" class="btn btn-success"><i class="icon-ok icon-white"></i>保存</span>
      		</td>
        </tr>
     	</tfoot>
</table>
	
<script type="text/javascript">
	function saveNews() {
		var submit = 1;
		var para = new Object();
		var darr = new Array();
		var dnum = 0;
		$(".dtitle").each(function(i) {
			var title = $.trim($(this).val());
			var tag = $.trim($(".dtag").eq(i).val());
			var intro = $(".intro").eq(i).val();
			var dauthor = $.trim($(".dauthor").eq(i).val());
			var dsource = $.trim($(".dsource").eq(i).val());
			if (title != "" && tag != "" && intro != "") {
				var dy = new Object();
				dy.title = title;
				dy.tag = tag;
				dy.dauthor = dauthor;
				dy.dsource = dsource;
				dy.intro = intro;
				darr[dnum++] = dy;
			} else {
				submit = 0;
			}
		});
		para.dynamic = darr;
		if (submit == 1) {
			$("#newsdetail").val(JSON.stringify(para));
			$("#form").submit();
		} else {
			layer.alert("有输入框未填写，请检查后提交!", {icon: 7, title : '提示'});
		}
	}
	
	function getdyhtml() {
		return	"<tr><td class='dnum'>标题(<span class='dynum'></span>)<span class='r'>*</span></td><td class='td_right'><input class='dtitle' type='text'/>"
		+ "</td><td class='dnum'>标签<span class='r'>*</span></td><td class='td_right'><input class='dtag' type='text'/></td><td class='oper' rowspan='3'><span onclick='deldy(this);' class='btn btn-danger'><i class='icon-remove icon-white'></i>删除</span></td></tr>"
		+ "<tr><td class='dnum'>作者</td><td class='td_right'><input class='dauthor' type='text'/></td><td class='dnum'>来源</td><td class='td_right' ><input class='dsource' type='text'/> </td></tr>"
		+ "<tr><td class='dnum'>简介<span class='r'>*</span></td><td class='td_right' colspan='3'><textarea class='intro'  rows='6'></textarea></td></tr>";
	}
	
	function number(){
		$(".dynum").each(function(i){
			$(this).html(i + 1);
		})
	}
	
	function adddy(){
		$("#dynamictbody").append(getdyhtml());
		number();
	}
	
	function deldy(obj){
		var tr = $(obj).parents("tr");
		tr.next().next().remove()
		tr.next().remove()
		tr.remove()
		number();
	}
	
	if ('${news.pkid}' != "") { 
		$('#qrcode').qrcode({
		    render: "canvas",
		    width: 160,
		    height: 160,
		    text: "https://www.winpow.com/app/newsdetail.action?id=${news.pkid}"
		});
	} else {
		for (var i = 1; i <= 2; i ++) {
			$("#dynamictbody").append(getdyhtml());
		}
		number();
	}
	$("#push").val("10001");
</script>	

</body>
</html>