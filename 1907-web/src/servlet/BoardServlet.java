package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.FileUpload;
import mybatis.AttVo;
import mybatis.BoardMybatisDao;
import mybatis.BoardVo;
import mybatis.Page;

@WebServlet("*.myba")
public class BoardServlet extends HttpServlet{
  HttpServletRequest req;
  HttpServletResponse resp;
  String url = "index_mybatis.jsp?inc=./mybatis/";
  RequestDispatcher rd;
  BoardMybatisDao dao;
  
  
  /*public BoardServlet(HttpServletRequest req, HttpServletResponse resp) {
	  this.req = req;
	  this.resp = resp;
  }*/
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.req = req;
		this.resp = resp;
		doPost(req, resp);
		//url이 들어오지 않았을 때 select메소드가 호출되도록
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		this.req = req;
		this.resp = resp;
		dao = new BoardMybatisDao();
			
		int pos = req.getRequestURI().lastIndexOf("/")+1;
		// 맨 마지막 슬러시를 찾아서 위치값을 pos에 넣음
		String tempUrl = req.getRequestURI().substring(pos);
		
		switch(tempUrl) {
		
		case "select.myba":
			select();
			break;
		
		case "view.myba":
			view();
			break;

		case "insert.myba":
			insert();
			break;

		case "insertR.myba":
			insertR();
			break;

		case "modify.myba":
			modify();
			break;
		
		case "modifyR.myba":
			modifyR();
			break;
		
		case "repl.myba":
			repl();
			break;
			
		case "replR.myba":
			replR();
			break;
			
		case "deleteR.myba":
			deleteR();
			break;

		}
		
	}
	
	public void select() throws ServletException, IOException  {
		String path = url + "select.jsp";
		Page p = new Page();
		
		p.setFindStr(req.getParameter("findStr"));
		
		if(req.getParameter("nowPage")!=null && req.getParameter("nowPage")!="") {
			p.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		}
		
		List<BoardVo> list = dao.select(p);
		req.setAttribute("list", list);
		req.setAttribute("p", p);
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void view() throws ServletException, IOException  {
		int serial = 0;
		/*System.out.println(req.getServletPath());
		System.out.println(req.getHeader("Referer"));
		
		int pos2 = req.getHeader("Referer").lastIndexOf("/")+1;
		// 맨 마지막 슬러시를 찾아서 위치값을 pos에 넣음
		String tempUrl2 = req.getHeader("Referer").substring(pos2);
		
		System.out.println(tempUrl2);
		System.out.println("remote addr"+req.getRemoteAddr());
		System.out.println("local addr"+req.getLocalAddr());*/
		
		if(req.getParameter("serial")!=null) {
			serial = Integer.parseInt(req.getParameter("serial"));
		}
		
		BoardVo vo = dao.view(serial, 'v');
		List<AttVo> attList = dao.getAttList(serial);
		
		req.setAttribute("vo", vo);
		req.setAttribute("attList", attList);
		
		String path = url + "view.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void insert() throws ServletException, IOException  {
		String path = url + "insert.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void insertR() throws ServletException, IOException  {
		String path = url + "insert_result.jsp";
		FileUpload fu = new FileUpload(req, resp);
		HttpServletRequest newReq = fu.uploading();
		
		BoardVo vo = (BoardVo)newReq.getAttribute("vo");
		List<AttVo> attList = (List<AttVo>)newReq.getAttribute("attList");
		String msg = dao.insert(vo, attList);
		newReq.setAttribute("msg", msg);
		
		rd = newReq.getRequestDispatcher(path);
		rd.forward(newReq, resp);
	}
	
	public void modify() throws ServletException, IOException  {
		int serial = 0;
		
		if(req.getParameter("serial")!=null) {
			serial = Integer.parseInt(req.getParameter("serial"));
		}
		BoardVo vo = dao.view(serial, ' ');
		List<AttVo> attList = dao.getAttList(serial);
		
		req.setAttribute("vo", vo);
		req.setAttribute("attList", attList);
		
		String path = url + "modify.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modifyR() throws ServletException, IOException  {
		FileUpload fu = new FileUpload(req, resp);
		HttpServletRequest newReq = fu.uploading();
		
		BoardVo vo = (BoardVo) newReq.getAttribute("vo");
		List<AttVo> attList = (List<AttVo>) newReq.getAttribute("attList");
		List<AttVo> delList = (List<AttVo>) newReq.getAttribute("delList");
		
		String msg = dao.modify(vo, attList, delList);
		newReq.setAttribute("msg", msg);
		
		String path = url + "modify_result.jsp";
		rd = newReq.getRequestDispatcher(path);
		rd.forward(newReq, resp);
	}
	
	public void deleteR() throws ServletException, IOException  {
		int serial = 0;
		String pwd = "";
		if(req.getParameter("serial")!=null) {
			serial = Integer.parseInt(req.getParameter("serial"));
		}
		
		if(req.getParameter("pwd")!=null) {
			pwd = req.getParameter("pwd");
		}
		
		BoardVo vo = new BoardVo();
		vo.setSerial(serial);
		vo.setPwd(pwd);
		
		//System.out.println("시리얼번호 들어오는지 : "+serial);
		String msg = dao.delete(vo);
		req.setAttribute("msg", msg);
		String path = url + "delete_result.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void repl() throws ServletException, IOException  {
		String path = url + "repl.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void replR() throws ServletException, IOException  {
		
		FileUpload fu = new FileUpload(req, resp);
		req = fu.uploading();
		
		BoardVo vo = (BoardVo)req.getAttribute("vo");
		List<AttVo> attList = (List<AttVo>)req.getAttribute("attList");
		
		String msg = dao.repl(vo, attList);
		req.setAttribute("msg", msg);
		
		String path = url + "repl_result.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	
}
