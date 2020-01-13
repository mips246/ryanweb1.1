package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import factory.DAOFactory;
import vo.StudentUser;

public class LoginServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException {
		req.getRequestDispatcher("/errorpage.jsp").forward(req,resp);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
		System.out.println("<login,����loginservlet>");
		String pathtrue="main.jsp";
		String pathfalse="login.jsp";
		String userid=req.getParameter("userid");
		String userpass=req.getParameter("userpass");
		String role=req.getParameter("role");
		boolean flag=false;
		List<String>info=new ArrayList<String>();
		if(userid==null||"".equals(userpass)) {
			info.add("���벻��Ϊ��");
		}
		if(info.size()==0) {
			//if(role.equals("student")) {}����es�ļܹ�������Ӧ���ж�role���������׳�ʼ���ĸ���
			StudentUser studentuser=new StudentUser();
			studentuser.setUserid(userid);
			studentuser.setPassword(userpass);
			try {
				if(DAOFactory.getIUserDAOInstance().loginCheck(studentuser)) {
					info.add("��½�ɹ�����ӭ"+studentuser.getName());
					//flag=true;
					HttpSession hs=req.getSession();
					hs.setAttribute("userid", userid);
					hs.setAttribute("role", role);
				}else {
					info.add("��¼ʧ��");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		req.setAttribute("info", info);
		
		if(flag==true) {
			req.getRequestDispatcher(pathtrue).forward(req,resp);
			//resp.sendRedirect("main.jsp");
		}else {
			req.getRequestDispatcher(pathfalse).forward(req,resp);
		}
		
	}
}
