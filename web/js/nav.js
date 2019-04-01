$(function(){
    //菜单隐藏展开
    var tabs_i=0
    $('.vtitle').click(function(){
        var _self = $(this);
        var j = $('.vtitle').index(_self);
        if( tabs_i == j ) return false; tabs_i = j;
        $('.vtitle em').each(function(e){
            if(e==tabs_i){
                $('em',_self).removeClass('v02').addClass('v02');
            }else{
                $(this).removeClass('v02').addClass('v02');
            }
        });
        $('.vcon').slideUp().eq(tabs_i).slideDown();
    });
})


/*jQuery vaildate导入*/

$().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
  $("#signupForm").validate({
    rules: {
      // firstname: "required",
      // lastname: "required",
      username: {
        required: true,
        minlength: 2
      },
      password: {
        required: true,
        minlength: 5
      },
      confirm_password: {
        required: true,
        minlength: 5,
        equalTo: "#password"
      },
      email: {
        required: true,
        email: true
      },
      topic: {
        required: "#newsletter:checked",
        minlength: 2
      },
      agree: "required"
    },
    messages: {
      // firstname: "请输入您的名字",
      // lastname: "请输入您的姓氏",
      
      username: {
        required: "请输入用户名",
        minlength: "用户名必需由两个字母组成"
      },
      password: {
        required: "请输入密码",
        minlength: "密码长度不能小于 5 个字母"
      },
      confirm_password: {
        required: "请输入密码",
        minlength: "密码长度不能小于 5 个字母",
        equalTo: "两次密码输入不一致"
      },
      email: "请输入一个正确的邮箱",
      agree: "请接受我们的声明",
      topic: "请选择两个主题"
    }
});
