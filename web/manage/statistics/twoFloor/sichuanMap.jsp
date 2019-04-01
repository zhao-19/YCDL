<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
    <title>科技金融大数据</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/manage/statistics/twoFloor/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/manage/statistics/twoFloor/css/style.css">
    <script src="<%=request.getContextPath() %>/manage/statistics/twoFloor/js/jquery-1.8.3.js"></script>
    <script src="<%=request.getContextPath() %>/manage/statistics/twoFloor/js/common.js"></script>
    <script src="<%=request.getContextPath() %>/manage/statistics/twoFloor/js/echarts.js"></script>
    <script src="<%=request.getContextPath() %>/manage/statistics/twoFloor/js/sichuan.js"></script>

</head>
<body class="mapDetail">
<div class="bodyBox">
    <div class="mapBox"></div>
    <div class="gifsBox">
        <!--bottom-->
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/bottomC.gif" alt="" class="gif bottomC">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/bottomL.gif" alt="" class="gif bottom bottomL">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/bottomR.gif" alt="" class="gif bottom bottomR">
        <!--bottom侧方-->
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/bottom1L.gif" alt="" class="gif bottom1 bottom1L">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/bottom1R.gif" alt="" class="gif bottom1 bottom1R">
        <!--中间-->
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/midL.gif" alt="" class="gif mid midL">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/midR.gif" alt="" class="gif mid midR">
        <!--顶部-->
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/top3L.gif" alt="" class="gif top3 top3L">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/top3R.gif" alt="" class="gif top3 top3R">

        <!--顶部侧方-->
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/top1L.gif" alt="" class="gif top1 top1L">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/top1R.gif" alt="" class="gif top1 top1R">
    </div>
    <div class="mapOnly">
        <div id="area"></div>
    </div>
    <div class="borderBox">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/title.png" alt="" class="title">
        <div class="mapSichuanBox">
            <div class="wave solid warning">
                <div class="circle circle1"></div>
                <div class="circle circle2"></div>
            </div>
            <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/addr.png" alt="" class="addr">
        </div>

    </div>
</div>
    <script>
        window.onload=function(){
            $('.bodyBox').click(function(){
                var index=parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            })
            $('#mapSichuanBox').click(function(e){
                e.stopPropagation()
            })

            $.get('<%=request.getContextPath()%>/manage/user!winpowStat.action', function (data) {
                var newData=JSON.parse(data).data[10];
                var weiboData=[[]];
                $.each(newData.longitude,function(i,v){
                    weiboData[0].push(v);
                    weiboData[0].push(newData.latitude[i]);
                })


                var myChart4 = echarts.init(document.getElementById('area'));
//                                      三个数组    数组坐标
                weiboData = weiboData.map(function (serieData, idx) {
                    var res = [];
                    for (var i = 0; i < serieData.length; i += 2) {
//            console.log(serieData.length);
                        var dx = serieData[i] ;
                        var dy = serieData[i + 1];
                        res.push([dx,dy]);
                    }
                    return res;
                });
                myChart4.setOption(option = {
                    // legend: {
                    //     left: '2%',
                    //     top: '5%',
                    //     data: ['强', '中', '弱'],
                    //     textStyle: {
                    //         color: '#ccc'
                    //     }
                    // },
                    geo: {
                        map: '四川',
                        roam: true,
                        label: {
                            normal: {
                                show: true,
                                textStyle:{
                                    color:'rgba(255,255,255,0.4)'
                                }
                            },
                            emphasis: {
                                show: true,
                                textStyle:{
                                    color:'rgba(255,255,255,0.4)'
                                }
                            }
                        },

                        itemStyle: {
                            normal: {
                                areaColor: '#2977b3',
                                borderColor: '#032042',
                                borderWidth:2,
                                textStyle:{
                                    color:'#fff'
                                }
                            },
                            emphasis: {
                                areaColor: '#2977b3',
                                color:'#fff'
                            }
                        }
                    },
                    series: [{
                        name: '弱',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbolSize: 12,
                        large: true,
                        itemStyle: {
                            normal: {
                                shadowBlur: 8,
                                shadowColor: 'rgba(255, 255, 255, 1)',
                                color: 'rgba(88, 255, 255,1)',
                                label:{show:true}
                            },
                            emphasis:{label:{show:true}}
                        },

                        data: weiboData[0]
                    }, {
                        name: '中',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbolSize: 15,
                        large: true,
                        itemStyle: {
                            normal: {
                                shadowBlur: 7,
                                shadowColor: 'rgba(14, 241, 242, 0.8)',
                                color: 'rgba(14, 241, 242, 0.8)',
                                label:{show:true}
                            },
                            emphasis:{label:{show:true}
                            }
                        },
                        data: weiboData[1]
                    }, {
                        name: '强',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbolSize: 20,
                        large: true,
                        itemStyle: {
                            normal: {
                                shadowBlur: 10,
                                shadowColor: 'rgba(255, 255, 255, 0.8)',
                                color: 'rgba(255, 255, 255, 0.8)',
                                label:{show:true}
                            },
                            emphasis:{label:{show:true}
                            }
                        },
                        data: weiboData[2]
                    }]
                })
            });
        }

    </script>
</body>
</html>