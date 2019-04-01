<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.incre.bean.Incre"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
</head>
<body>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>
<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="../image/box/dl_bg.png" alt="背景图">
</div>
<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>资料下载</li>
		</div>
		<div class="data_info_search fr" >
			<input id="querycontent" type="text" value="请输入搜索关键字"  onkeypress="if (event.keyCode == 13)  doquery()" onfocus="if(value=='请输入搜索关键字'){value=''}" onblur="if(value==''){value='请输入搜索关键字'}">
			<a href="javascript:doquery()"><img src="../image/data/fdj.jpg" alt=""></a>
		</div>
	</div>
</div>

<div class="downkind bl">
    <input type="hidden" id="filetype2" value="<s:property value="e.filetype"/>">
    <div class="ov fenlei">
        <span class="fl">分类：</span>
        <ul class="fr" id = "filetype">
            <li><a onclick="loadtype(this)" href="javascript:void(0)" lang="" >全部</a></li>
            <s:iterator value="filetypeList" var="type">
<%--             <li><a href="/files/toList.html?e.filetype=<s:property value="#type.id"/>" lang="<s:property value="#type.id"/>"><s:property value="#type.name"/></a></li> --%>
            <li><a onclick="loadtype(this)" href="javascript:void(0)" lang="<s:property value="#type.id"/>"><s:property value="#type.name"/></a></li>
            </s:iterator>
        </ul>
    </div>
    <%-- &lt;!&ndash;<div class="ov geshi">&ndash;&gt;
    &lt;!&ndash;<span class="fl">格式：</span>&ndash;&gt;
    &lt;!&ndash;<ul class="fr">&ndash;&gt;
    &lt;!&ndash;<li><a href="" class="active">全部</a></li>&ndash;&gt;
    &lt;!&ndash;<li><a href="">WORD</a></li>&ndash;&gt;
    &lt;!&ndash;<li><a href="">PDF</a></li>&ndash;&gt;
    &lt;!&ndash;<li><a href="">PPT</a></li>&ndash;&gt;
    &lt;!&ndash;<li><a href="">RAR</a></li>&ndash;&gt;
    &lt;!&ndash;<li><a href="">EXCEL</a></li>&ndash;&gt;
    &lt;!&ndash;<li><a href="">DEF</a></li>&ndash;&gt;
    &lt;!&ndash;</ul>&ndash;&gt;
    &lt;!&ndash;</div>&ndash;&gt; --%>
</div>
<div class="download widthbox">   
 	<ul class="downlist">
		<s:iterator value="pager.list" >
	        <%-- <div class="border fl">
				<div class="title_img">
					<div class="fk"> <s:property value="id" /></div><br/>
					<div class="title fl"> <s:property value="title" /> </div>
				</div>
				<div class="type">
					<img class="type1 fl" src="../icon/<s:property value="extfilename" />.png" alt="资料文件类型图标">
					<li class="type2 fl"> 资料 </li>
				</div>
				<div class="content">
					<li><s:property value="contents" /></li>
				</div>
				<div class="button"><a href="/download.action?number=2&id=<s:property value="id" />" target="_blank">点击下载</a></div>
			</div> --%>

				<li class="${extfilename}" name="${extfilename}">
		            <div class="downtitle">
                        <p>${title}</p>
		                <input type="hidden" value="${sort}">
                        <!--<span>培训活动</span>-->
		             </div>
		            <div class="downintro">
		                <div class="downintrotxt">
		                    <p>${contents}</p>
		                </div>
		                <div class="downnow">
		                    <a href="/download.action?number=2&id=${id}" download="${title}">立即下载</a>
		                </div>
		            </div>
		        </li>
		</s:iterator>
    </ul>
	<ul class="morebox"></ul>
	<li id="loadmorewordh" onClick="lanren.loadMore();" >查看更多</li>
</div>
<script>
	var pagesize = 20;
	var queryDataCount = 0;
    var _content = []; //临时存储li循环内容
    var offset;
    var lanren = {
        _default:pagesize, //默认显示图片个数
        _loading:pagesize,  //每次点击按钮后加载的个数
        init:function(){
            var lis = $(".downlist li");
            $(".morebox").html("");
            for(var n=0;n<lanren._default;n++){
                lis.eq(n).appendTo(".morebox");
            }
//            $(".morebox .border").each(function(){
//                $(this).attr('.border',$(this).attr('.border'));
//            })
            for(var i=lanren._default;i<lis.length;i++){
                _content.push(lis.eq(i));
            }
            $(".downlist").html("");
        },
        loadMore:function(){
        	//alert($('#loadmorewordh').html());
        	//$('#loadmorewordh').html("<p>玩命加载中，请稍后...</p>");
        	document.getElementById("loadmorewordh").innerHTML="玩命加载中，请稍后...";
        	var test = document.getElementById("loadmorewordh").innerHTML;
        	//alert($('#loadmoreword').html());
        	//如果 _content.length 小于每次显示的页数，则需要再次做异步请了。
        	/*if(_content.length<pagesize){
        		queryData();
        	}else {
        		loadData();
        	}*/
        	queryData();
        }
    }
    lanren.init();
    function loadData(){
      var mLis = $(".morebox li").length;
           for(var i =0;i<lanren._loading;i++){
              var target = _content.shift();
              if(!target){
                  $('#loadmorewordh').html("<p style='color:#888;'>亲，没有数据可以加载了！！！</p>");
                  return false;
              }
              $(".morebox").append(target);
               cls('xls','xlsx');
               cls('ppt','pptx');
               cls('pdf');
               cls('rar');
               cls('def');
               doc('doc','docx')
               hot();
//              $(".morebox .border").eq(mLis+i).each(function(){
//                  $(this).attr('.border',$(this).attr('.border'));
//              });
           }
           $('#loadmorewordh').html("加载更多");
     }
    function queryData(){
   		queryDataCount = queryDataCount+1;
   		var filetype2 = $("#filetype2").val();
    	var _url = "/files/toList2.html?page="+queryDataCount+"&e.filetype="+filetype2;
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  //dataType:"json",
		  //async:false,
	      beforeSend : function () {
              $("#loadmorewordh").html("数据拼命加载中...");
          },
		  success: function(data){
			  if(data=="0"){
				  //jQuery.unblockUI();
				 // alert("查询不到任何数据！");
				 // return null;
				  $("#loadmorewordh").html("没有更多数据了");
			  }
			  for(var i=0;i<data.length;i++ ){
 			    _content.push(
//			    	"<div class=\"border fl\">"+
//						"<div class=\"title_img\">"+
//							"<div class=\"fk\"> "+data[i].id+"</div><br/>"+
//							"<div class=\"title fl\"> "+data[i].title+" </div>"+
//						"</div>"+
//						"<div class=\"type\">"+
//							"<img class=\"type1 fl\" src=\"../icon/"+data[i].extfilename+".png\" alt=\"资料文件类型图标\"/>"+
//							"<li class=\"type2 fl\"> 资料 </li>"+
//						"</div>"+
//						"<div class=\"content\">"+
//							"<li>"+data[i].contents+"</li>"+
//						"</div>"+
//						"<div class=\"button\"><a href=\"/download.action?number=2&id=\""+data[i].id+"\" target=\"_blank\">点击下载</a></div>"+
//					"</div>"

                  '<li class="'+data[i].extfilename+'" name="'+data[i].extfilename+'">'+
                      '<div class="downtitle"><p>'+data[i].title+'</p>'+
                      '<input type="hidden" value="'+data[i].sort+'">'+
//                      '<span>'+'培训活动'+'</span>'+
                      '</div>'+
                      '<div class="downintro">'+
                      '<div class="downintrotxt">'+
                      '<p>'+data[i].contents+'</p>'+
                      '</div>'+
                      '<div class="downnow">'+
                      '<a href="/download.action?number=2&id='+data[i].id+'" download="'+data[i].title+'">立即下载</a>'+
                      '</div></div></li>'
              );
		  } 
			 loadData();
		  },
		  error:function(){
			  //console.log("加载数据失败，请联系管理员。");
			//  alert("加载数据失败，请联系管理员。");
			 // jQuery.unblockUI();
			return null;
		  }
		});
		return false;
    }
    function loadtype(obj) {
    	var filetype = $(obj).attr("lang");
    	$("#filetype li").each(function(){  
    	       var lan = $(this).children("a:eq(0)").removeClass('active');
    	    });
    	$(obj).addClass('active');
    	lanren.init();
    	queryDataCount = -1;
    	$("#filetype2").val(filetype);
    	queryData();
    }
</script>
<script>
window.onload=function (){
    var filetype =$("#filetype2").val();
	var bo = true;
	$("#filetype li").each(function(){  
       var lan = $(this).children("a:eq(0)");
       if (lan.attr("lang") == filetype) {
    	   lan.addClass('active');
    	   bo =false;
       }
    });  
	if (bo) {
		$("#filetype").children("li:eq(0)").children("a:eq(0)").addClass('active');
	}
}
function doquery(){
    var query = $('#querycontent').val();
 	if(query=='') {
	}else {
		var url = '/files/toList.html?t=q&q='+query;
 		window.location = url;
		return ;
	}
 }
</script>
<script>
function cls(id1,id2) {
    if(id2){
        var arr=$('.'+id1+',.'+id2);
    }else{
        var arr=$('.'+id1);
    }
    for(var i=0;i<arr.length;i++){
        if(i%2==0){
            $(arr[i]).addClass('odd')
        }else{
            $(arr[i]).addClass('even')
        }
    }
}
cls('xls','xlsx');
cls('ppt','pptx');
cls('pdf');
cls('rar');
cls('def');

function doc(id1,id2){
    var arr=$('.'+id1+',.'+id2);
    for(var i=0;i<arr.length;i++){
        if(i%4==0){
            $(arr[i]).addClass('n1')
        }else if(i%4==1){
            $(arr[i]).addClass('n2')
        }
        else if(i%4==2){
            $(arr[i]).addClass('n3')
        }
        else if(i%4==3){
            $(arr[i]).addClass('n4')
        }
    }
}
doc('doc','docx')


function hot(){
    $(".morebox li input").each(function(){
        var val = $.trim($(this).val());
        if (val>=100) {//id大于100的都是hot
            $(this).prev('p').prepend('<i></i>')
        }
    });
}
hot();
//$('.fenlei li>a').click(function(e){
//    e.preventDefault();
//    $(this).addClass('active').parent().siblings().find('.active').removeClass('active');
//
//})
</script>

<div class="fixed" id="totop">
    <div class="home">
        <div class="fixed_img">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="../image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>
<style type="text/css">
.fixed{top:auto;bottom:10%!important;height:82px;}
</style>

<script>
 menu_init("files");

</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>

</body>
</html>
