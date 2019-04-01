    <%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.winpow.core.front.SystemManager" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
                  
   <head>
     <title>盈创动力</title>
     <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css" />
     <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css" />
     <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
     <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
     <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
     <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css" />
     <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
     <script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
     <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_delimg.js"></script>
     <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
     <link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css" />
     <script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
     <script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
     <script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/drag/dragImg.js"></script>

        <style>
            .row{width: 100% !important;float:left;}
        .creditor .vipinfo .inputtest .rightinfo{width:152px;}
        .creditor .vipinfo .inputtest .input,.creditor .vipinfo .inputtest .select{width:100%;box-sizing:border-box;-webkit-box-sizing:border-box;-o-box-sizing:border-box;}
        .creditor .vipinfo .inputtest .leftnamel{width:235px;}
        #form1 input,radio,select,textarea,checkbox{border:0;}
        /*营业执照按钮*/
        .creditor .vipinfo .inputtest .rightinfo.bcard{display:none;}
        .creditor .vipinfo .inputtest .rightinfo.bcard .error{margin:4px 0 0 6px;}
        #bcard{float:left;color:transparent;background:#FF5722 url(<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/upload.png) no-repeat 47% 7px;width: 152px; cursor:pointer;padding-left:31px;border-radius:2px;}
        #bcard:hover{opacity: 0.8;}
        .showImg{position:relative; overflow:visible !important;cursor:pointer;}
        .showImg div.none{width:80%;text-align:center;position:absolute;top:38px;left:50%;/*border:1px solid #ddd;*/background: #fff;
        transform:translateX(-50%);-ms-transform:translateX(-50%); 	-moz-transform:translateX(-50%); -webkit-transform:translateX(-50%); -o-transform:translateX(-50%);
        box-shadow: 1px 2px 6px rgba(0,0,0,0.2)
        }
        .showImg .rightinfo{text-overflow: ellipsis;overflow: hidden;}
        /*缩略图*/
        .imgbox{width:150px;height:150px;text-align:center;margin:6px 0 0 245px;}
        .imgbox #topic_content{width:100%;height:80%;border:1px solid #ddd;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/sc-default.jpg") no-repeat 0 0;}
        .imgbox #topic_content>img{width:100%;height:100%;}
        /*全屏放大图*/
        #imglayer_bg {position:fixed;top:0;left:0;width:100%;height:100%;background:#000 url(/image/imglayer_loading.gif) no-repeat center center;;opacity:0.7;filter:alpha(opacity=70);z-index:9995;display:none;}
        #imglayer_border {max-width:60%;height:100%;position:fixed;top:0;left:0;z-index:9996;margin:20px;display:none;}
        #imglayer_zoom {display:block;border:0;max-height: 100% !important;}
        #imglayer_x {display:block;position:absolute;width:40px;height:40px;z-index:9997;outline:none;right:-20px;top:-20px;background:url(http://static.epaidai.com/images/bbs/topic/imglayer_ico.png) no-repeat;}
        #imglayer_x:hover {background-position:0 -40px;}
        </style>
     <script type="text/javascript">

     $(document).ready(function () {
    	    var backnotice = $("#backnotice").val(); //success  成功    erro 失败
    	    var backnoticebzf = $("#backnoticebzf").val(); // 1数据保存  2 数据提交
    	    //alert(backnotice+"**"+backnoticebzf);
    	    if (backnotice == 'success') {
    	        if (backnoticebzf == '1') {
    	            ggts2("数据暂存成功！");
    	            setTimeout(function () {
    	                    window.location = "/declare_base/toFrontBase.html?t=v";
    	                },
    	                1500);
    	        }
    	        if (backnoticebzf == '2') {
    	            ggts2("数据保存成功！");
    	            setTimeout(function () {
    	                    window.location = "/declare_base/toFrontBase.html?t=v";
    	                },
    	                1500);
    	        }
    	    }
    	    if (backnotice == 'erro') {
    	        if (backnoticebzf == '1') {
    	            ggts2("数据暂存失败！");
    	        }
    	        if (backnoticebzf == '2') {
    	            ggts2("数据保存失败！");
    	        }

    	    }

    	    var t = '${tbotherorg.t}'; //v 查看   u 修改  a 新增
    	    $(document).ready(function () {
    	        var t = '${tbotherorg.t}'; //v 查看   u 修改  a 新增 o只读
    	            //alert(t);
    	        if (t == 'v') {
    	            $("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
    	            $(".baocun,#zqxxxgbtn").hide();
    	            $("#form1 input,radio,textarea,checkbox").each(function () {
    	                $(this).parent("span").html($(this).val());
    	                $('.gszcddiv .rightinfo').css('width', 'auto')
    	            });
    	            $("#form1 select").each(function () {
    	                var text = $(this).find("option:selected").text();
    	                $(this).parent("span").html(text == "请选择" ? "" : text);
    	            });
    	            if (!$('#topic_content>img').attr('src')) {
    	                $('.imgbox').hide();
    	            }else{
                        $('#topic_content').css('background','none');
                      }
    	        } else if (t == 'a') {
    	            $('#form1 input,radio,select,textarea,checkbox').css('border', '1px solid #E0E0E0');
                    $('#form1 #bcard').css('border','0');
    	            $('.creditor .vipinfo .inputtest .rightinfo.bcard').show();
    	            $('.imgbox').css('marginTop', '40px')
    	        } else if (t == 'u') {
    	            $('#form1 input,radio,select,textarea,checkbox').css('border', '1px solid #E0E0E0');
                    $('#form1 #bcard').css('border','0');
    	            $('.creditor .vipinfo .inputtest .rightinfo.bcard').show();
    	            $('.imgbox').css('marginTop', '40px')
    	        } else if (t == 'o') {
    	            $("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
    	            $(".baocun,#zqxxxgbtn").hide();
    	            $(".readOnly").remove();
    	            $("#form1 input,radio,textarea,checkbox").each(function () {
    	                $(this).parent("span").html($(this).val());
    	            });
    	            $('.gszcddiv .rightinfo').css('width', 'auto');
    	            $("#form1 select").each(function () {
    	                var text = $(this).find("option:selected").text();
    	                $(this).parent("span").html(text == "请选择" ? "" : text);
    	            });
    	            if (!$('#topic_content>img').attr('src')) {
    	                $('.imgbox').hide();
    	            }else{
                        $('#topic_content').css('background','none');
                    }
    	        }

    	    });

    	    //提交的时候手动判断大框框下的小框框的第一个input框是否有值，如果没有，则这个小框框下的所有input的name去掉
    	    function checkIfval() {
    	        var xiaokks = $("#dkk").children(".xkk");
    	        xiaokks.each(function () {
    	            var xiaofirstval = $(this).children().find("input").eq(0).val();
    	            if (xiaofirstval.length < 1) {
    	                $(this).children().find("input").attr("name", "");
    	            }
    	        });

    	    };

         $('#tbotherorg_org_type').change(function(){
             if($(this).val()=="aaaaaaaaaaaaaaaaaaotherorgtype10"){
                 $('#zzjgdm').next('.error').hide()
             }
         })

    	    //点击保存,不验证isNotNull
    	    $('.baocun').click(function () {
    	        $('#buttonType').val('1');
    	        if (DataCheck.isZcNotNull()) {
    	            if (DataCheck.isLength()) {
    	                if (DataCheck.isInt()) {

    	                    if (DataCheck.isFint()) {

    	                        if (DataCheck.isZint()) {

    	                            if (DataCheck.isZuzhi()) {

    	                                if (DataCheck.isPhone()) {

    	                                    if (DataCheck.isEmail()) {
                                                if (DataCheck.isBankZint()) {
                                                if (DataCheck.isBankZZint()) {
    	                                        if (DataCheck.idCard()) {
    	                                            //检测如果没填小框框内容，则把inputdname去掉，避免传到后台。
    	                                            checkIfval();
    	                                            //alert("可以保存!");
    	                                            //判断上传文件
    	                                            //alert(checkfilehidden(true))
    	                                            //return;
    	                                            buttonDefaultValue = $(this).val();
    	                                            countDown(this, 5);
    	                                            nativeNum("isBankZint"); //还原为数字
    	                                       // nativeNum("isBankZZint"); //还原为数字
    	                                            $("#form1").submit(); //改变链接并提交
    	                                        } else {
    	                                            alert("不可以保存!");
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
    	        }
    	    });


    	    //点击提交,sb_base.jsp页面只有一个按钮，是当成提交处理。
    	    $('.tijiao').click(function () {
               if($('#tbotherorg_org_type').val()=="aaaaaaaaaaaaaaaaaaotherorgtype10"){
                   $('#zzjgdm').removeAttr('isnotnull iszcnotnull iszuzhi');
               }
    	        $('#buttonType').val('2');
    	        $('#notsave').val('0');
    	        //点击保存提交对其它融资方式的判断，判断是否显示，且判断其值是否符合要求
    	        var qtrzfsinput = $(".qtrzfs .rightinfo input");
    	        if (DataCheck.isNotNull()) {

    	            if (DataCheck.isLength()) {

    	                if (DataCheck.isInt()) {

    	                    if (DataCheck.isFint()) {

    	                        if (DataCheck.isZint()) {

    	                            if (DataCheck.isZuzhi()) {

    	                                if (DataCheck.isPhone()) {

    	                                    if (DataCheck.isEmail()) {

    	                                        if (DataCheck.isBankZint()) {
    	                                        if (DataCheck.isBankZZint()) {

    	                                            if (DataCheck.idCard()) {
    	                                                //alert("可以提交!");
    	                                                if (!checkEachNeedDate("form1")) {
    	                                                    return;
    	                                                }
    	                                                //检测如果没填小框框内容，则把inputdname去掉，避免传到后台。
    	                                                checkIfval();
    	                                                //判断上传文件
    	                                                if (checkfilehidden(true)) {

    	                                                    buttonDefaultValue = $(this).val();
    	                                                    countDown(this, 5);
    	                                                    nativeNum("isBankZint"); //还原为数字
    	                                               // nativeNum("isBankZZint"); //还原为数字
    	                                                    $("#form1").submit(); //改变链接并提交
    	                                                } else {
    	                                                    //alert("提交失败!");
    	                                                    return;
    	                                                }
    	                                            } else {
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
    	        }
    	    });

    	});
       //点击保存按钮时检查每个文件框是否都已经传值
       function checkfilehidden() {
         var picimgupspan = $(".upspan");
         var ifreturn = 0;
         var tolength = picimgupspan.length;
         picimgupspan.each(function(i, v) {
           var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
           var ifqsc = $(this).children(".qsc").attr("class"); //提示未上传的情况再提交不能再加提示了
           var picval = picimgss.attr("class");

           //if((i+1)<tolength && (i+1) != 2 && (i+1) != 3 && (i+1) != 4){
           if ((i + 1) <= tolength) {
             if (!picval) {
               if (!ifqsc) {
                 $(this).append("<div class='qsc'>请上传文件！</div>");
               }
               ifreturn = 1;
             }
           }

         });
         if (ifreturn) {
           return false;
         } else {
           return true;
         }
       }</script>
   </head>
   <body>
     <!-- 网站头部 -->
     <%@ include file="../header.jsp" %>
       <!-- 个人中心 -->
       <div class="background"></div>
       <div class="creditor widthbox">
         <div class="show fl">
         <%@ include file="../usercenter/leftnav.jsp" %></div>
         <div class="list fr">
           <div class="rightbox">
             <div id="zaiquanxinxi-update" class="vipinfo">
               <form id="form1" action="/usercenter/saveOtherInfo.html?tbotherorg.t=v" method="post">
                 <div class="title">
                   <li>
                     <span class="t">机构信息</span>
                      <a href="/usercenter/getOtherInfo.html?tbotherorg.t=u" class="readOnly"><span id="CreateTBpxhd" class="update">机构信息修改</span></a>
                  </li>
                 </div>
                 <input type="hidden" name="tbotherorg.id" value="<s:property value='tbotherorg.id'/>"/>
                  <div class="inputtest inputtestl" style="width: 100%;">
                    <span class="leftname leftnamel">机构名称：
                    <span style="color:red">*</span></span>
                      <span class="rightinfo" style="width:551px;" >
                    <input style="width:551px;" onblur="checkCreditId();" isNotNull="机构名称" isZcNotNull="机构名称" isLength="[0,64]"  auto-complete auto-complete-data="autoCompleteData"  id="jigouname" class="input" id="tbotherorg.org_name" name="tbotherorg.org_name" type="text" value="<s:property value='tbotherorg.org_name'/>" /></span>
                  </div>
                 <div class="inputtest inputtestl" style="width: 100%;">
                 <span class="leftname leftnamel" style="width:235px;">组织机构代码或统一社会信用代码：
                 <span style="color:red">*</span></span>
                 <span class="rightinfo" style="width:551px;">
                 <input style="width:100%" isNotNull="组织机构代码或统一社会信用代码" isZcNotNull="组织机构代码或统一社会信用代码" isLength="[0,32]" onblur="checkCreditId();" isZuzhi="组织机构代码或统一社会信用代码" id="zzjgdm" class="input" id="tbotherorg.org_credit_id" name="tbotherorg.org_credit_id" type="text" value="<s:property value='tbotherorg.org_credit_id'/>" /></span>
                 </div>


                 <div class="inputtest inputtestl">
                   <span class="leftname leftnamel">注册资本（万元）：
                     <span style="color:red">*</span></span>
                   <span class="rightinfo zczj">
                     <input isNotNull="注册资本" isBankZZint="isBankZZint"  onchange="this.value=formatNum(this.value)" isLength="[0,18]" class="input" id="tbotherorg.regist_amt" name="tbotherorg.regist_amt" type="text" value="<s:property value='tbotherorg.regist_amt'/>" /></span>
                 </div>
                 <div class="inputtest inputtestl">
                   <span class="leftname leftnamel">机构类型：
                     <span style="color:red">*</span></span>
                   <span class="rightinfo">
                  <s:select onchange="checkbureau();" isnotnull="机构类型" cssClass="select" list="%{#application.dic.otherorgtype.childs}" listKey="id" headerKey="" headerValue="" listValue="name" name="tbotherorg.org_type" style="width:152px;"/>
                  </span>
                 </div>
                 <div class="gszcddiv gszcddiv3 inputtest inputtestl" style="width:100%;padding-left:0px;">
                     <span class="leftname leftnamel" style="margin-right:10px;">工商注册地：
                     <span style="color:red">*</span></span>
                     <span class="rightinfo" id="gszcdspan" style="margin-right:6px; width:152px;">
                     <select isNotNull="省份" class="ssx" id="gszcd_province" name="tbotherorg.gszcd_province" style="width:100%;"><s:property value="tbotherorg.gszcd_province"/></select>
                     </span>
                     <span class="rightinfo" id="gszcdspan" style=" margin-right:6px; width:152px;">
                     <select isNotNull="市级" class="ssx" id="gszcd_city" name="tbotherorg.gszcd_city"  style="width:100%;"><s:property value="tbotherorg.gszcd_city"/></select>
                     </span>
                     <span class="rightinfo" id="gszcdspan" style="margin-right:6px;width:152px;">
                     <select isNotNull="区县" class="ssx" id="gszcd_county" name="tbotherorg.gszcd_county"  style=" width:100%;"><s:property value="tbotherorg.gszcd_county"/></select>
                     </span>
                     <input type="hidden" id="province" value='<s:property value="tbotherorg.gszcd_province"/>'/>
                     <input type="hidden" id="city" value='<s:property value="tbotherorg.gszcd_city"/>'/>
                     <input type="hidden" id="county" value='<s:property value="tbotherorg.gszcd_county"/>'/>
                     <input type="hidden" id="custtype" value='productczdfirst'/>
                 <script type="text/javascript">var custtype = 'productczdfirst';</script>
                 <script src="../resource/js/area.js"></script>
                 <script type="text/javascript">
                 _init_area();
                 </script>
                 </div>

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
                     <span class="leftname leftnamel">营业执照：
                     <span style="color:red">*</span></span>
                     <span class="rightinfo bcard" style="width:551px;">
                        <input type="button" class="input" isNotNull="营业执照"  id="bcard" name="tbotherorg.license" value="<s:property value='tbotherorg.license'/>" />
                     </span>
                      <span class="rightinfo bcard">
                          <input readonly="readonly"  type="hidden" class="input"  id="bcard2" name="tbotherorg.license" value="<s:property value='tbotherorg.license'/>"/>
                     </span>
                     <div class="imgbox">
                         <div id="topic_content">
                          <img src="${tbotherorg.license}">
                          <!--<s:if test="tbotherorg.license!=null&&tbotherorg.license!=''"><img src="${tbotherorg.license}"></s:if>-->
                         </div>
                         <i style="font-style:normal;font-size:12px;color:#bbb;display:none;" id="bigimg">点击图片查看大图</i>
                     </div>
                 </div>


                 <div class="inputtest inputtestl" style="width:100%;line-height: 36px;">
                     <span class="leftname leftnamel">办公地址：
                     <span style="color:red">*</span></span>
                     <span class="rightinfo" style="width:551px;">
                     <input style="width:551px;" isNotNull="办公地址" isLength="[0,64]" class="input" id="tbotherorg.org_address" name="tbotherorg.org_address" type="text" value="<s:property value='tbotherorg.org_address'/>" /></span></div>
                     <div class="inputtest inputtestl inputtestlrow">
                         <span class="leftname leftnamel" >主营业务：
                         <span style="color:red">*</span></span>
                         <span class="rightinfo tstextarea" style="width: 551px;"><textarea class="input" isNotNull="主营业务" isLength="[0,512]" style="width: 551px;min-height:60px" name="tbotherorg.org_info"><s:property value='tbotherorg.org_info'/></textarea></span>
                     </div>
                     <div class="inputtest inputtestl">
                         <span class="leftname leftnamel">联系人：
                         <span style="color:red">*</span></span>
                         <span class="rightinfo">
                         <input isNotNull="联系人" isLength="[0,16]" class="input" id="tbotherorg.org_linkman" name="tbotherorg.org_linkman" type="text" value="<s:property value='tbotherorg.org_linkman'/>" /></span>
                     </div>
                     <div class="inputtest inputtestl">
                   <span class="leftname leftnamel">联系人职务：
                     <span style="color:red">*</span></span>
                   <span class="rightinfo">
                     <input isNotNull="联系人职务" isLength="[0,16]" class="input" id="tbotherorg.org_linkduty" name="tbotherorg.org_linkduty" type="text" value="<s:property value='tbotherorg.org_linkduty'/>" /></span>
                 </div>

                 <div class="inputtest inputtestl">
                   <span class="leftname leftnamel">联系人电话：
                     <span style="color:red">*</span></span>
                   <span class="rightinfo">
                     <input isNotNull="联系人电话" isPhone="联系人电话" isLength="[0,11]" class="input" id="tbotherorg.org_linkcellphone" name="tbotherorg.org_linkcellphone" type="text" value="<s:property value='tbotherorg.org_linkcellphone'/>" /></span>
                 </div>
                 <div class="inputtest inputtestl">
                   <span class="leftname leftnamel">联系人邮箱：
                     <span style="color:red">*</span></span>
                   <span class="rightinfo">
                     <input isNotNull="联系人邮箱" isEmail="联系人邮箱" isLength="[0,32]" class="input" id="tbotherorg.org_linkemail" name="tbotherorg.org_linkemail" type="text" value="<s:property value='tbotherorg.org_linkemail'/>" /></span>
                 </div>
                 
                 <div class="inputtest inputtestl bureauoffice">
                   <span class="leftname leftnamel">所属局：</span>
                   <span class="rightinfo">
                     <select name="tbotherorg.bureau" id="bureau" class="select">
					    <option value=""></option>
					    <option value="1080">测试局1</option>
					    <option value="1081">测试局2</option>
					 </select>
                 </div>
                 <div class="inputtest inputtestl bureauoffice">
                   <span class="leftname leftnamel">所属处：</span>
                   <span class="rightinfo">
                     <select name="tbotherorg.office" id="office" class="select">
					    <option value=""></option>
					    <option value="1091">测试处1</option>
					    <option value="1092">测试处2</option>
					 </select>
                 </div>
                 
                 
                   <p class="jiange">党建信息</p>
                <div class="xkk djbox">
                    <div class="row">
                        <div class="inputtest inputtestl">
                            <span class="leftname leftnamel">公司人数：<span style="color:red">*</span></span>
                            <span class="rightinfo"><input isNotNull="" isZZint="公司人数" class="input" name="tbotherorg.yuangongshu" type="text" value="${tbotherorg.yuangongshu }"/></span>
                        </div>
                        <div class="inputtest inputtestl">
                            <span class="leftname leftnamel">党员人数：<span style="color:red">*</span></span>
                            <span class="rightinfo"><input isNotNull="" isZZint="党员人数" class="input" name="tbotherorg.party_num" type="text" value="${tbotherorg.party_num }"/></span>
                        </div>
                    </div>
                    <div class="row">
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">法人代表是否党员：<span style="color:red">*</span></span>
                        <span class="rightinfo"><s:select isNotNull="" list="%{#application.dic.whether.childs}" listKey="id" id="is_party" theme="simple"
                                  listValue="name" name="tbotherorg.is_party" label="法人代表是否党员" headerKey="" headerValue="" class="select"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">高管人数：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" isZZint="高管人数" class="input" name="tbotherorg.lead_num" type="text" value="${tbotherorg.lead_num }"/></span>
                    </div>
                    </div>
                    <div class="row">
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel">去年党费总额(元)：<span style="color:red">*</span></span>
							<span class="rightinfo"><input isNotNull="" isBankZZint="上年度年党费收取总额（元）" class="input" name="tbotherorg.last_party_cost" type="text"  value="${tbotherorg.last_party_cost }"/></span>
						</div>
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel" style="width: 235px;">是否愿意设立党支部：<span style="color:red">*</span></span>
							<span class="rightinfo"><s:select style="width: 152px;" isNotNull="" list="%{#application.dic.whether.childs}" listKey="id" id="will_set_party" theme="simple"
									  listValue="name" name="tbotherorg.will_set_party" label="是否愿意设立党支部" headerKey="" headerValue="" class="select"/></span>
						</div>
					</div>
                    <div class="row">
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">高管党员人数：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" isZZint="高管党员人数" class="input" name="tbotherorg.lead_party_num" type="text" value="${tbotherorg.lead_party_num }"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">是否设立党支部：<span style="color:red">*</span></span>
                        <span class="rightinfo"><s:select isNotNull="" list="%{#application.dic.whether.childs}" listKey="id" id="is_party_branch" theme="simple" onchange="hidebranchtime();"
                                  listValue="name" name="tbotherorg.is_party_branch" label="是否设立当支部" headerKey="" headerValue="" class="select"/></span>
                    </div>
                    </div>
                    <div class="inputtest inputtestl" id="branchtime">
                        <span class="leftname leftnamel">党支部设立时间：</span>
                        <span class="rightinfo"> <input readonly="readonly" class="input laydate-icon" rel="input laydate-icon" name="tbotherorg.party_branch_time"
                        	id="party_branch_time" type="text" value="${tbotherorg.party_branch_time }"/></span>
                    </div>
                </div>
                 <div class="revise readOnly" id="zqxxxgbtn">
                   <input type="hidden" class="input"  name="notsave" id="notsave" value="1"/>
                   <input class="shenqingdkt baocun" lang="<s:property value='rele_id'/>" type="button" id="tbotherorgZc" value="暂存" />&nbsp;&nbsp;
                   <input class="shenqingdkt tijiao" type="button"  id="tbotherorgSub" value="保存" /></div>
              </form>
             </div>
           </div>
         </div>
       </div>
     <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery-ui.min.css"/>
     <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-ui.min.js"></script>
     <script>
         $('#jigouname').autocomplete({
             source: function(request, response) {
                 var key = $("#jigouname").val();
                 if ($.trim(key) == "") {
                     return;
                 }
                 $.ajax({
                     type: 'post',
                     url: "/userextend/creditsearch.html",
                     dataType: "json",
                     data: {
                         "key": key
                     },
                     success: function(data) {
                         var reg = /<span style='color:red'>|<\/span>/ig;
                         $.each(data.data,
                             function(i, v) {
                                 v.company_name = v.company_name.replace(reg, '')
                             })
                         response($.map(data.data,
                             function(item) {
                                 return {
                                     label: item.company_name,
                                     value: item.company_name,
                                     code: item.credit_code
                                 }
                             }));
                     }
                 });
             },
             select: function(event, ui) {
                 if(ui.item.code){
                     $('#zzjgdm').siblings(".error").html("").hide();
                 }
                 $('#zzjgdm').val(ui.item.code);
             },

             minLength: 2
         })
     </script>

       <script type="text/javascript" src="../plupload/plupload.full.min.js"></script>
         <div id="imglayer_bg"></div>
         <div id="imglayer_border">
             <a href="javascript:;" id="imglayer_x" hidefocus="true"></a>
             <img id="imglayer_zoom" src="">
         </div>
       <%@ include file="../footer.jsp" %>
       <%@ include file="../sbapp/tanchudel.jsp" %>
       <script type="text/javascript">leftnav_init("tbotherorginfo");</script>
       <script type="text/javascript">
          if($('#topic_content>img').attr('src')){
              $('.imgbox>#bigimg').show();
              $('#topic_content').css('background','none');
          }
         $("[id='tbotherorg.org_type']").val('${tbotherorg.org_type}');
             if ('${flag}' != "") {
                 alert('${flag}');
                 console.log('${flag}')
             }

            function checkCreditId() {
            	var zzjgdm = $("input[name='tbotherorg.org_credit_id']").val();
                if (zzjgdm == "") {
                    return;
                }
                $.ajax({
                    type: 'post',
                    url: "/usercenter/checkCreditId.html",
                    dataType: "json",
                    data: {
                        "id": zzjgdm
                    },
                    success: function (data) {
                        if (data.relaSelf == 1) {
                            var msg = data.name + "已经注册，点击确认按钮自动关联到该公司";
                            if (confirm(msg)) {
                                $("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
                                $(".baocun,#zqxxxgbtn").hide();
                                relation(data);
                            }
                        } else if (data.relaSelf == 2) {
                            var msg = data.name + "的子账号数已经到达上限，不能再增加子账号。";
                            alert(msg);
                        } else if (data.id != "") {
                            var msg = data.name + "已经注册，点击确认按钮系统将发送请求到主用户（电话号码" + data.phone + "），待主用户审核,审核通过后即可关联";
                            if (confirm(msg)) {
                                $("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
                                $(".baocun,#zqxxxgbtn").hide();
                                relation(data);
                            }
                        }
                    }
                });
            }

           function relation(data) {
               $.ajax({
                   type: 'post',
                   url: "/usercenter/relation.html",
                   dataType: "json",
                   data: {
                       "id": data.id,
                       "relaId": data.relaId,
                       "name": data.name,
                       "relaSelf": data.relaSelf
                   },
                   success: function (data) {
                       alert(data.msg);
                       window.location.reload();
                   }
               });
           }
           
        function hidebranchtime() {
			if ($("select[id='is_party_branch']").val() == "10001") {
				$("#branchtime").show();
			} else {
				$("#branchtime").hide();
			}
		}
		hidebranchtime();
		
		
		!function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#party_branch_time'});//绑定元素
        //laydate({elem: '#fksj'});//绑定元素
        //laydate({elem: '#dqsj'});//绑定元素
    }();

    //日期范围限制
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };

    var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas; //结束日选好后，充值开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);

    //自定义日期格式
    laydate({
        elem: '#test1',
        format: 'YYYY年MM月DD日',
        festival: true, //显示节日
        choose: function (datas) { //选择日期完毕的回调
            alert('得到：' + datas);
        }
    });

    //日期范围限定在昨天到明天
    laydate({
        elem: '#hello3',
        min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
        max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
    });
    
    function checkbureau(){
    	if ($("select[name='tbotherorg.org_type']").val() == "aaaaaaaaaaaaaaaaaaotherorgtype10") {
    		$(".bureauoffice").show();
    	} else {
    		$(".bureauoffice").hide();
    	}
    }
    checkbureau();
	$("#bureau").val('${tbotherorg.bureau}');
	$("#office").val('${tbotherorg.office}');
        </script>
</body>
 </html>