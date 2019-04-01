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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_delimg2.js"></script>
    <script language="javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
</head>
<style type="text/css">
	.creditor .vipinfo .inputtest .leftname.lpamk{width: 241px;margin-left:-30px;}
	.baocun,.tijiao{display: none;}
	.creditor .vipinfo .xkk .inputtest .input,.creditor .vipinfo .xkk .inputtest .rightinfo{width:150px;}

</style>
<body>
<script type="text/javascript">
var t = '${t}';
$(document).ready(function() {
	if (t == "v") {
		$("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbsbcommonSub,#tbsbcommonSave").remove();
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
				<div class="title"><li><span class="t">${tbsbcommon.policy_name }</span></li></div>
			<form id="form1" action="/userextend/saveSbCommon.html" method="post">
				<input type="hidden" name="tbsbcommon.id" value="${tbsbcommon.id }"/>
				<input type="hidden" name="tbsbcommon.toptype_code" value="${tbsbcommon.toptype_code }"/>
				<input type="hidden" name="tbsbcommon.type_code" value="${tbsbcommon.type_code }"/>
				<input type="hidden" name="tbsbcommon.policy_id" value="${tbsbcommon.policy_id }"/>
				<input type="hidden" name="tbsbcommon.policy_name" value="${tbsbcommon.policy_name }"/>
				<input type="hidden" name="tbsbcommon.status" value="${tbsbcommon.status }"/>
				<input type="hidden" name="buttontype" id="buttontype"/>
				<input type="hidden" name="qiyemingcheng" value="${qiyemingcheng }"/>
				<div class="inputtest inputtestl" style="margin-left:-105px;width: 100%">
					<span class="leftname leftnamel" style="width:200px;">申请金额（万元）：</span>
					<span class="rightinfo">
						<span class="rightinfo"><input id="tbsbcommon.qysqje" name="tbsbcommon.qysqje" value="${tbsbcommon.qysqje}" class="input stext" type="text"/></span>
					</span>
				</div>
			
			<!-- 限售股减持特殊字表↓ -->
			<c:if test="${tbsbcommon.policy_id=='26b1b473c0d246d1900f3f0dd90ab650'}">
				<p class="jiange">限售股减持明细</p>
				<div id="dkk">
					<c:if test="${fn:length(tbsbcommon.sbxsgjccoreList) > 0}">
						<c:forEach items="${tbsbcommon.sbxsgjccoreList}" var="datas" varStatus="status">
							<input type="hidden" name="tbsbcommon.sbxsgjccoreList[${status.index}].id" value="${datas.id}">
							<div class="xkk" lang="firsttr">
								<div class="inputtest inputtestl">
									<span class="leftname leftnamel ">申请人姓名：<span style="color:red">*</span></span>
									<span class="rightinfo"> <input isNotNull="申请人姓名" isLength="[0,32]"
										class="input inumber  gsgb" id="tbsbcommon.sbxsgjccoreList[${status.index}].appname"
										name="tbsbcommon.sbxsgjccoreList[${status.index}].appname" type="text" value="${datas.appname}" />
									</span>
								</div>

								<div class="inputtest inputtestl">
									<span class="leftname leftnamel lpamk">身份证号：<span style="color:red">*</span></span> <span class="rightinfo">
									<input isNotNull="身份证号" isInt="身份证号" isLength="[0,18]" class="input inumber ptgb" id="tbsbcommon.sbxsgjccoreList[${status.index}].idcard"
										name="tbsbcommon.sbxsgjccoreList[${status.index}].idcard" type="text" value="${datas.idcard}" /></span>
								</div>

								<div class="inputtest inputtestl">
									<span class="leftname leftnamel ">担任职务：<span style="color:red">*</span></span> <span class="rightinfo ">
										<input isNotNull="担任职务" isLength="[0,32]" class="input inumber  yggb"
										id="tbsbcommon.sbxsgjccoreList[${status.index}].duty"
										name="tbsbcommon.sbxsgjccoreList[${status.index}].duty" type="text" value="${datas.duty}" /></span>
								</div>

								<div class="inputtest inputtestl">
									<span class="leftname leftnamel lpamk">限售股减持股数：<span style="color:red">*</span></span><span class="rightinfo ">
									<input isNotNull="限售股减持股数" isInt="限售股减持股数" isLength="[0,9]"
										class="input inumber ptgb" id="tbsbcommon.sbxsgjccoreList[${status.index}].xsgcount"
										name="tbsbcommon.sbxsgjccoreList[${status.index}].xsgcount" type="text" value="${datas.xsgcount}" /></span>
								</div>
								
								<div class="inputtest inputtestl">
									<span class="leftname leftnamel ">交易价格（元/股）：<span style="color:red">*</span></span> <span class="rightinfo ">
										<input isNotNull="交易价格（元/股）" isBankZint="isBankZint" isLength="[0,18]" class="input inumber  yggb"
										id="tbsbcommon.sbxsgjccoreList[${status.index}].price"
										name="tbsbcommon.sbxsgjccoreList[${status.index}].price" type="text" value="${datas.price}" /></span>
								</div>

								<div class="inputtest inputtestl">
									<span class="leftname leftnamel lpamk">因减持而缴纳的个人所得税(万)：<span style="color:red">*</span></span><span class="rightinfo ">
									<input isNotNull="因减持而缴纳的个人所得税(万)" isBankZint="isBankZint" isLength="[0,18]"
										class="input inumber ptgb" id="tbsbcommon.sbxsgjccoreList[${status.index}].incometax"
										name="tbsbcommon.sbxsgjccoreList[${status.index}].incometax" type="text" value="${datas.incometax}" /></span>
								</div>
								
								<div
									style="text-align:right;overflow: hidden;margin-bottom: 10px;clear: both;">
									<input class="adddel" type="button" id="copy" value="增加">&nbsp;<input
										class="addde2" type="button" id="gbdel" value="删除"
										onclick="deleteCore(this, ${datas.id})">
								</div>

							</div>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(tbsbcommon.sbxsgjccoreList) <= 0}">
						<div class="xkk" lang="firsttr">

							<div class="inputtest inputtestl">
									<span class="leftname leftnamel ">申请人姓名：<span style="color:red">*</span></span>
									<span class="rightinfo "> <input isNotNull="申请人姓名" isLength="[0,32]"
										class="input inumber  gsgb" id="tbsbcommon.sbxsgjccoreList[0].appname"
										name="tbsbcommon.sbxsgjccoreList[0].appname" type="text" value="" />
									</span>
								</div>

								<div class="inputtest inputtestl">
									<span class="leftname leftnamel lpamk">身份证号：<span style="color:red">*</span></span> <span class="rightinfo">
									<input isNotNull="身份证号" isInt="身份证号" isLength="[0,18]" class="input inumber ptgb" id="tbsbcommon.sbxsgjccoreList[0].idcard"
										name="tbsbcommon.sbxsgjccoreList[0].idcard" type="text" value="" /></span>
								</div>

								<div class="inputtest inputtestl">
									<span class="leftname leftnamel ">担任职务：<span style="color:red">*</span></span> <span class="rightinfo ">
										<input isNotNull="担任职务" isLength="[0,32]" class="input inumber  yggb"
										id="tbsbcommon.sbxsgjccoreList[0].duty"
										name="tbsbcommon.sbxsgjccoreList[0].duty" type="text" value="" /></span>
								</div>

								<div class="inputtest inputtestl">
									<span class="leftname leftnamel lpamk">限售股减持股数：<span style="color:red">*</span></span><span class="rightinfo ">
									<input isNotNull="限售股减持股数" isInt="限售股减持股数" isLength="[0,9]"
										class="input inumber ptgb" id="tbsbcommon.sbxsgjccoreList[0].xsgcount"
										name="tbsbcommon.sbxsgjccoreList[0].xsgcount" type="text" value="" /></span>
								</div>
								
								<div class="inputtest inputtestl">
									<span class="leftname leftnamel">交易价格（元/股）：<span style="color:red">*</span></span> <span class="rightinfo ">
										<input isNotNull="交易价格（元/股）" isBankZint="isBankZint" isLength="[0,18]" class="input inumber  yggb"
										id="tbsbcommon.sbxsgjccoreList[0].price"
										name="tbsbcommon.sbxsgjccoreList[0].price" type="text" value="" /></span>
								</div>

								<div class="inputtest inputtestl">
									<span class="leftname leftnamel lpamk">因减持而缴纳的个人所得税(万)：<span style="color:red">*</span></span><span class="rightinfo ">
									<input isNotNull="因减持而缴纳的个人所得税(万)" isBankZint="isBankZint" isLength="[0,18]"
										class="input inumber ptgb" id="tbsbcommon.sbxsgjccoreList[0].incometax"
										name="tbsbcommon.sbxsgjccoreList[0].incometax" type="text" value="" /></span>
								</div>

							<div
								style="text-align:right;overflow: hidden;margin-bottom: 10px;clear: both;">
								<input class="adddel" type="button" value="增加">&nbsp;<input
									class="addde2" type="button" value="删除"
									onclick="deleteCore(this, 0)">
							</div>

						</div>
					</c:if>
				</div>
		</c:if>		
		<!-- 限售股减持特殊字表↑ -->		
				
				
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
                 			 	
                 			 	<!-- 如果是中小微企业证明 -->
                                <s:if test="'aaaaaaaaaaaaaaaaaaaaaaaaatplx410'==#material.key">
                                 <div class="s s2"><a  href="/files/toList.html" target="_blank">模板下载</a></div>
                                </s:if> 
			                </div>
	                    </s:iterator>
                     </div>
                 </div>
				
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbsbcommonExcept" id="tbsbcommonSave" type="button" onclick="tbsbcommonSubmit(0);" value="暂存"/>
					<input class="shenqingdkt shenqingdkthide tbsbcommonExcept" id="tbsbcommonSub" type="button" onclick="tbsbcommonSubmit(1);" value="提交"/>
					<input class="baocun" type="button"/>
					<input class="tijiao" type="button"/>
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
		if ('${flag}' == "操作成功") {
			window.location.href = "/declare_base/selectAllBT.html";
		}
	}
	function tbsbcommonSubmit(num) {
		var status = $("input[name='tbsbcommon.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083" && num == 1) {
			status.val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081");
		}
		var msg = "";
		var check = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证正负数字保留两位小数
		var qysqje = $("input[id='tbsbcommon.qysqje']").val();
		if (num == 0) {
			if (qysqje != "" && !check.test(qysqje)) {
				msg += "申请金额不正确！\n";
			}
		} else if(num == 1) {
			$("#buttontype").val("2");
			if (!check.test(qysqje)) {
				msg += "申请金额不正确！\n";
			}
			var not = new Array();// 不必传
			not[0] = "aaaaaaaaaaaaaaaaaaaaaaaaatplx291";
			$(".upwk").each(function(){
				for (var i = 0; i < not.length; i ++ ) {
					if ($(this).find(".upspan").attr('accesskey') == not[i]) {
						return true;					
					}	
				}
				if ($(this).find(".img").length == 0) {
					msg += "【" + $(this).find(".t").html() + "】未上传！\n";
				}
			});
		}
		if (msg != ""){
			alert(msg);
			return;
		}
		if ('${tbsbcommon.policy_id}' == "26b1b473c0d246d1900f3f0dd90ab650") {
			if (num == 0) {
				$(".baocun").click();
			} else if(num == 1) {
				$(".tijiao").click();
			}
		} else {
			$("#form1").submit();
		}
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
			 + "&id=${tbsbcommon.id}" + "&table=${table_name}";
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
 <script type="text/javascript">
     //贷款银行到到期日期的8个元素的增加和删除
        $(".adddel").click(function () {
            var xkks = $("#dkk").children(".xkk");
            var nownum = xkks.length;//现在要添加的元素名称的序号
            var newElement = xkks.eq(0).clone(true).appendTo($("#dkk")).attr("lang", "");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
            newElement.find('input[type=text]').each(function() {
                $(this).val('');
            })
            var lastxkk_inputs = $("#dkk").children(".xkk:last").children().find("input[type=text]");//找到大框框下的最后一个元素里面的所有input
		var lastxkk_inputs_buttons = $("#dkk").children(".xkk:last").children().find("input[type=button]");
		lastxkk_inputs_buttons.eq(1).attr('onclick',"deleteCore(this, 0)");

            lastxkk_inputs.each(function () {
                //var reg=/^[^a-zA-Z0-9]$/g;//匹配字符串中的非字母【即中文和数字】
                //var thisnewstr=$(this).attr("name").replace(reg,"");//把匹配到的中文和数字替换为空
                var nameParentStrs = $(this).attr("name").split('.')[0] + "." + $(this).attr("name").split('.')[1];
                var nameStrs = $(this).attr("name").split('.')[2];

                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
                if ($(this).attr("value") == "增加" || $(this).attr("value") == "删除") {

                } else {
                    $(this).attr("value", "");
                }
            });

            var lastxkk_iname = $("#dkk").children(".xkk:last").children().find("input[class=input iname]");//为刚刚创建的元素里的class=input iname的input动态添加验证
            lastxkk_iname.each(function () {
                $(this).rules("add", {required: true, maxlength: 64, messages: {required: "请输入", maxlength: "64字符以内"}});
            });
            var lastxkk_inumbers = $("#dkk").children(".xkk:last").children().find("input[class=input inumber]");//为刚刚创建的元素里的class=input inumber的input动态添加验证
            lastxkk_inumbers.each(function () {
                $(this).rules("add", {
                    required: true,
                    number: true,
                    maxlength: 18,
                    messages: {required: "请输入", number: "请填写数字", maxlength: "18字符以内"}
                });
            });
            var lastxkk_laydates = $("#dkk").children(".xkk:last").children().find("input[class=input laydate-icon]");
            lastxkk_laydates.each(function () {
                $(this).rules("add", {
                    required: true,
                    isDate: true,
                    messages: {required: "请输入", isDate: "日期格式如：2016-08-12"}
                })
            });


            //alert(xkks.length);
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
			if (objid != 0 && xkks.length>1) {
		            $.post('/userextend/deleteCore.html',{ id : objid }, function (data) {
		
		                if (data.msg == 'erro'){
		                    alert("删除失败，请稍后再尝试！");
		                } else {
		                	alert("删除成功！");
		                    removeCore(objbl);return false;
		                }
		            }, 'json');
		    }else if(objid != 0 && xkks.length==1){
		        	ggts2('至少留一栏！');return;
		        	
		    }else if(objid == 0 && xkks.length>1){
		            removeCore(objbl);return false;
		            
	        }else if(objid == 0 && xkks.length==1){
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
                    nameParentStrs = nameStr.split('.')[0] + "." + nameStr.split('.')[1];
                    nameStrs = nameStr.split('.')[2];
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
                    nameParentStrs = nameStr.split('.')[0] + "." + nameStr.split('.')[1];
                    nameStrs = nameStr.split('.')[2];
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
    
            //点击保存,不验证isNotNull
        $('.baocun').click(function(){
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
	                                            /* if(checkfilehidden(true)){ */
		                                            buttonDefaultValue = $(this).val();
	                                                countDown(this,5);
	                                                nativeNum("isBankZint");//还原为数字
	                                            	$("#form1").submit();//改变链接并提交
	                                            /* }else{
	                                            	//alert("提交失败!");
	                                             	return;
	                                            } */
	                                           
												
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
 </script>
</body>
</html>