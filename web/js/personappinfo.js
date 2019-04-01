/**
 * @author Administrator
 */

function personappinfo(){
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
	  jQuery.validator.addMethod("isEmail", function(value, element) {       
		    return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/.test(value);     
		}, "请正确填写邮箱格式");
    $("#personappinfo").validate({
    	onkeyup:false,
        	rules: {
                "person.username": {
                    required: true,
                    maxlength:32
                },
                "person.orgid": {
                    required: true,
                    isIdcard:true
                },
                "person.zzjgdm": {
                	required: true,
                    maxlength:36
                },
                "person.sex": {
                	required: true
                },
                "person.birthday": {
                	required: true,
                	//maxlength: 10,
                	isDate:true
                },
                "person.address": {
                    required: true,
                    maxlength: 32
                },
                "person.education": {
                	required: true
                },
                "person.gszcd_province": {
                    required: true
                },
                "person.gszcd_city": {
    	        	required: true
    	        },
                "person.gszcd_county": {
                    required: true
                },
                "person.graduate": {
                    required: true,
                    maxlength: 18
                },
                "person.subject": {
                    required: true,
                    maxlength: 18
                },
                "person.introduce": {
                    required: true,
                    maxlength: 1024
                },
                "person.studio": {
                    required: true,
                    maxlength: 512
                },
                "email": {
                	required: true,
                    isEmail: true,
                	maxlength:32
                },
                "person.profession": {
                	required: true,
                    maxlength: 128
                },
                "person.org": {
                	required: true,
                    maxlength: 64
                },
                "person.label": {
                	required: true,
                    maxlength: 64
                },
                "person.investment": {
                	required: true
                },
                "person.headimg": {
                	// required: true
                }
            },
            messages: {
            	"person.username": {
                    required: "请输入姓名",
                    maxlength: "32字符以内"
                },
                "person.orgid": {
                    required: "请输入身份证号码",
                    isIdcard:"请正确输入"
                },
                "person.zzjgdm": {
                	required: "请输入组织机构代码",
                    maxlength: "36字符以内"
                },
                "person.sex": {
                	required: "请选择性别"
                },
                "person.birthday": {
                	required: "请输入出生日期",
                	//maxlength: "10字符以内",
                	isDate:"请正确输入"
                },
                "person.address": {
                    required: "请输入联系地址",
                    maxlength: "32字符以内"
                },
                "person.education": {
                	required: "请选择学历"
                },
                "person.gszcd_province": {
                    required: "请输入工作室所在省份"
                },
                "person.gszcd_city": {
    	        	required: "请输入工作室所在城市"
    	        },
                "person.gszcd_county": {
                    required: "请输入工作室所在区县"
                },
                "person.graduate": {
                    required: "请输入毕业院校",
                    maxlength: "18字符以内"
                },
                "person.subject": {
                    required: "请输入所学专业",
                    maxlength: "18字符以内"
                },
                "person.introduce": {
                    required: "请输入个人简介",
                    maxlength: "1024字符以内"
                },
                "person.studio": {
                    required: "请输入工作室介绍",
                    maxlength: "512字符以内"
                },
                "email": {
                	required: "请输入电子邮箱",
                    isEmail: "请正确输入电子邮箱",
                	maxlength:"32字符以内"
                },
                "person.profession": {
                	required: "请输入擅长行业",
                    maxlength: "128字符以内"
                },
                "person.org": {
                	required: "请输入所在机构",
                    maxlength: "64字符以内"
                },
                "person.label": {
                	required: "请输入标签",
                    maxlength: "64字符以内"
                },
                "person.investment": {
                	required: "请输入投资理念"
                },
                "person.headimg": {
                	// required: "请上传头像"
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
    	       //$("#gszcdspan span lable.eq(0)").nextAll().remove();
    	       //将错误信息添加当前元素的父结点后面
    	     }
        	else if (element.is('select[class*=ssx]')) { 
        		//把联动选择的提示只提示一个（思路：错误都一次放入容器最后，每次放入时，把第一个错误之后的错误节点删除）
    	       error.appendTo(element.parent()); //将错误信息添加当前元素的父结点后面
    	       //$("#gszcdspan span label").eq(0).nextAll().remove();
    	     }
        	else{
        	       error.insertAfter(element);
        	       //element.html(error); 
    	     }
        	
    	},
        submitHandler: function(form){       	
        	//表单提交句柄,为一回调函数，带一个参数：form   
           // alert("提交表单");
            form.submit();   //提交表单   
        }
    });
    
}
