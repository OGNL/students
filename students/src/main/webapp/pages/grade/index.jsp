<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>等级考试情况表</title>
<jsp:include page="../common/taglibs.jsp"></jsp:include>
<!-- FontAwesome Styles-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/menu/font-awesome.css">
<!-- Custom Styles-->
<link href="${pageContext.request.contextPath}/css/menu/custom-styles.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css">
<style type="text/css">
#example_length{
	height: 26px;
}
div.dialog-box-container.normal{
	width: 185px;
}
</style>

</head>
<body>
	
	<div id="wrapper">

		<jsp:include page="../common/head.jsp"></jsp:include>
		<jsp:include page="../common/menu.jsp"></jsp:include>
		
		<div id="page-wrapper">
		<div class="title">
				<h4>等级考试情况表</h4>
		</div>
		<div style="width: 990px; height: 125px; margin-top: 25px; margin-left: 65px;" >
			<form id="selectForm" method="post">
			
				学号：<input type="text" id="stuNo" name="stuNo">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				姓名：<input type="text" id="stuName" name="stuName">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				性别：<select id="gender" name="gender">
						<option value="">请选择</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				专业：<input type="text" id="major" name="major">
				<br/><br/>
				<div style="margin-left: 675px; float: left;"><a id="selectBtn" href="javascript:;" class="btn btn-primary">查询</a></div>
					<div style="margin-left: 25px; float: left;" ><a id="exportBtn" href="javascript:;" class="btn btn-primary">导出Excel</a></div>
			</form>
		</div>
		<a id="addBtn" href="javascript:;">
			<img   src="${pageContext.request.contextPath}/img/add.png" title="添加" width="25px" height="25px" style="margin-bottom: -10px;"	/>
		</a>	
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>学号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>专业</th>
						<th>英语四级</th>
						<th>英语六级</th>
						<th>计算机<br>一级</th>
						<th>计算机<br>二级</th>
						<th>会计从业<br>资格证</th>
						<th>教师资<br>格证</th>
						<c:if test="${user.role eq '管理员' || user.role eq '教导主任'}">
							<th>操作</th>
						</c:if>
						
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${graList != null }">
							<c:forEach var="g" items="${graList}">
								<tr>
									<td>${g.stu.stuNo}</td>
									<td>${g.stu.stuName}</td>
									<td>${g.stu.gender}</td>
									<td>${g.stu.major}</td>
									<td>${g.CET4}</td>
									<td>${g.CET6}</td>
									<td>${g.NCRE1}</td>
									<td>${g.NCRE2}</td>
									<td>${g.account}</td>
									<td>${g.teacher}</td>
									<c:if test="${user.role eq '管理员' || user.role eq '教导主任'}">
									<td>
										<a href="javascript:;"><img src="${pageContext.request.contextPath}/img/edit.png" title="修改" width="25px" height="22px"  onclick="editBtn(${g.stu.stuId})"/></a>
										<a href="javascript:;"><img src="${pageContext.request.contextPath}/img/delete.png" title="删除" width="25px" height="22px" onclick="deleteBtn(${g.gradeId})"/></a>
									</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:when>
						
					</c:choose>
				</tbody>
			</table> 
			<div id="btn-dialogBox"></div>
			<div id="stantard-dialogBox"></div>
		<!-- 	<div class="modalDiv" style="display: none;"></div>
			<div id="formDiv" style="display: none;"></div> -->
		</div>
	</div>
	<!-- /. WRAPPER  -->
	<script  src="${pageContext.request.contextPath}/js/tables/jquery.dataTables.min.js"></script>
	<script  src="${pageContext.request.contextPath}/js/tables/dataTables.bootstrap.js"></script>
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			showMenu(2);
			
			$('#example').dataTable();
			$("#stuNo").val('${stu.stuNo}');
			$("#stuName").val('${stu.stuName}');
			$("#gender").val('${stu.gender}');
			$("#major").val('${stu.major}');
			
			$("#selectBtn").click(function(){
				$("#selectForm").attr("action","${pageContext.request.contextPath}/grade/fuzzyQuery.action");
				$("#selectForm").submit();
			})
			
			$("#exportBtn").click(function(){
				var stuNo = $("#stuNo").val();
				var stuName = $("#stuName").val();
				var gender = $("#gender").val();
				var major = $("#major").val();
				$.ajax({ 
        			url: "${pageContext.request.contextPath}/grade/exportExcel.action", 
        			type:"post",
        			data:"stuNo="+stuNo+"&stuName="+stuName+"&gender="+gender+"&major="+major, 
        			dataType:"text",
        			success: function(data){
        	        	if(data == "success"){
        	        		$('#stantard-dialogBox').dialogBox({
        						title: '消息',
        						hasClose: true,
        						content: '导出成功！'
        					});
        	        	}else{
        	        		$('#stantard-dialogBox').dialogBox({
        						title: '消息',
        						hasClose: true,
        						content: '导出失败！'
        					});
        	        		
        	        	}
        	      }});
			});
			
			$("#addBtn").click(function(){
				location.href = "${pageContext.request.contextPath}/grade/toadd.action";
			})
		});

		// For demo to fit into DataTables site builder...
		$('#example').removeClass('display').addClass(
				'table table-striped table-bordered');
		
		function deleteBtn(id){
			$('#btn-dialogBox').dialogBox({
				hasClose: true,
				hasBtn: true,
				confirmValue: '确定',
				confirm: function(){
					location.href = "${pageContext.request.contextPath}/grade/dodelete.action?id="+id;
				},
				cancelValue: '取消',
				title: '警告',
				content: '是否删除该条信息？'
			});
			
		}
		
		function editBtn(id){
			$('#btn-dialogBox').dialogBox({
				hasClose: true,
				hasBtn: true,
				confirmValue: '确定',
				confirm: function(){
					location.href = "${pageContext.request.contextPath}/grade/toupdate.action?html="+id;
				},
				cancelValue: '取消',
				title: '警告',
				content: '是否修改该条信息？'
			});
		}
		
	
	</script>

</body>
</html>