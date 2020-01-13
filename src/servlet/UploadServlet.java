package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Date;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.FileDAO;
import vo.MyFile;
 

/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    // �ϴ�����
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  	// 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 500; 	// 500MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 525; 	// 525MB
    
    //�ݴ���ʱĿ¼
    //E:\Myeclipse_program\MIPS246\WebRoot
    //private static final String UPLOAD_TEMP_DIRCTORY = "E:\\Myeclipse_program\\MIPS246\\WebRoot\\temp";
    private static final String UPLOAD_TEMP_DIRCTORY = System.getProperty("user.dir") + File.separator + "temp";
    
     //�ϴ����ݼ������ļ�
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("< Upload >");
    	// ����Ƿ�Ϊmultipart/form-data�ϴ������������ֹͣ
        if (!ServletFileUpload.isMultipartContent(request)) {
            PrintWriter writer = response.getWriter();
            writer.println("Error: ��������� enctype=multipart/form-data");
            writer.flush();
            return;
        }
        
        //�����ݴ�Ŀ¼
        File tempDir = new File(UPLOAD_TEMP_DIRCTORY);
        if (!tempDir.exists()) {
        	tempDir.mkdirs();
            System.out.println("<Create Folder "+UPLOAD_TEMP_DIRCTORY+" >");
        }
        
        // �����ϴ�����
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MEMORY_THRESHOLD);// �����ڴ��ٽ�ֵ - �����󽫲�����ʱ�ļ����洢����ʱĿ¼��
        //factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        factory.setRepository(new File(UPLOAD_TEMP_DIRCTORY));// ������ʱ�洢Ŀ¼
 
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);	// ��������ļ��ϴ�ֵ
        upload.setSizeMax(MAX_REQUEST_SIZE);	// �����������ֵ (�����ļ��ͱ�����)
        upload.setHeaderEncoding("UTF-8"); 		// ���Ĵ���

        // ����·�����洢�ϴ����ļ�
        // ���·����Ե�ǰӦ�õ�Ŀ¼
        //String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
        //String uploadPath = "E:\\Myeclipse_program\\MIPS246\\WebRoot\\homework\\�����߼�";
        //System.out.println(uploadPath);
        //String outerpath = "E:\\Myeclipse_program\\MIPS246\\WebRoot";
        String 	outerpath	  = System.getProperty("user.dir") + File.separator + "WebRoot";	//������ļ���
        
        /*
         * �����д�����޷�ֱ����getParameterȡ��ǰ������
        String 	courseid	  = (String) request.getParameter("courseid");						//ȡ�γ�id��Ϊ����ļ�����
        String 	roletype      = (String) request.getParameter("roletype");						//ȡ��½�û��Ľ�ɫ����
        
        
        System.out.println("outerpath:"+outerpath);
        System.out.println("courseid:"+courseid);
        System.out.println("roletype:"+roletype);
        
        
        String 	userid 	 	  = null;														//ȡ�û�idΪ�ڲ��ļ�����
        int		filetype 	  = Integer.parseInt(request.getParameter("filetype")) ;							//��ʾ�ļ�����
        int 	coursesection = Integer.parseInt(request.getParameter("coursesection")) ;					//��ʾ�γ�С��
        */
        
        /*
        MyFile myfile = new MyFile();
        myfile.setFiletype(filetype);
        myfile.setCoursesection(coursesection);
        myfile.setCourseid(courseid);
        myfile.setGrade(-1);
        */
        /*
        if (roletype.equals("student")) {
        	System.out.println("< Student Upload >");
        	
        	userid = (String) request.getParameter("studentid");
        	myfile.setStudentid(userid);
        	myfile.setTeacherid(null);
        }
        else if (roletype.equals("teacher")) {
        	System.out.println("< Teacher Upload >");
        	
        	userid = (String) request.getParameter("teacherid");
        	myfile.setStudentid(null);
        	myfile.setTeacherid(userid);
        }
        else {
        	PrintWriter writer = response.getWriter();
            writer.println("Error: ����ѧ������ʦ���ϴ��ļ���");
            writer.flush();
            return;
        }
        */
        /*
        String uploadpath = outerpath + File.separator + courseid + File.separator + userid;//�������մ洢·��
        //String uploadPath = outerpath + "\\" + courseid + "\\" + userid;
        
        // ���Ŀ¼�������򴴽�
        File uploadDir = new File(uploadpath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        */
        String fieldName	 = null;//��¼ǰ�˴�����input������
        String courseid 	 = null;
        String roletype 	 = null;
        String userid		 = null;
        String uploadpath    = null;
        String reurl		 = null;//���·��
        int	   filetype 	 = 0;
        int	   coursesection = 1;
        
        MyFile myfile        = new MyFile();
        myfile.setGrade(-1);
        
        try {
            // ���������������ȡ�ļ�����
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                // ����������
                for (FileItem item : formItems) {
                    // �����ļ�
                    if (!item.isFormField()) {
                    	System.out.println("< Get File >");
                    	
                    	//��һ��getname()����ֵ��ʱֻ���ļ�������ʱ�Ǿ���·��
                        String filename = new File(item.getName()).getName();//�ļ���file_name
                        String filePath = uploadpath + File.separator + filename;//�ļ��ľ���·����file_url
                        File storeFile = new File(filePath);
                        System.out.println(filePath);// �ڿ���̨����ļ����ϴ�·��
                        item.write(storeFile);// �����ļ���Ӳ��
                        Date time = new Date(storeFile.lastModified());
                        String filetime = time.toString();//�ļ�����޸�ʱ�䣨����ʱ�䣩,create_time
                        request.setAttribute("message","�ļ��ϴ��ɹ�!");
                        
                        reurl += File.separator + filename;//���·��
                        
                        myfile.setCreatetime(filetime);
                        myfile.setFileurl(reurl);
                        myfile.setFilename(filename);
                        
                        System.out.println("createtime:"+filetime);
                        System.out.println("filePath:"+filePath);
                        System.out.println("filename:"+filename);
                        
                        FileDAO.insert(myfile);
                    }
                    // ��������
                    else {
                    	fieldName = item.getFieldName();
                    	if("coursesection".equals(fieldName)) {
                    		coursesection = Integer.parseInt(item.getString());
                    		myfile.setCoursesection(coursesection);
                    		System.out.println("coursesection:"+coursesection);
                    	}
                    	else if("filetype".equals(fieldName)) {
                    		filetype = Integer.parseInt(item.getString());
                    		myfile.setFiletype(filetype);
                    		System.out.println("filetype:"+filetype);
                    	}
                    	else if("roletype".equals(fieldName)) {
                    		roletype = item.getString();
                    		System.out.println("roletype:"+roletype);
                    	}
                    	else if("courseid".equals(fieldName)) {
                    		courseid = item.getString();
                    		myfile.setCourseid(courseid);
                    		System.out.println("courseid:"+courseid);
                    	}
                    	else if("userid".equals(fieldName)) {
                    		userid = item.getString();
                    		
                    		if (roletype.equals("student")) {
                            	System.out.println("< Student Upload >");

                            	myfile.setStudentid(userid);
                            	myfile.setTeacherid(null);
                            	System.out.println("userid:"+userid);
                            }
                            else if (roletype.equals("teacher")) {
                            	System.out.println("< Teacher Upload >");

                            	myfile.setStudentid(null);
                            	myfile.setTeacherid(userid);
                            	System.out.println("userid:"+userid);
                            }
                    		
                    		//�������մ洢·��
                    		uploadpath = outerpath + File.separator + courseid + File.separator + userid;
                    		//�������·��
                    		reurl = File.separator + "WebRoot" + File.separator + courseid + File.separator + userid;
                    		// ���Ŀ¼�������򴴽�
                            File uploadDir = new File(uploadpath);
                            if (!uploadDir.exists()) {
                                uploadDir.mkdirs();
                                System.out.println("<Create Folder "+uploadpath+" >");
                            }
                    	}
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message", "������Ϣ: " +  ex.getMessage());
        }
        getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
        /*
        if("teacher".equals(roletype)) {
        	//getServletContext().getRequestDispatcher("/teacher/teacher_course_manage.jsp").forward(request, response);// ��ת
        	getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
        }
        */
        //getServletContext().getRequestDispatcher("/homework1.jsp").forward(request, response);// ��ת
    }
}
