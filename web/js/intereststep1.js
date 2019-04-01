/**
 * @author Administrator
 */
function intereststep1(){
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
          var isTel = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
          return this.optional(element) || (isTel.test(value));
      }, "请输入正确的电话或传真号码");
    $("#intereststep1").validate({
        rules: {
            "e.qiyemingcheng": {
                required: true,
                maxlength:50
            },
            "e.zhuceziben": {
                required: true,
                number:true,
                maxlength:18
            },
            "e.chengliriqi": {
            	required: true,
            	isDate:true
            },
            "e.dizhi": {
            	required: true,
            	maxlength:64
            },
            "e.faren": {
            	required: true,
                maxlength:16
            },
            "e.farentele": {
                required: true,
                isTel:true
            },
            "e.fzr": {
            	required: true,
                maxlength:8
            },
            "e.fzrzhiwu": {
                required: true,
                maxlength:32
            },
            "e.fzrtele": {
	        	required: true,
	        	isTel:true
	        },
            "e.lxr": {
                required: true,
                maxlength:16
            },
            "e.lxrzhiwu": {
                required: true,
                maxlength:32
            },
            "e.lxrtlle": {
                required: true,
                isTel:true
            },
            "e.dkyy0": {
                required: true,
                maxlength:64
            },
            "e.dkje0": {
                required: true,
                number:true,
                maxlength:18
            },
            "e.dbfl0": {
                required: true,
                number:true,
                maxlength:18
            },
            "e.dbf0": {
                required: true,
                number:true,
                maxlength:18
            },
            "e.dkll0": {
                required: true,
                number:true,
                maxlength:18
            },
            "e.zflx0": {
                required: true,
                number:true,
                maxlength:18
            },
            "e.fksj0": {
                required: true,
                isDate:true
            },
            "e.dqsj0": {
                required: true,
                isDate:true
            },
            "e.gqrzds": {
                required: true,
                number:true,
                maxlength:18
            },
            "e.zqrzds": {
                required: true,
                number:true,
                maxlength:18
            },
            "e.vcpe": {
                required: true,
                maxlength:256
            },
            "e.dsfxypj": {
                required: true,
                maxlength:8
            },
            "e.qygm": {
                required: true,
                maxlength:16
            },
            "e.tjgxqk": {
                required: true,
                maxlength:16
            }
        },
        messages: {
        	"e.qiyemingcheng": {
            required: "请输入企业名称",
            maxlength:"50个字符以内"
	        },
	        "e.zhuceziben": {
	            required: "请输入注册资本",
	            number:"注册资本请填数字",
	            maxlength:"18字符以内"
	        },
	        "e.chengliriqi": {
	        	required: "请输入成立日期",
	        	isDate:"请正确输入日期格式"
	        },
	        "e.dizhi": {
	        	required: "请输入办公地址",
	        	maxlength:"64字符以内"
	        },
	        "e.faren": {
	        	required: "请输入法人姓名",
	            maxlength:"16字符以内"
	        },
	        "e.farentele": {
	            required: "请输入法人电话",
	            isTel:"请正确输入电话格式"
	        },
	        "e.fzr": {
	        	required: "请输入负责人姓名",
	            maxlength:"8个字符以内"
	        },
	        "e.fzrzhiwu": {
	            required: "请输入法人职务",
	            maxlength:"32字符以内"
	        },
	        "e.fzrtele": {
	        	required: "请输入负责人电话",
	        	isTel:"请正确输入电话格式"
	        },
	        "e.lxr": {
	            required: "请输入联系人姓名",
	            maxlength:"16字符以内"
	        },
	        "e.lxrzhiwu": {
	            required: "请输入联系人职务",
	            maxlength:"32字符以内"
	        },
	        "e.lxrtlle": {
	            required: "请输入联系人电话",
	            isTel:"请正确输电话格式"
	        },
	        "e.dkyy0": {
	            required: "请输入贷款银行名称",
	            maxlength:"64字符以内"
	        },
	        "e.dkje0": {
	            required: "请输入贷款金额",
	            number:"贷款金额请填数字",
	            maxlength:"18字符以内"
	        },
	        "e.dbfl0": {
	            required: "请输入担保费率",
	            number:"担保费率请填数字",
	            maxlength:"18字符以内"
	        },
	        "e.dbf0": {
	            required: "请输入担保费",
	            number:"担保费请填数字",
	            maxlength:"18字符以内"
	        },
	        "e.dkll0": {
	            required: "请输入担保利率",
	            number:"担保利率请填数字",
	            maxlength:"18字符以内"
	        },
	        "e.zflx0": {
	            required: "请输入支付利息",
	            number:"支付利息请填数字",
	            maxlength:"18字符以内"
	        },
	        "e.fksj0": {
	            required: "请输入放款日期",
	            isDate:"日期格式如：2016-08-12"
	        },
	        "e.dqsj0": {
	            required: "请输入到期日期",
	            isDate:"日期格式如：2016-08-12"
	        },
	        "e.gqrzds": {
	            required: "请输入股权融资需求",
	            number: "请输入数字",
	            maxlength:"18字符以内"
	        },
	        "e.zqrzds": {
	            required: "请输入债券融资需求",
	            number: "请输入数字",
	            maxlength:"18字符以内"
	        },
	        "e.vcpe": {
	            required: "请输入VCPE情况",
	            maxlength:"256字符以内"
	        },
	        "e.dsfxypj": {
	            required: "请输第三方评级",
	            maxlength:"8字符以内"
	        },
	        "e.qygm": {
	            required: "请选择企业规模",
	            maxlength:"16字符以内"
	        },
	        "e.tjgxqk": {
	            required: "请选择统计关系情况",
	            maxlength:"16字符以内"
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
			var vcpetext = $("#vcpetext").val();
			if(vcpetext.length<=17){
				alert("\"引入VC/PE情况\"为必填项！");
				$("#vcpetext").focus();
				return;
				
			};
        	//表单提交句柄,为一回调函数，带一个参数：form   
            //alert("提交表单");   return;
            form.submit();   //提交表单   
        }
    });
    
}
