<%@page import="com.winpow.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/zTree3.1/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<style>

		.keywordinput{
			color: #dedfdf; font-size: 12px; padding: 7px 10px;width: 78%;outline: none;display: block;margin: 0 auto;
			border-radius: 15px;border:0;
			background:#515d65 url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/search.png") no-repeat 95% center;
		}
		#expandOrCollapseAllBtn{color: #00beda;padding-left:20px;display: block;margin:3px 0 8px 25px;
			background: url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/updown.png") no-repeat 0 center;
		}
		#loadID{width: 110%;}

		.ztree {margin:0; padding:0px; color:#333}
		.ztree li{text-indent: 25px; margin:0; list-style:none; line-height:14px; text-align:left; white-space:nowrap}
		.ztree li ul{ background: #374754 !important;padding: 0;}
		.ztree li ul li{padding:0;}
		.ztree li ul li a{display: block;padding:6px 0 6px 25px;margin: 0;}
		.ztree>li a:hover{background: #4b5d6c;text-decoration: none;}
		.ztree li a.curSelectedNode{padding-top:6px;background:none;border:0;opacity: 1;}

		/*.ztree li ul.line{ background:url(./img/line_conn.gif) 0 0 repeat-y;}*/

		.ztree li a {padding:6px 0;  cursor:pointer; height:16px; background-color: transparent;
			text-decoration:none; vertical-align:top; display: inline-block;}
		/*.ztree li a:hover {color:#00b1da; }*/
		.ztree li ul li a.curSelectedNode { color:#00b1da !important;
			background: url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/ztreearrow_on.png") no-repeat 40px 10px;
			background-size: 4px auto;
		}
		
		.ztree li a.curSelectedNode_Edit {padding-top:0px; background-color:#FFE6B0; color:black; border:1px #FFB951 solid; opacity:0.8;}
		.ztree li a.tmpTargetNode {padding-top:0px; background-color:#316AC5; color:white; border:1px #316AC5 solid;
			opacity:0.8; filter:alpha(opacity=80)}


		.ztree li a{color:#fff; display: block;}
		.ztree li button {float:right;}
		.ztree li button.switch {
			/*width:18px; height:18px*/
			width: 14px;height: 14px;margin-right: 25px;margin-top:7px;
		}
		.ztree li button.root_open{background-position:-92px -54px}
		.ztree li button.root_close{background-position:-74px -54px}
		.ztree li button.roots_open{background-position:-92px 0}
		.ztree li button.roots_close{background-position:-74px 0}
		.ztree li button.center_open{
			/*background-position:-92px -18px;*/
			background: url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/jian.png") no-repeat;
		}
		.ztree li button.center_open+a{color: #00beda !important;}
		.ztree li button.center_close{
			/*background-position:-74px -18px;*/
			background: url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/jia.png") no-repeat;
		}

		.ztree li button.bottom_open{
			/*background-position:-92px -36px*/
			background: url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/jian.png") no-repeat;
		}
		.ztree li button.bottom_open+a{color: #00beda !important;}
		.ztree li button.bottom_close{
			/*background-position:-74px -36px*/
			background: url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/jia.png") no-repeat;
		}
		.ztree li button.noline_open{background-position:-92px -72px}
		.ztree li button.noline_close{background-position:-74px -72px}
		.ztree li button.root_docu{ background:none;}
		.ztree li button.roots_docu{  background-position:-56px 0;  background: none; }
		.ztree li button.center_docu{ background: none;}
		.ztree li button.bottom_docu{  background-position:-56px -36px;  background: none;  }
		.ztree li button.noline_docu{ background:none;}
		.ztree li button.ico_close,.ztree li button.ico_open{display: none;}
		.ztree>li>a>span{font-size: 13px;}
		.ztree li ul a{
			background: url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/ztreearrow.png") no-repeat 40px 10px;
			background-size: 4px auto; overflow: hidden;text-overflow: ellipsis;}
		.ztree li ul a:hover{
			background:#4b5d6c url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/ztreearrow.png") no-repeat 40px 10px;
			background-size: 4px auto; }
		.ztree li ul li.level2 a{padding-left:35px;background-position-x:51px; }
		.ztree li button.ico_docu{background: none !important;}
	</style>
</head>
<body style="background-color: #C1DAD7">
<div style="position: fixed;width: 100%;height: 100%;left:0;right: 0;overflow-y:hidden;overflow-x: auto;">
	<div style="overflow-y:scroll;overflow-x: auto;width: 100%;height: 100%;padding-right:25px;">
		<div id="loadImg" style="text-align: center; color: #fff;">
			<img style="margin-top: 20px;" alt="菜单加载中......" src="<%=request.getContextPath() %>/resource/images/loader.gif"><br>资源加载中...
		</div>
		<div id="loadID" style="display: none;">
			<input type="text" id="key" value="" class="empty keywordinput" placeholder="搜索栏目"/><br>
			<a id="expandOrCollapseAllBtn" href="#" title="展开/折叠全部栏目" onclick="return false;">展开/折叠全部栏目</a>
			<div style="display: none;">
				属性( key )：<input type="radio" id="name" name="keyType" class="radio first" checked /><span>name (string)</span><br/>
				<input type="radio" id="level" name="keyType" class="radio" style="margin-left:68px;" /><span>level (number) ... 根节点 level = 0</span><br/>
				<input type="radio" id="id" name="keyType" class="radio" style="margin-left:68px;" /><span>id (number)</span><br/>
				方法：<input type="radio" id="getNodeByParam" name="funType" class="radio first" /><span>getNodeByParam</span><br/>
				<input type="radio" id="getNodesByParam" name="funType" class="radio" style="margin-left:36px;" /><span>getNodesByParam</span><br/>
				<input type="radio" id="getNodesByParamFuzzy" name="funType" class="radio" style="margin-left:36px;" checked /><span>getNodesByParamFuzzy (only string)</span><br/>
				<input type="radio" id="getNodesByFilter" name="funType" class="radio" style="margin-left:36px;" /><span>getNodesByFilter (参考本页源码中 function filter)</span><br/>
			</div>
			<ul id="treeDemo" class="ztree"></ul>
		</div>
	</div>
</div>

<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/zTree3.1/js/jquery.ztree.all-3.1.min.js"></script>
<script type="text/javascript">
(function(){
	var setting = {
			check: {
				enable: false,
				dblClickExpand: false
			},view: {
				fontCss: getFontCss
			},callback: {
				onClick: onClick
			}
	};
	function onClick(e,treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.expandNode(treeNode);
	}
	var key;
	$.ajax({
		url:"<%=request.getContextPath() %>/manage/menu!selectJsonMenu.action",
		type:"post",
		dataType:"text",
		success:function(data, textStatus){

			var zNodes = eval('('+data+')');
			for(var i=0;i<zNodes.length;i++){
                  if(zNodes[i]['name']=="修改密码"){
                       zNodes.splice(i,1);
                       break;
				}
			}
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			
			key = $("#key");
			key.bind("focus", focusKey)
			.bind("blur", blurKey)
			.bind("propertychange", searchNode)
			.bind("input", searchNode);
			$("#getNodesByParamFuzzy").bind("change", clickRadio);
			
			$("#loadImg,button.ico_docu").hide();
			$("#loadID").show();
		},
		error:function(){
			alert("加载菜单失败！");
		}
	});
		
	function focusKey(e) {
        key.val("");
        $('#treeDemo a').css({
            'color':'#fff',
            'text-decoration':'none',
            "font-weight":"normal"
        })
		if (key.hasClass("empty")) {
			key.removeClass("empty");
		}
	}
	function blurKey(e) {
		if(key.val()==''){
			key.val("搜索栏目");
			key.addClass("empty");
		}
		if (key.get(0).value === "") {
			key.addClass("empty");
		}
	}
	var lastValue = "", nodeList = [], fontCss = {};
	function clickRadio(e) {
		lastValue = "";
		searchNode(e);
	}
	function searchNode(e) {
	    if(key.val()==""){
           $('#treeDemo a').css({
			   'color':'#fff',
               'text-decoration':'none',
               "font-weight":"normal"
		   })
		}
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		if (!$("#getNodesByFilter").attr("checked")) {
			var value = $.trim(key.get(0).value);
			var keyType = "";
			if ($("#name").attr("checked")) {
				keyType = "name";
			} else if ($("#level").attr("checked")) {
				keyType = "level";
				value = parseInt(value);
			} else if ($("#id").attr("checked")) {
				keyType = "id";
				value = parseInt(value);
			}
			if (key.hasClass("empty")) {
				value = "";
			}
			if (lastValue === value) return;
			lastValue = value;
			if (value === "") return;
			updateNodes(false);

			if ($("#getNodeByParam").attr("checked")) {
				var node = zTree.getNodeByParam(keyType, value);
				if (node === null) {
					nodeList = [];
				} else {
					nodeList = [node];
				}
			} else if ($("#getNodesByParam").attr("checked")) {
				nodeList = zTree.getNodesByParam(keyType, value);
			} else if ($("#getNodesByParamFuzzy").attr("checked")) {
				nodeList = zTree.getNodesByParamFuzzy(keyType, value);
			}
		} else {
			updateNodes(false);
			nodeList = zTree.getNodesByFilter(filter);
		}
		updateNodes(true);
	}
	
	function updateNodes(highlight) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		for( var i=0, l=nodeList.length; i<l; i++) {
			nodeList[i].highlight = highlight;
			zTree.updateNode(nodeList[i]);
		}
	}
	function getFontCss(treeId, treeNode) {
		return (!!treeNode.highlight) ? {"text-decoration":"underline","font-weight":"bold"} : { "font-weight":"normal"};
	}
	function filter(node) {
		return !node.isParent && node.isFirstNode;
	}
	
	var expandAllFlg = true;
	function expandNode(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		type = e.data.type,
		nodes = zTree.getSelectedNodes();

		if (type == "expandAll") {
			zTree.expandAll(true);
		} else if (type == "collapseAll") {
			zTree.expandAll(false);
		} else if (type == "expandOrCollapse") {
			zTree.expandAll(expandAllFlg);
			expandAllFlg = !expandAllFlg;
		} else {
			if (type.indexOf("All")<0 && nodes.length == 0) {
				alert("请先选择一个父节点");
			}
			var callbackFlag = $("#callbackTrigger").attr("checked");
			for (var i=0, l=nodes.length; i<l; i++) {
				zTree.setting.view.fontCss = {};
				if (type == "expand") {
					zTree.expandNode(nodes[i], true, null, null, callbackFlag);
				} else if (type == "collapse") {
					zTree.expandNode(nodes[i], false, null, null, callbackFlag);
				} else if (type == "toggle") {
					zTree.expandNode(nodes[i], null, null, null, callbackFlag);
				} else if (type == "expandSon") {
					zTree.expandNode(nodes[i], true, true, null, callbackFlag);
				} else if (type == "collapseSon") {
					zTree.expandNode(nodes[i], false, true, null, callbackFlag);
				}
			}
		}
	}
	$("#expandOrCollapseAllBtn").bind("click", {type:"expandOrCollapse"}, expandNode);
})();

</script>
</body>
</html>
