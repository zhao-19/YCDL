<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html PUBLIC “-//W3C//DTD XHTML 1.0 Transitional//EN” “http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd”>
<html xmlns=”http://www.w3.org/1999/xhtml”>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet"  href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet"  href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet"  href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
    <link rel="stylesheet"  href="../control/css/zyUpload.css" type="text/css">

    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.7.2.js"></script>
    <!-- 引用核心层插件 -->
    <script type="text/javascript" src="../core/zyFile.js"></script>
    <script type="text/javascript" src="../core/jquery-1.10.2.min.js"></script>
    <!-- 引用控制层插件 -->
    <script type="text/javascript" src="../control/js/zyUpload.js"></script>
    <!-- 引用初始化JS -->
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/demo.js"></script>
<style>
.baobiao{margin-top:0;}
fieldset{border:1px solid #d6d6d6!important;    padding: 20px;;}
	.fsf{height:50px;width:569px;margin:0 auto;;margin-top: 20px;}
        .fsf span{padding:8px 20px;border:1px solid #FF8000;}
        .fsf hr{width:100px;height:1px;border:1px solid #FF8000;display: inline-block;
            background-color: #FF8000;margin:0 -4px;margin-bottom: 6px;margin-left:-1px;}
            
 .step{width:573px;height:50px;margin:0 auto;margin-top:20px;margin-bottom:30px;}
.step .sp{width:122px;font-size:20px;height:48px;line-height:50px;text-align:center;float:left;border:1px solid #FF8000;}
.step .line{width:100px;height:2px;background-color:#FF8000;border:none;margin-top:24px;float: left;overflow:hidden;}
.step .hover{color:#FFf;;background-color:#FF8000;}
</style>
</head>
<body>
<div class="zgezhaoceng" id="zz" style="display:none;width:100%;height:2400px;"></div>



<!-- 网站头部 -->

<!--内容信息-->
<div class="baobiao">
    <!--<div class="bb-left">-->
        <!--<div class="fujiagn">功能</div>-->
        <!--<li id="tiexishenbao1">贴息申报</li>-->
        <!--<li id="tiexishenbao2">贴息申报</li>-->
        <!--<li id="tiexishenbao3">贴息申报</li>-->
        <!--<li id="tiexishenbao4">贴息申报</li>-->
        <!--<li id="tiexishenbao5">贴息申报</li>-->
        <!--<li id="tiexishenbao6">贴息申报</li>-->
        <!--<li id="tiexishenbao7">贴息申报</li>-->
        <!--<li id="tiexishenbao8">贴息申报</li>-->
    <!--</div>-->
    <form id="msform" method="post" action="/interestapp!submit.action" style="display: block;">
 		<input type="hidden" name="e.id" value='<s:property value="e.id"/>' />
        <fieldset style="display: block;">
			<div class="step">
				<div class="sp">基本信息</div>
				<div class="line"></div>
				<div class="sp">信息详情</div>
				<div class="line"></div>
				<div class="sp hover">资料上传</div>
			</div>         
		<div class="box-img" >
		<input type="hidden" name="picnum" id="picnum"/>
		<input type="hidden" name="picnum1" id="textpicnum1"/><!-- 营业执照 -->
		<input type="hidden" name="picnum2" id="textpicnum2"/><!-- 税务登记 -->
		<input type="hidden" name="picnum3" id="textpicnum3"/><!-- 组织机构代码 -->
		<input type="hidden" name="picnum4" id="textpicnum4"/><!-- 三证合一-->
		<input type="hidden" name="picnum5" id="textpicnum5"/><!-- 国税证明 -->
		<input type="hidden" name="picnum6" id="textpicnum6"/><!-- 上年度审计报告 -->
		<input type="hidden" name="picnum7" id="textpicnum7"/><!-- 征信报告 -->
		<input type="hidden" name="picnum8" id="textpicnum8"/><!-- 信用评估报告 -->
		<input type="hidden" name="picnum9" id="textpicnum9"/><!-- 贷款合同 -->
		<input type="hidden" name="picnum10" id="textpicnum10"/><!-- 放款证明 -->
		<input type="hidden" name="picnum11" id="textpicnum11"/><!-- 利息清单 -->
		<input type="hidden" name="picnum12" id="textpicnum12"/><!-- 立项文件 -->
		
                <!--<a  href="../demo.html">-->
                <div class="ck-img"  lang="picnum1" onclick="img(this)">
                	<div id="picnum1" class="picimg">
                		<s:if test="#request.picnum1!=null">
                			<img src="<s:property value="#request.picnum1" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                    </div>
                    <div>营业执照</div>
                </div>
                <!--</a>-->

                    <div class="ck-img"  lang="picnum2" onclick="img(this)">
                   		<div id="picnum2" class="picimg">
                        <s:if test="#request.picnum2!=null">
                			<img src="<s:property value="#request.picnum2" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div>税务登记</div>
                    </div>


                    <div class="ck-img" lang="picnum3" onclick="img(this)">
                    	<div id="picnum3" class="picimg">
                        <s:if test="#request.picnum3!=null">
                			<img src="<s:property value="#request.picnum3" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div>组织机构代码</div>
                    </div>


                    <div class="ck-img" lang="picnum4" onclick="img(this)">
                    	<div id="picnum4" class="picimg">
                       <s:if test="#request.picnum4!=null">
                			<img src="<s:property value="#request.picnum4" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div>三证合一</div>
                    </div>



                    <div class="ck-img" lang="picnum5" onclick="img()">
                    	<div id="picnum5" class="picimg">
                        <s:if test="#request.picnum5!=null">
                			<img src="<s:property value="#request.picnum5" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div>国税证明（必填）</div>
                    </div>


                    <div class="ck-img" lang="picnum6" onclick="img()">
                    	<div id="picnum6" class="picimg">
                       <s:if test="#request.picnum6!=null">
                			<img src="<s:property value="#request.picnum6" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div class="shangyinian">上一年度的审计报告（结论页）</div>
                    </div>


                    <div class="ck-img" lang="picnum7" onclick="img()">
                    	<div id="picnum7" class="picimg">
                      <s:if test="#request.picnum7!=null">
                			<img src="<s:property value="#request.picnum7" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div>征信报告（结论页）</div>
                    </div>


                    <div class="ck-img" lang="picnum8" onclick="img()">
                    	<div id="picnum8" class="picimg">
                       <s:if test="#request.picnum8!=null">
                			<img src="<s:property value="#request.picnum8" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div>信用评估报告（结论页）</div>
                    </div>


                    <div class="ck-img" lang="picnum9" onclick="img()">
                    	<div id="picnum9" class="picimg">
                        <s:if test="#request.picnum9!=null">
                			<img src="<s:property value="#request.picnum9" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div>贷款合同（核心页）</div>
                    </div>


                    <div class="ck-img" lang="picnum10" onclick="img()">
                    	<div id="picnum10" class="picimg">
                      <s:if test="#request.picnum10!=null">
                			<img src="<s:property value="#request.picnum10" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div>放款凭证</div>
                    </div>


                    <div class="ck-img" lang="picnum11" onclick="img()">
                    	<div id="picnum11" class="picimg">
                        <s:if test="#request.picnum11!=null">
                			<img src="<s:property value="#request.picnum11" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div>利息清单</div>
                    </div>


                    <div class="ck-img" lang="picnum12"  onclick="img()">
                    	<div id="picnum12" class="picimg">
                        <s:if test="#request.picnum12!=null">
                			<img src="<s:property value="#request.picnum12" />"/>
                		</s:if>
                		<s:else>
		                    <img src=".././image/img.jpg" alt=""/>
                		</s:else>
                        </div>
                        <div>立项文件核心页</div>
                    </div>


                <input type="button" name="previous" class="previous action-button juzhong1" style="position: relative;left: -120px;" onclick="location.href='/interestapp/tostep2.html?e.id=<s:property value="e.id"/>'" value="上一步" />
                <input type="submit" name="submit" class="submit action-button" style="position: relative;left: -120px;" value="完成" />
            </div>
        </fieldset>

    </form>
    <div class="file" id="file" style="display:none;position: fixed; top: 100px;left:150px;z-index: 99999;">
    <div id="demo" class="demo"></div>
    </div>

</div>
<script>
    function guanbi()
    {
        var aaa=document.getElementById("file");
        aaa.style.display="none";
        var bbb=document.getElementById("zz");
        bbb.style.display="none";
    }
</script>
<script>
    $(function(){

        $(".zgezhaoceng").width(body).width();
//		$('.zgezhaoceng').height(body).height();
        $('.zgezhaoceng').css('left',0);
        $('.zgezhaoceng').css('top',0);
    });
    function img(){
        $(".zgezhaoceng").css("display","block");
//        $(".bb-right").css("display","none");
        $(".file").css("display","block");
    
    };
    $(".ck-img").click(function(){
    	$("#picnum").val($(this).attr("lang"));
    	
    });

</script>

</body>
</html>
