/**
 * 后台脚本JS
 */

$(function(){
    //后台查询页面 全选/全不选 功能	jQuery v1.9
    $("#firstCheckbox").on("click",function(){
        //console.log("check="+$(this).prop("checked"));
        $(this).parent('label').toggleClass('on');
        if($(this).prop("checked")){
            $("input[type=checkbox]").prop("checked",true);
            $('label.labelContain').addClass('on');
        }else{
            $("input[type=checkbox]").prop("checked", false);
            $('label.labelContain').removeClass('on');
        }
    });

    $('body').delegate('label.labelContain','click',function(){
        $(this).toggleClass('on');
    })


    $('.FZbPageBody .checkboxLabel').prev('input').css({'width':'0','opacity':'0'});
    $('body.FZbPageBody').delegate('label.checkboxLabel','click',function(){
        $(this).toggleClass('on');
    })

    $('.FZbPageBody .checkboxLabel').each(function (i,v) {
        if($(this).prev("input[type='checkbox']").is(":checked")){
            $(this).addClass('on');
        }
    })
	//为了使用bootstrap2的图标功能，只有牺牲使用struts2的s:submit方式提交表单。
	//这里对s:form表单的action进行重新组装，加上了你点击的按钮的method="update"方法，最后验证通过则提交表单。
	$("form").on('click', 'button', function(e){
	    this.form.buttonMethod = $(this).attr('method');
	    //这里自带的框架没有开始验证
	});
	//onclick="doSubmitFuncWhenButton(this)"

	//通用按钮的提交表单事件
	$("form").on("valid.form", function(e, form){
		//这里表示表单自带的框架开始验证且验证全部通过了
		//此时，去判断表单的lang是否是isBank ，标识这个表单下的数据中有“银行数字逗号型的字段”，就需要验证
		if($(this).attr("lang")=='isBank'){
			nativeNum("isBankZint");//还原为数字
			
		}
		
		//alert("88888888");return false;
		//console.log(this.isValid);
        console.log("submit..."+form.buttonMethod);
        
        var buttonMethod = form.buttonMethod;
		//console.log(buttonMethod);
		var _formAction = $(form).attr("action");
		var aa = _formAction.substring(0,_formAction.lastIndexOf("/")+1);
		//console.log(aa);
		
		var lastFormAction = aa+buttonMethod;
		//console.log("lastFormAction="+lastFormAction);
		$(form).attr("action",lastFormAction);
		
		//console.log($(form).attr("action"));
		
		$.blockUI({ message: "系统处理中，请等待...",css: { 
            border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff' 
        }});
		createMark();
		form.submit();
	});
	$("body").delegate(".moreoper", "click", function () {	//表格更多操作按钮展开收起
        $(this).toggleClass('on');
        $(this).find('.moreoperlist').toggle();
        $(this).parent().parent().siblings('tr').find('.moreoper').removeClass('on')
        $(this).parent().parent().siblings('tr').find('.moreoperlist').hide();
    })

//    多图上传图片赋值
    $('.multipleImage').each(function(){
        var val=$(this).val();
        var imgs='';
        if(val){
            var arr=val.split(',');
            $.each(arr,function (i,v) {
                imgs+='<img src="'+v+'" class="smallpic"/>'
            })
            console.log(imgs)
            $(this).after(imgs);
        }
    })
});

//创建遮罩效果
function createMark(){
	$.blockUI({ message: "系统处理中，请等待...",css: { 
        border: 'none', 
        padding: '15px', 
        backgroundColor: '#000', 
        '-webkit-border-radius': '10px', 
        '-moz-border-radius': '10px', 
        opacity: .5, 
        color: '#fff' 
    }});
}

//查询
function selectList(obj){
	//console.log("selectList...");
	var _form = $("form");
	_form.attr("action",$(obj).attr("method"));
	_form.submit();
}

//批量删除选择的记录
function submitIDs(obj,tip){
	//console.log("submitIDs...");
	if ($("input:checked").size() == 0) {
		alert("请先选择要操作的内容！");
		return false;
	}

	if(confirm(tip)){
		createMark();
		var _form = $("form");
		_form.attr("action",$(obj).attr("method"));
		_form.submit();
	}
	return false;
}

//不需要任何验证的提交    
function submitNotValid2222(obj){
	createMark();
	//console.log("submitNotValid2222...");
	var _form = $("form");
	_form.attr("action",$(obj).attr("method"));
	_form.submit();
}



//为了使用bootstrap2的图标功能，只有牺牲使用struts2的s:submit方式提交表单。
//这里对s:form表单的action进行重新组装，加上了你点击的按钮的method="update"方法，最后验证通过则提交表单。
function doSubmitFuncWhenButton(obj){
	/*
	$("#form").validator({
		
		valid: function(form){
			var me = this;
	        // ajax提交表单之前，先禁用submit
	        me.holdSubmit();
	        $(form).find('button').css('color', '#999').text('正在提交..');
	        
			this.isAjaxSubmit = false;
			var method = $(obj).attr("method");
			//console.log(method);
			var _formAction = $(form).attr("action");
			var aa = _formAction.substring(0,_formAction.lastIndexOf("/")+1);
			//console.log(aa);
			
			var lastFormAction = aa+method;//aa +"!" +method+".action";
			//console.log("lastFormAction="+lastFormAction);
			$(form).attr("action",lastFormAction);
			
			//console.log($(form).attr("action"));
			
			form.submit();
			
			me.holdSubmit(false);
		}
	});
	*/
	
	$("#form").on("valid.form", function(e, form){
		//console.log(this.isValid);
		//if(this.isValid && this.isValid==true){
	        console.log("submit...");
		//}
	});
	
	$("#form").on("valid.form", function(e, form){
		//console.log(this.isValid);
		if(this.isValid && this.isValid==true){
			
			//var me = this;
	        // ajax提交表单之前，先禁用submit
	        //me.holdSubmit();
	        //$(form).find('button').css('color', '#999').text('正在提交..');
	        console.log("submit...");
			/*
			this.isAjaxSubmit = false;
			var method = $(obj).attr("method");
			//console.log(method);
			var _formAction = $(form).attr("action");
			var aa = _formAction.substring(0,_formAction.lastIndexOf("/")+1);
			//console.log(aa);
			
			var lastFormAction = aa+method;
			//console.log("lastFormAction="+lastFormAction);
			$(form).attr("action",lastFormAction);
			
			//console.log($(form).attr("action"));
			
			form.submit();
			*/
			
			//me.holdSubmit(false);
		}
	});
	
}

//分页工具用到的，点击下一页或者上一页会丢掉查询条件这个函数将查询条件带上。
function pager(pageNumber){
 	var _formAction = $('Form').attr("action");
	_formAction+"?pager.offset="+pageNumber;
	$('Form').attr("action",_formAction);
	
    $('Form').submit();;
}
