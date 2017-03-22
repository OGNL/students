<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息表</title>
<jsp:include page="../common/taglibs.jsp"></jsp:include>
<!-- FontAwesome Styles-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/menu/font-awesome.css">
<!-- Custom Styles-->
<link href="${pageContext.request.contextPath}/css/menu/custom-styles.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css">


<style type="text/css">
/* .modalDiv {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    overflow: hidden;
    outline: 0;
    -webkit-overflow-scrolling: touch;
    background-color: rgb(0, 0, 0);  
    filter: alpha(opacity=60);  
    background-color: rgba(0, 0, 0, 0.6); 
    z-index: 2;
}
#formDiv{
	border-radius: 15px;
    box-shadow: 0 0 10px #bbb;
    z-index: 5;
    position: relative;
    width: 350px;
    background: white;
    height: 400px;
    margin-top: -550px;
    margin-left: 300px;
} */
#example_length{
	height: 26px;
}
</style>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="../common/head.jsp"></jsp:include>
		<jsp:include page="../common/menu.jsp"></jsp:include>
		
		<div id="page-wrapper">
		<div class="title">
				<h4>学生信息表</h4>
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
				<div style="margin-left: 765px;" ><a id="selectBtn" href="javascript:;" class="btn btn-primary">查询</a></div>
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
						<th>出生日期</th>
						<th>入学时间</th>
						<th>联系方式</th>
						<th>籍贯</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${stuList != null }">
							<c:forEach var="s" items="${stuList}">
								<tr>
									<td>${s.stuNo}</td>
									<td>${s.stuName}</td>
									<td>${s.gender}</td>
									<td>${s.major}</td>
									<td>${s.birthday}</td>
									<td>${s.enterTime}</td>
									<td>${s.phone}</td>
									<td>${s.address}</td>
									<td>
										
										<a href="javascript:;"><img src="${pageContext.request.contextPath}/img/edit.png" title="修改" width="25px" height="22px"  onclick="editBtn(${s.stuId})"/></a>
										<a href="javascript:;"><img src="${pageContext.request.contextPath}/img/delete.png" title="删除" width="25px" height="22px" onclick="deleteBtn(${s.stuId})"/></a>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						
					</c:choose>
				</tbody>
			</table>
			<div id="btn-dialogBox"></div>
		<!-- 	<div class="modalDiv" style="display: none;"></div>
			<div id="formDiv" style="display: none;"></div> -->
		</div>
	</div>
	<!-- /. WRAPPER  -->
	<script  src="${pageContext.request.contextPath}/js/tables/jquery.dataTables.min.js"></script>
	<script  src="${pageContext.request.contextPath}/js/tables/dataTables.bootstrap.js"></script>
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			showMenu(1);
			
			$('#example').dataTable();
			$("#stuNo").val('${stu.stuNo}');
			$("#stuName").val('${stu.stuName}');
			$("#gender").val('${stu.gender}');
			$("#major").val('${stu.major}');
			
			$("#selectBtn").click(function(){
				$("#selectForm").attr("action","${pageContext.request.contextPath}/student/fuzzyQuery.action");
				$("#selectForm").submit();
			})
			
			$("#addBtn").click(function(){
				location.href = "${pageContext.request.contextPath}/student/toadd.action";
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
					location.href = "${pageContext.request.contextPath}/student/dodelete.action?id="+id;
				},
				cancelValue: '取消',
				title: '警告',
				content: '是否删除该学生信息(包括成绩)？'
			});
			
		}
		
		function editBtn(id){
			$('#btn-dialogBox').dialogBox({
				hasClose: true,
				hasBtn: true,
				confirmValue: '确定',
				confirm: function(){
					location.href = "${pageContext.request.contextPath}/student/toupdate.action?html="+id;
				},
				cancelValue: '取消',
				title: '警告',
				content: '是否修改该学生信息？'
			});
			
		}
		
	
	</script>

</body>
</html>