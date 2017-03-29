<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息表</title>
</head>
<body>
	 <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a href="${pageContext.request.contextPath}/home/show.action"><i class="fa fa-dashboard"></i> 主页</a>
                    </li>
                    <li id="1">
                        <a href=""><i class="fa fa-desktop"></i>学生管理<span class="fa arrow"></span></a>
                   		  <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/student/showall.action"> 学生信息表</a>
                            </li>
                        </ul>
                    </li>
                    <li id="2">
                        <a href=""><i class="fa fa-table"></i>成绩管理<span class="fa arrow"></span> </a>
                       	<ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/score/fuzzyQuery.action">学期成绩表</a>
                            </li>
                        	 <li>
                                <a href="${pageContext.request.contextPath}/grade/fuzzyQuery.action">等级考试情况表</a>
                            </li>
                        </ul>
                        
                    </li>
					<li id="3">
                        <a href=""><i class="fa fa-bar-chart-o"></i>数据统计<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/student/report.action">各年级学生情况分析</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/grade/report.action">英语、计算机考试通过率</a>
                            </li>
                        </ul>
                    </li>
					<c:if test="${user.role eq '管理员'}">
					<li id="9">
                        <a href="#"><i class="fa fa-sitemap"></i>系统设置<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/fuzzyQuery.action">账户管理</a>
                            </li>
                        </ul>
                    </li>
					</c:if>
               
                </ul>

            </div>

        </nav>
<script type="text/javascript">
	function showMenu(id){
		$("#"+id).attr("class","active");
		$("#"+id+">ul").attr("class","nav nav-second-level collapse in");
	}



</script>
</body>
</html>