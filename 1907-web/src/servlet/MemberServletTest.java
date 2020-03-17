package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.cc")
public class MemberServletTest extends HttpServlet{
	String url = "index.jsp?inc=./jsp_member/index_jsp_member.jsp&cont=./jsp_member";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempUrl = temp.substring(pos);
		System.out.println(url + tempUrl);
		
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
		String path = url + "/insert.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void insertR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = url + "/insert_result.jsp";
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
		String path = url + "/select.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
