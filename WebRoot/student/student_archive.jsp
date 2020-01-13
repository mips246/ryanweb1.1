<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.bootcss.com/normalize/8.0.1/normalize.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Title</title>
    <script>
        //$(document).ready(loadCourseTable());
        function loadCourseTable() {
        	var userid='<%=session.getAttribute("userid")%>';
            $.ajax({
                url:"/MIPS246/StudentServlet",
                type:"POST",
                data:{
                    method:"x",
                    userid:userid
                },
                dataType:"json",
                success:function (data) {
                    $.each(data,function (index) {
                        var coursename=data[index].coursename;
                        var studentid='<%=session.getAttribute("userid")%>';
                        var courseid=data[index].courseid;
                        var teacherid=data[index].teacherid;
                        var tt="<tr>"
                            +'<td><button onclick="seearchive(\''+courseid+'\',\''+teacherid+'\')">'+coursename+'</button></td></tr>';
                        $("#insertPlace").append(tt);
                    })
                }
            })
        }
        function seearchive(courseid,teacherid) {
            $.ajax({
                url:"/MIPS246/DownloadServlet",
                type:"POST",
                dataType: "json",
                data:{
                    method: "loadArchiveTable",
                    courseid:courseid,
                    teacherid:teacherid
                },
                success:function (data) {
                    dealData(data);
                },
                error:function (jqXHR,textStatus,errorThrown) {
                    dealData(jqXHR.responseText);
                }
            });
        }
        function dealData(data) {
            $("#insertPlace2").html("");
            $.each(data,function(index) {
                var fileurl=data[index].fileurl;
                var filename=data[index].filename;
                var tt="<tr>"
                +"<td><a href=\'"+fileurl+"\' download=\'"+filename+"\'>"+filename+"</a></td></tr>";
                $("#insertPlace2").append(tt);
            })
        }
    </script>
</head>
<body onload="loadCourseTable()">
<div class="container clearf">
    <div class="top-nav clearf">
        <div class="fl">
            <div class="item">
                <a href="student_main.jsp"><button type="button" class="btn btn-primary ">首页</button></a>
            </div>
            <div class="item">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">课程</button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="student_select_course.jsp">选课</a>
                    <a class="dropdown-item" href="student_course.jsp">上课</a>
                </div>
            </div>
            <div class="item">
                <a href="student_archive.jsp"><button type="button" class="btn btn-primary ">课程资料</button></a>
            </div>
            <div class="item">
                <a href="student_homework.jsp"><button type="button" class="btn btn-primary ">作业</button></a>
            </div>
        </div>
        <div class="fr">
            <div class="item">
                <!--<button type="button" class="btn btn-primary"><a href="logout.jsp">退出</a></button>  -->
                <a href="../logout.jsp"><button type="button" class="btn btn-primary ">退出</button></a>
                <a href="info.jsp"><button type="button" class="btn btn-primary ">个人信息修改</button></a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-2 sidebar">
            <table border="1" align="center">
                <thead>
                <tr>
                    <th>课程列表</th>
                </tr>
                </thead>
                <tbody id="insertPlace">
                </tbody>
            </table>
        </div>
        <div class="col-4">
            <table>
                <thead>
                <tr>
                    <th>资料列表</th>
                </tr>
                </thead>
                <tbody id="insertPlace2">

                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
