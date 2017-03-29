<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加等级情况</title>
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
                        <h3>添加等级情况</h3>
                    </div>

                    <form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/grade/doadd.action">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">学号</label>
                            <div class="col-lg-5">
                                   <input id="stuNo" type="text" class="form-control" name="stuNo" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">姓名</label>
                            <div class="col-lg-5">
                                <input id="stuName" type="text" class="form-control" name="stuName" />
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label class="col-lg-3 control-label">英语四级</label>
                            <div class="col-lg-5">
                            	<select id="CET4" name="CET4" class="form-control" >
                            		<option value="通过">通过</option>
                            		<option value="未通过" selected="selected">未通过</option>
                            	</select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">英语六级</label>
                            <div class="col-lg-5">
                                <select id="CET6" name="CET6" class="form-control" >
                            		<option value="通过">通过</option>
                            		<option value="未通过" selected="selected">未通过</option>
                            	</select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">计算机一级</label>
                            <div class="col-lg-5">
                                <select id="NCRE1" name="NCRE1" class="form-control">
                            		<option value="通过">通过</option>
                            		<option value="未通过" selected="selected">未通过</option>
                            	</select>
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label class="col-lg-3 control-label">计算机二级</label>
                            <div class="col-lg-5">
                                <select id="NCRE2" name="NCRE2" class="form-control">
                            		<option value="通过">通过</option>
                            		<option value="未通过" selected="selected">未通过</option>
                            	</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">会计从业资格证</label>
                            <div class="col-lg-5">
                                <select id="account" name="account" class="form-control">
                            		<option value="通过">通过</option>
                            		<option value="未通过" selected="selected">未通过</option>
                            	</select>
                            </div>
                        </div>
                            <div class="form-group">
                            <label class="col-lg-3 control-label">教师资格证</label>
                            <div class="col-lg-5">
                                <select id="teacher" name="teacher" class="form-control">
                            		<option value="通过">通过</option>
                            		<option value="未通过" selected="selected">未通过</option>
                            	</select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="button" onclick="javascript:history.go(-1);" class="btn btn-primary" name="signup" value="Sign up">返回</button>
                                <button type="submit"  class="btn btn-primary" name="signup" value="Sign up">添加</button>
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
showMenu(2);

$("#CET4").click(function(){
	var value = $("#CET4").val();
	if(value == "未通过"){
		$("#CET6").val("未通过");
		$("#CET6").attr("disabled","disabled");
	}else{
		$("#CET6").removeAttr("disabled");
	}
});

$("#NCRE1").click(function(){
	var value = $("#NCRE1").val();
	if(value == "未通过"){
		$("#NCRE2").val("未通过");
		$("#NCRE2").attr("disabled","disabled");
	}else{
		$("#NCRE2").removeAttr("disabled");
	}
});

$('#defaultForm').bootstrapValidator({
//    live: 'disabled',

    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        stuNo: {
            validators: {
                notEmpty: {
                    message: '学号不能为空！'
                },
                regexp: {
                    regexp: /^[0-9]{8,12}$/,
                    message: '学号只能由8~12位数字组成！'
                },
                remote:{
                	  url: '${pageContext.request.contextPath}/grade/checkStuNo.action',  
                      message:"该学号不存在或该学号等级情况已录入！",  
              /*         type: "post",  
                      dataType: 'json',  
                      data: {  
                            stuNo : $("#stuNo").val()
                      },   */
                      delay: 2000,  
                },
            }
        },
        stuName: {
            validators: {
                notEmpty: {
                    message: '姓名不能为空！'
                },
       		 remote:{
        	  url: '${pageContext.request.contextPath}/score/checkStuName.action',  
              message:"学号或姓名错误！",  
              type: "post",  
              dataType: 'json',  
              data:function(validator) {
            	  return {
            		  stuNo: $('#stuNo').val(),
            		  stuName: $('stuName').val()
            		  }
              },
              delay: 2000,  
        	}
          }
        }
       }

});
</script>
</html>