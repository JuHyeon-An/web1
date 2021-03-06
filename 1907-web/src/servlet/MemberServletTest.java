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
import member.Page;


@WebServlet("*.cc")
public class MemberServletTest extends HttpServlet{
	String url = "index.jsp?inc=./jsp_member/index_jsp_member.jsp&cont=./jsp_member";
	String findStr = "";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		select(req, resp);
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
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		findStr = req.getParameter("findStr");
		// select 페이지에서 넘겨준 검색어 findStr을 request를 통해서 가져옴
		String path = url + "/insert.jsp?findStr="+findStr;
				// => get 타입으로.
		
		// get 타입으로 보내줬을 경우에는 폼에서 받을 때 ${findStr} 아니고 ${param.findStr}해줘야돼
		RequestDispatcher rd = req.getRequestDispatcher(path);
		//req.setAttribute("findStr", findStr);
		rd.forward(req, resp);
	}
	
	public void insertR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String path = url + "/insert_result.jsp";
		FileUpload upload = new FileUpload(req, resp);
		
		if(upload.uploadFormCheck()) { // enctype = 'multipart/form-data'
			MemberVo vo = upload.uploading();
			// 사진을 포함해서 모든 폼태그가 담겨진 vo가 반환
			
			List<MemberPhoto> list = vo.getPhotos();
			// 일반 폼들은 객체 vo에 담겨질 것이고 사진은 list에
			
			MemberDao dao = new MemberDao();
			String msg = dao.insert(vo);
			// 폼태그 담은 vo를 실제로 DB에 넣어줌
			
			req.setAttribute("msg", msg);
			
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
		path += "?nowPage="+req.getAttribute("nowPage");
		// get타입으로 보내줌
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		MemberDao dao = new MemberDao();
		MemberVo vo = dao.view(req.getParameter("mId"));
		
		String photo = vo.getPhotos().get(0).getSysFile();
		System.out.println(photo);
		req.setAttribute("photo", photo);
		req.setAttribute("vo", vo);
		
		String path = url + "/modify.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		MemberVo vo = new MemberVo();
		/*
		if(req.getParameter("isChanged")!=null) {
			String isChanged = req.getParameter("isChanged");
			System.out.println("isChanged의 값 "+isChanged);
				// 1이면 사진이 올라간 것이고, 아니면 사진은 변경하지 않은 것.
				// 1이 아니라면 = 사진을 변경하지 않았다면 => 일반 getParameter로 받아야함
				vo.setmId(req.getParameter("mId"));
				vo.setmName(req.getParameter("mName"));
				vo.setrDate(req.getParameter("rDate"));
				vo.setGrade(Integer.parseInt(req.getParameter("grade")));
				vo.setPwd(req.getParameter("pwd"));
			}else {
			
			 */// isChanged가 null로 들어온 경우 = enctype때문에 (사진등록되는경우)
				FileUpload upload = new FileUpload(req, resp);
				if(upload.uploadFormCheck()) {
					vo = upload.uploading();
					//List<MemberPhoto> mp = vo.getPhotos();
					
				}else {
					System.out.println("error");
					resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				}
		
		MemberDao dao = new MemberDao();
		String msg = dao.modify(vo);
		req.setAttribute("msg", msg);
		
		String path = url + "/modify_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
		
	}
	
	public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		MemberDao dao = new MemberDao();
		System.out.println(req.getParameter("mId"));
		MemberVo vo = dao.view(req.getParameter("mId"));
		//Dao에서 mId가지고 vo만들어서 전달해줌
		String photo = null;
		
		if(vo.getPhotos()!=null) {
			photo = vo.getPhotos().get(0).getSysFile();
		}
		
		System.out.println(photo);
		req.setAttribute("photo", photo);
		req.setAttribute("vo", vo);
		String path = url + "/view.jsp";
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		MemberDao dao = new MemberDao();
		String msg = dao.delete(req.getParameter("mId"), req.getParameter("pwd"), req.getParameter("isChanged"));
		
		req.setAttribute("msg", msg);
		String path = url + "/delete_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		//findStr = req.getParameter("findStr");
		//System.out.println(findStr);
		//req.setAttribute("findStr", findStr);
		
		MemberDao dao = new MemberDao();
		int nowPage = 1;
		findStr = "";
		
		if(req.getParameter("nowPage")!="") {
			//nowPage가 파라미터값으로 들어온 적이 없으면 (null)이라면 그냥 1로 세팅됨
			//그게 아니라면 들어온 nowPage가 세팅됨
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if(req.getParameter("findStr")!="") {
			findStr = req.getParameter("findStr");
		}
		
		Page p = new Page();
		
		p.setNowPage(nowPage);
		p.setFindStr(findStr);
		System.out.println(findStr);
		
		List<MemberVo> list = dao.select(p);
		req.setAttribute("list", list);
		req.setAttribute("p", p);
		
		String path = url + "/select.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
