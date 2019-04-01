$(function () {
    var fenzhan={
        510185:{//简阳
            rightPhone:'028-27697897',
            footPhone:[['简阳市金融办','028-27029027'],['工投公司','028-27697897']],
            headAddrName:'简阳市金融办',
            qq:['盈创动力简阳站中小企业','475520872']
        },
        510113:{//青白江
            rightPhone:'028-89320208',
            footPhone:[['青白江区政府金融办','028-89320208']],
            headAddrName:'青白江区国有资产监督管理和金融工作局',
            qq:['青白江区企业挂牌上市','490112270']
        },
        510117:{
            rightPhone:'028-87905027',
            footPhone:[['成都鹃城金控控股有限公司','028-87905027']],
            headAddrName:'郫都区国资金融局',
            qq:['郫都区综合金融服务','862970224'],
            bottomCopy:'蜀ICP备19005032号-1',
            bottomCompany:'成都鹃城金控控股有限公司',
            bottomAdress:'成都市郫都区德源镇红旗大道221号5号楼11楼',
            bottomPhone:'028-87905027',
            bottomFax:false,
            bottomEmail:'cdjcjkkgyxgs@163.com',
            // hideCode:true
        }
    }
    var fenzhans = fenzhan[$("#sessionsubcode").html()];
    $('#headAddrName').html(fenzhans.headAddrName)
    $('#rightphone').html(fenzhans.rightPhone);
    $('#qqName').html(fenzhans.qq[0]);
    $('#qqNum').html(fenzhans.qq[1]);
    var footPhone='';
    $.each(fenzhans.footPhone,function (i,v) {
        footPhone+=' <dt>'+v[0]+'</dt><dd>'+v[1]+'</dd>'
    })
    $('#footPhone').html(footPhone);
    if(fenzhans.bottomCopy){
        $('#bottomCopy').html(fenzhans.bottomCopy);
    }
    if(fenzhans.bottomCompany){
        $('#bottomCompany').html(fenzhans.bottomCompany);
    }
    if(fenzhans.bottomAdress){
        $('#bottomAdress').html(fenzhans.bottomAdress);
    }
    if(fenzhans.bottomPhone){
        $('#bottomPhone').html(fenzhans.bottomPhone);
    }
    if(fenzhans.bottomEmail){
        $('#bottomEmail').html(fenzhans.bottomEmail);
    }
    if(!fenzhans.bottomFax){
        $('#bottomFaxHide').hide();
    }
    // if(fenzhans.hideCode){
    //     $('#footerCode').hide();
    // }
})