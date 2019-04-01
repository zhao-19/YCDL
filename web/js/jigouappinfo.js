/**
 * @author Administrator
 */

function jigouappinfo(){
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
	  jQuery.validator.addMethod("isOCC", function(value, element) {       
		    var num = /^[0-9]*$/;    //手写验证整数数字和0
		    return this.optional(element) || (num.test(value));       
		}, "请正确填写数字");
    $("#jigouappinfo").validate({
        	rules: {
                "jigou.jigoumingcheng": {
                    required: true,
                    maxlength:32
                },
                "jigou.jigouleixingid": {
                    required: true,
                    maxlength:18
                },
                "jigou.zzjgdm": {
                	required: true,
                    maxlength:36
                },
                "jigou.zhuceshijian": {
                	required: true,
                	isDate:true
                },
                "jigou.zhuceziben": {
                	required: true,
                	isNum:true,
                    maxlength:18
                },
                "jigou.gszcd_province": {
                    required: true
                },
                "jigou.gszcd_city": {
                	required: true
                },
                "jigou.gszcd_county": {
                    required: true
                },
                "jigou.fuwuneirong": {
    	        	required: true,
                    maxlength:1024
    	        },
                "jigou.fuwuanli": {
                    required: true,
                    maxlength:2048
                },
                "jigou.bangongdizhi": {
                    required: true,
                    maxlength:164
                },
                "jigou.jigoujianjie": {
                    required: true,
                    maxlength:2000
                },
                "jigou.jigoulogo": {
                    maxlength: 64
                },
                "jigou.wangzhi": {
                    maxlength:64
                },
                "jigou.tz_jijinxingzhi": {
                    required: true,
                    maxlength:32
                },
                "jigou.tz_glzbj": {
                    required: true,
                    isNum:true,
                    maxlength:64
                },
                "jigou.tz_touzihangye": {
                    required: true,
                    maxlength:50
                },
                "jigou.rongzhijieduan": {
                    required: true,
                    maxlength:50
                },
                "jigou.tz_touzijieduanid": {
                    required: true,
                    maxlength:18
                },
                "jigou.tz_touziedu": {
//                	 required: true,
                     isNum:true,
                     maxlength:64
                },
                "jigou.xingming": {
                    required: true,
                    maxlength:25
                },
                "jigou.bumenzhiwu": {
                	required: true,
                    maxlength:25
                },
                "jigou.yidongdianhua": {
                    required: true,
                    isTel:true
                },
                "jigou.gudingdianhua": {
//                	required: true,
                    isTel:true
                },
                "jigou.email": {
                    required: true,
                    isEmail:true
                },
                "jigou.bcard": {
                    required: true,
                    maxlength:128
                },
                "jigou.yuangongshu": {
                    required: true,
                    isOCC:true,
                	maxlength:7
                },
                "jigou.party_num": {
                    required: true,
                    isOCC:true,
                	maxlength:7
                },
                "jigou.lead_num": {
                    required: true,
                    isOCC:true,
                	maxlength:7
                },
                "jigou.lead_party_num": {
                    required: true,
                    isOCC:true,
                	maxlength:7
                },
                "jigou.is_party": {
                    required: true
                },
                "jigou.is_party_branch": {
                    required: true
                }
            },
            messages: {
            	"jigou.jigoumingcheng": {
                    required: "请输入机构名称",
                    maxlength:"32字符以内"
                },
                "jigou.jigouleixingid": {
                    required: "请输入机构类型",
                    maxlength:"18字符以内"
                },
                "jigou.zzjgdm": {
                	required: "请输入组织机构代码",
                    maxlength:"36字符以内"
                },
                "jigou.zhuceshijian": {
                	required: "请选择注册时间",
                	isDate:"请正确选择"
                },
                "jigou.zhuceziben": {
                	required: "请输入注册资本",
                	isNum:"请填写数字,保留两位小数",
                    maxlength:"18字符以内"
                },
                "jigou.gszcd_province": {
                    required: "请输入省份"
                },
                "jigou.gszcd_city": {
                	required: "请输入城市"
                },
                "jigou.gszcd_county": {
                    required: "请输入区县"
                },
                "jigou.fuwuneirong": {
    	        	required: "请输入机构服务内容",
                    maxlength:"1024字符以内"
    	        },
                "jigou.fuwuanli": {
                    required: "请输入机构服务案例",
                    maxlength:"2048字符以内"
                },
                "jigou.bangongdizhi": {
                    required: "请输入办公地址",
                    maxlength:"64字符以内"
                },
                "jigou.jigoujianjie": {
                    required: "请输入机构简介",
                    maxlength:"2000字符以内"
                },
                "jigou.jigoulogo": {
                	maxlength: "64字符以内"
                },
                "jigou.wangzhi": {
                    maxlength:"64字符以内"
                },
                "jigou.tz_jijinxingzhi": {
                    required: "请输入基金性质",
                    maxlength:"32字符以内"
                },
                "jigou.tz_glzbj": {
                    required: "请输入管理资本金",
                    isNum:"请输入数字，保留两位小数",
                    maxlength:"64字符以内"
                },
                "jigou.tz_touzihangye": {
                    required: "请选择投资行业",
                    maxlength:"50字符以内"
                },
                "jigou.rongzhijieduan": {
                    required: "请选择投资阶段",
                    maxlength:"50字符以内"
                },
                "jigou.tz_touzijieduanid": {
                    maxlength:"18字符以内",
                    required: "请输入投资阶段"
                },
                "jigou.tz_touziedu": {
//                	required: "请输入管理资本金",
                    isNum:"请输入数字，保留两位小数",
                    maxlength:"64字符以内"
                },
                "jigou.xingming": {
                    required: "请输入联系人姓名",
                    maxlength:"25字符以内"
                },
                "jigou.bumenzhiwu": {
                	required: "请输入联系人职务",
                    maxlength:"25字符以内"
                },
                "jigou.yidongdianhua": {
                    required: "请输入移动电话",
                    isTel:"请正确输入"
                },
                "jigou.gudingdianhua": {
//                	required: "请输入移固定电话",
                    isTel:"请正确输入 "
                },
                "jigou.email": {
                	required: "请输入联系人邮箱",
                	isEmail:"请正确输入邮箱格式"
                },
                "jigou.bcard": {
                	required: "请上传联系人名片",
                    maxlength:"128字符以内"
                },
                "jigou.yuangongshu": {
                    required: "请输入公司人数",
                    isNum:	"公司人数请填数字",
                	maxlength:	"7字符以内"
                },
                "jigou.party_num": {
                    required: "请输入党员人数",
                    isNum:	"党员人数请填数字",
                	maxlength:	"7字符以内"
                },
                "jigou.lead_num": {
                    required: "请输入高管人数",
                    isNum:	"高管人数请填数字",
                	maxlength:	"7字符以内"
                },
                "jigou.lead_party_num": {
                    required: "请输入高管党员人数",
                    isNum:	"高管党员人数请填数字",
                	maxlength:	"7字符以内"
                },
                "jigou.is_party": {
                    required: "请选择法人代表是否党员"
                },
                "jigou.is_party_branch": {
                    required: "请选择是否设立当支部"
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
