<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
 <!-- CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/supersized.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/style.css">
        
        <!-- Javascript -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/login/supersized.3.2.7.min.js"></script>
<style type="text/css">
.modalDiv {
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
</style>
</head>
<body>
		<div class="modalDiv" ></div>
		<div class="alert" style="z-index: 8">
			<h2>消息</h2>
			<div class="alert_con">
				<p id="ts">您还没有登录或登录已超时，请重新登录！</p>
				<p style="line-height:70px"><a id="btn" class="btn" href="${pageContext.request.contextPath}/user/login.action">确定</a></p>
			</div>
		</div>
</body>
<script>
	$(function(){
		$(".alert").show().animate({"top":"45%"}, 300)
	})
</script>
</html>