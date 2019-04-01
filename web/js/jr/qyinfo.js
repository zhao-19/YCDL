function qyinfo(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    // var num = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
        var num = /^(\-|\+)?[0-9]+(,*[0-9]*)*[.]{0,1}[0-9]{0,2}$/;    //验证千分位保留两位小数
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
    $("#tbjrqyFormInfo").validate({
    	 onkeyup:false,
        rules: {
            "tbjrqy.business_income": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrqy.deposit_total": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrqy.deposit_sett": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrqy.cross_sett": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrqy.contact_name": {
                required: true,
                rangelength:[1,16]
            },
            "tbjrqy.contact_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjrqy.leader_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjrqy.contact_duty": {
                required: true,
                rangelength:[1,16]
            },
            "tbjrqy.time_port": {
                required: true
            }
        },
        messages: {
        	"tbjrqy.business_income": {
            	required: "请输入业务经营额",
            	isNum:"业务经营额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrqy.deposit_total": {
            	required: "请输入人民币贷款余额",
            	isNum:"人民币贷款余额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrqy.deposit_sett": {
            	required: "请输入人民币资金池业务结算量",
            	isNum:"人民币资金池业务结算量请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrqy.cross_sett": {
            	required: "请输入跨境人民币结算金额",
            	isNum:"跨境人民币结算金额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrqy.contact_name": {
            	required: "请输入填报人姓名",
            	rangelength:"字符过长"
            },
            "tbjrqy.contact_tele": {
            	required: "请输入填报人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjrqy.leader_tele": {
            	required: "请输入负责人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjrqy.contact_duty": {
            	required: "请输入填报人职务",
            	rangelength:"字符过长"
            },
            "tbjrqy.time_port": {
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
        	$("#tbjrqySub,#tbjrqySave").attr("disabled","disabled");
            form.submit();
        }        
    });
}