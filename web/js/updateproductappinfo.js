/**
 * @author Administrator
 */
function updateproductappinfo(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("isOCC", function(value, element) {       
	    var num = /^[0-9]*$/;    //手写验证整数数字和0
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
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
    $("#updateproductappinfo").validate({
        rules: {
            "productapp.userid": {
                required: true,
                maxlength:32
            },
            "productapp.username": {
                required: true,
                maxlength:64
            },
            "productapp.prodid": {
            	required: true,
                maxlength:8
            },
            "productapp.prodname": {
            	required: true
            },
            "productapp.qiyemingcheng": {
            	required: true,
                maxlength:64
            },
            "productapp.loanamt": {
            	required: true,
            	isOCC:true,
                maxlength:7
            },
            "productapp.loanuser": {
                required: true,
                maxlength:123
            },
            "productapp.faren": {
            	required: true,
                maxlength:8
            },
            "productapp.chengliriqi": {
                required: true,
                isDate:true
            },
            "productapp.zhuceziben": {
	        	required: true,
	        	isNum:true,
                maxlength:7
	        },
            "productapp.gszcd_province": {
                required: true
            },
            "productapp.gszcd_city": {
                required: true
            },
            "productapp.gszcd_county": {
                required: true
            },
            "productapp.hangyeid": {
                required: true
            },
            "productapp.zhuanli": {
                required: true,
                digits:true,
                maxlength:18
            },
            "productapp.lastsellincome": {
                required: true,
                number:true,
                maxlength:18
            },
            "productapp.lastimcome": {
                required: true,
                number:true,
                maxlength:18
            },
            "productapp.lastloanamt": {
                required: true,
                number:true,
                maxlength:18
            },
            "productapp.sellincome": {
                required: true,
                number:true,
                maxlength:18
            },
            "productapp.imcome": {
                required: true,
                number:true,
                maxlength:18
            },
            "productapp.loanamt2": {
                required: true,
                isNum:true,
                maxlength:18
            },
            "productapp.blastsellincome": {
                required: true,
                number:true,
                maxlength:18
            },
            "productapp.blastimcome": {
                required: true,
                number:true,
                maxlength:18
            },
            "productapp.blastloanamt": {
                required: true,
                number:true,
                maxlength:18
            },
            "productapp.lianxiren": {
                required: true,
                maxlength:8
            },
            "productapp.lianxidianh": {
                required: true,
                isTel: true
            }
        },
        messages: {
        	"productapp.userid": {
                required: "请输入申请人",
                maxlength: "32字符以内"
            },
            "productapp.username": {
                required: "请输入申请人名称",
                maxlength: "64字符以内"
            },
            "productapp.prodid": {
            	required: "请输入产品编号",
                maxlength: "8字符以内"
            },
            "productapp.prodname": {
            	required: "请输入产品名称"
            },
            "productapp.qiyemingcheng": {
            	required: "请输入企业名称",
                maxlength: "64字符以内"
            },
            "productapp.loanamt": {
            	required: "请输入申请金额",
            	isOCC:"请填写整数",
                maxlength: "7字符以内"
            },
            "productapp.loanuser": {
                required: "请输入贷款用途",
                maxlength: "123字符以内"
            },
            "productapp.faren": {
            	required: "请输入法人名字",
                maxlength: "8字符以内"
            },
            "productapp.chengliriqi": {
                required: "请输入成立日期",
                isDate:"请输入正确格式"
            },
            "productapp.zhuceziben": {
	        	required: "请输入注册资本",
	        	isNum:"注册资本请填非负数字",
                maxlength: "7字符以内"
	        },
            "productapp.gszcd_province": {
                required: "请选择省份"
            },
            "productapp.gszcd_city": {
                required: "请选择城市"
            },
            "productapp.gszcd_county": {
                required: "请选择区县"
            },
            "productapp.hangyeid": {
                required: "请选择所属行业"
            },
            "productapp.zhuanli": {
                required: "请输入专利状况",
                digits:"只能输入整数",
                maxlength: "18字符以内"
            },
            "productapp.lastsellincome": {
                required: "请输入销售收入",
                number:"销售收入请填数字",
                maxlength: "18字符以内"
            },
            "productapp.lastimcome": {
                required: "请输入净利润",
                number:"净利润请填数字",
                maxlength: "18字符以内"
            },
            "productapp.lastloanamt": {
                required: "请输入银行贷款",
                number:"银行贷款请填数字",
                maxlength: "18字符以内"
            },
            "productapp.sellincome": {
                required: "请输入销售收入",
                number:"销售收入请填数字",
                maxlength: "18字符以内"
            },
            "productapp.imcome": {
                required: "请输入本年净利润",
                number:"本年净利润请填数字",
                maxlength: "18字符以内"
            },
            "productapp.loanamt2": {
                required: "请输入本年银行贷款",
                isNum:"请填写数字",
                maxlength: "18字符以内"
            },
            "productapp.blastsellincome": {
                required: "请输入销售收入",
                number:"请填写数字",
                maxlength: "18字符以内"
            },
            "productapp.blastimcome": {
                required: "请输入利润收入",
                number:"请填写数字",
                maxlength: "18字符以内"
            },
            "productapp.blastloanamt": {
                required: "请输入贷款余额",
                number:"请填写数字",
                maxlength: "18字符以内"
            },
            "productapp.lianxiren": {
                required: "请输入联系人名字",
                maxlength: "8字符以内"
            },
            "productapp.lianxidianh": {
                required: "请输入联系人电话",
                isTel: "请输入正确的电话号码"
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
    
}
