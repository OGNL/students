<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户信息表</title>
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
</style>

</head>
<body>
	<div id="wrapper">

		<jsp:include page="../common/head.jsp"></jsp:include>
		<jsp:include page="../common/menu.jsp"></jsp:include>
		
		<div id="page-wrapper">
		<div class="title">
				<h4>账户信息表</h4>
		</div>
		<div style="width: 990px; height: 125px; margin-top: 25px; margin-left: 65px;" >
			<form id="selectForm" method="post">
			
				用户名：<input type="text" id="username" name="username">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				角色：<select id="role" name="role">
						<option value="">请选择</option>
						<option value="班主任">班主任</option>
						<option value="教导主任">教导主任</option>
					</select>
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
						<th>用户名</th>
						<th>密码</th>
						<th>角色</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${userList != null }">
							<c:forEach var="us" items="${userList}">
								<tr>
									<td>${us.username}</td>
									<td>${us.password}</td>
									<td>${us.role}</td>
									<td>
										<a href="javascript:;"><img src="${pageContext.request.contextPath}/img/edit.png" title="修改" width="25px" height="22px"  onclick="editBtn(${us.userId})"/></a>
										<a href="javascript:;"><img src="${pageContext.request.contextPath}/img/delete.png" title="删除" width="25px" height="22px" onclick="deleteBtn(${us.userId})"/></a>
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
			showMenu(9);
			$('#example').dataTable();
			$("#username").val('${u.username}');
			$("#role").val('${u.role}');
			
			$("#selectBtn").click(function(){
				$("#selectForm").attr("action","${pageContext.request.contextPath}/user/fuzzyQuery.action");
				$("#selectForm").submit();
			})
			
			$("#addBtn").click(function(){
				location.href = "${pageContext.request.contextPath}/user/toadd.action";
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
					location.href = "${pageContext.request.contextPath}/user/dodelete.action?id="+id;
				},
				cancelValue: '取消',
				title: '警告',
				content: '是否删除该账户信息？'
			});
			
		}
		
		function editBtn(id){
			$('#btn-dialogBox').dialogBox({
				hasClose: true,
				hasBtn: true,
				confirmValue: '确定',
				confirm: function(){
					location.href = "${pageContext.request.contextPath}/user/toUpdateUser.action?html="+id;
				},
				cancelValue: '取消',
				title: '警告',
				content: '是否修改该账户信息？'
			});
		}
	</script>
</body>
</html>