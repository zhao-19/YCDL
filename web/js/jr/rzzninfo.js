function rzzninfo(){
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
    $("#tbjrrzznFormInfo").validate({    //融资租赁表单内容验证内容
    	 onkeyup:false,
        rules: {
            "tbjrrzzn.contract_incre": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.contract_incre_amt": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.contract_direct_incre": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.sell_back_incre": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.contract_total": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.grant_total_amt": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.contract_total_incre": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.sell_back_total": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.staff_count": {
                required: true,
                isOCC:true,
                rangelength:[1,10]
            },
            "tbjrrzzn.business_income": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.profit": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.fixed_assets": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.intangible_assets": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.salaries": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.added_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.income_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.other_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrrzzn.contact_name": {
                required: true,
                rangelength:[1,16]
            },
            "tbjrrzzn.contact_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjrrzzn.leader_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjrrzzn.contact_duty": {
                required: true,
                rangelength:[1,16]
            },
            "tbjrrzzn.time_port": {
                required: true
            }
        },
        messages: {
        	"tbjrrzzn.contract_incre": {
            	required: "请输入当期新签融资租赁合同金额",
            	isNum:"当期新签融资租赁合同金额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.contract_incre_amt": {
            	required: "请输入投放总额",
            	isNum:"投放总额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.contract_direct_incre": {
            	required: "请输入其中：直接融资租赁",
            	isNum:"其中：直接融资租赁请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.sell_back_incre": {
            	required: "请输入售后回租",
            	isNum:"售后回租请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.contract_total": {
            	required: "请输入累计融资租赁合同金额",
            	isNum:"累计融资租赁合同金额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.grant_total_amt": {
            	required: "请输入投放总额",
            	isNum:"投放总额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.contract_total_incre": {
            	required: "请输入其中：直接融资租赁",
            	isNum:"其中：直接融资租赁请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.sell_back_total": {
            	required: "请输入出售回租",
            	isNum:"出售回租请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.staff_count": {
            	required: "请输入员工数",
            	isOCC:"员工数请输入整数",
            	rangelength:"字符过长"
            },
            "tbjrrzzn.business_income": {
            	required: "请输入营业收入",
            	isNum:"营业收入请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.profit": {
            	required: "请输入净利润",
            	isNum:"净利润请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.fixed_assets": {
            	required: "请输入固定资产折旧",
            	isNum:"固定资产折旧请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.intangible_assets": {
            	required: "请输入无形资产摊销",
            	isNum:"无形资产摊销请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.salaries": {
            	required: "请输入人员薪酬及福利",
            	isNum:"人员薪酬及福利请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.added_tax": {
            	required: "请输入增值税",
            	isNum:"增值税请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.income_tax": {
            	required: "请输入所得税",
            	isNum:"所得税请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.other_tax": {
            	required: "请输入其他税金及附加",
            	isNum:"其他税金及附加请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrrzzn.contact_name": {
            	required: "请输入填报人姓名",
            	rangelength:"字符过长"
            },
            "tbjrrzzn.contact_tele": {
            	required: "请输入填报人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjrrzzn.leader_tele": {
            	required: "请输入负责人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjrrzzn.contact_duty": {
            	required: "请输入填报人职务",
            	rangelength:"字符过长"
            },
            "tbjrrzzn.time_port": {
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
        	$("#tbjrrzznSub,#tbjrrzznSave").attr("disabled","disabled");
            form.submit();
        }        
    });

}