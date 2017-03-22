<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">	
    <head>
        <meta charset="UTF-8">
        <title>学生信息管理系统</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/supersized.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/style.css">
        
        <!-- Javascript -->
		<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/login/supersized.3.2.7.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/login/supersized-init.js"></script>
		<script>
		
		$("#submit").live('click',function(){
			var username = $("#username").val();
			var password = $("#password").val();
			if(username == '' || username == null || password ==''|| password == null )
			{
				$("#ts").html("用户名或密码不能为空！");
				is_show();
			}
			else if(username.length<2){
					$("#ts").html("用户名至少2位！");
					is_show();
			}else if(password.length<5){
				$("#ts").html("密码至少5位！");
				is_show();
			}else{
				
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/user/verify.action",
					data:"username="+username+"&password="+password,
					dataType:"text",
					success:function(data){
						if(data == "success"){
							location.href = "${pageContext.request.contextPath}/user/dologin.action";
						}else{
							$("#ts").html("用户名或密码错误！");
							is_show();
						}
					}
				})
			}
		});
		window.onload = function()
		{
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
			
			$("#btn").click(function(){
				is_hide();
			})
		
		}
		function is_hide(){ $(".alert").animate({"top":"-40%"}, 300) }
		function is_show(){ $(".alert").show().animate({"top":"45%"}, 300) }
		</script>


    </head>

    <body >
        <div class="page-container">
            <h1>学生信息管理系统</h1>
            <form id="form" action="" method="post">
				<div>
					<input id="username" type="text" name="username" class="username" placeholder="用户名" />
				</div>
                <div>
					<input id="password" type="password" name="password" class="password" placeholder="密码"  />
                </div>
                <button id="submit" type="button">登录</button>
            </form>
         <!--    <div class="connect">
				<p style="margin-top:20px;">有志者，事竟成，破釜沉舟，百二秦关终属楚；苦心人，天不负，卧薪尝胆，三千越甲可吞吴。</p>
            </div> -->
        </div>
		<div class="alert" style="display:none;">
			<h2>消息</h2>
			<div class="alert_con">
				<p id="ts"></p>
				<p style="line-height:70px"><a id="btn" class="btn">确定</a></p>
			</div>
		</div>
    </body>

</html>

