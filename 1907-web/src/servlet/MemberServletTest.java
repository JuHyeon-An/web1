package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDao;
import member.FileUpload;
import member.MemberPhoto;
import member.MemberVo;


@WebServlet("*.cc")
public class MemberServletTest extends HttpServlet{
	String url = "index.jsp?inc=./jsp_member/index_jsp_member.jsp&cont=./jsp_member";
	String findStr = "";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempUrl = temp.substring(pos);
		
		switch(tempUrl) {
		case "/insert.cc":
			insert(req, resp);
			break;
		
		case "/insertR.cc":
			insertR(req, resp);
			break;
			
		case "/modify.cc":
			modify(req, resp);
			break;
			
		case "/modifyR.cc":
			modifyR(req, resp);
			break;
			
		case "/view.cc":
			view(req, resp);
			break;
			
		case "/deleteR.cc":
			deleteR(req, resp);
			break;
			
		case "/select.cc":
			select(req, resp);
			break;
		}
	}

	public void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		findStr = req.getParameter("findStr");
		// select 페이지에서 넘겨준 검색어 findStr을 request를 통해서 가져옴
		//String path = url + "/insert.jsp";
		String path = url + "/insert.jsp?findStr="+findStr;
				// => get 타입으로.
		// get 타입으로 보내줬을 경우에는 폼에서 받을 때 ${findStr} 아니고 ${param.findStr}해줘야돼
		RequestDispatcher rd = req.getRequestDispatcher(path);
		//req.setAttribute("findStr", findStr);
		rd.forward(req, resp);
	}
	
	public void insertR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = url + "/insert_result.jsp";
		FileUpload upload = new FileUpload(req, resp);
		
		if(upload.uploadFormCheck()) { // enctype = 'multipart/form-data'
			MemberVo vo = upload.uploading();
			List<MemberPhoto> list = vo.getPhotos();
			// 일반 폼들은 객체 vo에 담겨질 것이고 사진은 list에
			
			MemberDao dao = new MemberDao();
			String msg = dao.insert(vo);
			req.setAttribute("msg", msg);
			
			/*
			System.out.println("mName = "+vo.getmName());
			System.out.println("pwd = "+vo.getPwd());
			System.out.println("mId = "+vo.getmId());
			System.out.println("rDate = "+vo.getrDate());
			System.out.println("grade = "+vo.getGrade());
			*/
			
			for(MemberPhoto p : list) {
				/*
				System.out.println("ori = "+p.getOriFile());
				System.out.println("sys = "+p.getSysFile());
				*/
			}
		}else {
			System.out.println("error");
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = url + "/modify.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = url + "/modify_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		vo = dao.view(req.getParameter("mId"));
		System.out.println(req.getParameter("mId"));
		req.setAttribute("mId", vo.getmId());
		req.setAttribute("mName", vo.getmName());
		req.setAttribute("rDate", vo.getrDate());
		req.setAttribute("grade", vo.getGrade());
		
		String path = url + "/view.jsp";
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = url + "/delete_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		findStr = req.getParameter("findStr");
		System.out.println(findStr);
		//req.setAttribute("findStr", findStr);
		MemberDao dao = new MemberDao();
		List<MemberVo> list = dao.select(findStr);
		System.out.println(list.get(0).getmId());
		req.setAttribute("list", list);
		
		String path = url + "/select.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
