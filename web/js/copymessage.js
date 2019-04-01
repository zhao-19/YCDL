$(function () {
	//文件加载完时就看复制按钮所在的如果不是成长贷、壮大贷、新创贷的就移除这个按钮
	var fzs = $(".fz");
	fzs.each(function(){
		var name = $(this).attr("accesskey");
		if(name != '成长贷' && name != '新创贷' && name != '壮大贷'){
			$(this).remove();
		}
	});
	
	//最后加载该js文件时就把 贷款产品的options值只留下成长贷，壮大贷，新创贷
	var prodnameoptions = $("#ldksq #prodname option");
	prodnameoptions.each(function(){
		var thisattr = $(this).attr("value");
		if(thisattr == '开行统借统还贷款' || thisattr == '口行统借统还贷款'){
			$(this).remove();
		}
		
	});
	//同时就把贷款银行的options清空
	var bank = $("#ldksq #bank");
	bank.html("");
	//同时就创建好成长贷的options
	var czdoptions = $('<option value="">-请选择-</option>	<option value="盈创动力分配银行">盈创动力分配银行</option><option value="成都银行科技支行">成都银行科技支行</option><option value="成都银行高新支行">成都银行高新支行</option>');
	
	//同时就创建好壮大贷的options
	var zddoptions = $('<option value="">-请选择-</option><option value="盈创动力分配银行">盈创动力分配银行</option><option value="成都银行华兴支行">成都银行华兴支行</option><option value="成都银行高新支行">成都银行高新支行</option><option value="成都银行琴台支行">成都银行琴台支行</option><option value="成都银行金河支行">成都银行金河支行</option><option value="成都银行长顺支行">成都银行长顺支行</option><option value="成都银行锦江支行">成都银行锦江支行</option><option value="成都银行成华支行">成都银行成华支行</option><option value="成都银行武侯支行">成都银行武侯支行</option><option value="成都银行德盛支行">成都银行德盛支行</option><option value="成都银行青羊支行">成都银行青羊支行</option><option value="成都银行高升桥支行">成都银行高升桥支行</option>	<option value="成都银行金牛支行">成都银行金牛支行</option><option value="成都银行沙湾支行">成都银行沙湾支行</option><option value="成都银行体育场路支行">成都银行体育场路支行</option>	<option value="成都银行科技支行">成都银行科技支行</option><option value="成都银行双流支行">成都银行双流支行</option>');
	
	//同时就创建好新创贷的options
	var xcdoptions = $('<option value="">-请选择-</option><option value="工行高新支行">工行高新支行</option>');
	
	var option1 = $('<option value="">-请选择-</option><option value="盈创动力分配银行">盈创动力分配银行</option><option value="成都银行科技支行">成都银行科技支行</option><option value="成都银行高新支行">成都银行高新支行</option><option value="成都银行营业部">成都银行营业部</option><option value="成都银行华兴支行">成都银行华兴支行</option><option value="成都银行高新支行">成都银行高新支行</option><option value="成都银行琴台支行">成都银行琴台支行</option><option value="成都银行金河支行">成都银行金河支行</option><option value="成都银行长顺支行">成都银行长顺支行</option><option value="成都银行锦江支行">成都银行锦江支行</option><option value="成都银行成华支行">成都银行成华支行</option><option value="成都银行武侯支行">成都银行武侯支行</option><option value="成都银行德盛支行">成都银行德盛支行</option><option value="成都银行青羊支行">成都银行青羊支行</option><option value="成都银行高升桥支行">成都银行高升桥支行</option><option value="成都银行金牛支行">成都银行金牛支行</option><option value="成都银行沙湾支行">成都银行沙湾支行</option><option value="成都银行体育场路支行">成都银行体育场路支行</option><option value="成都银行科技支行">成都银行科技支行</option><option value="成都银行双流支行">成都银行双流支行</option>');
	
	var option2 = $('<option value="">-请选择-</option><option value="盈创动力分配银行">盈创动力分配银行</option><option value="邮储银行成都市太升南路支行">邮储银行成都市太升南路支行</option><option value="邮储银行成都市高新支行">邮储银行成都市高新支行</option><option value="邮储银行省分行直属支行">邮储银行省分行直属支行</option><option value="邮储银行成都市沙湾支行">邮储银行成都市沙湾支行</option><option value="邮储银行成都市双楠支行">邮储银行成都市双楠支行</option><option value="建设银行成都第五支行">建设银行成都第五支行</option><option value="工行高新支行">工行高新支行</option><option value="工行双流支行">工行双流支行</option>');
	
	//获取贷款产品元素		
	var prodname = $("#ldksq #prodname");
	//贷款产品元素的option发生change事件时看值变为哪个
	prodname.change(function(){
		var nowdkyh = $(this).val();//可能的值：成长贷，壮大贷，新创贷

 							
		if(nowdkyh=='成长贷' || nowdkyh=='壮大贷' || nowdkyh=='期权贷'){
			bank.html("");
			option1.appendTo(bank);			
		}		
		
		if(nowdkyh=='新创贷'){
			bank.html("");
			xcdoptions.appendTo(bank);
		}
		
		if(nowdkyh=='园保贷'){
			bank.html("");
			option2.appendTo(bank);			
		}

	});
	
	//点击贷款品种后面的修改按钮，弹出修改form表单 ，单独修改产品名称
	$(".fz").click(function(){
		
		if($(this).attr("name")<5){alert('当前状态不提供复制！');return;}
		
		$("#tcktel").remove();
		$("#tckremark").remove();
		$("#ldksq").show();
		$("#tckselect").show();
		var copyid = $(this).attr("lang");
		$("#copyid").val(copyid);
   	 	var divName = $("#ldksq_c");
		var top = ($(window).height() - $(divName).height())/2;
        var left = ($(window).width() - $(divName).width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        
        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
	});
	 

    $("#ldksq_lose").click(function(){
        $("#ldksq").hide();
    });
    $("#ldksq_lose2").click(function(){
        $("#ldksq").hide();
    });
    

    
	
 
    
});
