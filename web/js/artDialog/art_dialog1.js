//var pathName = window.document.location.href;
//var curWwwPath=window.document.location.pathname;
//var pos=curWwwPath.indexOf(pathName);
//pathName=curWwwPath.substring(0,pos);

var pathName = window.document.location.pathname;
pathName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

// pathName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
document.write('<script type="text/javascript" src="/js/artDialog/src/dialog-config.js"></script>');
document.write('<script type="text/javascript" src="/js/artDialog/src/popup.js"></script>');
document.write('<script type="text/javascript" src="/js/artDialog/src/dialog.js"></script>');
document.write('<script type="text/javascript" src="/js/artDialog/src/dialog-plus.js"></script>');
document.write('<script type="text/javascript" src="/js/artDialog/src/drag.js"></script>');


/**
 * 公共提示信息接口
 * alert:没按钮的提示框
 * confirm:带按钮的提示框
 * info:没有标题和按钮的提示框，2秒自动关闭 
 */
var msg = {
	alert : function(content,title) {
		var element = $('[i="dialog"]');
		if(element.length <=0){
			dialog1({
				fixed:true,
				padding : 10,
				title : title != null && title != "" ? title : '提示信息',
				content : content,
				width : 200
			}).show();
		}
	},
	confirm : function(content,callback,title) {
		dialog1({
			fixed:true,
			padding : 10,
			title : title != null && title != "" ? title : '提示信息',
			content : content,
			width : 250,
			okValue: '确定',
		    ok: callback,
		    cancelValue: '取消',
		    cancel: function () {}
		}).showModal();
	},
	info:function(content){
		var d = dialog1({
			padding : 20,
			width:200,
		    content: "<span style='color:red;'>"+content+"<span>"
		});
		d.show();
		setTimeout(function () {
		    d.close().remove();
		}, 2000);
	},
	dialog : function(content,callback1,callback2,title){
		dialog1({
			fixed : true,
			padding : 10,
			title : title != null && title != "" ? title : '提示信息',
			content : content,
			width : 250,
			button: [
		        {
		            value: '同意',
		            callback: callback1,
		            autofocus: true
		        }
		    ]
		}).showModal();
	}
};


var model = {
		info : function(title,url) {
			var element = $('[i="dialog"]');
			if(element.length <=0){
				$.ajax({
					type:"get",
					url:url,
					dataType:"html",
					success:function(html){
						dialog1({
							padding : 10,
							fixed:true,
							quickClose: true,
							title : title != null && title != "" ? title : '信息弹出框',
							content : html
						}).show();
					}
				});
			}
		}
};

/*function tip(obj,content,align){
	var d = dialog({
		padding : 0,
		align: align != null && align != "" ? align : 'top',
		content: content,
		quickClose: true
	});
	d.show(obj);
};*/

/**
 * 提示错误信息
 */
$.fn.err = function(title){
	$(this).addClass("biankuang");
	$(this).tooltip({
		content:'<span style="color:#F04">' + title + '</span>',hideDelay:null}).tooltip('show');
	$(this).focus(function(){
		$(this).removeClass("biankuang");
		$(this).tooltip('destroy');
	});
};

/**
 * 关闭错误信息
 */
$.fn.closeErr = function(){
	$(this).removeClass("biankuang");
	$(this).tooltip('destroy');
};

