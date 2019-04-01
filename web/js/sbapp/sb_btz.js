/**
 * @author Administrator
 */

function qiyeappinfo(){
	
    jQuery.validator.addMethod("isOCC", function(value, element) {   
	    var num = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;    //手写验证组织机构代码或统一社会信用代码  用竖线表示两个条件为或（共10位）
	    //var num = /^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$/;//组织机构代码
		    return this.optional(element) ||  (num.test(value));       
	    
	}, "请正确【组织机构代码】或者【统一社会信用代码】");
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");

	//邮政编码验证       
	jQuery.validator.addMethod("isEmail", function(value, element) {       
	    return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/.test(value);     
	}, "请正确填写邮箱格式");
		
	jQuery.validator.addMethod("isDate", function(value, element) {       
	    var tel = /^\d{4}(\-|\/|.)\d{1,2}\1\d{1,2}$/;    //日期
	    return this.optional(element) || (tel.test(value));       
	}, "请正确填写日期");
	  jQuery.validator.addMethod("isIdcard", function(value, element) {
          var length = value.length;
          var isIdcard = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
          return this.optional(element) || (isIdcard.test(value));
      }, "请输入正确的身份证号码");
	  jQuery.validator.addMethod("isTel", function(value, element) {
	      var length = value.length;
	      var isTel = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
	      return this.optional(element) || (isTel.test(value));
	  }, "请输入正确的电话或传真号码");

    $("#sb_btz").validate({
    	onkeyup:false,
        	rules: {  
                                "qiyemingcheng": {
    	require:true,
                	maxlength:64
                },
                                "zyyw": {
                	
                	maxlength:256
                },
                				"clrq": {
                	
                	isDate:true
                },
                                "dizhi": {
                	
                	maxlength:64
                },
                                "gdsjnjg": {
                	
                	maxlength:64
                },
                                "tjgxszd": {
                	
                	maxlength:64
                },
                                "fzr": {
                	
                	maxlength:16
                },
                                "fzrzw": {
                	
                	maxlength:8
                },
                                "fzrsj": {
                	isTel:true,
                	maxlength:11
                },
                                "lxr": {
                	
                	maxlength:16
                },
                                "lxrzw": {
                	
                	maxlength:8
                },
                                "lxrsj": {
                	
                	isTel:true,
                	maxlength:18
                },
                                "qysqje": {
                	
                	isNum:true,
                	maxlength:18
                },
                                "status": {
                	
                	maxlength:18
                },
                                "jgmc": {
                	
                	maxlength:64
                },
                                "jgzzjgdm": {
                	
                	isOCC:true,
                	maxlength:32
                },
                                "jgzyyw": {
                	
                	maxlength:256
                },
                                "jgtzje": {
                	
                	isNum:true,
                	maxlength:18
                },
                                "jgszgf": {
                	
                	sNum:true,
                	maxlength:18
                },
                                "tzsfdz": {
                	
                	maxlength:16
                },   
                                "jgsfba": {
                	
                	maxlength:16
                }              
                               
            },
            messages: {
            	            	      	"qiyemingcheng": {
            	require:"请树",
                    maxlength: "64字符以内"
                },
                            	"zyyw": {
                    maxlength: "256字符以内"
                },
                            	
                            	"dizhi": {
                	
                    maxlength: "64字符以内"
                },
                				"clrq": {
                    isDate: "请正确输入日期格式"
                },
                            	"gdsjnjg": {
                    maxlength: "64字符以内"
                },
                            	"tjgxszd": {
                    maxlength: "64字符以内"
                },
                            	
                            	"fzr": {
                    maxlength: "16字符以内"
                },
                            	"fzrzw": {
                    maxlength: "8字符以内"
                },
                            	"fzrsj": {
                    isTel:"请正确输入手机号",
                    maxlength: "11字符以内"
                },
                            	"lxr": {
                    maxlength: "16字符以内"
                },
                            	"lxrzw": {
                    maxlength: "8字符以内"
                },
                            	"lxrsj": {
                    isTel:"请正确输入手机号",
                    maxlength: "11字符以内"
                },
                            	"qysqje": {
                    isNum:"请输入数字",
                    maxlength: "18字符以内"
                },
                            	"status": {
                    maxlength: "18字符以内"
                },
                            	"jgmc": {
                    maxlength: "18字符以内"
                },
                            	"jgzzjgdm": {
                    isOCC:"请正确输入",
                    maxlength: "32字符以内"
                },
                            	"jgzyyw": {
                    maxlength: "256字符以内"
                },
                            	"jgtzje": {
                    isNum:"请输入数字",
                    maxlength: "18字符以内"
                },
                            	"jgszgf": {
                    isNum:"请输入数字",
                    maxlength: "18字符以内"
                },
                            	"tzsfdz": {
                    maxlength: "16字符以内"
                },
                            	"jgsfba": {
                    maxlength: "16字符以内"
                }
                            	
                        },
        /*errorElement:"font",
        errorPlacement: function(error, element){
            error.appendTo(element.parent().find(".tipinfo"));
        },success:"valid"
        ,*/
        errorPlacement: function (error, element) {
        	if (element.is(':radio') || element.is(':checkbox')) { 
        		//如果是radio或checkbox
    	       error.appendTo(element.parent()); 
    	       $("#gszcdspan lable.eq(0)").nextAll().remove();
    	       //将错误信息添加当前元素的父结点后面
    	     }
        	else if (element.is('select[class*=ssx]')) { 
        		//把联动选择的提示只提示一个（思路：错误都一次放入容器最后，每次放入时，把第一个错误之后的错误节点删除）
    	       error.appendTo(element.parent()); //将错误信息添加当前元素的父结点后面
    	       $("#gszcdspan label").eq(0).nextAll().remove();
    	     }
        	else{
        	       error.insertAfter(element);
        	       //element.html(error); 
    	     }
        	
    	},
        submitHandler: function(form){       	
        	//表单提交句柄,为一回调函数，带一个参数：form   
            //alert("提交表单");   return;
            form.submit();   //提交表单   
        }
    });
    
    
    $.extend($.validator.messages, {  
        required: '该项为必填项!'
       /*  maxlength: $.validator.format("最大长度不能大于{0}个字符"),  
        minlength: $.validator.format("最小长度不能小于{0}个字符"),  
        rangelength: $.validator.format("字符长度必须在 {0} 和 {1} 之间"),  
        range: $.validator.format("数值必须在 {0} 和 {1} 之间"),  
        max: $.validator.format("数值不能大于 {0}"),  
        min: $.validator.format("数值不能小于 {0}")  */
    });  
    
}


function remove_validate(){
    //$("#qiyemingcheng").rules("remove");
    //$("#fzrsj").rules("remove"); 
    //$("#fzrsj").rules("add",{required:false,messages:{required:"请输入法人手机号！"}});
	
	//$("#qiyemingcheng").attr("required",false);
    //$("#fzrsj").attr("required",false);
	
	$("#sb_btz input[type='text']").attr("required",false);
	$("#sb_btz select").attr("required",false);
} 
function add_validate(){
    //$("#qiyemingcheng").rules("remove");
    //$("#fzrsj").rules("remove"); 
    //$("#fzrsj").rules("add",{required:true,isTel:true,messages:{required:"请输入法人手机号！",isTel:"请正确输入"}});
	
	//$("#fzrsj").attr("required",true);
	//$("#qiyemingcheng").attr("required",true);
	$("#sb_btz input[type='text']").attr("required","required");
	$("#sb_btz select").attr("required","required");
	alert(2222);
	
} 
