<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head >
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_delimg2.js"></script>
</head>

<body>
<script type="text/javascript">
var t = '${t}';
$(document).ready(function() {
	if (t == "v") {
		$("#tbsbgpFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbsbgpSub,#tbsbgpSave").remove();
	} else {
		setupload();
	}
});
</script>

<!-- 网站头部 -->
	<%@ include file="../../header.jsp"%>
<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="/usercenter/leftnav.jsp"%>
	</div>
	<div class="list fr">
		<div class="rightbox">
			<div id="zaiquanxinxi-update" class="vipinfo" >
				<div class="title"><li><span class="t">${tbsbgp.policy_name }</span></li></div>
			<form id="tbsbgpFormInfo" action="/userextend/saveSbGp.html" method="post">
				<input type="hidden" name="tbsbgp.id" value="${tbsbgp.id }"/>
				<input type="hidden" name="tbsbgp.toptype_code" value="${tbsbgp.toptype_code }"/>
				<input type="hidden" name="tbsbgp.type_code" value="${tbsbgp.type_code }"/>
				<input type="hidden" name="tbsbgp.policy_id" value="${tbsbgp.policy_id }"/>
				<input type="hidden" name="tbsbgp.policy_name" value="${tbsbgp.policy_name }"/>
				<input type="hidden" name="tbsbgp.status" value="${tbsbgp.status }"/>
				<input type="hidden" name="buttontype" id="buttontype"/>
                <input type="hidden" name="qiyemingcheng" value="${qiyemingcheng }"/>
				<!--
				<div class="inputtest inputtestl" style="margin-left: -70px;">
					<span class="leftname leftnamel">政策大类名称：</span>
					<span class="rightinfo"><input id="tbsbgp.toptype_name" name="tbsbgp.toptype_name" value="${tbsbgp.toptype_name }" readonly="readonly" class="input" type="text" style="background-color:#dbdbdf;"/></span>
				</div>
				<div class="inputtest inputtestl" style="margin-left: -70px;">
					<span class="leftname leftnamel">分类名称：</span>
					<span class="rightinfo"><input id="tbsbgp.type_name" name="tbsbgp.type_name" value="${tbsbgp.type_name }" readonly="readonly" class="input" type="text" style="background-color:#dbdbdf;"/></span>
				</div>
				-->
				<div class="inputtest inputtestl" style="margin-left: -70px;">
					<span class="leftname leftnamel">挂牌时间：</span>
					<span class="rightinfo"><input id="tbsbgp.pool_amount" name="tbsbgp.pool_amount" value="${fn:substring(tbsbgp.pool_amount, 0, 10)}" readonly="readonly" class="input stext laydate-icon" type="text"/></span>
				</div>
				<div class="inputtest inputtestl" style="margin-left: -70px;">
					<span class="leftname leftnamel">挂牌板块：</span>
					<span class="rightinfo">
						<s:select cssClass="select" list="%{#application.dic.settlementamount.childs}" listKey="id" headerKey="" headerValue="" listValue="name" name="tbsbgp.settlement_amount"/>
					</span>
				</div>
				<div class="inputtest inputtestl" style="margin-left: -70px;">
					<span class="leftname leftnamel">证券代码：</span>
					<span class="rightinfo"><input id="tbsbgp.stock_code" name="tbsbgp.stock_code" maxlength="64" value="${tbsbgp.stock_code }" class="input" type="text"/></span>
				</div>
				<div class="inputtest inputtestl" style="margin-left: -70px;">
					<span class="leftname leftnamel">证券简称：</span>
					<span class="rightinfo"><input id="tbsbgp.stock_short" name="tbsbgp.stock_short" maxlength="128" value="${tbsbgp.stock_short }" class="input" type="text"/></span>
				</div>
				<div class="inputtest inputtestl" style="margin-left:-105px;width: 100%">
					<span class="leftname leftnamel" style="width:200px;">申请金额（万元）：</span>
					<span class="rightinfo">
						<span class="rightinfo"><input id="tbsbgp.qysqje" name="tbsbgp.qysqje" value="1" readonly="readonly" class="input stext" type="text" style="background-color:#dbdbdf;"/></span>
					</span>
				</div>
				
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
				                				 <div class="div">
				                				 	<div class="img"><img accesskey="${files.picurl }" lang="${files.id }" src="/image/pdf.jpg"></div>
				                				 </div>
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
			                </div>
	                    </s:iterator>
                     </div>
                 </div>
				
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbsbcommonExcept" id="tbsbgpSave" type="button" onclick="tbsbgpSubmit(0);" value="暂存"/>
					<input class="shenqingdkt shenqingdkthide tbsbcommonExcept" id="tbsbgpSub" type="button" onclick="tbsbgpSubmit(1);" value="提交"/>
				</div>
			</form>
				</div>
		</div>	
	</div>
</div>
 <%@ include file="../../footer.jsp"%>
 <%@ include file="../sbapp/tanchudel.jsp" %>
 <script type="text/javascript">

 
	if ('${flag}' != "") {
		alert('${flag}');
	}
	!function(){
		laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
		laydate({elem: '#tbsbgp.pool_amount'});//绑定元素
	}();
	function tbsbgpSubmit(num) {
		var status = $("input[name='tbsbgp.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083" && num == 1) {
			status.val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081");
		}
		var check = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证正负数字保留两位小数
		var qysqje = $("input[id='tbsbgp.qysqje']").val();
		var stock_code = $("input[id='tbsbgp.stock_code']").val();
		var stock_short = $("input[id='tbsbgp.stock_short']").val();
		if (num == 0) {
			if (qysqje != "" && !check.test(qysqje)) {
				alert("申请金额不正确！")
				return;
			}
		} else if(num == 1) {
			$("#buttontype").val("2");
			var msg = "";
			if (stock_code == "") {
				msg += "请输入证券代码！\n";
			}
			if (stock_short == "") {
				msg += "请输入证券简称！\n";
			}
			if (!check.test(qysqje)) {
				msg += "申请金额不正确！\n";
			}
			if ($("input[id='tbsbgp.pool_amount']").val() == "") {
				msg += "请选择挂牌时间！\n";
			}
			if ($("select[id='tbsbgp.settlement_amount']").val() == "") {
				msg += "请选择挂牌板块！\n";
			}
			$(".upwk").each(function(){
				if ($(this).find(".img").length == 0) {
					msg += "【" + $(this).find(".t").html() + "】未上传！\n";
				}
			});
			if (msg != ""){
				alert(msg);
				return;
			}
		}
		$("#tbsbgpFormInfo").submit();
	}	
 </script>
 <script type="text/javascript" >
 	leftnav_init("allbt");
 </script>
 
 
 <!-- 全新的上传控件代码 -->
<style type="text/css">
	.btn{-webkit-border-radius:3px;-moz-border-radius:3px;-ms-border-radius:3px;-o-border-radius:3px;border-radius:3px;
	     background-color: #ff8400;color: #fff;display: inline-block;height: 28px;line-height: 28px;text-align: center;
	     width: 72px;transition: background-color 0.2s linear 0s;border:none;cursor:pointer;margin:0 0 20px;}
	.demo{width:700px;margin:0 auto;width:100%;overflow:hidden;}
	.btn:hover{background-color: #e95a00;text-decoration: none}
	.ul_pics li{float:left;width:160px;height:160px;border:1px solid #ddd;padding:2px;text-align: center;margin:0 5px 5px 0;}
	.ul_pics li .img{width: 160px;height: 140px;display: table-cell;vertical-align: middle;}
	.ul_pics li img{max-width: 160px;max-height: 140px;vertical-align: middle;}
	.picimg li img{max-width: 100%!important;border:none!important;max-height: 100%;vertical-align: middle;};
	.progress{position:relative;padding: 1px; border-radius:3px; margin:60px 0 0 0;} 
	.bar {background-color: green; display:block; width:0%; height:20px; border-radius:3px; } 
	.percent{position:absolute; height:20px; display:inline-block;top:3px; left:2%; color:#fff } 
</style>

<script type="text/javascript" src="/plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="/plupload/sucaihuo.js"></script>
<script type="text/javascript">
//每次上传完时调取这个排列图片的left的函数
function eachimg(target){
    var target = "#"+target;
	var left = 0;
	var picimgs = $(target+" .div");
	
	//去除先提交情况下的提示框
	var qsc = $(target).parent().parent().children('.qsc');
	if(qsc){qsc.remove()}
	picimgs.each(function(i,v){
		left = i*8;
		picimgs.eq(i).attr("style","left:"+left+"px");
		$(this).parent().prev("span").html(i+1);
	});		
}
 
 //刷新时，如果有图片还是要把left位置从新固定一下
 $(document).ready(function(){
   	var lefts = 0;
   	var picimgupspan = $(".upspan");
   	picimgupspan.each(function(){
   		var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
   		picimgss.each(function(i,v){
	   		lefts = i*8;
	   		picimgss.eq(i).attr("style","left:"+lefts+"px");	
	   		$(this).parent().prev("span").html(i+1);
   		});
   })
})
function setupload() {
 $(".upspan").each(function(){
 	var index = $(this).attr('index'); 
 	$(this).find(".nums" + index).html($(this).find(".img").size());
	var path = "/goodaaa.action?uptarget=" + $(this).attr('id') + "&leixing=" + $(this).attr('accesskey')
			 + "&id=${tbsbgp.id}" + "&table=${table_name}";
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
 })
} 
 </script>
</body>
</html>