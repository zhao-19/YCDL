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
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<%-- <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script> --%>
	

    	<link rel="stylesheet"  href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    	<!-- <link rel="stylesheet"  href="../control/css/zyUpload.css" type="text/css"> -->
    	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
    	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
    	
    	<%-- <script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
    	<script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
   	    <script type="text/javascript" src="../core/zyFile.js"></script>
	    <script type="text/javascript" src="../control/js/zyUpload.js"></script>
	    <script type="text/javascript" src="../js/demo.js"></script> --%>
	    
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/delimg.js"></script>
</head>
<body>
<!--公共提示框-->
<div id="ggts2"></div>
<!-- t有值代表是查看 -->
<input type="hidden" id="flag" value="<s:property value="#request.falg"/>">
<input type="hidden" id="ifdelimg">
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#t").val();
	var flag = $("#flag").val();
	if(flag=='1' ) {
		var a = document.getElementById("ggts2");//获取div块对象
        var Height=document.documentElement.clientHeight;//取得浏览器页面可视区域的宽度
        var Width=document.documentElement.clientWidth;//取得浏览器页面可视区域的宽度
        var gao1 = a.offsetHeight;//获取div块的高度值
        var gao2 = a.offsetWidth;//获取div块的宽度值
        var Sgao1= (Height - gao1)/2-110+"px";
        var Sgao2= (Width - gao2)/2+"px";
        a.style.top=Sgao1;
        a.style.left=Sgao2;
       // $("#ggts2").show();
   		ggts2("提交成功！");
 		setTimeout("location.href='/interestapp/selectList.html'",1300)
 		//location.href='/interestapp/selectList.html';
		
	}else if(flag=='0') {
		alert('提交失败！');
	}
	//alert(t);
	
	if(t=='v'){
		$("#intereststep3 input,radio,select,textarea,checkbox").attr('readonly','readonly');
		//$(".upspan").attr("class","ck-img upspanx");
		$(".shenqingdkttijiao").hide();
		$(".delimg").hide();
	}else{
		//intereststep3();
	}
	
	$(".upback").click(function(){
		//第二步 返回上一步
		var id = $("#id").val()
		location.href="/interestapp/tostep2.html?id="+id+"&t="+t;
	});

});
</script>
<style>
.error {
    border: none;
    background:none;
    }
label.error {
    border: 1px solid #f5694b!important;
    background:none;
	color: #f5694b;
	padding: 0 2px;
	display:inline-block;
    }
    #ldksq #ldksq_c .tjdiv input.res{margin-right:0;}
    #ldksq #ldksq_c {width: 720px;/*height: 434px;*/height: 434px;}
    #ldksq #ldksq_c .delt{padding: 10px;}
    #ldksq #ldksq_c .delimglist{height:336px;border:1px solid #ccc;overflow-y: auto;}
    #ldksq #ldksq_c .delimglist .imglis{margin:12px;height:122px;float:left;width:100px;}
    #ldksq #ldksq_c .delimglist .imglis img{height:122px;width:100px;}
    #ldksq #ldksq_c .delimglist .imglis p{margin-bottom:5px;cursor:pointer;color: #fff;text-align: center;background-color: #555;border-radius: 5px 0px;}
    #ldksq #ldksq_c .delimglist .imglis p:hover{background-color:#FF8140;color:#fff;}
    
    
    
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
			
			<!-- 债权信息修改    用户为企业时显示    -->
			<div id="zaiquanxinxi-update" class="vipinfo" >
			<div class="baobiao">
								<!-- <form id="intereststep3" enctype="multipart/form-data" action="/interestapp/imgupload.jsp" method="post"> -->
			
			
									
				<div class="title"><li>贴息申报第三步</li></div>
				
				<input type="hidden" name="id" id="id" value="<s:property value='id'/>"/>
		 		<input type="hidden" id="t" name="t" value="<s:property value="#request.t"/>">
				<input type="hidden" id="namebzf" name="namebzf">
				<input type="hidden" id="leixing" name="leixing" value="textpicnum1">
				<input id="photoimg" type="file" name="file">
		 
				<div class="box-img" >
		<!-- <input type="hidden" name="picnum" id="picnum"/>-->

		
		
		<!-- 
 		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa150	营业执照
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa151	税务登记
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa152	组织机构代码
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa153	综合信用代码
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa154	国税纳税证明
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa155	地税纳税证明
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa156	上一年度的审计报表
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa157	征信报告
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa158	信用评估报告
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa159	贷款合同
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa160	放款凭证
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa161	利息清单
		aaaaaaaaaaaaaaaaaaaaaaaaaaaaa162	立项文件
 -->
                <!--<a  href="../demo.html">-->
                <div class="ck-img upspan"  lang="picnum1"  id="upspan1" for="photoimg" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa150">
                	<div class="nrk">
                	<span class="n">0</span>
                	<div id="picnum1" class="picimg upspan1">      
                	        	
                		
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa150'">
                				<div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                    </div>
                    <span class="delimg">删除</span>
                    </div>	
                    <div class="t">营业执照(或者三证合一执照)</div>
                </div>
                <!-- </a>   -->

                    <div class="ck-img upspan"  lang="picnum2"  id="upspan2" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa151">
                   		<div class="nrk">
                   		<span class="n">0</span>
                   		<div id="picnum2" class="picimg upspan2">
                       	
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa151'">
	                				 <div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                	
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div class="t">税务登记（三证合一不传）</div>
                    </div>


                    <div class="ck-img upspan" lang="picnum3"  id="upspan3" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa152">
                    	<div class="nrk">
                    	<span class="n">0</span>
                    	<div id="picnum3" class="picimg upspan3">
                       	
                		
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa152'">
	                				 <div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div class="t">组织机构代码（三证合一不传）</div>
                    </div>


                    <div class="ck-img upspan" lang="picnum4" id="upspan4" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa153">
                    	<div class="nrk">
                    	<span class="n">0</span>
                    	<div id="picnum4" class="picimg upspan4">
                       	
                		
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa153'">
	                				 <div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                	
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div class="t">担保合同核心页和发票(非必填)</div>
                    </div>



                    <div class="ck-img upspan" lang="picnum5" id="upspan5" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa154">
                    	<div class="nrk">
                    	<span class="n">0</span>
                    	<div id="picnum5" class="picimg upspan5">
                       	
                		
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa154'">
	                				<div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                	
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div class="t">国税、地税纳税证明（必填）</div>
                    </div>
 
				   <%--<div class="ck-img upspan" lang="picnum6" id="upspan6" dir="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa155">
                    	<div class="nrk">
                    	<div id="picnum6" class="picimg upspan6">
                       	
                		
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa155'">
	                				 <div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                	
                        </div>
                        </div>
                        <div class="t">地税纳税证明（必填）</div>
                    </div>

                    --%><div class="ck-img upspan" lang="picnum7" id="upspan7" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa156">
                    	<div class="nrk">
                    	<span class="n">0</span>
                    	<div id="picnum7" class="picimg upspan7">
                      
                		
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa156'">
	                				 <div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                		
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div class="t shangyinian" style="font-size:12px;">上一年度的审计报告（须包含封面页、结论页、资产负债表、现金流量表、损益表。必填）</div>
                    </div>


                    <div class="ck-img upspan" lang="picnum8" id="upspan8" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa157">
                    	<div class="nrk">
                    	<span class="n">0</span>
                    	<div id="picnum8" class="picimg upspan8">
                     
                		
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa157'">
	                				 <div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                	
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div  class="t">征信报告全文（人民银行出具的信用报告。必填）</div>
                    </div>


                    <div class="ck-img upspan" lang="picnum9" id="upspan9" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa158">
                    	<div class="nrk">
                    	<span class="n">0</span>
                    	<div id="picnum9" class="picimg upspan9">
                      
                		
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa158'">
	                				<div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                		
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div class="t">信用评估报告（信用等级证书和报告结论页。必填）</div>
                    </div>


                    <div class="ck-img upspan" lang="picnum10" id="upspan10" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa159">
                    	<div class="nrk">
                    	<span class="n">0</span>
                    	<div id="picnum10" class="picimg upspan10">
						
                	
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa159'">
	                				 <div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                		
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div  class="t">贷款合同（核心页。必填）</div>
                    </div>


                    <div class="ck-img upspan" lang="picnum11" id="upspan11" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa160">
                    	<div class="nrk">
                    	<span class="n">0</span>
                    	<div id="picnum11" class="picimg upspan11">
                  
                	
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa160'">
	                				<div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                	
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div  class="t">放款凭证（必填）</div>
                    </div>


                    <div class="ck-img upspan" lang="picnum12" id="upspan12" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa161">
                    	<div class="nrk">
                    	<span class="n">0</span>
                    	<div id="picnum12" class="picimg upspan12">
						
                	
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa161'">
	                				 <div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                	
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div  class="t">利息清单（必填）</div>
                    </div>


                    <div class="ck-img upspan" lang="picnum13"  id="upspan13" accesskey="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa162">
                    	<div class="nrk">
                    	<span class="n">0</span>
                    	<div id="picnum13" class="picimg upspan13">
						
                	
               		        <s:iterator value="#request.list" status="index">
                				<s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa162'">
	                				 <div class="div" id=""><div class="img"><img lang="<s:property value="id" />"  src="<s:property value="picurl" />"></div></div>
                				</s:if>	
                				     
                			</s:iterator>
                		
                        </div>
                        <span class="delimg">删除</span>
                        </div>
                        <div  class="t">立项文件核心页（国家重大专项立项文件。非必填）</div>
                    </div>


                <%-- <input type="button" name="previous" class="previous action-button juzhong1" style="position: relative;left: -120px;" onclick="location.href='/interestapp/tostep2.html?e.id=<s:property value="e.id"/>'" value="上一步" />
                <input type="submit" name="submit" class="submit action-button" style="position: relative;left: -120px;" value="完成" /> --%>
            </div>
				
				
 				
			
			
					<div style="overflow:hidden;clear:both;"></div>			
			<form id="intereststepsubmit"   action="/interestapp/submit.html" method="post" styl="overflow:hidden;clear:both;z-index:-1;float:left;"> 
					<input type="hidden" name="e.id"   value="<s:property value='e.id'/>"/>
					<div class="revise" id="zqxxxgbtn" >
					<input class="shenqingdkt upback" type="button" value="上一步"/>&nbsp;&nbsp;
					<input class="shenqingdkt shenqingdkttijiao" onclick="return checkfilehidden(true);" type="submit" value="提交"/>&nbsp;&nbsp;(注：提交后就不能再次修改)
				 </div>
					

			
			
					<input type="hidden" id="uptarget">
					
			
			</form>
   			 
				</div>
							
		</div>	
		</div>	
		
		</div>

</div>

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



<script type="text/javascript" src="../plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="../plupload/Public/js/sucaihuo.js"></script>
<script type="text/javascript">
var t = $("#t").val();
if(t!='v'){
			var id = $("#id").val();
			
			var uptarget1 = $("#upspan1").attr('id');
			var leixing1 = $("#upspan1").attr('accesskey');
			
            var uploaderupspan1 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan1', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget1+"&leixing="+leixing1+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum1").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan1.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum1").append(li);
                            eachimg("picnum1");
                            uploaderupspan1.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发                    	
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan1.init();


            var uptarget2 = $("#upspan2").attr('id');
			var leixing2 = $("#upspan2").attr('accesskey');
            var uploaderupspan2 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan2', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget2+"&leixing="+leixing2+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum2").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan2.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum2").append(li);
                            eachimg("picnum2");
                            uploaderupspan2.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan2.init();


            var uptarget3 = $("#upspan3").attr('id');
			var leixing3 = $("#upspan3").attr('accesskey');
            var uploaderupspan3 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan3', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget3+"&leixing="+leixing3+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum3").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan3.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum3").append(li);
                            eachimg("picnum3");
                            uploaderupspan3.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan3.init();



            var uptarget4 = $("#upspan4").attr('id');
			var leixing4 = $("#upspan4").attr('accesskey');
            var uploaderupspan4 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan4', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget4+"&leixing="+leixing4+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum4").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan4.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum4").append(li);
                            eachimg("picnum4");
                            uploaderupspan4.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan4.init();


            var uptarget5 = $("#upspan5").attr('id');
			var leixing5 = $("#upspan5").attr('accesskey');
            var uploaderupspan5 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan5', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget5+"&leixing="+leixing5+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum5").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan5.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum5").append(li);
                            eachimg("picnum5");
                            uploaderupspan5.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan5.init();


            var uptarget6 = $("#upspan6").attr('id');
			var leixing6 = $("#upspan6").attr('accesskey');
            var uploaderupspan6 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan6', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget6+"&leixing="+leixing6+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum6").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan6.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum6").append(li);
                            eachimg("picnum6");
                            uploaderupspan6.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan6.init();


            var uptarget7 = $("#upspan7").attr('id');
			var leixing7 = $("#upspan7").attr('accesskey');
            var uploaderupspan7 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan7', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget7+"&leixing="+leixing7+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum7").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan7.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum7").append(li);
                            eachimg("picnum7");
                            uploaderupspan7.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan7.init();



            var uptarget8 = $("#upspan8").attr('id');
			var leixing8 = $("#upspan8").attr('accesskey');
            var uploaderupspan8 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan8', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget8+"&leixing="+leixing8+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum8").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan8.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum8").append(li);
                            eachimg("picnum8");
                            uploaderupspan8.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan8.init();


            var uptarget9 = $("#upspan9").attr('id');
			var leixing9 = $("#upspan9").attr('accesskey');
            var uploaderupspan9 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan9', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget9+"&leixing="+leixing9+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum9").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan9.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum9").append(li);
                            eachimg("picnum9");
                            uploaderupspan9.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan9.init();


            var uptarget10 = $("#upspan10").attr('id');
			var leixing10 = $("#upspan10").attr('accesskey');
            var uploaderupspan10 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan10', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget10+"&leixing="+leixing10+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum10").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan10.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum10").append(li);
                            eachimg("picnum10");
                            uploaderupspan10.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan10.init();



            var uptarget11 = $("#upspan11").attr('id');
			var leixing11 = $("#upspan11").attr('accesskey');
            var uploaderupspan11 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan11', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget11+"&leixing="+leixing11+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum11").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan11.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum11").append(li);
                            eachimg("picnum11");
                            uploaderupspan11.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan11.init();


            var uptarget12 = $("#upspan12").attr('id');
			var leixing12 = $("#upspan12").attr('accesskey');
            var uploaderupspan12 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan12', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget12+"&leixing="+leixing12+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum12").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan12.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum12").append(li);
                            eachimg("picnum12");
                            uploaderupspan12.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan12.init();


            var uptarget13 = $("#upspan13").attr('id');
			var leixing13 = $("#upspan13").attr('accesskey');
            var uploaderupspan13 = new plupload.Uploader({//创建实例的构造方法
                runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
                browse_button: 'upspan13', // 上传按钮
                multi_selection: true,
                url: "/goodaaa.action?uptarget="+uptarget13+"&leixing="+leixing13+"&id="+id, //远程上传地址
                flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
                silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
                filters: {
                    max_file_size: '50mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                    mime_types: [//允许文件上传类型
                        {title: "files", extensions: "jpg,png,gif,pdf"}
                    ]
                },
                multi_selection: true, //true:ctrl多文件上传, false 单文件上传
                init: {
                    FilesAdded: function(up, files) { //文件上传前
                        if ($("#picnum13").children(".div").length > 10) {
                            alert("您上传的图片太多了！");
                            uploaderupspan13.destroy();
                        } else {
                            var li = '';
                         
                            plupload.each(files, function(file) { //遍历文件
                                li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                            });
                           
                            $("#picnum13").append(li);
                            eachimg("picnum13");
                            uploaderupspan13.start();
                        }
                    },
                    UploadProgress: function(up, file) { //上传中，显示进度条
                 var percent = file.percent;
                        $("#" + file.id).find('.bar').css({"width": percent + "%"});
                        $("#" + file.id).find(".percent").text(percent + "%");
                    },
                    FileUploaded: function(up, file, info) { //文件上传成功的时候触发
                       var data = eval("(" + info.response + ")");
                        $("#" + file.id).html("<div class='img'><img src='" + data.pic + "'/></div>");
                    },
                    Error: function(up, err) { //上传出错的时候触发
                        alert(err.message);
                    }
                }
            });
            uploaderupspan13.init();
}


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
            
//点击保存按钮时检查每个文件框是否都已经传值
    function checkfilehidden(){
    	var picimgupspan = $(".upspan");
    	var ifreturn = 0;
    	var tolength = picimgupspan.length;
    	picimgupspan.each(function(i,v){
    		var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
    		var ifqsc = $(this).children(".qsc").attr("class");//提示未上传的情况再提交不能再加提示了
    		var picval = picimgss.attr("class");
    		if((i+1)<tolength && (i+1) != 2 && (i+1) != 3 && (i+1) != 4){
    			if(!picval){
    				if(!ifqsc){
    					$(this).append("<div class='qsc'>请上传图片！</div>");
    				}
    				ifreturn = 1;
    			}
    		}

    	});
    	if(ifreturn){
    		return false;
    	}
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
   	
   	
   
   	
   	
</script>


 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("interestapp2");
 </script>
 
 
 
 
 <!--我要参加弹出框 start-->
<div id="ldksq">
    <div id="ldksq_c">
        <div id="ldksq_lose"></div>
        <div class=""></div>
        <div class="delt" id="delt">营业执照(或者三证合一执照)图片：</div>
        <div class="delimglist" id="delimglist"></div>
        
        
        <!--<input type="button"  class="res tj"  value="返回"/>-->
       	<div class="tjdiv"><input id="rztjan"  type="button"  class="res sure tj" value="确定"/></div>
    </div>
</div>
<!--我要参加弹出框 end-->
</body>

</html>
 