<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>各年级学生情况分析</title>
<jsp:include page="../common/taglibs.jsp"></jsp:include>
<!-- FontAwesome Styles-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/menu/font-awesome.css">
<!-- Custom Styles-->
<link href="${pageContext.request.contextPath}/css/menu/custom-styles.css" rel="stylesheet" />
</head>
<body>
	<div id="wrapper">

		<jsp:include page="../common/head.jsp"></jsp:include>
		<jsp:include page="../common/menu.jsp"></jsp:include>
		
		<div id="page-wrapper">
		<div class="title">
		</div>
		<div style="width: 990px; height: 125px; margin-top: 25px; margin-left: 65px;" >
			<form id="selectForm" method="post">
				年级：<select id="year" name="year">
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015" selected="selected">2015</option>
						<option value="2016">2016</option>
					</select>
				<br/><br/>
				<div style="margin-left: 765px;" ><a id="selectBtn" href="javascript:findDatas();" class="btn btn-primary" >查询</a></div>
			</form>
		</div>
						<div class="row">

					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">

							<div class="block_content" style="font-size: 18px;">
								<h2 class="title"  style="font-size: 24px;text-align: center;">
									<a style="color: #405060;">各年级学生情况分析报告</a>
								</h2>
								<p class="excerpt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="rs"></span></p>
								<div id="chart1" style="height:350px;"></div>
								<p class="excerpt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="sf"></span></p>
								<div id="chart2" class="col-md-8 col-sm-8 col-xs-8" style="height:350px;"></div>
							</div>
						</div>
					</div>
				</div>
	</div>
	</div>
	<script>
	$( function(){
		showMenu(3);
	});
		var path = '${pageContext.request.contextPath}';
		function findDatas(){
			var year = $("#year").val();
			queryWordText(year);
			chart1(year);
			chart2(year);
		}
		
		function queryWordText(year) {
			$.ajax({
						url : path + "/student/queryWordText.action",
						type : "post",
						dataType : "json",
						async : false,
						data : {
							'year' : year,
						},
						success : function(data) {
							if(data.length==2){
								var count = data[0].rs+data[1].rs;
								var zb0 = (data[0].rs/count).toFixed(3);
								var zb1 = (data[1].rs/count).toFixed(3);
								$("#rs").html("我校有 "+count+" 名"+year+"级学生，其中"+data[0].gender+"生"+data[0].rs+"人，"+"占"+Math.round(zb0*1000)/10+"%；"+data[1].gender+"生"+data[1].rs+"人，"+"占"+Math.round(zb1*1000)/10+"%。");
							}else if(data.length==1){
								$("#rs").html("我校有 "+data[0].rs+" 名"+year+"级学生，其中"+data[0].gender+"生"+data[0].rs+"人，"+"占100%。");
							}
							else{
								$("#rs").html("我校有 0 名"+year+"级学生。");
							}
							
						}
			});
		}
		
		function chart1(year) {
			var chart1 = echarts.init(document.getElementById('chart1'), 'macarons');
			//var option1;
			$.ajax({
 						url : path+"/student/chart1.action",
						type : "post",
						dataType : "json",
						async : false,
						data : {
							'year' : year
						},
						success : function(data) {
							var major = [];
							var rs = [];
							if(data.length>0){
								for(var i in data){
									major.push(data[i].major);
									rs.push(data[i].rs);
								}
							}
							
							option = {
									 title : {
									        text: '各专业人数统计'
									    },
								    tooltip: {
								        trigger: 'axis'
								    },
								    xAxis: [
								        {
								            type: 'category',
								            name: '专业',
								            data: major,
								            axisLabel:{
												interval:0
											},

								        }
								    ],
								    yAxis: [
								        {
								            type: 'value',
								            name: '人数',
								            min: 0,
								            axisLabel: {
								                formatter: '{value}人'
								            }
								        },
								    ],
								    series: [
								        {
								            name:'人数',
								            type:'bar',
								            data:rs
								        },
								    ]
								};
							chart1.setOption(option);
						}
						
						
					});
		}
	
		
		
		function chart2(year) {
			var chart2 = echarts.init(document.getElementById('chart2'), 'macarons');
			$.ajax({
					url : path+"/student/chart2.action",
					type : "post",
					dataType : "json",
					async : false,
					data : {
						'year' : year
					},
				success : function(data) {
					var result = [];
					if(data.length>0){
						for(var i in data){
							var res = {value:data[i].rs, name:data[i].address};
							result.push(res);
						}
						if(data.length>3){
							$("#sf").html("从生源地来看，学生人数排名前三的地区是："+data[0].address+data[0].rs+"人、"+data[1].address+data[1].rs+"人、"+data[2].address+data[2].rs+"人。");
						}else{
							$("#sf").html("从生源地来看，学生人数最多的地区是："+data[0].address+data[0].rs+"人。");
						}
					}else{
						$("#sf").html("");
					}
					option = {
							 title : {
							        text: '生源地学生人数统计'
							    },
							    tooltip : {
							        trigger: 'item',
							        formatter: "{a} <br/>{b} : {c} ({d}%)"
							    },
							    legend: {
							        orient: 'vertical',
							        left: 'left'
							    },
							    series : [
							        {
							            name: '学生人数',
							            type: 'pie',
							            radius : '50%',
							            center: ['50%', '55%'],
							            data:result,
							            itemStyle: {
							                emphasis: {
							                    shadowBlur: 10,
							                    shadowOffsetX: 0,
							                    shadowColor: 'rgba(0, 0, 0, 0.5)'
							                }
							            }
							        }
							    ]
						};
					chart2.setOption(option);
				}
			});
		}
		
		findDatas();
	</script>

</body>
</html>