
$(document).ready(function(){
	//查看状态下隐藏提交按钮
	if((typeof(t) != "undefined")&& (t == 'v')){
		$('.tijiao').hide();
	}
});



//说明：form表单id只能为“#form1”。保存按钮只能是“.baocun”。提交按钮只能是“.tijiao”。页面加载完时默认添加失去焦点事件，
        var DataCheck = {
            isNotNull: function () {
                var ret = true;
                $('*[isNotNull]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var thisErrorSpanRadio = $(this).parent().parent().children("span");//专门对radio和checkbox的提示标签
                    var thisInputName = $(this).attr('name');//当前标签的InputName
                    var val = $(this).val();
                    var content = $(this).attr('isNotNull');
                    var nodeName = this.nodeName;
                    if (nodeName == 'INPUT') {
                        var type = $(this).attr('type');

                        if (type == 'radio' || type == 'checkbox') {
                            //if($(this).parent().find("input:checked").length <= 0) {
                            if(!($('input[name="'+thisInputName+'"]:checked').val())){
                                thisErrorSpanRadio.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpanRadio.html('').hide();
                            }

                        } else {

                            if (val == null || val == '') {
                                thisErrorSpan.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpan.html('').hide();
                            }
                        }
                    } else {
                        if (val == null || val == '') {
                            thisErrorSpan.html(content+'不能为空！').show();
                            ret = false;
                        } else {
                            thisErrorSpan.html('').hide();
                        }
                    }
                });
                return ret;
            },
            isZcNotNull: function () {
                var ret = true;
                $('*[isZcNotNull]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var thisErrorSpanRadio = $(this).parent().parent().children("span");//专门对radio和checkbox的提示标签
                    var thisInputName = $(this).attr('name');//当前标签的InputName
                    var val = $(this).val();
                    var content = $(this).attr('isZcNotNull');
                    var nodeName = this.nodeName;
                    if (nodeName == 'INPUT') {
                        var type = $(this).attr('type');

                        if (type == 'radio' || type == 'checkbox') {
                            //if($(this).parent().find("input:checked").length <= 0) {
                            if(!($('input[name="'+thisInputName+'"]:checked').val())){
                                thisErrorSpanRadio.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpanRadio.html('').hide();
                            }

                        } else {

                            if (val == null || val == '') {
                                thisErrorSpan.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpan.html('').hide();
                            }
                        }
                    } else {
                        if (val == null || val == '') {
                            thisErrorSpan.html(content+'不能为空！').show();
                            ret = false;
                        } else {
                            thisErrorSpan.html('').hide();
                        }
                    }
                });
                return ret;
            },
            isInt: function () {
                var ret = true;

                $('*[isInt]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isInt');
                    var zzInt = "^[-]{0,1}[0-9]+$";
                    reg = new RegExp(zzInt);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须是整数！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }

                });
                return ret;
            },
            isFint: function () {
                var ret = true;

                $('*[isFint]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isFint');

                    var zzInt = "^[-]{0,1}[0-9]+[.]{0,1}[0-9]{0,2}$";
                    reg = new RegExp(zzInt);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须是数字，保留2位小数！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }

                });
                return ret;
            },
            isBankZint: function () {
                var ret = true;
                $('*[isBankZint]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    if(val.length==1&&isNaN(parseInt(val))){
                        thisErrorSpan.html('必须是数字，最多保留2位小数！').show();
                    }else {
                        var content = $(this).attr('isBankZint');
                        var isBankZint = "^[-]*[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}(.){0,1}[0-9]{0,2}$";
                        reg = new RegExp(isBankZint);
                        if (!(reg.test(val))) {
                            thisErrorSpan.html('必须是数字，最多保留2位小数！').show();
                            ret = false;
                        } else {
                            thisErrorSpan.html('').hide();
                        }
                    }
                });
                return ret;
            },
            isBankZZint: function () {
                var ret = true;
                $('*[isBankZZint]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isBankZZint');
                    var isBankZZint = "^[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}(.){0,1}[0-9]{0,2}$";
                    reg = new RegExp(isBankZZint);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须为正数，最多保留2位小数！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }

                });
                return ret;
            },

            isZint: function () {
                var ret = true;

                $('*[isZint]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isZint');

                    var zzInt = "^[0-9]+[.]{0,1}[0-9]{0,2}$";
                    reg = new RegExp(zzInt);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须是非负数字，保留2位小数！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }

                });
                return ret;
            },

            isDouble: function () {
                var ret = true;

                $('*[isDouble]').each(function () {
                    var val = $(this).val();
                    if(!val){return;}
                    var r = /^[1-9]?[0-9]*\.[0-9]*$/;
                    var content = $(this).attr("isDouble");

                    if (!r.test(val)) {
                        $(this).err(content + "必须是小数！");
                        ret = false;
                    } else {
                        $(this).closeErr();
                    }
                });
                return ret;
            },
            isLength: function () {
                var ret = true;

                $('*[isLength]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isLength');
                    content = eval(content);
                    if(content.length>1){
                        if(val.length<content[0] || val.length>content[1]){
                            content = content[0]+"~"+content[1]+'字符之内';
                            thisErrorSpan.html(content).show();
                            ret = false;
                        }else{
                            thisErrorSpan.html('').hide();
                        }


                    }else{
                        if(val.length<content[0]){
                            content = content[0]+"字符以上";
                            thisErrorSpan.html(content).show();
                            ret = false;
                        }else{
                            thisErrorSpan.html('').hide();
                        }

                    }

                });
                return ret;
            },
            isPhone: function () {
                var ret = true;

                $('*[isPhone]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isPhone');
                    var zzInt = /((^0\d{2}-\d{8}$)|(^0\d{3}-\d{7}$)|(^1[35847]\d{9}$))/;
                    if(!(zzInt.test(val))){
                        thisErrorSpan.html(content+'有误！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                });
                return ret;
            },
            isLandline: function () {//座机
                var ret = true;

                $('*[isLandline]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isLandline');
                    var zzInt = /((^0\d{2}-\d{8}$)|(^0\d{3}-\d{7}$))/;
                    if(!(zzInt.test(val))){
                        thisErrorSpan.html(content+'有误！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                });
                return ret;
            },
            isZZint: function () {//非负整数
                var ret = true;
                $('*[isZZint]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isZZint');

                    var zzInt =  /^([1-9]\d*|[0]{1,1})$/;
                    reg = new RegExp(zzInt);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须是正整数！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                });
                return ret;
            },
            isZuzhi: function () {
                var ret = true;

                $('*[isZuzhi]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isZuzhi');
                    var zzInt = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;
                    if(!(zzInt.test(val))){
                        thisErrorSpan.html(content+'有误！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                });
                return ret;
            },
            // isEmail: function () {
            //     var ret = true;
            //
            //     $('*[isEmail]').each(function () {
            //         var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
            //         var val = $(this).val();
            //         if(!val){return;}
            //         var content = $(this).attr('isEmail');
            //
            //         if (val.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
            //             thisErrorSpan.html("邮箱地址有误！");
            //             ret = false;
            //         } else {
            //             thisErrorSpan.html('').hide();
            //         }
            //     });
            //     return ret;
            // },
            isEmail: function () {
                var ret = true;

                $('*[isEmail]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isEmail');
                    var zzInt = /^([0-9A-Za-z\-_\.]+)@([0-9a-z\-]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
                    if(!(zzInt.test(val))){
                        thisErrorSpan.html(content+'有误！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                });
                return ret;
            },
            idCard: function () {
                var ret = true;

                $('*[idCard]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('idCard');
                    var zzInt = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
                    if(!(zzInt.test(val))){
                        thisErrorSpan.html('身份证号有误！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                });
                return ret;
            }





        }



    //说明：isInt是整的数字,包括正整数和负整数；
    // isFint是负的数字，包括负的整数，负的小数，正的整数，正的小数；
    // isZint是正的数字或0，包括正整数，正小数，0;
    // isZuzhi是组织机构代码，三证合一代码；

      /*  var bzf = DataCheck.isNotNull();
        alert(bzf);
        var bzf = DataCheck.isInt();
        alert(bzf);
        var bzf = DataCheck.isFint();
        alert(bzf);
        var bzf = DataCheck.isZint();
        alert(bzf);*/


        $(function() {
        	//
        	$("#form1 input:not('.submit,[type='checkbox']'),#form1 select,#form1 textarea").parent().append($('<span class="error"></span>'));
        	$("#form1 input[type='checkbox']").parent().parent().append($('<span class="error"></span>'));

	        //绑定失去焦点事件
	        var divid = "#form1";
            $('#form1').delegate("input:not('.submit'),select,label, textarea",'blur',function(){
            // $("#form1 input:not('.submit'),#form1 select,#form1 label,#form1 textarea").on('blur',function(){

	            var publickret = true;
	            //判断它是否有哪些属性
	            if($(this).attr('isNotNull') && publickret){
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var thisErrorSpanRadio = $(this).parent().parent().children("span");//专门对radio和checkbox的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isNotNull');
	                var nodeName = this.nodeName;
	                if (nodeName == 'INPUT') {
                        var type = $(this).attr('type');

                        if (type == 'radio' || type == 'checkbox') {
                            //if($(this).parent().find("input:checked").length <= 0) {
                            if(!($('input[name="'+thisInputName+'"]:checked').val())){
                                thisErrorSpanRadio.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpanRadio.html('').hide();
                            }

                        } else {

                            if ($.trim(val) === null || $.trim(val) == '') {
                                thisErrorSpan.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpan.html('').hide();
                            }
                        }
                    } else {
                        if ($.trim(val) === null || $.trim(val) == '') {
                            thisErrorSpan.html(content+'不能为空！').show();
                            ret = false;
                        } else {
                            thisErrorSpan.html('').hide();
                        }
                    }
	            }
	            if($(this).attr('isZcNotNull') && publickret){
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var thisErrorSpanRadio = $(this).parent().parent().children("span");//专门对radio和checkbox的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isZcNotNull');
	                var nodeName = this.nodeName;
	                if (nodeName == 'INPUT') {
                        var type = $(this).attr('type');

                        if (type == 'radio' || type == 'checkbox') {
                            //if($(this).parent().find("input:checked").length <= 0) {
                            if(!($('input[name="'+thisInputName+'"]:checked').val())){
                                thisErrorSpanRadio.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpanRadio.html('').hide();
                            }

                        } else {

                            if (val == null || val == '') {
                                thisErrorSpan.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpan.html('').hide();
                            }
                        }
                    } else {
                        if (val == null || val == '') {
                            thisErrorSpan.html(content+'不能为空！').show();
                            ret = false;
                        } else {
                            thisErrorSpan.html('').hide();
                        }
                    }
	            }
	            if($(this).attr('isLength') && publickret){

	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isLength');
	                content = eval(content);
	                if(content.length>1){
	                	//alert(val+"**"+val.length);
	                    if(val.length<content[0] || val.length>content[1]){
	                        content = content[0]+"~"+content[1]+'字符之内';
	                        thisErrorSpan.html(content).show();
	                        publickret = false;
	                    }else{
	                        thisErrorSpan.html('').hide();
	                    }


	                }else{
	                    if(val.length<content[0]){
	                        content = content[0]+"字符以上";
	                        thisErrorSpan.html(content).show();
	                        publickret = false;
	                    }else{
	                        thisErrorSpan.html('').hide();
	                    }

	                }
	            }
	            if($(this).attr('isInt') && publickret){

	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isInt');
	                var zzInt = "^[-]{0,1}[0-9]+$";
	                reg = new RegExp(zzInt);
	                if(!(reg.test(val))){
	                    thisErrorSpan.html('必须是整数！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	            if($(this).attr('isFint') && publickret){

	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isFint');
	                var zzInt = "^[-]{0,1}[0-9]+[.]{0,1}[0-9]{0,2}$";
	                reg = new RegExp(zzInt);
	                if(!(reg.test(val))){
	                    thisErrorSpan.html('必须是数字,保留2位小数！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	            if($(this).attr('isZint') && publickret){

	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isZint');
	                var zzInt = "^[0-9]+[.]{0,1}[0-9]{0,2}$";
	                reg = new RegExp(zzInt);
	                if(!(reg.test(val))){
	                    thisErrorSpan.html('必须是非负数字,保留2位小数！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }

	            if($(this).attr('isBankZint') && publickret){
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    if(val.length==1&&isNaN(parseInt(val))){
                        thisErrorSpan.html('必须是数字，最多保留2位小数！').show();
                    }else{
                        var content = $(this).attr('isBankZint');
                        var isBankZint = "^[-]*[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}(.){0,1}[0-9]{0,2}$";
                        reg = new RegExp(isBankZint);
                        if(!(reg.test(val))){
                            thisErrorSpan.html('必须是数字，最多保留2位小数！').show();
                            publickret = false;
                        }else{
                            thisErrorSpan.html('').hide();
                        }
                    }
	            }
                if($(this).attr('isBankZZint') && publickret){
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    var content = $(this).attr('isBankZZint');
                    var isBankZZint = "^[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}(.){0,1}[0-9]{0,2}$";
                    reg = new RegExp(isBankZZint);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须为正数，最多保留2位小数！').show();
                        publickret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                }

                if($(this).attr('isZuzhi') && publickret){

	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isZuzhi');
	                var zzInt = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;
	                if(!(zzInt.test(val))){
	                    thisErrorSpan.html(content+'有误！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	            if($(this).attr('isPhone') && publickret){

	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isPhone');
	                var zzInt = /((^0\d{2}-\d{8}$)|(^0\d{3}-\d{7}$)|(^1[35847]\d{9}$))/;
	                if(!(zzInt.test(val))){
	                    thisErrorSpan.html(content+'有误！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	            if($(this).attr('isLandline') && publickret){

	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isLandline');
	                var zzInt = /((^0\d{2}-\d{8}$)|(^0\d{3}-\d{7}$))/;
	                if(!(zzInt.test(val))){
	                    thisErrorSpan.html(content+'有误！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
                if($(this).attr('isZZint') && publickret){

                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    var content = $(this).attr('isZZint');

                    var zzInt = /^([1-9]\d*|[0]{1,1})$/;

                    if(!(zzInt.test(val))){
                        thisErrorSpan.html('必须是正整数！').show();
                        publickret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                }
	            // if($(this).attr('isEmail') && publickret){
                //
	            //     var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	            //     var val = $(this).val();
	            //     var content = $(this).attr('isEmail');
                //
	            //     if (val.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
	            //         thisErrorSpan.html("邮箱地址有误！");
	            //         publickret = false;
	            //     } else {
	            //         thisErrorSpan.html('').hide();
	            //     }
	            // }
                if($(this).attr('isEmail') && publickret){

                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    var content = $(this).attr('isEmail');
                    var zzInt = /^([0-9A-Za-z\-_\.]+)@([0-9a-z\-]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
                    if(!(zzInt.test(val))){
                        thisErrorSpan.html(content+'有误！').show();
                        publickret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                }
	            if($(this).attr('idCard') && publickret){

	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('idCard');
	                var zzInt = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
	                if(!(zzInt.test(val))){
	                    thisErrorSpan.html('身份证号有误！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	
	
	        });
        })

        

       
        //测试动态创建的元素对绑定的blur事件是否依然生效[可以]
        $(".dongtai").click(function(){
            $(".namewk").clone(true).appendTo($("#form1"));
        });

