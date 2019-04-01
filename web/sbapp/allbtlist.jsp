<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.winpow.services.manage.activities.bean.Activities" %>
<%@page import="com.winpow.core.util.StringUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>
<!DOCTYPE html>
<html>
<head>
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.dialogbox.css">
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog/jDialog.css"
          type="text/css">
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/skin/default/layer.css"></script>

    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <script type="text/javascript"
	src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_download.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer2.js"></script>

<style type="text/css">
.sbhz_mask,.sbhz_mask *,#ycacti *{box-sizing:border-box;}
 .sbhz_mask{display:none;position:fixed;top:0;left:0;z-index:10000;overflow:hidden;width: 100%;height:100%;background: rgba(0,0,0,0.6)}
        .sbhz_box{width:860px;height:90%;position: absolute;top:50%;left:50%;background:#fff;/*margin-top:-50px;*/
            transform:translate(-50%,-50%) /*scale(0.5)*/;transition: 0.3s ease-out 0.1s;
            padding:25px 30px 0;color:#333;line-height: 33px;
            /*box-shadow: 3px 3px 9px rgba(0,0,0,0.2)*/
        }
     .sbhz_box li ul{  padding-bottom:15px; border-bottom: 1px dashed #ddd;}
    .sbhz_box li{float:left;}
    .sbhz_all{position:relative;border:1px solid #dfdfdf;width:800px;height: 90%;border-radius: 5px;}
    .sbhz_one{width:100%;height:70px;background:#dcdfe1 ;padding:2px 3.5px;    border-radius: 0 0 5px 5px;border-bottom:2px solid #dfdfdf; }
    .sbhz_one li{position: relative;width:261.6px;height:65px;line-height:65px;border-radius: 5px;cursor: pointer;}
    .sbhz_one img{float:left; margin-top: 16px;}
    .sbhz_one li>span{display: block;  padding-left: 70px;}
    .sbhz_one li.active{background: #fff;}
    .sbhz_one li.active i{display:inline-block;    z-index: 100;width:28px;height:9px;position:absolute;top:67px; background: url("../icon/sbhz-sanjiao.png")}
    .sbhz_one li b{position: absolute;width:34px;height:27px;margin-left:20px;text-align: center;border-radius: 5px;line-height: 27px;color:#fff;top: 21px;  left:0;  font-weight: normal;font-size:17px;}
    .sbhz_content{padding:10px 30px 40px 42px;    height: calc(100% - 70px);overflow-y: auto;}
    .sbhz_content>li{display: none;width:100%;}
    .sbhz_content>li.active{display: block;}
    .sbhz_content h2{font-size:16px;font-weight: normal;margin:10px 0 5px;}
    .sbhz_content h2 img{float:left;margin:8px 7px 0 0;}
    .sbhz_content>li li{margin:6px 33px 6px 0;min-width: 118px;  position:relative;  float: none;display: inline-block;}
   .sbhz_content>li li>span{position:relative;display:inline-block; border-radius: 3px;font-size:14px;padding:0 15px;border:1px solid #dcdfe1;background:#dcdfe1;color:#aaa;cursor: pointer;}
    .sbhz_content>li li>span.can{background:none;border-color:#ff6600;color:#333;}
     .sbhz_content>li li>span em{position:absolute;top:40px;left:-20px;    background:url("../icon/tip-title.png") no-repeat ;display:none;
   				 z-index: 100;    font-style: normal;line-height:18px;    width: 180px;  left: 50%;
   				 margin-left: -90px;  padding:9px 0px 2px 11px;font-size: 13px;   color: #fff;border-radius:3px;}
     
     .sbhz_content>li li>span:hover em{display:block;}
     .sbhz_content>li li>span.can em{display:none;top:34px; width:100px;margin-left: -50px; padding: 37px 0 5px; text-align: center; background:url("../icon/tit-hover.png") no-repeat 0 bottom;}
   .sbhz_content>li li>span.can:hover em{display:block;}
   .sbhz_content>li li>span.can em:hover{background-image:url("../icon/tit-hoverOn.png")}
   .sbhz_content>li li>span.active{background:#ff712b;color:#fff;}
   .sbhz_content>li li>span>b{display:none;position:absolute;width:21px;height:21px;bottom:-5px;right:-7px;background: url("../icon/sbhz-check.png") no-repeat 0 0;}
   .sbhz_content>li li>span.active>b{display:block;}
   .sbhz_tj{text-align:center;cursor: pointer;border-radius:5px;display: inline-block;width:100px;height:35px;line-height:35px;margin:10px 5px;color:#fff;background:#ff6600; }
  #sbhz_tj.f {background:#ff6600;}
  #sbhz_tj{background:#dcdfe1;}
    .sbhz_tj:hover{background:#eb5404;}
   .sbhz_content i{display:inline-block;width:20px;height:12px;background: url("../icon/hot.gif") no-repeat;position: absolute;top:-5px;right:-10px;}
   #showMask,#daochu{margin:0;width: 70px;height: 35px;line-height: 35px;}
   #daochu{width:170px;margin-right:90px;background:#3dc16b;}
    .zc_detail{width:860px;height:100%;        padding: 25px 30px 0;
    font-size: 15px;position:absolute;top:0;left:0;z-index: 1000;display:none;}
.zc_detailbox{width:100%;height:88%;overflow-y:auto; padding: 20px 20px 0;line-heigth:30px;}
#policy_name{font-size: 17px;}
#closeDetail{    display: block; width: 80px; height: 30px;margin: 10px auto;line-height: 28px;text-align: center; border: 1px solid #444;
    color: #333; font-size: 14px;cursor: pointer;}
.zc_border{box-shadow: 5px 5px 10px rgba(0,0,0,0.2);background: #f9f9f9;  border: 1px solid #ccc;height: 94%;width: 100%;}
#shenbao{display: none;}




		.sbhz_mask2,.sbhz_mask2 *{box-sizing:border-box;font-size:14px;color: #333;}
		.sbhz_mask2{display:none;position:fixed;top:0;left:0;z-index:10000;overflow:hidden;width: 100%;height:100%;background: rgba(0,0,0,0.6)}
		.sbhz_box2{width:600px;height:380px;position: absolute;top:50%;left:50%;background:#fff;
            margin:-180px 0 0 -300px;
            /*transform:translate(-50%,-50%);transition: 0.3s ease-out 0.1s;*/
            padding:25px 30px 0;color:#333;line-height: 33px;}
		.sbhz_box2 li ul{padding-bottom:15px;border-bottom: 1px dashed #ddd;}
		.sbhz_box2 li{float:left;}
		.sbhz_all2{position:relative;border:1px solid #dfdfdf;width:100%;height: 83%;border-radius: 5px;padding:5% 7%;}
		.sbhz_tj2{text-align:center;cursor: pointer;border-radius:3px;display: inline-block;width:70px;height:30px;line-height:30px;margin:10px 5px;color:#fff;background:#ff6600;}
		#sbhz_tj2.f{background:#ff6600;}
		#sbhz_tj2{background:#dcdfe1;}
		.sbhz_tj2:hover{background:#eb5404;}
		#receipt_form>div{margin-bottom:15px;}
		.sbhz_all2 input{font-family:"微软雅黑";margin-left:5px;font-size:14px;color:#666;}
		.sbhz_tj2{font-family:"微软雅黑";margin-top:15px;}
		.ceinput{border:1px solid #E0E0E0;padding:6px 8px;width: 300px;}



/*.layui-layer-dialog {  width:65%;height:75%;}*/
.layui-layer-title{font-size: 17px;  font-weight: bold;}
.layui-layer-content{height:calc(100% - 140px)}
.layui-layer-content>div{max-width: 750px;max-height:400px;}
.layui-layer-dialog .layui-layer-content{font-size: 15px;line-height: 32px; color:#444;}
.layui-layer-dialog .layui-layer-content b{font-weight: bold;}
.layui-layer-btn{text-align: center;border-top: 1px solid #eee;padding:8px 0 6px 0;width: 97%;margin:0 auto;}



</style>

</head>
<body>
<div id="shenbao"><%out.print(SystemManager.CONFIGS.get(Config.ZHENGCHESHENBAO));%></div>
<div id="policyconfirm" style="display: none;"><%out.print(SystemManager.CONFIGS.get(Config.POLICYCONFIRM));%></div>
<div id="nowpichi" style="display: none;"><%out.print(SystemManager.PICHI);%></div>
<div id="myConfirm">
	<h4></h4>
	<p><a href="javascript:volid(0);" class="sure" >确认</a><a href="javascript:volid(0);" class="cancel" >取消</a></p>
</div>

<script>
    $(function () {
        //$(".zgezhaoceng").width(body).width();
//		$('.zgezhaoceng').height(body).height();
        //$('.zgezhaoceng').css('left',0);
        //$('.zgezhaoceng').css('top',0);
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
        <div class="shjlTab">
            <div class="shjl_tit ov">
                <h2 class="fl">审核记录</h2>
                <span class="fr shjl_close">&times;</span>
            </div>
            <div class="shjl_over">
                 <table class="sbhzTab" >
                    <thead>
                        <tr class="TT">
                            <td>时间</td>
                            <td>动作</td>
                            <td>处理人</td>
                            <td>意见</td>
                        </tr>
                    </thead>
                    <tbody>
                    
                    </tbody>
                </table>
                
            </div>
        </div>
        <div class="rightbox">
            <div id="peixunhuodong" class="vipinfo">
                <div class="title" style="height:auto;line-height:30px; background-position: 11px 2px;">
                    
                    <li>
                        <div class="ov">
                            <span class="t" style="line-height:30px; ">企业名称：${name}</span>
                            <span class="sbhz_tj fr" id="showMask">新增</span>
                            <span class="sbhz_tj fr" id="daochu" onclick="getPDF();">导出资金计划通知</span>
                        </div>
                    	<span style="color:red;font-size:14px;    display: inline-block; padding-bottom: 3px;margin-top:8px;">
                    		<!-- 提示：申报截止日期2017年11月17日，状态为【审批通过】才能生成资料。 -->
                    		<!--成都高新区财政金融局审批通过后会有金额展示，可点击【导出收据】下载收据！-->
                                                                                     状态为【审批通过】时可以导出申请资料，高新区财政金融局审批通过后点击【确认金额】，进行申报审核金额确认。
                    	</span>
                    	

                    	
                    	<%--
                    	<span class="t">企业名称：${name}</span>
	                    <a href="/declare_pj/toFrontAdd.html?type=${type}&t=a">
	                    	<span id="CreateTBpxhd" class="update">新增一条申报补贴</span>
	                    </a>
	                    --%>
	                    
                    </li>
                </div>
                <table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr class="TT">
                        <td>批次</td>
                        <td>申报项目</td>
                        <td style="width: 94px;">录入日期</td>
                        <td style="width:72px;">状态</td>
                        <td style="display: none;">审核金额(万元)</td>
                        <td style="width:365px;">操作</td>
                    </tr>
                    <s:iterator value="#request.list">
                        <tr>
                            <td>${pichi }</td>
                            <td><s:if test="type == 'btz'">股权融资奖励</s:if>
                                <s:elseif test="type == 'czbg'">并购重组奖励</s:elseif>
                                <s:elseif test="type == 'gfzgz'">改制奖励</s:elseif>
                                <s:elseif test="type == 'ipo'">上市受理奖励</s:elseif>
                                <s:elseif test="type == 'jwzb'">境外上市奖励</s:elseif>
                                <s:elseif test="type == 'kjbx'">科技保险补贴</s:elseif>
                                <s:elseif test="type == 'rzzn'">融资租赁补贴</s:elseif>
                                <s:elseif test="type == 'yggqjl'">股权激励奖励</s:elseif>
                                <s:elseif test="type == 'zwrz'">发债贴息</s:elseif>
                                <s:elseif test="type == 'zzgb'">转增股本奖励</s:elseif>
                                <s:elseif test="type == 'interest'">贷款贴息</s:elseif>
                                <s:elseif test="type == 'ssgp'">上市挂牌奖励</s:elseif>
                                <s:elseif test="type == 'pj'">信用评级补贴</s:elseif>
                                <s:elseif test="type == 'common'">${nssjys }</s:elseif>
                                <s:elseif test="type == 'gp'">${nssjys }</s:elseif>
                                <s:elseif test="type == 'border'">${nssjys }</s:elseif>
                            </td>
                            <%--<td>&nbsp;<s:property value="lurushijian"/></td>--%>
                            <td><fmt:parseDate value="${lurushijian}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${date}" pattern="yyyy-MM-dd "/>
                            </td>
                            <td class="allstatus" pichi='${pichi }'><% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("status")); if( o != null){
                                out.print(o.getName());}%></td>
							<td style="display: none;">${xtjsje }</td>
                            <td>
                                <input type="hidden" id="url" value="<s:if test="type == 'btz'">/declare_btz/toFrontEdit.html</s:if>
                                <s:elseif test="type == 'czbg'">/declare_czbg/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'gfzgz'">/declare_gfzgz/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'ipo'">/declare_ipo/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'jwzb'">/declare_jwzb/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'kjbx'">/declare_kjbx/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'rzzn'">/declare_rzzn/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'yggqjl'">/declare_yggqjl/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'zwrz'">/declare_zwrz/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'zzgb'">/declare_zzgb/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'interest'">/interestapp/tostep1.html</s:elseif>
                                <s:elseif test="type == 'ssgp'">/declare_ssgp/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'pj'">/declare_pj/toFrontEdit.html</s:elseif>
                                <s:elseif test="type == 'common'">${zcfx }</s:elseif>
                                <s:elseif test="type == 'gp'">${zcfx }</s:elseif>
                                <s:elseif test="type == 'border'">${zcfx }</s:elseif>">
                                
                                
                            	<input class="an xg op  opl" msg="<s:if test="type == 'btz'"><s:if test="leibie == 1">hlwbt</s:if><s:else>kjcxbt</s:else></s:if>" lang="<s:property value="id"/>" type="button" value="修改" class="pxhdjs">
                            	
                            	<input class="an ck op opr" msg="<s:if test="type == 'btz'"><s:if test="leibie == 1">hlwbt</s:if><s:else>kjcxbt</s:else></s:if>" type="button" value="查看" lang="<s:property value="id"/>">
                            	
                                <%--<input class="an xzp op oprd"  type="button" value="" onclick="location.href='declare_pj/exportPDF.html?id=<s:property value="id"/>&zcfx=<s:property value="zcfx"/>'"  title="导出pdf"  >--%>
                                <input class="an xzw op oprd"  type="button" value="导出资料" leibie="${leibie }" ty="${type }"
                                <s:if test="type == 'btz'"><s:if test="leibie == 1"> msg="hlwbt"</s:if><s:else> msg="kjcxbt"</s:else></s:if>
                                <s:elseif test="type == 'czbg'"> msg="czbgbt"</s:elseif>
                                <s:elseif test="type == 'gfzgz'"> msg="qygzbt"</s:elseif>
                                <s:elseif test="type == 'ipo'"> msg="ipohjbt"</s:elseif>
                                <s:elseif test="type == 'jwzb'"> msg="jwsscgbt"</s:elseif>
                                <s:elseif test="type == 'kjbx'"> msg="kjbxbt"</s:elseif>
                                <s:elseif test="type == 'rzzn'"> msg="rzznbt"</s:elseif>
                                <s:elseif test="type == 'yggqjl'"> msg="yggqbt"</s:elseif>
                                <s:elseif test="type == 'zwrz'"> msg="zwrzbt"</s:elseif>
                                <s:elseif test="type == 'zzgb'"> msg="zzgbbt"</s:elseif>
                                <s:elseif test="type == 'interest'"> msg="txdb"</s:elseif>
                                <s:elseif test="type == 'ssgp'"> msg="sscgbt"</s:elseif>
                                <s:elseif test="type == 'pj'"> msg="xypjbt"</s:elseif>
                                <s:elseif test="type == 'common'"> msg="${type }" pid="${leibie }"</s:elseif>
                                <s:elseif test="type == 'gp'"> msg="${type }" pid="${leibie }"</s:elseif>
                                <s:elseif test="type == 'border'"> msg="${type }" pid="${leibie }"</s:elseif>
                                       title="导出申报资料"  lang="<s:property value="id"/>"  >
                                <input class="an ck op delete" type="button" value="删除" lang="${id}" msg="${type}" disabled>
                                <!--审核记录-->
                                <input class="an ck op  shjl" type="button" lang="${id}" msg="${policyid}" value="审核记录"/>
                                <!--确认金额-->
                                <input class="an amtconf op" style="display: none;" value="确认金额" type="button" lang="${id}" msg="${type}" xtjsje="${xtjsje }" status="${status}" amtconfirm="${amt_confirm }" pichi="${pichi }" disabled="disabled"/>
                            </td>
                        </tr>
                    </s:iterator>
                </table>
				<div id="shenbao"><%out.print(SystemManager.CONFIGS.get(Config.ZHENGCHESHENBAO));%></div>
                <script type="text/javascript">
                
                $(".allstatus").each(function(){
					if ($(this).html() == "审批通过" && $(this).attr("pichi")==$("#nowpichi").html()) {
						$(this).html("审批通过");
					}
				});	
                
                
                
               	var change = $.trim($('#shenbao').text());
               	
				if (change != 1 || ${servertime} > 1541001599000) { //定时关闭新增功能
                    /* $("#ycacti .opl").each(function () {
                        var stateinput = $(this).parent().prev().prev().html();
                        if (stateinput == "未提交" || stateinput == "审批通过") {
                            $(this).hide().removeAttr("lang").addClass('padd').attr('disabled','disabled');
                        }
                        $("#showMask").remove();
                    }); */
                    $("#showMask").remove();
					//$('.opl').hide().removeAttr("lang").addClass('padd').attr('disabled','disabled');
					//$('.opl').remove();
				}
				
				
				
                $('#ycacti tr td:nth-child(4)').each(function(){
                	var text=$.trim($(this).text());
                	if(text=="驳回"||text=="未提交"){
                		//$(this).next().next().find('.delete').removeAttr('disabled');
                	}
                })
                $("#ycacti .delete").click(function(){
                	
                	if(window.confirm("当前操作不可能恢复，确认删除吗？")){	
                	 $.ajax({
                         type: "POST",
                         url: "/userextend/delDeclare.html",
                         data: {
                        	 	id:$(this).attr('lang'),
                        		type:$(this).attr('msg')
                        	 },
                         dataType: "text",
                         success: function(data){
                        	 alert(data);
                        	 if($.trim(data)=="删除成功！"){
                        		 window.location.reload()
                        	 } 
                         }

                     });
                	}
                	
                })
                
                
                
                    //只有‘未提交’才可以修改
                    var opls = $("#ycacti .opl");
                    var oprs = $("#ycacti .opr");
                    opls.each(function () {
                        var stateinput = $(this).parent().prev().prev().html();
                        if (stateinput != "未提交" && stateinput != "驳回") {
                            $(this).attr("disabled", "true");
                            $(this).removeClass("op").addClass("padd");
                            //$(this).next().attr("disabled","false");
                            //$(this).next().removeClass("op");
                        }


                    });
                    $(".showh").hover(function () {
                        $(this).children("span").show();
                    }, function () {
                        $(this).children("span").hide();
                    });

                    //修改
                    opls.click(function () {
                    	var url = $(this).prev().val().trim();
                        var id = $(this).attr("lang");
                        var type = $(this).attr('msg');
	                    if (change != 1 || ${servertime} > 1541001599000) { //定时关闭新增功能
	                    	var shjl = $(this).siblings(".shjl");
	                    	var id = shjl.attr('lang');
	                    	var policyid = shjl.attr('msg');
	                    	$.ajax({
		                        type: "post",
		                        url:"declare_base/getReviewLog.html?id="+id+"&policyid="+policyid,
		                        async: false,
		                        success: function(data) {
		                            if (data.length == 0) {
		                               alert("申报系统已关闭，当前政策不能修改！");
		                            } else {
		                            	location.href = url + "?id=" + id + "&type=" + type;
		                            }
		                        }
		                    });
	                    } else { 
	                    	location.href = url + "?id=" + id + "&type=" + type;
	                    }
                    });
                    //查看
                    oprs.click(function () {
                        var url = $(this).prev().prev().val().trim();
                        var id = $(this).attr("lang");
                        var type = $(this).attr('msg');
                        location.href = url + "?id=" + id + "&t=v" + "&type=" + type;
                    });
                    
                
				
				
				
 				var beginDate="2018-03-01"; //这之前的数据都不能导出
                var d1 = beginDate.replace(/-/g, "");
				var oprds = $("#ycacti .oprd");
				oprds.each(function(i,v){
					var stateinput= $.trim($(this).parent().prev().prev().html());
					var endDate= $.trim($(this).parent().prev().prev().prev().html());
				 	var d2 = endDate.replace(/-/g, "");//录入日期
				if (stateinput != "审批通过" || d2 < d1) { //注释后全部不能点
						$(this).attr("disabled","true");
						$(this).removeClass("op").addClass("padd3");
					}
				});


				//导出资料跳转链接
				oprds.click(function(){
					var id=$(this).attr("lang");
					location.href="#";
				});
				
				

               

                $('.shjlTab .shjl_tit .shjl_close').click(function(){
                    $('.shjlTab').fadeOut(200);
                })
                $('.rightbox #ycacti').delegate(' tr>td input.shjl','click',function(e){
                    e.stopPropagation();
                    $('.shjlTab').fadeIn(200);
                    var id=$(this).attr('lang');
                    var policyid=$(this).attr('msg');
                    $.ajax({
                        cache: true,
                        type: "POST",
                        url:"declare_base/getReviewLog.html?id="+id+"&policyid="+policyid,
//                        data:{
//                                'id':id
//                        },
                        async: false,
                        error: function(request) {
                            // alert("请求出错");
                        },
                        success: function(data) {
                            $('.sbhzTab tbody').html('');
                            if(data.length==0||data==""){
                                $('.sbhzTab tbody').html('<p>暂无审核记录！</p>');
                            }
                            for(var i=0;i<data.length;i++){
                                var tr="";
                                tr+='<tr><td>'+data[i].inputtime+'</td><td>'+data[i].result +'</td><td>'+data[i].inputuser+'</td><td>'+data[i].review_opinion+'</td></tr>';
                                $('.sbhzTab tbody').append(tr);
                            }
                        }
                    })
                })

                </script>
            </div>
        </div>
    </div>
</div>

<div class="sbhz_mask"><!--黑色大背景-->
    <div class="sbhz_box">
        <div class="sbhz_all">
            <ul class="sbhz_one tc">
                <li class="active"><b style="background: #15A1EA;" id="type1Count">14</b><span go="#kindOne"  class="active">支持金融服务实体经济</span><i></i></li><img src="/icon/sbhz-line.png">
                <li><b style="background: #FF712B;" id="type2Count">39</b><span go="#kindTwo">支持提升金融产业能级</span><i></i></li><img src="/icon/sbhz-line.png">
                <li><b style="background: #53BC45;" id="type3Count">11</b><span go="#kindThree">支持构建金融生态圈</span><i></i></li>
            </ul>
            <ul class="sbhz_content">
                <li id="kindOne" class="active">
                    <!-- <h2 class="toptitle">创新债权融资补贴</h2>
                    <ul>
                        <li><span class="active">贷款贴息<i></i></span></li>
                        <li><span>发债贴息</span></li>
                        <li><span>融资租赁补贴</span></li>
                    </ul>-->
                <li id="kindTwo"></li>
                <li id="kindThree"></li>
            </ul>
        </div>
        <div class="zc_detail">
        <div class="zc_border">
         <div class="zc_detailbox">
	        <p><b id="policy_name">贷款贴息</b></p>
	        <p><b>申报项目和标准：</b><span id="sub_describe"></span></p>
	        <p><b>补贴金额：</b><span id="sub_amount"></span></p>
	        <p><b>申报条件：</b><br><span id="sub_condition"></span></p>
	        <p><b>申报资料：</b><br><span id="sub_materials"></span></p>
	        <p><b>申报时间：</b><span id="sub_time"></span></p>
	        <p><b>受理部门：</b><span id="accepting_department"></span></p>
	        <p><b>申报网址：</b><span id="sub_platform"></span></p>  
	        </div>
	        <span id="closeDetail">关闭详情</span>
	        </div>
        </div>
<p style="text-align:center;"> <a href="" id="sbhz_tj" class="sbhz_tj">确定</a>
        <span id="sbhz_close" class="sbhz_tj">关闭</span></p>
       

    </div>
</div>


<div class="sbhz_mask2">
    <div class="sbhz_box2">
        <div class="sbhz_all2">
        <form id="receipt_form" method="post" action="/declare_base/downxls.html">
        	<input name="receipt_orgname" type="hidden" value="${name}"/>
        	<input name="receipt_xtjsje" type="hidden"/>
        	<input name="receipt_name" type="hidden"/>
        	<input name="receipt_type" type="hidden"/>
        	<input name="receipt_policyid" type="hidden"/>
        	<input name="receipt_url" type="hidden"/>
        	<div><span>收款单位户名&#12288;：</span>${name}</div>
        	<div><span>收款单位开户行：<span style="color:red">*</span></span><input class="ceinput" name="receipt_bank" type="text" maxlength="32" value="${receipt_bank }"/></div>
        	<div><span>收款单位帐号&#12288;：<span style="color:red">*</span></span><input class="ceinput" name="receipt_account" type="text" maxlength="32" value="${receipt_account }"/></div>
          	<div><span>收款人(自然人)：<span style="color:red">*</span></span><input style="margin-left:9px;" class="ceinput" name="receipt_payee" type="text" maxlength="16" value="${receipt_payee }"/></div>
            <div><span>联系电话&#12288;&#12288;&#12288;：<span style="color:red">*</span></span><input class="ceinput" name="receipt_phone" type="text" maxlength="11" value="${receipt_phone }" id="receipt_phone"/>
                <p style="color:red;padding-left: 130px;display: none;">联系电话输入有误！</p>
            </div>
        </form>
        </div>
		<p style="text-align:center;"> 
			<a href="javascript:void(0);" class="sbhz_tj2" onclick="downxls();">下载资料</a>
	        <span class="sbhz_tj2" onclick="$('.sbhz_mask2').hide();">关闭</span>
        </p>
    </div>
</div>

<form id="epdfform" style="display: none;" method="post" action="/declare_base/exportPdf.html">
	<input name="epdf" type="hidden" id="epdf"/>
</form>


 <%-- <%Cust u = (Cust)session.getAttribute(FrontContainer.USER_INFO);
if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001".equals(u.getUsertype())){%>
	<div style="display: none" id="usertype">1</div>
<%} else {%>
	<div style="display: none" id="usertype">2</div>
<%}%> --%>
<%@ include file="../footer.jsp" %>
<script type="text/javascript">
    leftnav_init("allbt");
</script>
<script>
	$(".ghjk").each(function(){
		if ($(this).attr("time").replace(/-/g, "") < 20180401){
			$(this).attr("disabled", true);
		}
	});
    $('.sbhz_one li').click(function(){
        $(this).addClass('active').siblings('.active').removeClass('active');
        $($(this).children('span').attr('go')).addClass('active').siblings('.active').removeClass('active');
    	$('.sbhz_content').scrollTop(0);
    });
    $('.sbhz_content>li').delegate(' li>span.can','click',function(){
        $(this).addClass('active').parents().siblings().find('span.active').removeClass('active');
        $(this).parents().parents().siblings('ul').find('span.active').removeClass('active');
        $(this).parents().parents().parents().siblings('li').find('span.active').removeClass('active');
        $('#sbhz_tj').attr('href','/userextend/toPolicy.html?id='+$(this).attr('href')).addClass('f');
    });
    
   $('.sbhz_content>li').delegate(' li>span.gray','hover',function(){
//	   console.log($(this).attr('lang'))
	   if($(this).attr('lang')==0){
    	$(this).append('<em>该政策未开放线上申报，<br>请联系相关人员。</em>');
    	}else{
    		$(this).append('<em>当前用户不能申请该政策，<br>如有疑问请联系系统管理员。</em>');
    	}
    	
    })
	 $('.sbhz_content>li').delegate(' li>span.gray','mouseout',function(){
		   $(this).find('em').remove();
	   })  
    /*  $('.sbhz_content>li').delegate(' li>span.can','hover',function(){
    	$(this).append('<em>点击查看该政策详情</em>');
    	
    })
   $('.sbhz_content>li').delegate(' li>span.can','mouseout',function(){
	   $(this).find('em').remove();
   }) */
   $('.sbhz_content>li').delegate(' li>span.can em','click',function(e){
	   e.stopPropagation();
//	   $('.zc_detail').fadeIn(200);
	   $('.zc_detailbox').scrollTop(0);
	  
	   var id=$(this).parent().attr('href');
	  
        $.ajax({
            cache: true,
            type: "POST",
            url:"/userextend/getPolicy.html?id="+id,
//            data:{}
            async: false,
            error: function(request) {
               // alert("请求出错");
            },
            success: function(data) {
//                $('#policy_name').html(data[0].policy_name);
//                $('#sub_describe').html(data[0].sub_describe);
//                $('#sub_amount').html(data[0].sub_amount);
//                $('#sub_condition').html(data[0].sub_condition);
//                $('#sub_materials').html(data[0].sub_materials);
//                $('#sub_time').html(data[0].sub_time);
//                $('#accepting_department').html(data[0].accepting_department);
//                $('#sub_platform').html(data[0].sub_platform);

                var text='<div><b>申报项目和标准：</b><p>'+data[0].sub_describe+'</p><b>补贴金额：</b><p>'+data[0].sub_amount+'</p><b>申报条件：</b><p>'+data[0].sub_condition+'</p><b>申报资料：</b><p>'+data[0].sub_materials+'</p><b>申报时间：</b><p>'+data[0].sub_time+'</p><b>受理部门：</b><p>'+data[0].accepting_department+'</p><b>申报网址：</b><p>'+data[0].sub_platform+'</p></div>'
                layer.alert(text, {
//                    icon: 1,
                    btn:"关闭",
                    title:data[0].policy_name,
                    skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
                })
            }
            })
   })
   
    
   
    	 $('#sbhz_tj').click(function(e){
    			if (dktxstat()) {
    				e.preventDefault();
    			    alert("您申请的申请贷款贴息不满1年，不能再次申请！");
    			} else if( $(this).attr('href')==""){
    		 		e.preventDefault();
    			    alert("请选择要填写的政策名称");
    		   }else{
    			   $('.sbhz_mask').hide();
    			   $('.sbhz_content>li li>span.active').removeClass('active');
    		   }
    	 })
 

    $('#newAdd').click(function(e){
        e.preventDefault();
        $('.sbhz_mask').fadeIn(300);
        $('.sbhz_content').scrollTop(0);
    });
    $('#showMask').click(function(){
        $('.sbhz_mask').fadeIn(300);
        $('.sbhz_content').scrollTop(0);
    });
    $('.sbhz_mask').click(function(){
        $(this).hide();
        $('.sbhz_content>li li>span.active').removeClass('active');
        $('#sbhz_tj').attr('href','').removeClass('f');
        $('.zc_detail').hide();
    });
    
    
    $('#sbhz_close').click(function(){
        $('.sbhz_mask').hide();
        $('.sbhz_content>li li>span.active').removeClass('active');
        $('#sbhz_tj').attr('href','').removeClass('f');
    });
    $(".sbhz_box").click(function(event) {
        event.stopPropagation();
    });
   
    $('#closeDetail').click(function(){
        $('.zc_detail').hide();   
    });
	if ($("#policyconfirm").html() == "10001") {
		$(".amtconf").each(function(){
			if ($(this).attr("status") == 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083' 
				&& $(this).attr("amtconfirm") != '10001' 
				&& $(this).attr("pichi") == $("#nowpichi").html()
				) {
				$(this).attr("disabled", false); 
				$(this).addClass("amtconfirm");
			}
			if ($(this).attr("amtconfirm") == '10001') {
				$(this).val("已确认金额");
			}
		});
	}
	
	$('.amtconfirm').click(function() {
		var amtmsg = "请确认您本项政策审核批准的金额为" + $(this).attr('xtjsje') + "万元";
		var aid = $(this).attr('lang');
		var atype = $(this).attr('msg');
		layer.confirm(amtmsg, {
			title: "提示",btn : [ '确定', '取消' ]
        }, function(index) {
            layer.close(index);
		 	$.ajax({
				type : "post",
				url : "/userextend/amtconfirm.html",
				data : {id: aid, type: atype},
				dataType : "text",
				success : function(data) {
					layer.confirm(data, {
						title:"提示",btn:['确定'],area: ['200px', '200px']
			        }, function(index) {
			            layer.close(index);
			            if ($.trim(data) == "确认成功！") {
							location.href = "/declare_base/selectAllBT.html";
						}
			        });
				}
			});
        });
	});

	/*****获取数据*****/
	var type1=[];
    var type2=[];
    var type3=[];
    function a(){
        $.ajax({
            cache: true,
            type: "POST",
            url:"/userextend/getPolicy.html",
            data:{
                id:""
            },
            dataType:"json",
            async: false,
            error: function(request) {
                //alert("请求出错");
            },
            success: function(data) {
            	//var usertype = '${usertype}';
            	

            	for (var i = 0; i < data.length; i++) {
            		var da = data[i];
            		var id=da.id;
            		var toptype_code = da.toptype_code;
            		var type_name = da.type_name;
            		var policy_name = da.policy_name;
            		var policy_type = da.policy_type;
            		var open_stat = da.open_stat;
            		var ishot = da.ishot;
            		var obj = null; 
            		$(".toptitle").each(function(){
            			if ($(this).html() == type_name) {
            				obj = $(this).next();
            			}
            		});
            		if (change != 1) {
            			open_stat = 0;
            		}
            		var c = "gray";
            		var em = "";
            		if (policy_type == 1 && open_stat==1) {
            			c = "can";
            			em= "<em></em>";
            		}
            		var hot = "";
            		if (ishot == 1) {
            			hot = "<i></i>";
            		}
            		var html = "<li><span href='"+id+"' class='" + c + "' lang='" + open_stat + "'>"  + policy_name + em +"<b></b>" + hot + "</span></li>";//可选 默认

            		var html1 = "<h2 class='toptitle'>" + type_name + "</h2><ul>" + html + "</ul>";
            		if (obj == null) {
	            		if (toptype_code == 100) {
	            			$("#kindOne").append(html1);
	            		} else if (toptype_code == 200) {
	            			$("#kindTwo").append(html1);
	            		} else if (toptype_code == 300) {
	            			$("#kindThree").append(html1);
	            		}
           			} else {
           				obj.append(html)
           			}
            	}

            	
            	
                $.each(data,function(i,val) {
                   var code = data[i].toptype_code;
                     if(code==100){
                          type1.push(data[i])
                     }else if(code==200){
                          type2.push(data[i])
                     }else if(code==300){
                          type3.push(data[i])
                     }
               });
                $('#type1Count').html(type1.length)
                $('#type2Count').html(type2.length)
                $('#type3Count').html(type3.length)

            }
        });
    }
    a();

    $(".toptitle").each(function(i){
    	console.log()
		$(this).append('<img src="/icon/tit-icon'+(i+1)+'.png"/>')
	});
    
    function showxtjsje(obj, url) {
    	$("#mon").html($(obj).attr("jine"));
    	var name = $.trim($(obj).parents("tr").children("td").first().next().html());
    	$("input[name='receipt_xtjsje']").val($(obj).attr("jine"));		//金额
    	$("input[name='receipt_name']").val(name);						//政策名称
    	$("input[name='receipt_type']").val($(obj).attr("ty"));		//类别
    	$("input[name='receipt_policyid']").val($(obj).attr("leibie"));	//policy ID
    	$("input[name='receipt_url']").val(url);
    	$('.sbhz_mask2').show();
    }
	
	function downxls(){
        reg = /^1\d{10}$/;
        var phone=$('#receipt_phone');
        if(!reg.test($(phone).val())){$(phone).next('p').show();return;}

		var bank = $("input[name='receipt_bank']").val();
		var account = $("input[name='receipt_account']").val();
		var payee = $("input[name='receipt_payee']").val();
		var phone = $("input[name='receipt_phone']").val();
		if (bank == "" || account == "" || payee == "" || phone == ""){
			alert("请填写！");
			return;
		}
		$("#ldksq").show();
        var divName = $("#ldksq_c");
        var top = ($(window).height() - $(divName).height())/2;
        var left = ($(window).width() - $(divName).width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        
        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
        
        //点击时内容框显示加载中图片,且下载按钮是隐藏
        //$(".delimglist").html("数据处理中，请稍等（大约10分钟后可在政策申报的“资料下载“里面去点击下载），下载后请用2010版的word");
        $(".download").hide();
        //找到下载文件的名称
        var mc = $(this).attr("accesskey");
            mc = "四川计算机行业审批PDF";
        
        //return ;
        var url = $("input[name='receipt_url']").val();
        $.ajax({
            url: url,
            type: "POST",
            data: $('#receipt_form').serialize(),
            dataType: 'text',
            beforeSend:function(data){ 
                $(".delimglist").html('<img src="/icon/loading.gif" />&nbsp;&nbsp;文件生成中....');
           },
            success: function(data){
                var data=JSON.parse(data);
                if(data== 0){
                    $(".delimglist").html("数据处理中，请稍等，（大约10分钟后可在政策申报的“文件下载“里面去点击下载），下载后请用2010版的word");
                    /*setTimeout(function () {
                        $("#ldksq").hide();
                    }, 12000);
                    countSecond($(".countDown")[0],12);*/
                    
                }else{
                    $(".delimglist").html(data.content);
                    if(data.code==0){   
                        $('#sbhz_tcqd').attr('href','/declare_uploader/selectList.html')     
                    }else{
                        $("#sbhz_tcqd").click(function(e){
                         e.preventDefault();
                            $("#ldksq").hide();
                        }); 
                    }
                     
                     
                    /*setTimeout(function () {
                        $("#ldksq").hide();
                    }, 12000);
                    countSecond($(".countDown")[0],12);*/
                    //var form = $('<form method="POST" action="declare_base/export.html?id='+ data +'"></form>>');
                   // form.appendTo('body').submit().remove();
                
                }
                
            },
            error: function () {
                /*setTimeout(function () {
                        $("#ldksq").hide();
                }, 12000);
                countSecond($(".countDown")[0],12);*/
            }
        })

        // var delps = $(".download");
        // 点击“下载到本地”按钮时异步发个请求到后台：
        // delps.click(function(){
        //    var choice=confirm("确认要下载吗？");
        //
        //    if(choice){
         //
         //        $.post("/declare_base/deletepic.html", {id : picid, userid : userid},function(data,status){
         //            //如果返回值为流生成成功1，则名称框里的加载中图片消失，显示对应名称，下载按钮显示、
         //           if(data==1){
         //              $(".delimglist").html(mc);
         //              $(".download").show();
         //           }else if(data==2){
         //                 //未生成下载流，则名称框里的加载中图片消失，显示“没有改下载文件！”，
         //              $(".delimglist").html("没有改下载文件！");
         //           }else{
         //               //未知错误
         //           }
         //
         //        },"json");
        //    }
        // });
        
        
        $("#ldksq_lose").click(function(){
            $("#ldksq").hide();
        });
        
        //点击取消按钮
        $(".res").click(function(){
            $("#ldksq").hide();
        });
        
		$('.sbhz_mask2').hide();
	}
</script>

<script type="text/javascript">
	function getTime() {	// 获取上一次政策申报时间
		var time = $.trim($("#nowpichi").html());
		var ntime = "";
		if (time.length == 6) {
			var year = time.substring(0, 4);
			var mon = time.substring(4, 6);
			if (mon == "04") {
				ntime = (year - 1) + "10";
			} else if (mon == "10") {
				ntime = year + "04";
			}
		}
		return ntime;
	}
	
	function dktxstat() {	// 上一次政策申报是否申请成功过贷款贴息
		var che = false;
		if ($('#sbhz_tj').attr("href").indexOf("717fe76c435d48dc82557e17ecf7a118") == -1) {
			return che;
		}
		$("#ycacti tbody tr").each(function(){
			var tr = $(this).html();
			if (tr.indexOf(getTime()) != -1 && 
				tr.indexOf("贷款贴息") != -1 &&
				tr.indexOf("审批通过") != -1) {
				che = true;
			}
		});
		return che;
	}
	
	function getPDF() {
		var arr = new Array();
		var x = 0;
		$("#ycacti tbody tr").each(function(i){
			if (i != 0) {
				var qiye = '${name}';
				var pichi = $.trim($(this).find("td").eq(0).text());
				var name = $.trim($(this).find("td").eq(1).text());
				var status = $.trim($(this).find("td").eq(3).text());
				var sum = $.trim($(this).find("td").eq(4).text());
				if (pichi=="201810" && status == "审批通过") {
					var obj = new Object();
					obj.qiye = qiye;
					obj.name = name;
					obj.sum = sum;
					arr[x++] = obj;
				}
			}
		});
		if (arr.length == 0) {
			layer.alert('当前批次没有审批通过的申请，无法导出！', {icon: 7, title : '提示'});
			return;
		}
		$("#epdf").val(JSON.stringify(arr));
		$("#epdfform").submit();
	}
	
	$(".allstatus").each(function(){
		if ($(this).html() == "审批通过" && $(this).attr("pichi")==$("#nowpichi").html()) {
			$(this).html("审批通过");
		}
	});
	
</script>

<%@ include file="tanchudownload.jsp" %>
</body>
</html>
 