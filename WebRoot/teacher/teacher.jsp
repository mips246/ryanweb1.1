<%-- <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <title>教师主页</title>
</head>
<body>
<!--教师主页分为3（暂定）个组件，
组件1首页用来展示教师的个人信息，并且提供修改密码的功能，
组件2课程管理用来展示课程，并且可以对某个课程上传作业，视频
组件3学生管理用来展示每个课程的选课学生，然后可以查看该学生该课程的作业，并且为作业打分
目前我认为实验和理论学习处于同等地位，也就是说，计算机组成原理和计算机组成原理实验是同等地位的不同两个课程。
 -->
    <div class="container clearf">
        <div class="container clearf">
            <div class="top-nav clearf">
                <div class="fl">
                    <div class="item">
                        <a href="teacher.jsp"><button type="button" class="btn btn-primary">首页</button></a>
                    </div>
                    <div class="item">
                        <a href="teacher_course.jsp"><button type="button" class="btn btn-primary">课程管理</button></a>
                    </div>
                </div>
                <div class="fr">
                	<div class="item">
                        <a href="updatepw.jsp"><button type="button" class="btn btn-primary">修改密码</button></a>
                    </div>
                    <div class="item">
                        <a href="../logout.jsp"><button type="button" class="btn btn-primary">退出</button></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container clearf">
        <h3>欢迎${sessionScope.u_name}老师！</h3>
        
        
        </div>
    </div>
</body>
</html> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>主页</title>

	    <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
	    <link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
	    <link href="../css/animate.min.css" rel="stylesheet">
	    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
	    
	</head>
	
	<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
		<div id="wrapper">
		
			<!--左侧导航开始-->
			<nav class="navbar-default navbar-static-side" role="navigation">
				<div class="nav-close">
					<!--不清楚是做什么的-->
					<i class="fa fa-times-circle"></i>
				</div>
				<div class="sidebar-collapse">
					<ul class="nav" id="side-menu">
						<li class="nav-header">
							<div class="dropdown profile-element">
								<span class="block m-t-xs">
									<strong class="font-bold">欢迎登录，${sessionScope.u_name}老师</strong>
								</span>
							</div>
							<div class="logo-element">MIPS<br>246</div>
	                    </li>
	                    <li>
                    		<a class="J_menuItem" href="updatepw.jsp">
                    		<i class="fa fa-home"></i>
                    		<span class="nav-label">修改密码</span>
                    		</a>
		                </li>
		                <li>
		                    <a class="J_menuItem" href="teacher_course.jsp">
		                    <i class="fa fa-home"></i>
		                    <span class="nav-label">课程管理</span>
		                    </a>
		                </li>
		                <%-- <li>
		                    <a class="J_menuItem" href="teacher_submit_grade.jsp?u_number=${u_number }">
		                    <i class="fa fa fa-bar-chart-o"></i>
		                    <span class="nav-label">提交成绩</span>
		                    </a>
		                </li> --%>
					</ul>
				</div>
			</nav>
			
			<!--右侧部分开始-->
			<div id="page-wrapper" class="gray-bg dashbard-1">
				<div class="row border-bottom">
					<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
						<div class="navbar-header">
							<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#">
								<i class="fa fa-bars"></i>
							</a>
							<h1 align="right"><b>MIPS246</b></h1>
						</div>
					</nav>
				</div>
				
				<div class="row content-tabs">
					<button class="roll-nav roll-left J_tabLeft">
						<i class="fa fa-backward"></i>
            		</button>
            		
            		<nav class="page-tabs J_menuTabs">
		                <div class="page-tabs-content">
		                    <a href="javascript:;" class="active J_menuTab" data-id="index_v6.html">首页</a>
		                </div>
		            </nav>
		            
		            <button class="roll-nav roll-right J_tabRight">
		            	<i class="fa fa-forward"></i>
           	 		</button>
           	 		
           	 		<div class="btn-group roll-nav roll-right">
		                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作
		                	<span class="caret"></span>
		                </button>
		                <ul role="menu" class="dropdown-menu dropdown-menu-right">
		                    <li class="J_tabShowActive">
		                    	<a>定位当前选项卡</a>
		                    </li>
		                    <li class="divider"></li>
		                    <li class="J_tabCloseAll">
		                    	<a>关闭全部选项卡</a>
		                    </li>
		                    <li class="J_tabCloseOther">
		                    	<a>关闭其他选项卡</a>
		                    </li>
		                </ul>
		            </div>
           	 		
           	 		<a href="../logout.jsp" class="roll-nav roll-right J_tabExit">
           	 			<i class="fa fa fa-sign-out"></i> 退出
           	 		</a>
           	 		
				</div>
				
				<div class="row J_mainContent" id="content-main">
			            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="index.jsp" frameborder="0" data-id="index_v1.html" seamless></iframe>
			        </div>
           	 		
           	 	<div class="footer">
			    	<div class="pull-right">
			            &copy; 同济大学国家计算机实验示范中心
			        </div>
			    </div>
				
			</div>
		</div>
		
		<script src="../js/jquery.min.js?v=2.1.4"></script>
		<script src="../js/bootstrap.min.js?v=3.3.6"></script>
		<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
		<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="../js/plugins/layer/layer.min.js"></script>
		<script src="../js/hplus.min.js?v=4.1.0"></script>
		<script type="text/javascript" src="../js/contabs.min.js"></script>
		<script src="../js/plugins/pace/pace.min.js"></script>
	</body>
</html>