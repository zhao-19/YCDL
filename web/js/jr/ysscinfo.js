function ysscinfo(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    // var num = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
        var num = /^(\-|\+)?[0-9]+(,*[0-9]*)*[.]{0,1}[0-9]{0,2}$/;    //验证千分位保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("isOCC", function(value, element) {       
	    var num = /^[0-9]*$/;    //手写验证整数数字和0
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("NumLength", function(value, element) {       
	    return !(value < -1000000000000 || value > 1000000000000);       
	}, "字符过长");
	jQuery.validator.addMethod("isTel", function(value, element) {
        var length = value.length;
        var isTel = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
        return this.optional(element) || (isTel.test(value));
    }, "请输入正确的电话");
    $("#tbjrysscFormInfo").validate({
    	 onkeyup:false,
        rules: {
            "tbjryssc.transaction_amount": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryssc.staff_count": {
                required: true,
                isOCC:true,
                rangelength:[1,10]
            },
            "tbjryssc.business_income": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryssc.profit": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryssc.fixed_assets": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryssc.intangible_assets": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryssc.salaries": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryssc.added_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryssc.income_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryssc.other_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryssc.contact_name": {
                required: true,
                rangelength:[1,16]
            },
            "tbjryssc.contact_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjryssc.leader_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjryssc.contact_duty": {
                required: true,
                rangelength:[1,16]
            },
            "tbjryssc.time_port": {
                required: true
            }

        },
        messages: {
            "tbjryssc.transaction_amount": {
            	required: "请输入全年交易额",
            	isNum:"全年交易额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryssc.staff_count": {
            	required: "请输入职工人数",
            	isOCC:"职工人数请输入整数",
            	rangelength:"字符过长"
            },
            "tbjryssc.business_income": {
            	required: "请输入营业收入",
            	isNum:"营业收入请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryssc.profit": {
            	required: "请输入净利润",
            	isNum:"净利润请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryssc.fixed_assets": {
            	required: "请输入固定资产折旧",
            	isNum:"固定资产折旧请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryssc.intangible_assets": {
            	required: "请输入无形资产摊销",
            	isNum:"无形资产摊销请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryssc.salaries": {
            	required: "请输入人员薪酬及福利",
            	isNum:"人员薪酬及福利请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryssc.added_tax": {
            	required: "请输入增值税",
            	isNum:"增值税请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryssc.income_tax": {
            	required: "请输入所得税",
            	isNum:"所得税请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryssc.other_tax": {
            	required: "请输入其他税金及附加",
            	isNum:"其他税金及附加请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryssc.contact_name": {
            	required: "请输入填报人姓名",
            	rangelength:"字符过长"
            },
            "tbjryssc.contact_tele": {
            	required: "请输入填报人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjryssc.leader_tele": {
            	required: "请输入负责人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjryssc.contact_duty": {
            	required: "请输入填报人职务",
            	rangelength:"字符过长"
            },
            "tbjryssc.time_port": {
                required: "请选择"
            }
        },
        errorPlacement: function (error, element) {
        	if (element.is(':radio') || element.is(':checkbox')) { 
        	    var eid = element.attr('name');
        	    error.appendTo(element.parent()); 
        	} else {
        		error.insertAfter(element);
        	}
        },
        submitHandler: function(form){
            nativeNum("isBankZint");//还原为数字
        	$("#tbjrysscSub,#tbjrysscSave").attr("disabled","disabled");
            form.submit();
        }        
    });
}