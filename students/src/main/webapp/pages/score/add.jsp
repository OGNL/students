<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生成绩</title>
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
                        <h3>添加成绩</h3>
                    </div>

                    <form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/score/doadd.action">
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
                            <label class="col-lg-3 control-label">大学英语</label>
                            <div class="col-lg-5">
                               
                                 <input  id ="english"type="text" class="form-control" name="english" /> 
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">高等数学</label>
                            <div class="col-lg-5">
                                <input id="math" type="text" class="form-control" name="math" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">线性代数</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="xxds" />
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label class="col-lg-3 control-label">计算机基础</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="computer" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">毛泽东思想</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="mzd" />
                            </div>
                        </div>
                            <div class="form-group">
                            <label class="col-lg-3 control-label">邓小平理论</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="dxp" />
                            </div>
                        </div>
                            <div class="form-group">
                            <label class="col-lg-3 control-label">中国近现代史</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="zgls" />
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
                	  url: '${pageContext.request.contextPath}/score/checkStuNo.action',  
                      message:"该学号不存在或该学号成绩已录入！",  
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
       
        },
        english: {
            validators: {
                notEmpty: {
                    message: '请输入成绩！'
                },
                regexp: {
                    regexp: /^(0|[1-9][0-9]?|100)$/,
                    message: '成绩只能是0~100的数字！'
                },
            }
        },
        math: {
        	 validators: {
                 notEmpty: {
                     message: '请输入成绩！'
                 },
                 regexp: {
                     regexp: /^(0|[1-9][0-9]?|100)$/,
                     message: '成绩只能是0~100的数字！'
                 },
             }
        },
        xxds: {
        	 validators: {
                 notEmpty: {
                     message: '请输入成绩！'
                 },
                 regexp: {
                     regexp: /^(0|[1-9][0-9]?|100)$/,
                     message: '成绩只能是0~100的数字！'
                 },
             }
        },
        computer: {
        	 validators: {
                 notEmpty: {
                     message: '请输入成绩！'
                 },
                 regexp: {
                     regexp: /^(0|[1-9][0-9]?|100)$/,
                     message: '成绩只能是0~100的数字！'
                 },
             }
        },
        mzd: {
       	 validators: {
                notEmpty: {
                    message: '请输入成绩！'
                },
                regexp: {
                    regexp: /^(0|[1-9][0-9]?|100)$/,
                    message: '成绩只能是0~100的数字！'
                },
            }
       },
       dxp: {
      	 validators: {
               notEmpty: {
                   message: '请输入成绩！'
               },
               regexp: {
                   regexp: /^(0|[1-9][0-9]?|100)$/,
                   message: '成绩只能是0~100的数字！'
               },
           }
      },
      zgls: {
     	 validators: {
              notEmpty: {
                  message: '请输入成绩！'
              },
              regexp: {
                  regexp: /^(0|[1-9][0-9]?|100)$/,
                  message: '成绩只能是0~100的数字！'
              },
          }
     },
         
        }

});


</script>
</html>