<%@page import="com.winpow.services.manage.catalog.bean.Catalog"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/themes/default/default.css" />

<style>
#insertOrUpdateMsg {
	border: 0px solid #aaa;
	margin: 0px;
	position: fixed;
	top: 0;
	width: 100%;
	background-color: #d1d1d1;
	display: none;
	height: 30px;
	z-index: 9999;
	font-size: 18px;
	color: red;
}

select {
	height: auto;
}
/*重新调整财务信息table表的样式，只在当前页面有效*/
#tabs-3 input {
	width: 104px;
	margin: 10px 0px;
}

#tabs-3 td {
	vertical-align: middle;
}

.n-ok .n-icon {
	margin-top: 12px;
}
</style>


<script charset="utf-8"
	src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8"
	src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="../css/progressBar.css" />
<link rel="stylesheet" href="../css/massage.css" />
<script src="../js/jquery.min.js"></script>
<script src="../js/message.js"></script>
<style>
#ldksq {
	display: none;
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	margin: auto;
	z-index: 9999 !important;
	background: url("../img/lobg_03.png") repeat;
}

#ldksq_c {
	background-color: #fff;
	width: 95%;
	min-height: 410px;
	/*position: absolute;top:0;left:0;right:0;bottom: 0;*/
	margin: auto;
	border-radius: 5px;
	behavior: url(PIE.htc);
	padding: 10px;
}

#ldksq_c p {
	text-align: center;
}

#ldksq_c .qx {
	background: url("../img/delete.png") no-repeat;
}

#ldksq_c form {
	margin: 0;
	padding-top: 10px;;
}

#ldksq_c input.title, textarea.duanxin {
	width: 240px;;
}

.pbczdbaseTitle {
	font-size: 20px;
	text-align: left !important;
}

.pbczdbaseTable {
	height: 320px;
	width: 100%;
	overflow: auto;
}

.ke-dialog-default, .ke-dialog {
	top: 50%;
	transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-webkit-transform: translateY(-50%);
	-o-transform: translateY(-50%);
}
</style>

</head>

<body>
	<input type="hidden" id="ifsave"
		value="<s:property value="#request.ifsave"/>" />
	<s:form action="appGoods!update.action" id="form" name="form"
		namespace="/manage" theme="simple" method="post">

		<div class="navbar navbar-inverse">
			<div id="insertOrUpdateMsg">
				<s:property value="#session.insertOrUpdateMsg" />
				<%
				    request.getSession().setAttribute("insertOrUpdateMsg", "");//列表页面进行编辑文章的时候,需要清空信息
				%>
			</div>
		</div>

		<span id="pifeSpan" class="input-group-addon" style="display: none"><%=SystemManager.systemSetting.getImagerootpath()%></span>



		<!-- 流程进度条 -->
		<div class="project-screening">
			<div class="project-screening-yellow"></div>
			<div class="select-1-yellow"></div>
			<div id="step1" class="screening-select select-1 current">
				<span>1</span><a href="javascript:void(0)">基础资料审查通过</a>
			</div>
			<div id="step2" class="screening-select select-2" selval="4,6">
				<span>2</span><a href="javascript:void(0)">详细资料审查通过</a>
			</div>
			<div id="step3" class="screening-select select-3" selval="6,7">
				<span>3</span><a href="javascript:void(0)">项目评审会评审通过</a>
			</div>
			<div id="step4" class="screening-select select-4" selval="7,10">
				<span>4</span><a href="javascript:void(0)">担保公司审批通过</a>
			</div>
			<div id="step5" class="screening-select select-5" selval="10,-1">
				<span>5</span><a href="javascript:void(0)">银行审批通过</a>
			</div>
			<div id="step6" class="screening-select select-6" selval="10,-1">
				<span>6</span><a href="javascript:void(0)">金融办审批通过</a>
			</div>
			<div id="step7" class="screening-select select-7" selval="10,-1">
				<span>7</span><a href="javascript:void(0)">银行放贷成功</a>
			</div>
		</div>

		<script type="text/javascript">
			$(document).ready(function() {
				var step = "<s:property value='e.status'/>";
				if (step == 0) {

				} else if (step == 10) {
					step = 1;
				} else if (step == 20) {
					step = 1;
				} else if (step == 30) {
					step = 1;
				} else if (step == 40) {
					step = 2;
				} else if (step == 50) {
					step = 3;
				} else if (step == 60) {
					step = 4;
				} else if (step == 70) {
					step = 5;
				} else if (step == 80) {
					step = 6;
				} else if (step == 90) {
					step = 7;
				} else {
					step = 1;
				}

				for (var i = 1; i <= step; i++) {
					refresh(i);
				}

			});

			function refresh(value) {
				var _parent = $("#step" + value + "");
				var _postX = _parent.position().left + 65;
				_parent.siblings(".screening-select").removeClass("current");

				_parent.siblings(".project-screening-yellow").animate({
					width : _postX
				}, 300);

				_parent.siblings(".select-1-yellow").animate({
					left : _postX - 75
				}, 300, function() {
					_parent.addClass("redbg");
					_parent.prevAll(".screening-select").addClass("redbg");
					_parent.addClass("current");
				});

				//_parent.nextAll().removeAttr("style");
			}
		</script>



		<div style="text-align: center; margin-bottom: 20px;">
			<div id="updateMsg">
				<font color='red'><s:property value="updateMsg" /></font>
			</div>
			<!-- 	<s:if test="e.id=='' or e.id==null">
				<button method="productczdbase!insert.action" class="btn btn-success">
					<i class="icon-ok icon-white"></i> 新增
				</button>
			</s:if> 
			<s:else> 
			</s:else>
			-->
			用户ID：<span class="badge badge-success"><s:property
					value="e.id" /></span>
			<button method="appGoods!update.action" class="btn btn-success">
				<i class="icon-ok icon-white"></i> 保存
			</button>


			<button type="button" class="btn btn-danger" id="backstep"
				style="margin-left: 20px;">
				<i class="icon-ok icon-error"></i> 驳回
			</button>
			<button type="button" class="btn btn-info btnnextstep"
				style="margin-left: 20px;">
				<i class="icon-ok icon-white"></i> 下一步
			</button>
			<!-- <input type="button" class="btnnextstep"  value="下一步"> -->
		</div>



		<div id="tabs">

			<ul>
				<li><a href="#tabs-1">基本信息</a></li>
				<li><a href="#tabs-2">高管信息</a></li>
				<li><a href="#tabs-3">财务信息</a></li>
				<li><a href="#tabs-4">经营信息</a></li>
				<li><a href="#tabs-5">存量贷款情况</a></li>
				<li><a href="#tabs-6">拟提供担保情况</a></li>
				<li><a href="#tabs-7">其他信息</a></li>

			</ul>


			<div id="tabs-1">
				<table class="table table-bordered">

					<tr style="display: none;">
						<th>id</th>
						<td colspan="3"><s:hidden name="e.pkid" /></td>
					</tr>

					<tr>
						<th class="td_right">类型</th>
						<td style="text-align: left;" colspan="3"><s:select
								list="%{#request.genreType}" name="genre" id="genre"
								value="e.genre" readonly="false" /></td>
					</tr>


					<tr>
						<th class="td_right">名称</th>
						<td style="text-align: left;"><s:textfield name="e.title"
								id="title" readonly="false"
								data-rule="标题:required;prodid;length[1~16]" /></td>
					</tr>
					<tr>
						<th class="td_right">简单描述</th>
						<td style="text-align: left;" colspan="3"><s:textarea
								name="e.bewrite" id="bewrite" readonly="false" rows="3"
								cols="80" /></td>
					</tr>
					<tr>
						<th class="td_right">详细介绍</th>
						<td style="text-align: left;" colspan="3"><s:textarea
								name="e.content" id="content" readonly="false" rows="3"
								cols="80" /></td>
					</tr>
					<tr>
						<th class="td_right">所属行业</th>
						<td style="text-align: left;" colspan="3"><s:select
								list="%{#request.industrylist}" listKey="id" listValue="name"
								name="industry" id="industry" value="e.industry"
								readonly="false" /></td>
					</tr>
					<tr>
						<th class="td_right">产品价格</th>
						<td style="text-align: left;"><s:textfield name="e.price"
								id="price" readonly="false"
								data-rule="产品价格:required;price;" /></td>
					</tr>
					<tr>
						<div class="inputtest inputtestl">
							<td class="td_right"><span class="leftname leftnamel"><input
									type="button" name="filemanager" id="filemanager"
									value="详情图片（720*288）" class="btn btn-success" /></span></td>
							<td style="text-align: left;"><span class="rightinfo"><input
									readonly="readonly" type="text" class="input" id="imgurl"
									name="e.imgurl" value="<s:property value='e.imgurl'/>" /> </span></td>
						</div>
					</tr>
					<tr>
						<div class="inputtest inputtestl">
							<td class="td_right"><span class="leftname leftnamel"><input
									type="button" name="filemanager2" id="filemanager2"
									value="列表图片（300*180）" class="btn btn-success" /></span></td>
							<td style="text-align: left;"><span class="rightinfo"><input
									readonly="readonly" type="text" class="input" id="logo"
									name="e.prologo" value="<s:property value='e.prologo'/>" /> </span></td>
						</div>
					</tr>

					<tr>
						<th class="td_right">数据来源</th>
						<td style="text-align: left;"><s:select
								list="%{#request.datasourcelist}" listKey="id" listValue="name"
								name="e.data_source" id="data_source"
								value="#request.e.data_source" /></td>

						<th class="td_right">app发布编号</th>
						<td style="text-align: left;"><s:textfield name="e.appid"
								id="appid" readonly="false" />
							<s:a href="#" cssClass="btn btn-success" id="selectPbczdbase">请选择</s:a></td>
					</tr>
					<tr>
						<th class="td_right">企业id</th>
						<td style="text-align: left;"><s:textfield name="e.releid"
								id="releid" readonly="false" /></td>

						<th class="td_right">发布人id</th>
						<td style="text-align: left;"><s:textfield
								name="e.releuserid" id="releuserid" readonly="false" /></td>
					</tr>
					<tr>
						<th class="td_right">创建时间</th>
						<td style="text-align: left;" colspan="3"><s:textfield
								name="e.createdate" id="createdate" readonly="true" /></td>
					</tr>
					<tr>
						<th class="td_right">创建人</th>
						<td style="text-align: left;" colspan="3"><s:textfield
								name="e.createby" id="createby" readonly="true" /></td>
					</tr>
					<tr>
						<th class="td_right">最后修改人</th>
						<td style="text-align: left;" colspan="3"><s:textfield
								name="e.updateby" id="updateby" readonly="true" /></td>
					</tr>
					<tr>
						<th class="td_right">最后修改时间</th>
						<td style="text-align: left;" colspan="3"><s:textfield
								name="e.updatedate" id="updatedate" readonly="true" /></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center;"><s:if
								test="e.pkid=='' or e.pkid==null">
								<button method="appGoods!insert.action" class="btn btn-success"
									onclick="javascript:submitNotValid2222(this)">
									<i class="icon-ok icon-white"></i> 新增
								</button>
							</s:if> <s:else>
								<button method="appGoods!update.action" class="btn btn-success">
									<i class="icon-ok icon-white"></i> 保存
								</button>
							</s:else></td>
					</tr>
				</table>

				
				<!-- 股东信息 -->
				<div id="tabs-2"></div>
				<!-- 财务信息 -->
				<div id="tabs-3"></div>


				<div id="tabs-4"></div>


				<div id="tabs-5"></div>
	</s:form>
	<div id="ldksq">
		<div id="ldksq_c">
			<div id="ldksq_lose"></div>
			<input type="hidden" name="e.id" value="<s:property value="e.id" />" />
			<p class="pbczdbaseTitle">
				app端未在pc端发布数据:<span style="margin-left: 20px;">输入产品标题进行模糊筛选：</span><input
					onkeypress="if (event.keyCode == 13)  return false" type="text"
					value="" style="margin-left: 20px; margin-bottom: 0;" />
				<button type="button" class="shaixuan btn btn-success"
					style="margin-left: 20px;">
					<i class="icon-ok icon-white"></i> 筛选
				</button>
			</p>
			<div class="pbczdbaseTable">

				<table id="pbczdbaseTablec" class="table table-bordered table-hover">

					<thead>
						<tr style="background-color: #dff0d8">
							<th width="20"><input type="radio" id="checkBox" /></th>
							<th>pkid</th>
							<th>类别</th>
							<th>申请人</th>
							<th>标题</th>
							<th>审核状态</th>
							<th>审核人</th>
							<th>最后修改时间</th>
						</tr>
					</thead>
					<tbody id="dataBody">

					</tbody>


				</table>

			</div>
			<p>
				<button id="ldksq_lose2" type="reset" class="btn btn-inverse"
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
	</div>
<script type="text/javascript">
                    if ('${flag}' != "") {
                        alert('${flag}');
                    }
                    $("#selectPbczdbase")
                            .click(
                                    function() {
                                        //ajax异步请求查询贷款申请表审核通过数据返回到id为pbczdbaseTablec的table表里面
                                        //1.查询之后返回到当前
                                        $.post("appGoods!selectAppProducts.action",function(data) {
                                                            var dataObj = eval("("+ data+ ")");
                                                            var htmlStr = "";
                                                            $.each(dataObj,function(k,v) {
                                                                                htmlStr += '<tr>'
                                                                                        + '<th width="20"><input lang="'+v.pkid+'" type="radio" name="dataCheckBox"  user="'+v.userid+'" qiye="'+v.qiyeid+'"/>'
                                                                                        + '</th><th>'
                                                                                        + v.pkid
                                                                                        + '</th>'
                                                                                        + '<th>'
                                                                                        + v.genre
                                                                                        + '</th>'
                                                                                        + '<th>'
                                                                                        + v.userid
                                                                                        + '</th>'
                                                                                        + '<th>'
                                                                                        + v.title
                                                                                        + '</th>'
                                                                                        + '<th>'
                                                                                        + v.review_id
                                                                                        + '</th>'
                                                                                        + '<th>'
                                                                                        + v.review_date
                                                                                        + '</th>'
                                                                                        + '<th>'
                                                                                        + v.update_at
                                                                                        + '</th></tr>'
                                                                            });
                                                            $("#dataBody").html(htmlStr);
                                                        });

                                        $("#ldksq").show();
                                        var divName = $("#ldksq_c");
                                        var top = ($(window).height() - $(
                                                divName).height()) / 2;
                                        var left = ($(window).width() - $(
                                                divName).width()) / 2;
                                        var scrollTop = $(document).scrollTop();
                                        var scrollLeft = $(document)
                                                .scrollLeft();
                                        $(divName).css({
                                            position : 'absolute',
                                            'top' : top,
                                            left : left + scrollLeft
                                        }).show();
                                    });
                    $("#ldksq_lose2").click(function() {
                        $("#ldksq").hide();
                    });
                    $("#btn-successok").click(function() {
                        var appTag = getDataIds();
                        $("#appid").val(appTag.attr("lang"));
                        $("#releuserid").val(appTag.attr("user"));
                        $("#releid").val(appTag.attr("qiye"));
                        //             alert(strid+"***"+pshid);return;
                        // 保存数据
                        // 设置数据
                        $("#ldksq").hide();

                        return;
                    });
                    function getDataIds() {
                        var dataTag = $("#dataBody input[name=dataCheckBox]:checked");
                        return dataTag;
                    }
                    KindEditor.ready(function(K) {
                        var editor = K.editor({
                            allowFileManager : false
                        });

                        K('#filemanager').click(function() {
                            editor.loadPlugin('image', function() {
                                editor.plugin.imageDialog({
                                    insertfile : K('#imgurl').val(),
                                    clickFn : function(url, title) {
                                        K('#imgurl').val(url);
                                        editor.hideDialog();
                                    }
                                });
                            });
                        });
                        K('#filemanager2').click(function() {
                            editor.loadPlugin('image', function() {
                                editor.plugin.imageDialog({
                                    insertfile : K('#logo').val(),
                                    clickFn : function(url, title) {
                                        K('#logo').val(url);
                                        editor.hideDialog();
                                    }
                                });
                            });
                        });

                    });
                </script>
	<script type="text/javascript">
		var custtype = '<s:property value="userType"/>';
	</script>

	<script
		src="<%=request.getContextPath()%>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/area.js"></script>



	<script type="text/javascript">
		var Gid = document.getElementById;

		$(function() {
			$("#tabs").tabs({
			//event: "mouseover"
			});
			//alert($("#insertOrUpdateMsg").html());
			if ($("#insertOrUpdateMsg").html() != ''
					&& $("#insertOrUpdateMsg").html().trim().length > 0) {
				$("#insertOrUpdateMsg").slideDown(1000).delay(1500).slideUp(
						1000);
			}

			$("#removePife").click(function() {
				clearRootImagePath();
			});
		});
	</script>

	<script charset="utf-8"
		src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
	<script charset="utf-8"
		src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>


	<!--点击下一步弹出发送短信对话框 start-->
	<div id="ldksq">
		<div id="ldksq_c">
			<div id="ldksq_lose"></div>
			<form action="productczdbase!donextstep.action" name="indexdksq"
				id="indexdksq" method="post">
				<input type="hidden" name="e.id" value="<s:property value="e.id" />" />
				<input type="hidden" name="e.status" id="status"
					value="<s:property value="e.status" />" /> <input type="hidden"
					name="e.userid" value="<s:property value="e.userid" />" /> <input
					type="hidden" id="phoneNumber"
					value="<s:property value="#request.custManage.cellPhoneNum"/> ">
				<input type="hidden" id="nickname"
					value="<s:property value="#request.custManage.nickname"/> ">

				<p id="tckselect" style="display: none; margin-top: 20px;">
					<span>贷款产品：</span><span><s:select
							list="#{'成长贷':'成长贷','壮大贷':'壮大贷','新创贷':'新创贷','开行统借统还贷款':'开行统借统还贷款','口行统借统还贷款':'口行统借统还贷款'}"
							id="daikuanpingz" name="e.daikuanpingz" cssClass="input-medium"
							listKey="key" listValue="value" headerKey="" headerValue=""
							data-rule="贷款品种:required;daikuanpingz" /></span>
				</p>
				<p id="tcktel">
					<span>电话号码：</span><input class="title" type="text"
						value="<s:property value="e.dianhua" />" name="e.dianhua"
						data-rule="短信标题:required;m_title;length[2~22]">
				</p>
				<p id="tckremark">
					<span class="msgcontenttype">短信内容：</span>
					<textarea class="duanxin" rows="4" cols="80" name="e.content"
						id="msgcontent" data-rule="短信标题:required;m_remark;length[2~512]">   </textarea>
				</p>
				<p>
					<button id="ldksq_lose2" type="reset" class="btn btn-inverse"
						style="margin-left: 20px;">
						<i class="icon-ok icon-white qx"></i> 取消
					</button>
					<button type="submit" class="btn btn-success"
						style="margin-left: 20px;">
						<i class="icon-ok icon-white"></i> 确定
					</button>
				</p>
			</form>
		</div>
	</div>

	<!--驳回
<div id="bhdksq">
    <div id="bhdksq_c">
        <div id="bhdksq_lose"></div>
        <form action="productczdbase!backstep.action" name="indexbhdksq" id="indexbhdksq" method="post">
        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        <input type="hidden" name="e.status" value="<s:property value="e.status" />"/>
        <input type="hidden" name="e.userid" value="<s:property value="e.userid" />"/>
        <p><span>电话号码：</span><input class="title" type="text"   value="<s:property value="e.dianhua" />" name="e.dianhua" data-rule="短信标题:required;m_title;length[2~22]"></p>
        <p><span>驳回原因：</span><textarea  rows="4" cols="80" name="e.content"   data-rule="短信标题:required;m_remark;length[2~64]">   </textarea></p>
        <p>
        	<button id="bhdksq_lose2" type="reset" class="btn btn-inverse"  style="margin-left:20px;">
				<i class="icon-ok icon-white qx"></i> 取消
			</button>
			<button type="botton" class="btn btn-success" style="margin-left:20px;">
				<i class="icon-ok icon-white"></i> 确定
			</button></p>
        </form>
    </div>
</div>
-->
</body>
</html>
