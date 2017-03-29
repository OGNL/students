<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<jsp:include page="../common/taglibs.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrapValidator.css">
<!-- FontAwesome Styles-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/menu/font-awesome.css">
<!-- Custom Styles-->
<link href="${pageContext.request.contextPath}/css/menu/custom-styles.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css">
</head>
<body>
		<div id="wrapper">

		<jsp:include page="../common/head.jsp"></jsp:include>
		<jsp:include page="../common/menu.jsp"></jsp:include>
		
		<div id="page-wrapper">
			<div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h3>修改密码</h3>
                    </div>

                    <form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/user/doupdate.action">
                        <input type="hidden" name="userId" value="${user.userId}">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">用户名</label>
                            <div class="col-lg-5">
                                   <input id="username" type="text" class="form-control" name="username" readonly="readonly" value="${user.username}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">原密码</label>
                            <div class="col-lg-5">
                                <input id="pwd1" type="password" class="form-control" name="pwd1" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">新密码</label>
                            <div class="col-lg-5">
                                <input id="pwd2" type="password" class="form-control" name="pwd2" />
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label class="col-lg-3 control-label">确认密码</label>
                            <div class="col-lg-5">
                                 <input  id ="pwd3"type="password" class="form-control" name="pwd3" /> 
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="button" onclick="history.go(-1)" class="btn btn-primary" name="signup" value="Sign up">返回</button>
                                <button type="submit"  class="btn btn-primary" name="signup" value="Sign up">修改</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
		
	</div>	
	</div>
</body>
<script src="${pageContext.request.contextPath}/js/bootstrapValidator.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		  $('#defaultForm').bootstrapValidator({
//	        live: 'disabled',
		
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            username: {
	                validators: {
	                    notEmpty: {
	                        message: '用户名不能为空！'
	                    }
	                }
	            },
	            pwd1: {
	                validators: {
	                    notEmpty: {
	                        message: '原密码不能为空！'
	                    },
	                    remote:{
	                  	  url: '${pageContext.request.contextPath}/user/checkPwd.action',  
	                        message:"密码错误！",  
	                        type: "post",  
	                        dataType: 'json',  
	                        data:function(validator) {
	                      	  return {
	                      		  username: $('#username').val(),
	                      		  pwd1: $('#pwd1').val()
	                      		  }
	                        },
	                        delay: 2000,  
	                  	}
	                }
	            },
	            pwd2: {
	                validators: {
	                    notEmpty: {
	                        message: '新密码不能为空！'
	                    },
	                    identical: {
	                        field: 'pwd3',
	                        message: '两次密码不一致！'
	                    },
	                    different: {
	                        field: 'pwd1',
	                        message: '新密码和原密码不能相同！'
	                    }
	                }
	            },
	            pwd3: {
	                validators: {
	                    notEmpty: {
	                        message: '新密码不能为空！'
	                    },
	                    identical: {
	                        field: 'pwd2',
	                        message: '两次密码不一致!'
	                    },
	                    different: {
	                        field: 'pwd1',
	                        message: '新密码和原密码不能相同！'
	                    }
	                }
	            }
	           }
	    });
		
	});

</script>
</html>