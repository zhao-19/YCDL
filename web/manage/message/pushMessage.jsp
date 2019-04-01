<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">

<style>
select{height: auto;}
p{text-indent:2em;}
select{height: auto;}
#ldksq{display: none; width: 100%; height: 100%; position: fixed; left: 0; top: 0; bottom: 0; right: 0; margin: auto; z-index: 9999 !important; background: url("../img/lobg_03.png") repeat;}
#ldksq_c{background-color: #fff; width: 95%; min-height: 410px; /*position: absolute;top:0;left:0;right:0;bottom: 0;*/ margin: auto; border-radius: 5px; behavior: url(PIE.htc); padding: 10px;}
#ldksq_c p{text-align: center;}
#ldksq_c .qx{background: url("../img/delete.png") no-repeat;}
#ldksq_c form{margin: 0; padding-top: 10px;;}
#ldksq_c input.title, textarea.duanxin{width: 240px;;}
.pbczdbaseTitle{font-size: 20px; text-align: left !important;}
.pbczdbaseTable{height: 320px; width: 100%; overflow: auto;}
</style>

</head>

<body>
	<s:form action="pushMessage" namespace="/manage" theme="simple" id="form"
        name="form" method="post">
        <table class="table table-bordered">

            <tr style="display: none;">
                <th>id</th>
                <td colspan="3"><s:hidden name="e.pkid" /></td>
            </tr>

            <tr>
                <th class="td_right">标题</th>
                <td style="text-align: left;"><s:textfield name="e.title"
                        id="title" readonly="false"
                        data-rule="标题:required;title;length[1~64]" style="width:487px;"/></td>
            </tr>
            <tr>
                <th class="td_right">推送内容</th>
                <td style="text-align: left;" colspan="3"><s:textarea
                        name="e.content" id="content" readonly="false" rows="3" cols="80"
                        data-rule="推送内容:required;content;length[1~256]" />
                        
                </td>
            </tr>
            <tr>
                <th class="td_right">消息类型</th>
                <td style="text-align: left;" colspan="3">
	                <s:select list="%{#application.dic.msgdata.childs}" listKey="id" id="pushgenre" onchange="showtr();"
	                         listValue="name" name="e.pushgenre" label="类型" data-rule="消息类型:required;pushgenre"/>
                </td>
            </tr>
            <tr style="display: none;" id="relei">
                <th class="td_right">关联ID</th>
                <td style="text-align: left;" colspan="3">
	                <s:textfield name="e.releid" id="releid" readonly="false" data-rule="关联ID:;releid;length[0~32]" style="width:200px;"/>
	                <s:a href="javascript:$('#queryname').val('');getAppList()" cssClass="btn btn-success" id="selectPbczdbase">请选择</s:a>
	                <div style="display: none;" id="savetype"></div>
                </td>
            </tr>
            <tr style="display: none;" id="h5url">
                <th class="td_right">h5链接</th>
                <td style="text-align: left;" colspan="3">
	                <s:textfield name="e.exturl" id="exturl" readonly="false" data-rule="h5链接:;exturl;length[0~256]" style="width:487px;"/>
                </td>
            </tr>
            <tr>
                <th class="td_right">推送类型</th>
                <td style="text-align: left;" colspan="3">
                <s:a href="#" cssClass="btn btn-success" onclick="javascript:pushallcust()" >群推app用户</s:a>
                <s:a href="#" cssClass="btn btn-success" id="selectId">推荐给多人</s:a>
                <s:a href="#" cssClass="btn btn-success" onclick="javascript:pushsystemmsg()" >发送系统消息</s:a>
                </td>
            </tr>
            <tr>
                <th class="td_right">推送类型</th>
                <td style="text-align: left;" colspan="3">
                说明：<br/>
                <p>1.群推:推送给所有app注册用户。<br/></p>
                <p>2.推荐给多人:选择一个或多个用户发送推送消息。<br/></p>
                <p>3.发送系统消息:给所有app用户发送系统消息<br/></p>
                </td>
            </tr>
            <tr class="accid" hidden="true">
                <th class="td_right">收件人id</th>
                <td style="text-align: left;" colspan="3"><s:textarea
                        name="e.acceptid" id="accept" readonly="true" rows="3" cols="80"
                        data-rule="收件人id:required;accept;length[1~1024]" />
                        
                </td>
            </tr>
            
            <tr  class="accid" hidden="true" >
                <th class="td_right" style="width:200px;">选择收件人</th>
                <td style="text-align: left;width:600px;"><div><s:textfield
                        name="" id="acceptid" readonly="false" 
                         /></div>
                    <div id="tips" style="height:50px; background-color:#FFFFFF;width:300px;" ></div>    
                </td>
                <td style="text-align: left;width:600px;">
                <table id="acceptidTable">
                <tr><th style="width:50px;">序号</th><th style="width:200px;">id</th><th style="width:200px;">操作</th></tr>
                </table>    
                </td>
            </tr>
            
            
            <tr>
                <td colspan="4" style="text-align: center;"> 
                        <button style="display:none" id="sendButton" method="pushMessage!pushMessage.action" class="btn btn-success">
                            <i class="icon-ok icon-white"></i> 发送
                        </button>
                        <button style="display:none" method="pushMessage!pushAllCust.action" class="btn btn-success" id="pushAll">
                                                                            群推
                        </button>
                        <button style="display:none" method="pushMessage!pushSystemMsg.action" class="btn btn-success" id="pushSystem">
                                                                             系统消息
                        </button>
                    </td>
            </tr>
        </table>
    </s:form>
    
<div id="ldksq">
        <div id="ldksq_c">
            <input type="hidden" name="e.id" value="<s:property value="e.id" />" />
            <p class="pbczdbaseTitle">
                <span style="margin-left: 20px;">输入产品标题进行模糊筛选：</span>
                <input type="text" style="margin-left: 20px; margin-bottom: 0;" id="queryname"/>
                <button type="button" class="shaixuan btn btn-success" onclick="getAppList();"
                    style="margin-left: 20px;">
                    <i class="icon-ok icon-white"></i> 筛选
                </button>
            </p>
            <div class="pbczdbaseTable">
                <table id="pbczdbaseTablec" class="table table-bordered table-hover">
                    <thead>
                        <tr style="background-color: #dff0d8">
                            <th width="20"></th>
                            <th>关联ID</th>
                            <th>类别</th>
                            <th>用户名</th>
                            <th>标题</th>
                            <th>状态</th>
                            <th>录入人</th>
                            <th>录入时间</th>
                        </tr>
                    </thead>
                    <tbody id="dataBody"></tbody>
                </table>
            </div>
            <p>
                <button id="ldksq_lose2" type="button" class="btn btn-inverse"
                    style="margin-left: 20px;">
                    <i class="icon-ok icon-white qx"></i> 取消
                </button>
                <button id="btn-successok" type="button" class="btn btn-success"
                    style="margin-left: 20px;">
                    <i class="icon-ok icon-white"></i> 确定
                </button>
            </p>
        </div>
    </div>

<script type="text/javascript">
$("#acceptid").bind('input propertychange', function() {
	var user = $("#acceptid").val();
    $.post("pushMessage!selectCust.action",{'user':user}, function(data) {
        var dataObj = eval("(" + data + ")");
        var htmlStr = "";
        $.each(dataObj, function(k, v) {
            htmlStr += '<a href="javascript:void(0)" onclick="setacceptid(this.innerText)" class="userid">'+v.userid+'</a><br/>'
        });
        $("#tips").show();
        $("#tips").html(htmlStr);
    });
});
$('#selectId').click(function(){
	$("#sendButton").show();
	 $(".accid").show();
});
function pushallcust(){
	$("#sendButton").hide();
    $(".accid").hide();
	if(confirm("确定推送到全部客户吗？")) {
		$('#accept').val("aaa");
		$('#pushAll').click();
	}
}
function pushsystemmsg(){
	$("#sendButton").hide();
    $(".accid").hide();
    if(confirm("确定发送系统消息吗？")) {
        $('#accept').val("aaa");
        $('#pushSystem').click();
    }
}
function setacceptid(obj){
	var boo = checkuser(obj);
	console.log(boo);
	if(boo){
	var html ="<tr><td><span class=\"ordernum\">1</span></td><td class=\"acceptids\">"+obj+
	"</td><td><a href=\"javascript:void(0);\" onclick=\"acceptiddel(this);\">删除</a></td></tr>";
	$("#acceptidTable").append(html);
	sort();
	}
}
function checkuser(obj) {
	var boo = true;
	$(".acceptids").each(function(){
        if($(this).html() == obj) {
        	alert("不能重复添加");
        	boo = false;
        	}
        });
	return boo;
}
function sort(){
	$(".ordernum").each(function(i){
	        $(this).html(i + 1);
	});
	var ids = new Array();
	$(".acceptids").each(function(){
        ids.push($(this).html());
        });
	$("#accept").val(JSON.stringify(ids));
}
function acceptiddel(obj){
	$(obj).parent().parent().remove();
	sort();
}
if ('${flag}' != "") {
    alert('${flag}');
}
$("#pushgenre").val("12620");
function showtr(){
	var val = $("#pushgenre").val();
	if (val == "12601") {		//H5
		$("#h5url").show();
		$("#relei").hide();
	} else if (val == "12620") {//其它
		$("#relei,#h5url").hide();
	} else {
		$("#h5url").hide();
		$("#relei").show();
		if (val != $("#savetype").html()) {
			$("#releid").val("");
		}
	}
}
$("#ldksq_lose2").click(function() {
    $("#ldksq").hide();
});
 $("#btn-successok").click(function() {
    $("#releid").val($("input[name='dataBox']:checked").attr("lang"));
    $("#ldksq").hide();
});
function getAppList() {
	var pushgenre = $("#pushgenre").val();
	var queryname = $("#queryname").val();
	$.post("pushMessage!selectAppProducts.action",{"pushgenre" : pushgenre, "queryname" : queryname},function(data) {
        var obj = eval("("+ data+ ")");
        var htmlStr = "";
        $.each(obj, function(k,v) {
            htmlStr += '<tr><th><input lang="'+v.id+'" type="radio" name="dataBox"/>'
            + '</th><th>'+ v.id+ '</th><th>'+ v.typename + '</th><th>'+ v.releuserid+ '</th><th class="sxmc">'+ v.name + '</th>'
            + '<th>通过审核</th><th>'+ v.inputuser + '</th><th>'+ v.lurushijian + '</th></tr>'
        });
		$("#dataBody").html(htmlStr);
    });
	$("#ldksq").show();
	var divName = $("#ldksq_c");
	var top = ($(window).height() - $(divName).height()) / 2;
	var left = ($(window).width() - $(divName).width()) / 2;
	var scrollTop = $(document).scrollTop();
	var scrollLeft = $(document).scrollLeft();
	$(divName).css({
		position : 'absolute',
		'top' : top,
		left : left + scrollLeft
	}).show();
	$("#savetype").html(pushgenre);
}
    </script>   
</html>
