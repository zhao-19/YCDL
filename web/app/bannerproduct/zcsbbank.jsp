<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
	<jsp:param name="title" value="我的政策申报"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/skin/layer.css">
<script src="${pageContext.request.contextPath}/app/js/layer.js"></script>
<script src="${pageContext.request.contextPath}/app/js/check.js"></script>
<body class="zmtdetail siz zcsbbank">
<style>
	.pubrz .inputrow{height:auto;line-height: 0.5rem;}
	.error{font-size: 0.24rem;color: red;display: none;}
	.pubrz .inputrow>span{line-height:1.15rem;}
	.pubrz .inputrow input[type='text'], .pubrz .inputrow input[type='number'], .pubrz .inputrow input[type='date']{height:1.15rem;margin:0;}
</style>
<form action="" id="zcsbbank">
    <input type="hidden" name="userid" value="${userid}">
    <input type="hidden" name="pkid" value="${pkid}">
	<div class="stephead tc" >
		<h2>拨款账户信息</h2>
	</div>
	<div class="pubzmt">
		<div class="pubrz">
			<div class="inputrow ov">
				<span>户名</span>
				<div class="fr">
                    <span style="height:1.15rem;line-height: 1.15rem;">${qiyename}</span>
					<input type="hidden" name="qiyename" value="${qiyename}" placeholder="请输入收款账户名称">
				</div>
			</div>
			<div class="inputrow ov">
				<span>开户行</span>
				<div class="fr">
					<input type="text" name="receipt_bank" value="${receipt_bank}" placeholder="请输入开户银行" id="bank">
					<span class="error">开户银行输入有误！</span>
				</div>
			</div>
			<div class="inputrow ov">
				<span>账号</span>
				<div class="fr">
					<input type="text" name="" value="" placeholder="请输入银行账号" id="account">
					<span class="error">银行账号输入有误！</span>
					<input type="hidden" name="receipt_account" value="${receipt_account}" placeholder="请输入银行账号" id="account2">
				</div>
			</div>
		</div>
	</div>
	<div class="tips">
		<i>*</i>
		<p>1、以上信息仅供财政拨款使用，平台承诺不会透露给第三方;</p>
		<p>2、企业名称与银行账户必须匹配；否则会影响拨款。</p>
	</div>
</form>
<input id="tijiao"  class="zmtapply" type="button" onclick="checkzcsbbank($('#zcsbbank')[0])" value="保存信息" disabled="disabled"/>

<script>
    $('#account').val($('#account2').val().replace(/\s/g,'').replace(/(.{4})/g,"$1 "))

    var oldbank=$('#bank').val();
    var oldaccount=$('#account2').val()
    $('#bank').bind('input propertychange', function() {
        //开头6位
        var account = $('#account2').val();
        var bank=$(this).val();
        if(bank.length>=4){
            $('#bank').siblings('.error').hide();

        }else{
            $('#bank').siblings('.error').show();
        }
        if((bank!=oldbank)&&bank.length>=4&&(account.length>=8&&account.length<=32)){
                 $('#tijiao').removeAttr('disabled');

            }else{
                 $('#tijiao').attr('disabled','true');
            }
    });
    $('#account').bind('input propertychange', function() {
        formatBankNo($(this)[0]);
    });
    function formatBankNo (BankNo){
        if (BankNo.value == "") return;
        var account = new String (BankNo.value);
        account = account.substring(0,39); /*帐号的总数, 包括空格在内 */
        if (account.match (".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}") == null){
            /* 对照格式 */
            if (account.match (".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}") == null){
                var accountNumeric = accountChar = "", i;
                for (i=0;i<account.length;i++){
                    accountChar = account.substr (i,1);
                    if (!isNaN (accountChar) && (accountChar != " ")) accountNumeric = accountNumeric + accountChar;
                }
                account = "";
                for (i=0;i<accountNumeric.length;i++){  /* 可将以下空格改为-,效果也不错 */
                    if (i == 4) account = account + " "; /* 帐号第四位数后加空格 */
                    if (i == 8) account = account + " "; /* 帐号第八位数后加空格 */
                    if (i == 12) account = account + " ";/* 帐号第十二位后数后加空格 */
                    if (i == 16) account = account + " ";/* 帐号第十二位后数后加空格 */
                    if (i == 20) account = account + " ";/* 帐号第十二位后数后加空格 */
                    if (i == 24) account = account + " ";/* 帐号第十二位后数后加空格 */
                    if (i == 28) account = account + " ";/* 帐号第十二位后数后加空格 */
                    account = account + accountNumeric.substr (i,1)
                }
            }
        }
        // // else
        // // {
        //     account = " " + account.substring (1,5) + " " + account.substring (6,10) + " " + account.substring (14,18) + "-" + account.substring(18,25);
        // // }
        if (account != BankNo.value) BankNo.value = account;
        //开头6位
        var strBin = "10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";
        var newaccount=account.replace(/\s|\xA0/g,"");
        if(newaccount.length>=8&&newaccount.length<=32){
            $('#account2').val(newaccount);
            $('#account2').siblings('.error').hide();
        }else{
            $('#account2').siblings('.error').show();
        }
        if(((newaccount!=oldaccount)&&newaccount.length>=8&&newaccount.length<=32)&&($('#bank').val().length>=4)){
            $('#tijiao').removeAttr('disabled')
        }else{
            $('#tijiao').attr('disabled','true')
        }
    }


    function checkzcsbbank(bank){
        $('#tijiao').attr('disabled','true');
        $.ajax({
            type: "post",
            url: "/app/zcsbbanksubmit.action",
            dataType: "json",
            async : false,
            data:$(bank).serialize(),
            beforeSend:function(data){

            },
            success: function(data){
                layer.msg(data.msg);
            },
            error:function(data){
                layer.msg("data.msg");
            }
        });
    }
</script>
</body>
</html>