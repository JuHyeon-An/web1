package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.myba")
public class BoardServlet extends HttpServlet{
  HttpServletRequest req;
  HttpServletResponse resp;
  String url = "index_mybatis.jsp?inc=./mybatis/";
  RequestDispatcher rd;
  
  /*public BoardServlet(HttpServletRequest req, HttpServletResponse resp) {
	  this.req = req;
	  this.resp = resp;
  }*/
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		this.req = req;
		this.resp = resp;
		select();
		//url이 들어오지 않았을 때 select메소드가 호출되도록
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		this.req = req;
		this.resp = resp;
		int pos = req.getRequestURI().lastIndexOf("/")+1;
		// 맨 마지막 슬러시를 찾아서 위치값을 pos에 넣음
		String tempUrl = req.getRequestURI().substring(pos);
		
		switch(tempUrl) {
		
		case "select.myba":
			select();
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
		
		case "view.myba":
			view();
			break;

		}
		
	}
	
	public void select() throws ServletException, IOException  {
		String path = url + "select.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
		
	}
	
	public void view() throws ServletException, IOException  {
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
		
	}
	
	public void modify() throws ServletException, IOException  {
		
	}
	
	public void modifyR() throws ServletException, IOException  {
		
	}
	
	public void deleteR() throws ServletException, IOException  {
		
	}
	
	public void repl() throws ServletException, IOException  {
		
	}
	
	public void replR() throws ServletException, IOException  {
		
	}
	
	
}
