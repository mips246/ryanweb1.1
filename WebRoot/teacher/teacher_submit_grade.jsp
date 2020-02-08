<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
	<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
    
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>提交学生课程成绩</title>
	
	<script type="text/javascript">
		function validateGrade(stuid,grade){
        	var flag = true;
            var reg = new RegExp(/^(?:[1-9]?\d|100)$/);
            if(!reg.test(grade)){
            	alert(stuid + "成绩不合法！");
                flag=false;
            	return flag;
            }
        	return flag;
        }
	</script>
	
	<script type="text/javascript">
		function loadInfoTable(){
			var teacherid = '<%=session.getAttribute("userid")%>';
			$.ajax({
				url:"/MIPS246/TeacherServlet",
				type:"POST",
				data:{
                    method:"selectAllCourseForTeacher",
                    teacherid:teacherid
                },
                dataType:"json",
                success:function(data){
                	$("#selectList").html("");
                	$.each(data, function (index){
                		var courseid = data[index].courseid;
                        var coursename = data[index].coursename;
                        tt = "<option value='"+courseid+"'>"+ courseid + " " + coursename+"</option>";
                        $("#selectList").append(tt);
                	});
                	loadStudentTable(teacherid,data[0].courseid);
                }
			});
		}
		
		function loadStudentTable(teacherid,courseid){
			$.ajax({
				url:"/MIPS246/TeacherServlet",
                type:"POST",
                data:{
                    method:"selectCourseSelectAndStudentName",
                    teacherid:teacherid,
                    courseid:courseid
                },
                dataType:"json",
                success:function(data){
                	$("#studentList").html("");
                    $.each(data, function (index) {
                    	var stuid = data[index].stuid;
                        var studentname = data[index].name;
                        var grade = data[index].grade;
                        
                        var str = (grade!=0?"disabled='disabled'":" ");

                        tt = "<tr>"
                        	+"<td class='text-center'>"+stuid+"</td>"
                            +"<td class='text-center'>"+studentname+"</td>"
                            //+"<td><input style='width:60px;margin:0 auto;padding:2px' name='gradeText' stuid='"+stuid+"' "+str+" type='number' value='"+grade+"' ></td>"
                            +"<td class='text-center'><input class='form-control' style='width:60px;margin:0 auto;padding:2px' id='grade"+stuid+"' "+str+" type='number' value='"+grade+"' ></td>"
                            +'<td class="text-center"><button onclick="updateGrade(\''+stuid+'\')" class="btn btn-primary demo4">提交成绩</button></td>'
                            +"</tr>";
                        $("#studentList").append(tt);
                    });
                }
			});
		}
    </script>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		var teacherid = '<%=session.getAttribute("userid")%>';
    		$("#selectList").change(function(){
        		if($("#selectList").val()!=null){
        			loadStudentTable(teacherid,$("#selectList").val());
        		}
        	});
    	});
    </script>
    
    <script type="text/javascript">
    	function updateGrade(stuid){
    		var teacherid = '<%=session.getAttribute("userid")%>';
        	var courseid = $('#selectList').val();
        	var inputid = "#grade" + stuid;
        	var grade = $(inputid).val();
        	if(validateGrade(stuid,grade)){
        		$.ajax({
        			url:"/MIPS246/TeacherServlet",
                	type:"POST",
                	data:{
                    	method:"updateGrade",
                  		teacherid:teacherid,
                    	courseid:courseid,
                    	studentid:stuid,
                    	grade:grade
                	},
                	dataType:"json",
                	success:function(data){
                		alert(stuid + "成绩提交成功");
                		window.location.reload();
                	}
        		});
        	}
    	}
    </script>
    
</head>
<body class="gray-bg" onload="loadInfoTable()">
    <div class="wrapper wrapper-content animated fadeInRight">
    	<div class="row">
    		<div class="col-sm-12">
    			<div class="ibox float-e-margins">
    				<div class="ibox-title">
                        <h3>提交学生课程成绩</h3>
                    </div>
			        
			        <div class="ibox-content">
			        	<div class="row">
			        		<div class="col-sm-3 m-b-xs">
			        			<select id="selectList" class="input-sm form-control input-lg inline">
			        				<option value="-1">选择课程</option>
			        			</select>
			        		</div>
			        	</div>
			        	<div class="table-responsive" class="row">
			        		<div class="col-sm-12">
					        	<table class="table table-striped" class="text-center">
					        		<thead>
					        			<tr>
					        				<th class="text-center ">学号</th>
						                    <th class="text-center ">姓名</th>
						                    <th class="text-center ">成绩</th>
						                    <th class="text-center "></th>
						                </tr>
						            </thead>
									<tbody id="studentList">
									</tbody>
								</table>
							</div>
			        	</div>
			        </div>
			        
		        </div>
	        </div>
        </div>
    </div>
    
    <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../js/content.min.js?v=1.0.0"></script>
    <script src="../js/plugins/validate/jquery.validate.min.js"></script>
    <script src="../js/plugins/validate/messages_zh.min.js"></script>
    <script src="../js/demo/form-validate-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>