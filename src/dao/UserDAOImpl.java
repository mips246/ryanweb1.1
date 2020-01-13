package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.StudentUser;
import vo.TeacherUser;

public class UserDAOImpl implements UserDAO {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	public UserDAOImpl(Connection conn) {
		this.conn=conn;
	}
	public boolean loginCheck(StudentUser studentuser)throws Exception{
		boolean flag=false;
		try {
			String sql="select name from student where userid=? and password=?";
			this.pstmt=this.conn.prepareStatement(sql);
			this.pstmt.setString(1, studentuser.getUserid());//��һ�������Ǹò���������е�������������Ǿ��д� 1 ��ʼ�ı�š� ͨ��ָ���ǵ�һ��������
														//�ڶ���������Ҫ�Ե�һ���������õ�ֵ��
			this.pstmt.setString(2, studentuser.getPassword());
			ResultSet rs=this.pstmt.executeQuery();//executeQuery���������ݿ��ѯ���������Ὣ���ݿ��ѯ�Ľ���洢��ResultSet������
			if(rs.next()) {
				studentuser.setName(rs.getString(1));
				flag=true;
			}
		}catch(Exception e) {
			throw e;
		}finally {
			if(this.pstmt!=null) {
				try {
					this.pstmt.close();
				}catch(Exception e) {
					throw e;
				}
			}
		}
		return flag;
	}
	public boolean loginCheck(TeacherUser teacheruser)throws Exception{
		boolean flag=false;
		//TODO
		return flag;
	}
}
