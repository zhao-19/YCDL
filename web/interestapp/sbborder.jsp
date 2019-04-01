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
		$("#tbsbborderFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbsbborderSub,#tbsbborderSave").remove();
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
				<div class="title"><li><span class="t">${tbsbborder.policy_name }</span></li></div>
			<form id="tbsbborderFormInfo" action="/userextend/saveSbBorder.html" method="post">
				<input type="hidden" name="tbsbborder.id" value="${tbsbborder.id }"/>
				<input type="hidden" name="tbsbborder.toptype_code" value="${tbsbborder.toptype_code }"/>
				<input type="hidden" name="tbsbborder.type_code" value="${tbsbborder.type_code }"/>
				<input type="hidden" name="tbsbborder.policy_id" value="${tbsbborder.policy_id }"/>
				<input type="hidden" name="tbsbborder.policy_name" value="${tbsbborder.policy_name }"/>
				<input type="hidden" name="tbsbborder.status" value="${tbsbborder.status }"/>
				<input type="hidden" name="buttontype" id="buttontype"/>
                <input type="hidden" name="qiyemingcheng" value="${qiyemingcheng }"/>
				<!--
				<div class="inputtest inputtestl" style="margin-left: -70px;">
					<span class="leftname leftnamel">政策大类名称：</span>
					<span class="rightinfo"><input id="tbsbborder.toptype_name" name="tbsbborder.toptype_name" value="${tbsbborder.toptype_name }" readonly="readonly" class="input" type="text" style="background-color:#dbdbdf;"/></span>
				</div>
				<div class="inputtest inputtestl" style="margin-left: -70px;">
					<span class="leftname leftnamel">分类名称：</span>
					<span class="rightinfo"><input id="tbsbborder.type_name" name="tbsbborder.type_name" value="${tbsbborder.type_name }" readonly="readonly" class="input" type="text" style="background-color:#dbdbdf;"/></span>
				</div>
				-->
				<div class="inputtest inputtestl" style="margin-left:-47px;width: 100%">
					<span class="leftname leftnamel" style="width:200px;">上年度外汇资金池归集量（万元）：</span>
					<span class="rightinfo"><input id="tbsbborder.pool_amount" name="tbsbborder.pool_amount" value="${tbsbborder.pool_amount}" class="input stext" type="text"/></span>
				</div>
				<div class="inputtest inputtestl" style="margin-left:-47px;width: 100%">
					<span class="leftname leftnamel" style="width:200px;">&nbsp;&nbsp;&nbsp;&nbsp;上年度跨境结算量（万元）：</span>
					<span class="rightinfo">
						<span class="rightinfo"><input id="tbsbborder.settlement_amount" name="tbsbborder.settlement_amount" value="${tbsbborder.settlement_amount}" class="input stext" type="text"/></span>
					</span>
				</div>
				<div class="inputtest inputtestl" style="margin-left:-47px;width: 100%">
					<span class="leftname leftnamel" style="width:200px;">&nbsp;&nbsp;&nbsp;&nbsp;申请金额（万元）：</span>
					<span class="rightinfo">
						<span class="rightinfo"><input id="tbsbborder.qysqje" name="tbsbborder.qysqje" value="${tbsbborder.qysqje}" class="input stext" type="text"/></span>
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
				                				 <div class="div"><div class="img"><img accesskey="${files.picurl }" lang="${files.id }" src="/image/pdf.jpg"></div></div>
			                			 	</s:if>	
			                			</s:iterator>
			                        </div>
			                        <span class="delimg">编辑</span>
			                        </div>
			                        <div class="t">${material.value }</div>
			                    </div>
			                </div>
	                    </s:iterator>
                     </div>
                 </div>
				
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbsbcommonExcept" id="tbsbborderSave" type="button" onclick="tbsbborderSubmit(0);" value="暂存"/>
					<input class="shenqingdkt shenqingdkthide tbsbcommonExcept" id="tbsbborderSub" type="button" onclick="tbsbborderSubmit(1);" value="提交"/>
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
	function tbsbborderSubmit(num) {
		var status = $("input[name='tbsbborder.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083" && num == 1) {
			status.val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081");
		}
		var check = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证正负数字保留两位小数
		var pool = $("input[id='tbsbborder.pool_amount']").val();
		var settle = $("input[id='tbsbborder.settlement_amount']").val();
		var qysqje = $("input[id='tbsbborder.qysqje']").val();
		if (num == 0) {
			if (pool != "" && !check.test(pool)) {
				alert("外汇资金池归集量不正确！")
				return;
			}
			if (settle != "" && !check.test(settle)) {
				alert("跨境结算量不正确！")
				return;
			}
			if (qysqje != "" && !check.test(qysqje)) {
				alert("申请金额不正确！")
				return;
			}
		} else if(num == 1) {
			$("#buttontype").val("2");
			if (!check.test(pool)) {
				alert("外汇资金池归集量不正确！")
				return;
			}
			if (!check.test(settle)) {
				alert("跨境结算量不正确！")
				return;
			}
			if (!check.test(qysqje)) {
				alert("申请金额不正确！")
				return;
			}
			var msg = "";
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
		
		$("#tbsbborderFormInfo").submit();
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
function setupload(){ 
 $(".upspan").each(function(){
 	var index = $(this).attr('index'); 
 	$(this).find(".nums" + index).html($(this).find(".img").size());
	var path = "/goodaaa.action?uptarget=" + $(this).attr('id') + "&leixing=" + $(this).attr('accesskey')
			 + "&id=${tbsbborder.id}" + "&table=${table_name}";
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