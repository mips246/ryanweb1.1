package dao;

import vo.StudentUser;
import vo.TeacherUser;

public interface UserDAO {
	//user�౾����ֱ�Ӽ̳еģ���Ϊ���߼���д���������࣬��UserDAO�����������ӿڡ�
	public boolean loginCheck(StudentUser studentuser)throws Exception;
	public boolean loginCheck(TeacherUser teacheruser)throws Exception;
}
