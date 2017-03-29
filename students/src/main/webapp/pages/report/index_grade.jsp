<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>英语、计算机考试通过率</title>
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
	<!-- 	<div style="width: 990px; height: 125px; margin-top: 25px; margin-left: 65px;" >
			<form id="selectForm" method="post">
				<br/><br/>
				<div style="margin-left: 765px;" ><a id="selectBtn" href="javascript:findDatas();" class="btn btn-primary" >查询</a></div>
			</form>
		</div>
				 -->
			<div class="row">

					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">

							<div class="block_content" style="font-size: 18px;">
								<h2 class="title"  style="font-size: 24px;text-align: center;">
									<a style="color: #405060;">学生英语、计算机考试通过情况</a>
								</h2>
								<p class="excerpt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="rs"></span></p>
								<div id="chart1" style="height:350px;"></div>
								<p class="excerpt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="sf"></span></p>
								<div id="chart2"  style="height:350px;"></div>
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
			chart1();
			chart2();
		}
	
		
		function chart1() {
			var chart1 = echarts.init(document.getElementById('chart1'), 'macarons');
			//var option1;
							option = {
									 title : {
									        text: '英语四六级通过率'
									    },
								    tooltip: {
								        trigger: 'axis'
								    },
								    legend : {
										data : [ '四级通过率', '六级通过率' ]
									},
								    xAxis: [
								        {
								            type: 'category',
								            name: '年级',
								            data: ['2010','2011','2012','2013','2014','2015','2016'],
								            axisLabel:{
												interval:0
											},

								        }
								    ],
								    yAxis: [
								        {
								            type: 'value',
								            name: '%',
								            min: 0,
								            axisLabel: {
								                formatter: '{value}'
								            }
								        },
								    ],
								    series: [
								        {
								            name:'四级通过率',
								            type:'line',
								            data:[76.8, 80.9, 91.8, 75.0, 88.3, 83.1, 85.0]
								        },
								        {
								            name:'六级通过率',
								            type:'line',
								            data:[36.5, 25.1, 31.4, 45.0, 33.7, 31.1, 20.0]
								        },
								    ]
								};
							chart1.setOption(option);
						}
						
						
	
		
		
		function chart2(year) {
			var chart2 = echarts.init(document.getElementById('chart2'), 'macarons');
			option = {
					 title : {
					        text: '计算机一二级通过率'
					    },
				    tooltip: {
				        trigger: 'axis'
				    },
				    legend : {
						data : [ '一级通过率', '二级通过率' ]
					},
				    xAxis: [
				        {
				            type: 'category',
				            name: '年级',
				            data: ['2010','2011','2012','2013','2014','2015','2016'],
				            axisLabel:{
								interval:0
							},

				        }
				    ],
				    yAxis: [
				        {
				            type: 'value',
				            name: '%',
				            min: 0,
				            axisLabel: {
				                formatter: '{value}'
				            }
				        },
				    ],
				    series: [
				        {
				            name:'一级通过率',
				            type:'line',
				            data:[96.8, 90.5, 91.8, 95.0, 88.3, 85.1, 89.0]
				        },
				        {
				            name:'二级通过率',
				            type:'line',
				            data:[56.0, 45.1, 61.7, 65.0, 63.7, 71.1,60.0]
				        },
				    ]
				};
					chart2.setOption(option);
				}
		findDatas();
	</script>
</body>
</html>