# tongjicsmooc
homework文件体系命名规范
homework下有course文件夹，每个course下有学生id文件夹，学生id文件夹下面就是提交的作业。
同理，老师讲义，file文件夹，下面有多个course文件夹，每个course有老师id文件夹，老师id文件夹里是讲义文件。

file表中file_type表示文件类型，规定如下：
	0 -> 作业(不区分老师和学生)
	1 -> 视频
	2 -> 报告
	3 -> 讲义
	
目前teacher部分存在的问题
	1.teacher_submit_grade.jsp可以考虑增加按学号搜索学生的功能
	2.teacher_submit_grade.jsp是否能改成提交成绩后的刷新不改变当前课程
	3.teacher_submit_grade.jsp的ajax仅对success做了处理，没有error的处理