<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>

<script type="text/javascript" src="../js/onlytime/sucaihuojquery.js"></script>
<script src="../js/onlytime/jquery-ui.js"></script>
<script src="../js/onlytime/jquery-ui-slide.min.js"></script>
<script src="../js/onlytime/jquery-ui-timepicker-addon.js"></script>

<%--art弹出框js--%>
<script type="text/javascript" src="/js/artDialog/art_dialog.js"></script>
<%--<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>--%>
<%--<link rel="stylesheet" href="../resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>--%>

<script language="JavaScript" type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>


<link rel="stylesheet" href="../css/progressBar.css"/>
<link rel="stylesheet" href="../css/selectPbczdbase.css"/>
<style type="text/css">
			.example_2{width:100px;}
            .demo{width:500px; margin:20px auto}
            .demo h4{height:32px; line-height:32px; font-size:14px}
            .demo h4 span{font-weight:500; font-size:12px}
            .demo p{line-height:28px;}
            input{width:200px; height:20px; line-height:20px; padding:2px; border:1px solid #d3d3d3}
            pre{padding:6px 0 0 0; color:#666; line-height:20px; background:#f7f7f7}

            .ui-timepicker-div .ui-widget-header { margin-bottom: 8px;}
            .ui-timepicker-div dl { text-align: left; }
            .ui-timepicker-div dl dt { height: 25px; margin-bottom: -25px; }
            .ui-timepicker-div dl dd { margin: 0 10px 10px 65px; }
            .ui-timepicker-div td { font-size: 90%; }
            .ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
            .ui_tpicker_hour_label,.ui_tpicker_minute_label,.ui_tpicker_second_label,.ui_tpicker_millisec_label,.ui_tpicker_time_label{padding-left:20px}
			.timeInput input{width: 36px;}
			.table th, .table td {padding: 3px;}

			#ldksq1{display:none;width: 100%;height: 100%;position: fixed;left: 0;top:0;bottom: 0;right: 0;margin:auto;z-index: 9999!important;background:url("../img/lobg_03.png") repeat;}
			#ldksq_a{background-color: #fff;width: 520px;min-height:140px;/*position: absolute;top:0;left:0;right:0;bottom: 0;*/margin:auto;border-radius: 5px;behavior: url(PIE.htc);padding:10px;}
			#ldksq_l{background: url("../../img/delete.png") no-repeat;position: absolute;right: 10px;top:10px;width: 16px;height: 16px;cursor: pointer;}
			#ldksq_a p{text-align:center;}
			#ldksq_a .qx{background:url("../../img/delete.png") no-repeat;}
			#ldksq_a form{margin:0; padding-top: 10px;;}
			#ldksq_a input.title,textarea.duanxin{width:400px;;}
			
			#ldksq11{display:none;width: 100%;height: 100%;position: fixed;left: 0;top:0;bottom: 0;right: 0;margin:auto;z-index: 9999!important;background:url("../img/lobg_03.png") repeat;}
			#ldksq_a1{background-color: #fff;width: 1000px;height:600px;overflow-y:scroll;margin:auto;border-radius: 5px;behavior: url(PIE.htc);padding:10px;}
			#ldksq_l1{background: url("../../img/delete.png") no-repeat;position: absolute;right: 10px;top:10px;width: 16px;height: 16px;cursor: pointer;}
			#ldksq_a1 p{text-align:center;}
			#ldksq_a1 .qx{background:url("../../img/delete.png") no-repeat;}
			#ldksq_a1 form{margin:0; padding-top: 10px;;}
			#ldksq_a1 input.title,textarea.duanxin{width:400px;}
			#expscoreTale th,#expscoreTale td{padding:1px;}
			#expscoreTale input{width: 80px;}
			#expscoreTale textarea{width: 71px;height: 150px;}
			.cheExpForm{color:red;}
        </style>
<link rel="stylesheet" href="../css/onlytime/jquery-ui.css"/>
<%-- <script src="../js/jquery.min.js"></script> --%>

<script src="../js/selectPbczdbase.js"></script>


<style>
	.td_right{text-align: right;}
	.example_2{cursor:pointer!important;background:#fff!important;}
</style>
<script type="text/javascript">
	$(function() {
			 $("#username").focus();
		 $('.example_2').timepicker({});
		 
		 if($("#content").val()=='') {
			 $("#content").val('高新区第pichi次 政策性产品评议会 将于 begindate pingshenshijian点整开始，贵公司上会时间安排于pingshenshijiantwo开始，请合理安排出席时间。参会人员：企业市场营销负责人及技术负责人务必到场现场讲解PPT参会地点：高新区锦城大道539号盈创动力大厦A座5楼 盈创公司会议室注意：企业现场讲解PPT电子版5分钟，交流10分钟，每个项目共计15分钟，请合理安排时间');
		 }
		 
	
		 if($("#pmingcheng").val()=='') {
			 $("#pmingcheng").val('高新区政策性贷款产品评议会');
		 }
		 if($("#jiangeshijian").val()==''||$("#jiangeshijian").val()==0) {
			 $("#jiangeshijian").val(15);
		 }
	
		 
	});
	
</script>
</head>

<body>
<!-- 按钮 -->
	<table class="table table-bordered table-condensed">
	<!--按钮 -->
		
		<tr>
			<td colspan="11">
<%-- 				<%if(PrivilegeUtil.check(request.getSession(), "pingshenhuimingxi!insert.action")){%> --%>
<%-- 					<s:a method="toAdd" cssClass="btn btn-success"> --%>
<!-- 						<i class="icon-plus-sign icon-white"></i> 添加 -->
<%-- 					</s:a> --%>
<%-- 				<%} %> --%>
				
<%--  							<s:submit method="deletes" onclick="return deleteSelect()" value="删除" cssClass="btn btn-danger"/>  --%>
				
				
				
				
				<s:if test="e.id=='' or e.id==null">
</s:if>
<s:else>

				<s:a href="#" cssClass="btn btn-success" id="selectPbczdbase">添加</s:a>
				<s:a href="javascript:deleFunc()" cssClass="btn btn-danger">删除</s:a> 
				<button type="button" class="btn btn-info sendpshmessage" style="margin-left:20px;">
					<i class="icon-ok icon-white"></i> 发送短信
				</button>
				<button type="button" class="btn btn-info" id="saveNumberId" style="margin-left:20px;">保存序号</button>
				</s:else>
				
			</td>
		</tr>
	</table>
	<!--selectPbczdbase.js判断隐藏table  -->
	<input id="ifValue" type="hidden" value="<s:property value="#request.dlist.size()"/>">
	<!--具体评审时间变量 -->
	<!--评审会明细列表部分-->
	<table id="ifshowTab" class="table table-bordered table-hover"  >
		<thead>
		<tr style="background-color: #dff0d8">
			<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
			<th style="display: none;">id</th>
 					<%--<th>ID</th>--%>
					<th>序号</th>
					<th>企业名称</th>
					<th>行业</th>
					<th>申请金额</th>
					<th>具体评审时间</th>
					<th>产品名称</th>
					<th>客户经理</th>
					<th align="center">排序</th>
					<th align="center">电话号码</th>
					
<!-- 					<th>录入时间</th> -->
<!-- 					<th>录入人</th> -->
<!-- 					<th>最后修改时间</th> -->
					<th>平均分</th>
 					<th nowrap="nowrap">操作</th> 
		</tr></thead>
		<tbody id="pingshenMxDataBody">
			<form id="saveNumberDataId">
				<s:iterator  value="#request.dlist" >
						<tr class= 'shangjialist' time='<s:property value="pingshenshijian"/>'>
							<td>
								<input type="checkbox" name="ids"   value="<s:property value="id"/>"/>
							</td>
							<td  style="display: none;">&nbsp;<s:property value="id"/><input type="hidden" value="<s:property value="id"/>" name="did"></td>
							<%--<td>&nbsp;<s:property value="id"/></td>--%>
							<td>&nbsp;<input type="text" onblur="removeRepeat(this);if(this.value=='') {this.value=0};this.value=this.value.replace(/\.$/g,'');"
											 class="n-valid remove-repeat-id" style="width: 20px;"
											 value="<s:property value="xuhao"/>" name="number"
											 oninput="isNumber(this)"></td>
							<td>&nbsp;<s:property value="qiyemingcheng"/></td>
							<td>&nbsp;<s:property value="hangye"/></td>
							<td>&nbsp;<s:property value="shenqingjine"/>万</td>
							<td class="timeInput">&nbsp;
								<input type="text" readonly="true" class="example_2 time1 pingshenshijian" value='<s:property value="pingshenshijian.substring(0,5)"/>'  lang='<s:property value="rele_pingshenhui"/>' accesskey="<s:property value="xuhao"/>"  /><span> -
								</span><input type="text" readonly="true"  value='<s:property value="pingshenshijian.substring(6)"/>' class="example_2 example_2e time2" lang='<s:property value="rele_pingshenhui" />' accesskey="<s:property value="xuhao"/>"  /></td>
							<td class="chanpingmingcheng">&nbsp;<s:property value="chanpingmingcheng"/></td>
							<td>&nbsp;<s:property value="checkuser"/></td>
							<td><a href="#" onclick="sortFunc(0,<s:property value="id"/>,<s:property value="rele_pingshenhui"/>, <s:property value="xuhao"/>);">上升</a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="sortFunc(1, <s:property value="id"/>,<s:property value="rele_pingshenhui"/>, <s:property value="xuhao"/>);">下降</a></td>
	<%-- 						<td>&nbsp;<s:property value="lurushijian"/></td> --%>
	<%-- 						<td>&nbsp;<s:property value="inputuser"/></td> --%>
	<%-- 						<td>&nbsp;<s:property value="lastchgtime"/></td> --%>
							<%-- <td>
								<s:a href="productczdbase!toEdit.action?e.id=1">编辑</s:a>
							</td> --%>

							<td class='telnumber' ><s:property value="dianhua"/></td>
							<td class="avgscore" id="${id}"></td>
							<td><a href="javascript:void(0);" onclick="getExpScore('${id}','${userid }','${qiyemingcheng }');" style="color: blue;">专家评分</a></td>

					</tr>
				</s:iterator>
			</form>
		</tbody>
	</table>
<%-- 	</s:if> --%>
				
<!--评审会编辑部分 -->
<s:form action="pingshenhui" namespace="/manage" theme="simple" id="form">
	<table class="table table-bordered">
	 
		<tr style="display:none;">
			<th><input type="hidden" id="singleid" name="id" value="<s:property value="e.id" />"></th>
			<td><input type="hidden" id="prodcutIds" name="prodcutIds"></td>
		</tr>
			<tr>
				<th class="td_right">评审时间</th>
			  <td style="text-align: left;">
			<input id="begindate" class="Wdate search-query" type="text" name="e.shijian"
			value="<s:property value="e.shijian" />"
			onFocus="WdatePicker({isShowClear:false,readOnly:false})" data-rule="评审时间;required"/> 
			</td>
				
					
								

			</tr>
			
			
				
				
				
						<tr>
			<th class="td_right">间隔时间（分钟）</th>
			<td style="text-align: left;">
			<s:textfield name="e.jiangeshijian" id="jiangeshijian" readonly="false" data-rule="间隔时间:required;jiangeshijian;length[1~5]"/>
			</td>
			</tr>
				
				
				
				
								<tr>
			<th class="td_right">批次</th>
			<td style="text-align: left;">
			<s:textfield name="e.pichi" id="pichi" readonly="false" />
			</td>
			</tr>
				
			<tr>
				<th class="td_right">评审会名称</th>
				<td style="text-align: left;">
					<s:textfield name="e.pmingcheng" id="pmingcheng"  readonly="false" data-rule="评审会名称:required;pmingcheng;length[2~64]"/>
				</td>
			</tr>
			
			<tr>
				<th class="td_right">评审会专家（空格分隔）</th>
				<td style="text-align: left;">
					<s:textfield name="e.experts" id="experts"  readonly="false" data-rule="评审会专家:required;experts;length[2~64]"/>
				</td>
			</tr>
			<tr>
			<th class="td_right">评审要求</th>
			<td style="text-align: left;">
			<s:textarea rows="6" cols="120"  name="e.content" id="content" readonly="false"  data-rule="评审要求:required;content;length[2~512]">
			</s:textarea>
			</td>
			</tr>
				
								<tr>
			<th class="td_right">户数</th>
			<td style="text-align: left;">
			<s:textfield name="e.hushu" id="hushu" readonly="true" />
			</td>
			</tr>
				
								<tr>
			<th class="td_right">申请总金额</th>
			<td style="text-align: left;">
			<s:textfield name="e.shenqingzongjine" id="shenqingzongjine" readonly="true"/><div id="refreshamt" >刷新</div>
			</td>
			</tr>
				
<!-- 								<tr> -->
<!-- 			<th class="td_right">录入时间</th> -->
<!-- 			<td style="text-align: left;"> -->
<%-- 			<s:textfield name="e.lurushijian" id="lurushijian" readonly="true" data-rule="户数:required;hushu;length[2~4]"/> --%>
<!-- 			</td> -->
<!-- 			</tr> -->
				
<!-- 								<tr> -->
<!-- 			<th class="td_right">录入人</th> -->
<!-- 			<td style="text-align: left;"> -->
<%-- 			<s:textfield name="e.inputuser" id="inputuser"  readonly="true" data-rule="申请总金额:required;shenqingzongjine;length[2~9]"/> --%>
<!-- 			</td> -->
<!-- 			</tr> -->
				
<!-- 								<tr> -->
<!-- 			<th class="td_right">最后修改时间</th> -->
<!-- 			<td style="text-align: left;"> -->
<%-- 			<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="true" /> --%>
<!-- 			</td> -->
<!-- 			</tr> -->
				
								
			   
		<tr >
			<td colspan="2" style="text-align: center;">
				<s:if test="e.id=='' or e.id==null">
					<button type="button" class="btn btn-success adddetaile">
						<i class="icon-ok icon-white"></i> 新增
					</button>
				</s:if>
				<s:else>
						<button type="button"  class="btn btn-success savedetaile">
							<i class="icon-ok icon-white"></i> 保存
						</button>
				</s:else>
			</td>
		</tr>
	</table>
</s:form>
<div style="clear:both;"></div>
 <!--点击添加按钮弹出对话框       贷款明细列表-->
<div id="ldksq">
    <div id="ldksq_c">
        <div id="ldksq_lose"></div>
        <form action="" name="indexdksq" id="indexdksq" method="post">
        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        <p class="pbczdbaseTitle">基础贷款申请表审核通过数据:<span style="margin-left:20px;">输入企业名称进行模糊筛选：</span><input onkeypress="if (event.keyCode == 13)  return false" type="text" value="" style="margin-left:20px;margin-bottom:0;"/><button type="button"  class="shaixuan btn btn-success" style="margin-left:20px;"><i class="icon-ok icon-white"></i> 筛选</button></p>
        <div class="pbczdbaseTable">
        
        <table id="pbczdbaseTablec" class="table table-bordered table-hover">
        
		<thead>
		<tr style="background-color: #dff0d8">
			<th width="20"><input type="checkbox" id="checkBox" disabled="disabled"/></th>
			<th style="display: none;">id</th>
			<th>申请人</th>
			<th>企业名称</th>
			<th>申请金额</th>
			<th>贷款品种</th>
			<th>申请贷款期限</th>
			<th>审批状态</th>
			<th>审核人</th>
			<th>最后修改时间</th>
		</tr>
		</thead>
		<tbody id="dataBody">
			
		</tbody>
		
		
	</table>
        
        </div>
        <p>
        	<button id="ldksq_lose2" type="reset" class="btn btn-inverse"  style="margin-left:20px;">
				<i class="icon-ok icon-white qx"></i> 取消
			</button>
			<button id="btn-successok" type="button" class="btn btn-success" style="margin-left:20px;">
				<i class="icon-ok icon-white"></i> 确定
			</button>
		</p>
        </form>
    </div>
</div>

<div id="ldksq1">
	<div id="ldksq_a">
	<div id="ldksq_l"></div>
		<p id="tckremark"><span class="msgcontenttype">短信内容：</span><textarea class="duanxin" rows="4" cols="80" name="e.content" id="msgcontent"   data-rule="短信标题:required;length[2~512]">   </textarea></p>
		<p>
			<button type="reset" id="ldksq_lo" class="btn btn-inverse"  style="margin-left:20px;">
				<i class="icon-ok icon-white qx"></i> 取消
			</button>
			<button type="button" class="btn btn-success" onclick="sendMsgs()" style="margin-left:20px;">
				<i class="icon-ok icon-white"></i> 确定
			</button>
		</p>
	</div>
</div>

<div id="ldksq11">
	<div id="ldksq_a1">
	<div id="ldksq_l1"></div>
			<p>
				<table id="expscoreTale" class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="col" colspan="4" style="text-align: center;">成都高新区政策性信贷产品专家评议表</th>
						</tr>
						<tr>
							<th class="col" colspan="4" style="text-align: left;">企业名称：<span id="expqiyename"></span></th>
						</tr>
					</thead>
					<tbody>
						<tr class="expinputtr" style="display: none;">
							<td colspan="3"></td>
						</tr>
						<tr class="expinputtr">
							<td style="width: 50px;">大类指标</td>
							<td style="width: 79px;">中类指标</td>
							<td>具体指标</td>
						</tr>
						<tr class="expinputtr">
							<td rowspan="7">技术指标</td>
							<td>知识产权/标准</td>
							<td>发明、实用新型、外观专利、软件著作权、行业标准等</td>
						</tr>
						<tr class="expinputtr">
							<td rowspan="3">权威认定</td>
							<td>A类：高企、双软、集成电路</td>
						</tr>
						<tr>
							<td>B类：CE、CMMI、GMP</td>
						</tr>
						<tr>
							<td>C类：ISO1400、OHSMSISO 18000、ISO22000</td>
						</tr>
						<tr class="expinputtr">
							<td rowspan="2">研发投入</td>
							<td>研发费用占销售收入比例</td>
						</tr>
						<tr>
							<td>研发人员占职工总数比例</td>
						</tr>
						<tr class="expinputtr">
							<td>技术应用</td>
							<td>技术应用的市场前景</td>
						</tr>
						<tr class="expinputtr">
							<td rowspan="7">市场指标</td>
							<td>行业</td>
							<td>发展前景及市场容量</td>
						</tr>
						<tr class="expinputtr">
							<td rowspan="3">产品竞争力</td>
							<td>产品销售范围</td>
						</tr>
						<tr>
							<td>产品在细分行业占比</td>
						</tr>
						<tr>
							<td>获得名牌产品或驰名（著名）商标情况</td>
						</tr>
						<tr class="expinputtr">
							<td rowspan="2">高管团队</td>
							<td>教育背景及学历</td>
						</tr>
						<tr>
							<td>行业从业经历</td>
						</tr>
						<tr class="expinputtr">
							<td>市场拓展</td>
							<td>市场拓展的前景</td>
						</tr>
						<tr class="expinputtr">
							<td rowspan="2">信用指标</td>
							<td>金融信用</td>
							<td>银行贷款违约情况</td>
						</tr>
						<tr class="expinputtr">
							<td>公共信用</td>
							<td>法院强制执行、税务稽查、工商执法、环保事故、安全生产事故等情况</td>
						</tr>
						<tr class="expinputtr">
							<td rowspan="3">党建增信（附加10分）</td>
							<td>是否设立党支部（4分）</td>
							<td>设立党支部4分，否则0分。</td>
						</tr>
						<tr class="expinputtr">
							<td>公司党员占比（3分）</td>
							<td>党员占比20%（含）以上得3分，10%（含）以上得2分，10%以下得1分。</td>
						</tr>
						<tr class="expinputtr">
							<td>公司管理层党员人数（3分）</td>
							<td>公司管理层党员人数3人（含）以上3分，1人（含）以上得1分，否则0分。</td>
						</tr>
					</tbody>
					<tfoot>
						<tr class="expinputtr">
							<td colspan="3">总分：（平均分<input id="average" disabled='disabled'/>）</td>
						</tr>
						<tr class="expinputtr">
							<td colspan="3">党建增信附加得分</td>
						</tr>
						<tr class="expinputtr">
							<td colspan="3">评议意见：</td>
						</tr>
					</tfoot>
				</table>
				<div id="relaMingxi" style="display: none;"></div>
				<div id="mingxiUserid" style="display: none;"></div>
			</p>
		<p>
			<button type="reset" id="ldksq_lo1" class="btn btn-inverse"  style="margin-left:20px;">
				<i class="icon-ok icon-white qx"></i> 关闭
			</button>
			<button type="button" class="btn btn-success" id="expsubmit" onclick="saveExpScore();" style="margin-left:20px;">
				<i class="icon-ok icon-white"></i> 保存
			</button>
		</p>
	</div>
</div>

</body>
<script type="text/javascript">
	function getExpScore(id, userid, qiyemingcheng) {
		$("#expqiyename").html(qiyemingcheng);
		$("#expsubmit").removeAttr("disabled");
		var experts = $.trim('${e.experts}').replace(/\s+/g, ' ');
		var expert = experts.split(" ");
		var length = expert.length;
		if (experts == "" || length > 4) {
			alert("评审会专家不能为空，且小于4个。");
			$("#experts").focus();
			return;
		}
		if (userid == "") {
			alert("无法关联到企业，不能进行专家评分。");
			return;
		}
		$("#ldksq11").show();
		var divName = $("#ldksq_a1");
		var top = ($(window).height() - $(divName).height())/2;
		var left = ($(window).width() - $(divName).width())/2;
		var scrollTop = $(document).scrollTop();
		var scrollLeft = $(document).scrollLeft();
		$(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
		
		$(".addexptd").remove();
		$("#relaMingxi").html(id);
		$("#mingxiUserid").html(userid);
		$.ajax({
			type: 'post',
			url: "/manage/pingshenhui!getExpScore.action",
			dataType: "json",
			data: {"id": id},
			success: function(data) {
				var list = data.list;
				addTd(list, 0);
				var arr = new Array();
				for (var i = 0; i < list.length; i ++ ) {
					var expert_name = checknull(list[i]["expert_name"]);
					for (var x = 0; x < expert.length;x ++ ) {
						if (expert_name == expert[x]) {
							expert.splice(x, 1); 
							break;
						}
					}
				}
				var arr = new Array();
				for (var i = 0; i < expert.length; i++ ) {
					var data = new Object();
					arr[i] = data;
				}
				for (var x = 0; x < expert.length;x ++ ) {
					arr[x]["expert_name"] = expert[x];
				}
				addTd(arr, list.length);
				$(".col").attr("colspan", 3 + list.length + expert.length);
				calculateaverage();
			}
		});
	};
	var expsub = true;
	function saveExpScore() {
		$("#expsubmit").attr({"disabled":"disabled"});
		$(".cheExpForm").remove();
		calcuparty();
		expsub = true;
		var arr = new Array();
		for (var i = 0; i < $("input[name='expid']").length; i++ ) {
			var data = new Object();
			data["evaluate_date"] = '${e.shijian}';
			data["rela_mingxi"] = $("#relaMingxi").html();
			arr[i] = data;
		}
		var field = new Array("intellectual_score","authority_score","research_score","technology_score","industry_score",
					"product_score","team_score","market_score","finance_score","public_score","party_branch","party_member","manage_party_member");
		for (var i = 0; i < field.length; i++) {
			$("input[name='" + field[i] + "']").each(function(j){
				arr[j][field[i]] = checkNum(this);
			});
		}
		$("input[name='expid']").each(function(j){
			arr[j]["id"] = $(this).val();
		});
		var fi = new Array("total_score", "expert_name","all_party");
		for (var i = 0; i < fi.length; i++) {
			$("input[name='" + fi[i] + "']").each(function(j){
				arr[j][fi[i]] = $(this).val();
			});
		}
		$("input[name='version_no']").each(function(j){
			var value = $(this).val();
			arr[j]["version_no"] = value == "" ? 1 : value;
		});
		$("textarea[name='expert_memo']").each(function(j){
			var value = $(this).val();
			if (value.length > 128 || value.length == 0) {
				$(this).after("<span class='cheExpForm'><br/>请输入1-128个字</span>")
				expsub = false;
			}
			arr[j]["expert_memo"] = value;
		});
		if (expsub) {
			$.ajax({
				type: 'post',
				url: "/manage/pingshenhui!saveExpScore.action",
				dataType: "json",
				data: {
					"arr": JSON.stringify(arr),
					userid: $("#mingxiUserid").html()
				},
				success: function(data) {
					if (data.msg == "succ") {
						alert("保存成功");
						$("#ldksq11").hide();
						getAvgScore();
					} else {
						alert(data.msg)
					}
				}
			});
		} else {
			alert("验证失败，请检查后重新提交");
			$("#expsubmit").removeAttr("disabled");
		}
	}
	
	function checknull(val) {
		return typeof(val) != "undefined" ? val : "";
	}
	
	function checkNum(obj){
		var val = $(obj).val();
		var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;
		if (!num.test(val) || (val > 10 || val < 0)) {
			$(obj).after("<span class='cheExpForm'><br/>请输入数字0-10，最多保留2位小数</span>")
			expsub = false;
		}
		return val;
	}
	
	function addTd(list, num) {
		var fi = ["id", "expert_name","intellectual_score","authority_score","research_score","technology_score","industry_score",
					"product_score","team_score","market_score","finance_score","public_score","party_branch","party_member","manage_party_member","total_score","all_party","expert_memo"];
		for (var i = 0; i < list.length; i ++ ) {
			var exp = list[i];
			$(".expinputtr").each(function(j) {
				var val = checknull(exp[fi[j]]);
				var html = "";
				if (j == 0) {
					html = "<td class='addexptd'><input name='expid' value='" + val + "'/><input name='version_no' value='" + checknull(exp["version_no"]) + "'/></td>";
				} else if (j == 1) {
					html = "<td class='addexptd' style='width:85px;'><input disabled='disabled' name='" + fi[j] + "' value='" + val + "'/></td>";;
				} else if (j == 15 || j == 16) {
					html = "<td class='addexptd'><input id=" + fi[j] + (i + num) + " disabled='disabled' name='" + fi[j] + "' value='" + val + "'/></td>";
				} else if (j == 17) {
					html = "<td class='addexptd'><textarea maxlength='128' name='" + fi[j] + "'>" + val + "</textarea></td>";
				} else if (j >= 12 && j <= 14) {
					html = "<td class='addexptd'><input onblur='calcuparty(" + (i + num) + ");' id=" + fi[j] + (i + num) + " maxlength='5' name='" + fi[j] + "' value='" + val + "'/></td>";
				} else {
					var len = $(this).children('td').length;
					var row = $(this).children(":first").attr("rowspan");
					if (len == 3 + i + num) {
						row = $(this).children('td').eq(1).attr("rowspan")
					}
					var rowhtml = "";
					if (typeof(row) != "undefined") { 
						rowhtml = " rowspan='" + row + "'";
					} 
					html = "<td" + rowhtml + " class='addexptd'><input onblur='calculate(" + (i + num) + ");' id=" + fi[j] + (i + num) + " maxlength='5' name='" + fi[j] + "' value='" + val + "'/></td>";
				}
				$(this).append(html);
			});
		}
	}
	
	function calcuparty(num) {
		var fi = ["party_branch","party_member","manage_party_member"];
		var count = 0;
		for (var i = 0; i < fi.length; i++) {
			var val = $("#" + fi[i] + num).val();
			if (!isNaN(val) && val != 0) {
				count += parseFloat(val);
			}
		}
		$("#all_party" + num).val(parseFloat(count.toFixed(2)));
		calculateaverage();
	}
	
	function calculate(num){
		var fi = ["intellectual_score","authority_score","research_score","technology_score","industry_score","product_score","team_score","market_score","finance_score","public_score"];
		var count = 0;
		for (var i = 0; i < fi.length; i++) {
			var val = $("#" + fi[i] + num).val();
			if (!isNaN(val) && val != 0) {
				count += parseFloat(val);
			}
		}
		$("#total_score" + num).val(parseFloat(count.toFixed(2)));
		calculateaverage();
	}
	
	function calculateaverage() {
		var total_score = $("input[name='total_score']");
		var score = 0;
		total_score.each(function(){
			var val = $(this).val();
			if (!isNaN(val) && val != 0) {
				score += parseFloat(val);
			}
		});
		$("#average").val(parseFloat((score / total_score.length).toFixed(2)));
	}
	
	function getAvgScore(){
		var arr = new Array();
		$(".avgscore").each(function(){
			arr.push($(this).attr("id"));
		});	
		if (arr.length < 1) {
			return;
		}
		$.ajax({
			type: 'post',
			url: "/manage/pingshenhui!getAvgScore.action",
			dataType: "json",
			data: {"ids": arr.join(",")},
			success: function(data) {
				var list = data.list;
				$(".avgscore").each(function(){
					var id = $(this).attr("id");
					var score = "0";
					for (var i = 0; i < list.length; i ++ ) {
						if (list[i].ID == id) {
							score = list[i].SCORE;
							break;
						}
					}
					$(this).html((parseFloat(score) + 0.000000000001).toFixed(2));
				});
			}
		});
	}
	getAvgScore();
</script>
<script type="text/javascript">
$(function(){
	$('.sendpshmessage').click(function(){
		showMsg($('#content').val());
	});
	//保存序号
	$('#saveNumberId').click(function () {
		var fal = true;

		$('[name = number]').each(function() {
			numObj = $(this);
			if(numObj.val() == '') {
				$(this).attr("style", "border: 1px solid red;width: 20px;");
				$(this).focus(function(){
					$(this).attr("style", "width: 20px;");
				});
//				numObj.err("序号不能为空！");
				msg.info("序号不能为空");
				fal = false;
			} else {
				$(this).attr("style", "width: 20px;");
//				$(this).closeErr();
			}
		})

		if(fal) {
			$.post("/manage/pingshenhui!updateNumber.action", $('#saveNumberDataId').serialize(), function (data) {

				if(data.msg == 'success') {
					msg.info("保存成功！");
					sendTime();
					setTimeout('location.reload()', 1000);
				} else if (data.msg == 'erro') {
					msg.info("保存失败，请稍后再尝试");
					setTimeout('location.reload()', 1000);
				} else if(data.msg == 'idIsNull'){
					msg.info("没有需要保存的数据！");
					setTimeout('location.reload()', 1000);
				} else {
					msg.info("未知的错误！");
					setTimeout('location.reload()', 1000);
				}
			}, 'json')
		}
	})
});
//去除重复的。
function removeRepeat(obj) {
	$(obj).removeClass('remove-repeat-id');
	var rnum = $(obj).val();

	$(obj).parent().parent().parent().find('.remove-repeat-id').each(function () {
		var num = $(this).val();

		if(num == rnum) {
			$(this).val('');
		}
	})
	$(obj).addClass('remove-repeat-id');
}

//效验数字
function isNumber(obj) {
	var $amountInput = $(obj);
	//先把非数字的都替换掉，除了数字和.
	$amountInput.val($amountInput.val().replace(/[^\d.]/g, "")
			.replace(/^\./g, "").replace(/\.{2,}/g, ".").replace(".", "$#$").replace(/\./g, "").replace("$#$", ".").replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'));
}

$(function() {
	$("#ldksq_l,#ldksq_lo").click(function(){
		$("#ldksq1").hide();
	});
	$("#ldksq_l1,#ldksq_lo1").click(function(){
		$("#ldksq11").hide();
	});
})
function showMsg(content){
	$("#ldksq1").show();
//	var content = "您好,贵公司资料未填写完整，请填写完整再提交，如有问题请联系， "+ phoneNumber +"，"+ nickname +"。";

	$("#msgcontent").val(content);
	var divName = $("#ldksq_a");
	var top = ($(window).height() - $(divName).height())/2;
	var left = ($(window).width() - $(divName).width())/2;
	var scrollTop = $(document).scrollTop();
	var scrollLeft = $(document).scrollLeft();

	$(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
};

function sendMsgs() {
	var pichi = $('#pichi').val();
	var begindate = $('#begindate').val().substring(0,10);
	var shangjialists = $('.shangjialist');
	var pingshenshijian = $('.shangjialist').eq(0).children().find('.pingshenshijian').eq(0).val();
	var pingshenshijiantwo = '';
	var telnumber = '';
	var request = $('#content').val();

	//动态替换评审要求文本框中的字符串
	var x,s,reg,newrequest='';
	var arr =["pichi","begindate","pingshenshijian","pingshenshijiantwo"];


	var arrw = new Array();
	var fal = true;
	var msg = "";
	shangjialists.each(function(){
		pingshenshijiantwo = $(this).children().find('.pingshenshijian').eq(0).val();
		telnumber = $(this).children().last().prev().prev().html();

		//没循环一次要把所有字符串替换完
		for(x in arr){
			s = arr[x];
			reg=new RegExp("("+s+")","");//不用全局匹配，否则会把字符串中相同字符替换掉
			//每替换一次后的值要保存下来，作为下一次的被替换字符串
			if(newrequest.length>0){
				newrequest=newrequest.replace(reg,eval("("+s+")"));
			}else{
				newrequest=request.replace(reg,eval("("+s+")"));
			}

		}
		//arrw.push(newrequest);
		var index = $(this).index();
		var length = shangjialists.length;
		$.post("/manage/message!insert2.action",{telnumber:telnumber,comtent:newrequest}, function(data) {

			if(data != 0){
				fal = false;
				msg = msg + telnumber + "  ";
			}

			if(index == length) {

				if(fal) {
					alert("发送成功！");
					$("#ldksq1").hide();
				} else {
					alert(msg + "发送失败,请稍后再尝试！");
					$("#ldksq1").hide();
				}
			}
		});

		newrequest = '';//大循环执行一次发送的字符串应该恢复初始值，进行下一次组装。

	});

//		location.reload();
	//alert(arrw.length);
	//alert(pingshenshijian2);
}
</script>
</html>
