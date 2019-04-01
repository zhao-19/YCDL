<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
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
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/publishguquanappedit.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css" />
	<script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
	<script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
</head>
<body>

<script type="text/javascript">
	var fadeflagv = '${guquan.shenhezhuangtai}';
	var t = '${t}';

	KindEditor.ready(function(K) {
		var editor = K.editor({
			allowFileManager : false
		});

		K('#insertfile').click(function() {
//			if(t=='v' || fadeflagv){
//				return;
//			}
			var val = $(this).attr("id");
			var inHeight = window.innerHeight;
			var inWidth = window.innerWidth;
			var outHeight = window.outerHeight;
			var outWidth = window.outerWidth;
			editor.loadPlugin('insertfile', function() {
				editor.plugin.fileDialog({
					insertfile : K('#insertfile').val(),
					clickFn : function(url, title) {

						K('#insertfile').val(url);
						K('#insertfile3').html(url.split('/').pop());
						K('#pptbox').css('display','block');
						editor.hideDialog();
						removError(val)
					}
				});
				var dlgH = $(".ke-dialog-default").height();
				var dlgW = $(".ke-dialog-default").width();
				//以下公式是计算出浏览器的居中位置
				var nTop = (inHeight - dlgH) / 2;
				var nLeft = (inWidth - dlgW) / 2;
				$('.ke-dialog-default').css({"top":nTop,"left":nLeft});
			});
		});

		//首页图片(179*248)：
		K('#tuijianpic').click(function() {
			if(t=='v' || fadeflagv){
				return;
			}
			var val = $(this).attr("id");
			var inHeight = window.innerHeight;  
			var inWidth = window.innerWidth;  
			var outHeight = window.outerHeight;  
			var outWidth = window.outerWidth;  
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					insertfile : K('#tuijianpic').val(),
					clickFn : function(url, title) {
						K('#tuijianpic').val(url);
						editor.hideDialog();
						removError(val);
						tuijian();
					}
				});
				var dlgH = $(".ke-dialog-default").height();
				var dlgW = $(".ke-dialog-default").width();
				//以下公式是计算出浏览器的居中位置
				var nTop = (inHeight - dlgH) / 2;
				var nLeft = (inWidth - dlgW) / 2;
				$('.ke-dialog-default').css({"top":nTop,"left":nLeft});
			});
		});
});
//如果填写之前有error错误提示，则用日期或时间插件完成时，若框框有值了，需要手动移除这个错误提示。框框本身不能手写。
function removError(val){
	$('#'+val).next().remove();
	var thisclass = $('#'+val).attr("class");
	var endIndex = thisclass.indexOf("error");
	var nowClass = thisclass.substring(0,endIndex);
	if(nowClass){
		$('#'+val).attr("class",nowClass);
		//然后动态关闭jQuery.validate验证
		$('#'+val).rules("remove");
	}
}
</script>
<style>
.error{border: none;background:none;}
label.error{border: 1px solid #f5694b!important;background:none;color: #f5694b;padding: 0 2px;display:inline-block;}
.ke-dialog{top:auto;left:auto;}
.gdqkinputs tr td input{width:auto;}
.fzlcx tr td .langtd{width:624px;}
.gdqkinputsx tr td .langtd{width: 474px;} 
</style>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>
<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="leftnav.jsp"%>
	</div>
	<div class="list fr">
		<div class="rightbox">
			
			<!-- 贴息申报    -->
			<div id="zaiquanxinxi-update" class="vipinfo" >
			
				<form id="publishguquanappedit" action="/usercenter/saveguquan.html" method="post">

					<div class="title"><li>股权信息</li></div>
						<input type="hidden" name="guquan.id" value="<s:property value='guquan.id'/>"/>
						<input type="hidden" name="t" id="t" value="<s:property value="#request.t"/>">
						<input type="hidden" name="buttonid" id="buttonid" >
						<input type="hidden" name="taskid" value="${taskid }" >
						
		 				<!--<p class="jg"><span  class="trleft" >股权项目信息：</span></p>-->
		 
						<div class = 'firstreaddiv'>
							<div class="inputtest inputtestl" style="width: 100%;">
								<span class="leftname leftnamel inmin">项目名称(20字以内)：<span style="color:red">*</span></span>
								<span class="rightinfo rightinfoinmin" style="width:565px;"><input style="width:565px;"  class="input" name="guquan.mingcheng" type="text" value="<s:property value='guquan.mingcheng'/>"/></span>
							</div>
							<div class="inputtest inputtestl" style="width: 99%;">
								<span class="leftname leftnamel inmin">项目/产品简介(800字以内)：<span style="color:red">*</span></span>
								<span class="rightinfo rightinfoinmin" style="width: auto;"><textarea style="width: 565px;min-height: 96px;display: block;" class="input" name="guquan.jianjie"  ><s:property value='guquan.jianjie'/></textarea></span>
							</div>
							<div class="inputtest inputtestl">
								<span class="leftname leftnamel inmin">核心竞争力(10字以内)：<span style="color:red">*</span></span>
								<span class="rightinfo rightinfoinmin"><input class="input" name="guquan.hexinjzl" type="text" value="<s:property value='guquan.hexinjzl'/>"/></span>
							</div>
							<div class="inputtest inputtestl">
								<span class="leftname leftnamel inmin">融资额度(万元)：<span style="color:red">*</span></span>
								<span class="rightinfo rightinfoinmin"><input class="input" name="guquan.rongziedu" type="text"  value="<s:property value='guquan.rongziedu'/>"/></span>
							</div>




							<div class="inputtest inputtestl">
								<span class="leftname leftnamel inmin">行业：<span style="color:red">*</span></span>
								<span class="rightinfo rightinfoinmin">
									<s:select list="%{#application.dic.guquanindustry.childs}" listKey="id"
														  listValue="name" name="guquan.hangye"
														  headerKey="" headerValue="" cssClass="select"/>
								</span>
							</div>

							<div class="inputtest inputtestl">
								<span class="leftname leftnamel inmin">融资阶段：<span style="color:red">*</span></span>
								<span class="rightinfo rightinfoinmin">
									<s:select list="%{#application.dic.guquanstage.childs}" listKey="id"
										listValue="name" name="guquan.rongzhijieduan" headerKey="" headerValue="" cssClass="select"/>
								</span>
							</div>
							<div class="inputtest inputtestl">
								<span class="leftname leftnamel inmin">项目所处阶段：<span style="color:red">*</span></span>
								<span class="rightinfo rightinfoinmin">
		                            <s:select list="%{#application.dic.e677910075c6406db2f9311f808dd63d.childs}" listKey="id"
										listValue="name" name="guquan.xiangmuzhuangtai" headerKey="" headerValue="" cssClass="select"/>
									</span>
							</div>
							<div class="inputtest inputtestl">
								<span class="leftname leftnamel inmin">出让股权比例(%)：<span style="color:red">*</span></span>
								<span class="rightinfo rightinfoinmin"><input class="input" name="guquan.crgqbl" type="text" value="<s:property value='guquan.crgqbl'/>"/></span>
							</div>

								<div class="inputtest inputtestl" style="width: 100%;">
									<span class="leftname leftnamel inmin" style="line-height: 27px;">上传项目计划书：<span style="color:red">*</span>
									</span>
									<span class="rightinfo rightinfoinmin" style="width: 70%;margin-bottom:8px">
										<input class="input"  id="insertfile"  name="guquan.jihuashu" value="<s:property value='guquan.jihuashu'/>" style="border: 0;"/>
									   <span id="insertfiletxt">（只允许pdf,ppt,pptx格式）</span>
									</span>
									<p id="pptbox">
										<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/pptbg.png" alt="" id="insertfile2">
										<b id="insertfile3">${guquan.jihuashu}</b>
									</p>

									<!--<input class="input" readonly="readonly"  id="insertfile2"  name="guquan.jihuashu" value="<s:property value='guquan.jihuashu'/>"/>-->
								</div>
								<!--<div class="inputtest inputtestl">-->
								<!--<span class="leftname leftnamel inmin"></span>-->
								<!--<span class="rightinfo rightinfoinmin"></span>-->
								<!--</div>-->
								<!--<div class="inputtest inputtestl">-->
								<!--<span class="leftname leftnamel inmin">项目图片：<span style="color:red">*</span></span>-->
								<!--<span class="rightinfo rightinfoinmin"><input type="text" class="input stext" id="tuijianpic" name="guquan.tuijianpic"  value="<s:property value='guquan.tuijianpic'/>"/></span>-->
								<!--</div>-->
								<!--<div class="inputtest inputtestl">-->
								<!--<span class="leftname leftnamel inmin" id="tuijianpicspan"></span>-->
								<!--<span class="rightinfo rightinfoinmin"></span>-->
								<!--</div>-->
								<script>
                                    KindEditor.ready(function (K) {
                                        var editor = K.editor({
                                            allowFileManager: false
                                        });
                                        var val = "";
                                        K('#bcard').click(function () {
                                            val = $(this).attr("id");
                                            editor.loadPlugin('image', function () {
                                                editor.plugin.imageDialog({
                                                    showRemote : false,
                                                    insertfile: K('#bcard').val(),
                                                    clickFn: function (url, title) {
                                                        K('#bcard').val(url);
                                                        K('#bcard2').val(url);
                                                        K('.imgbox>#bigimg').show();
                                                        K('.imgbox').css('display','block');
                                                        K('#topic_content>img').attr('src', url);
                                                        K('#topic_content').css('background','none');
                                                        editor.hideDialog();
                                                        removError(val);
                                                    }
                                                });
                                            });
                                        });

                                    });


                                    //如果填写之前有error错误提示，则用日期或时间插件完成时，若框框有值了，需要手动移除这个错误提示。框框本身不能手写。
                                    function removError(val) {
                                        $('#' + val).next().remove();
                                        var thisclass = $('#' + val).attr("class");
                                        var endIndex = thisclass.indexOf("error");
                                        var nowClass = thisclass.substring(0, endIndex);
                                        if (nowClass) {
                                            $('#' + val).attr("class", nowClass);
                                            //然后动态关闭jQuery.validate验证
                                            $('#' + val).rules("remove");
                                        }
                                    }
								</script>
								<div class="inputtest inputtestl showImg" style="width:100%;">
									<span class="leftname inmin ">上传项目图片：<span style="color:red">*</span></span>
									<span class="rightinfo bcard" >
									<input type="button" class="input"  id="bcard" name="guquan.tuijianpic" value="<s:property value='guquan.tuijianpic'/>" style="border:0;"/>
								 </span>
									<span class="rightinfo bcard">
									  <input readonly="readonly"  type="hidden" class="input"  id="bcard2" name="guquan.tuijianpic" value="<s:property value='guquan.tuijianpic'/>"/>
								 </span>
									<div class="imgbox">
										<div id="topic_content">
											<img src="${guquan.tuijianpic}">
											<!--<s:if test="guquan.tuijianpic!=null&&guquan.tuijianpic!=''"><img src="${guquan.tuijianpic}"></s:if>-->
										</div>
										<i style="font-style:normal;font-size:12px;color:#bbb;display:none;" id="bigimg">点击图片查看大图</i>
									</div>
								</div>

							<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/drag/dragImg.js"></script>

							<style>
								#insertfiletxt{font-size: 12px; }
								#insertfile2{  width:40px; vertical-align: middle;}
								#pptbox{display: none;margin-left:200px;}
								#insertfile3{ font-weight: normal; font-size: 10px; color: #999;}
								.creditor .vipinfo .inputtestl{margin-bottom:15px;}
								.row{width: 100% !important;float:left;}
								#form1 input,radio,select,textarea,checkbox{border:0;}
								.creditor .vipinfo .inputtest .rightinfo.bcard{width: 240px;}
								.creditor .vipinfo .inputtest .rightinfo.bcard .error{margin:4px 0 0 6px;}
								/*营业执照按钮*/
								#bcard,#insertfile{float:left;color:transparent;background:#FF5722 url(<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/upload.png) no-repeat 47% 7px;width: 152px; cursor:pointer;padding-left:31px;border-radius:2px;
									box-sizing: border-box;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;}
								#bcard:hover,#insertfile:hover{opacity: 0.8;}
								.showImg{position:relative; overflow:visible !important;cursor:pointer;}
								.showImg div.none{width:80%;text-align:center;position:absolute;top:38px;left:50%;/*border:1px solid #ddd;*/background: #fff;
									transform:translateX(-50%);-ms-transform:translateX(-50%); 	-moz-transform:translateX(-50%); -webkit-transform:translateX(-50%); -o-transform:translateX(-50%);
									box-shadow: 1px 2px 6px rgba(0,0,0,0.2)
								}
								.showImg .rightinfo{text-overflow: ellipsis;overflow: hidden;}
								/*缩略图*/
								.imgbox{width:150px;height:150px;text-align:center;margin:6px 0 0 200px;display:none;}
								.imgbox #topic_content{width:100%;height:80%;border:1px solid #ddd;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/sc-default.jpg") no-repeat 0 0;margin-top: 40px;}
								.imgbox #topic_content>img{width:100%;height:100%;}
								/*全屏放大图*/
								#imglayer_bg {position:fixed;top:0;left:0;width:100%;height:100%;background:#000 url(/image/imglayer_loading.gif) no-repeat center center;;opacity:0.7;filter:alpha(opacity=70);z-index:9995;display:none;}
								#imglayer_border {max-width:60%;height:100%;position:fixed;top:0;left:0;z-index:9996;margin:20px;display:none;}
								#imglayer_zoom{display:block;border:0;max-height: 100% !important;}
								#imglayer_x{display:block;position:absolute;width:40px;height:40px;z-index:9997;outline:none;right:-20px;top:-20px;background:url(http://static.epaidai.com/images/bbs/topic/imglayer_ico.png) no-repeat;}
								#imglayer_x:hover {background-position:0 -40px;}
							</style>


						</div>
				
						<div class="revise" id="zqxxxgbtn" >
							<input class="shenqingdkt upback" type="button" value="返回"/>&nbsp;&nbsp;
							<input class="shenqingdkt shenqingdkthide" type="submit" value="保存"/>&nbsp;&nbsp;
							<s:if test="#request.buttonlist==null">
								<input class="shenqingdkt shenqingdkttijiao" type="submit"
									value="提交" />
							</s:if>
							<s:else>
								<s:iterator value="#request.buttonlist" var="button" status="st">
									<input type="button" class="shenqingdkt oper"
										lang="<s:property value="id"/>"
										buttonid="<s:property value="#button.key" />"
										name="czdsteponetijiao"
										value="<s:property value="#button.val"/>">
									</td>

								</s:iterator>
							</s:else>
						</div>
				</form>					
			</div>	
			
		</div>
		
	</div>

</div>

 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 $('.oper').click(function(){
	 console.log(11);
	 $('#publishguquanappedit').valid();
	 console.log(22)
     $('#buttonid').val($(this).attr("buttonid"));
     
     $("#publishguquanappedit").attr("action","/usercenter/submit.html");
     $("#publishguquanappedit").submit();
 })
 	leftnav_init("publishguquanlist");
 </script>
 
 <script type="text/javascript">

	 if($('#insertfile').val()!=""){
         $('#pptbox').show();
         $('#insertfile3').html($('#insertfile3').html().split('/').pop())
     }
     if($('#topic_content>img').attr('src')){
         $('.imgbox').show();
         $('.imgbox>#bigimg').show();
         $('#topic_content').css('background','none');
     }

 	$(".shenqingdkttijiao").click(function(){
// 	    var geshi=$('#insertfile3').html().split('.').pop();
// 	    if(geshi=="pdf"||geshi=="ppt"||geshi=="pptx"){
            $("#publishguquanappedit").attr("action","/usercenter/submit.html");
            $("#publishguquanappedit").submit();
//		}else{
// 	        alert('项目计划书只允许pdf,ppt,pptx格式。')
//		}

	});

	if (t == 'v') {
		$("#publishguquanappedit input,radio,select,textarea,checkbox").attr('disabled',true);
		$("#zqxxxgbtn").remove();
		$('#bcard,#insertfile').hide();
		$('.imgbox #topic_content').css('marginTop','0');
		$('#insertfiletxt').hide();
	} else {
		publishguquanappedit();
	}

	function pichtml(url){
		return "<a target='_blank' href='" + url + "'><img style='max-width: 50px;max-height: 50px;' src='" + url + "'></a>";
	}

	function tuijian() {
		var tuijianpic = $("#tuijianpic").val();
		if (tuijianpic != "") {
			$("#tuijianpicspan").html(pichtml(tuijianpic))
	}
     }
 	tuijian();
 </script>
 
</body>
</html>