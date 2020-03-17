package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.mms")
public class MemberServlet extends HttpServlet{
	String url = "index.jsp?inc=./jsp/index_jsp.jsp&cont=./jsp_member";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("ok...");
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempUrl = temp.substring(pos);
		System.out.println(url + tempUrl);
		
		switch(tempUrl) {
		case "/insert.mm":
			insert(req, resp);
			break;
		
		case "/insertR.mm":
			insertR(req, resp);
			break;
			
		case "/modify.mm":
			modify(req, resp);
			break;
			
		case "/modifyR.mm":
			modifyR(req, resp);
			break;
			
		case "/view.mm":
			view(req, resp);
			break;
			
		case "/deleteR.mm":
			deleteR(req, resp);
			break;
			
		case "/select.mm":
			select(req, resp);
			break;
		}
	}
	
	public void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String path = url + "/insert.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	public void insertR(HttpServletRequest req, HttpServletResponse resp) {
		
	}
	
	public void modify(HttpServletRequest req, HttpServletResponse resp) {
		
	}
	
	public void modifyR(HttpServletRequest req, HttpServletResponse resp) {
		
	}
	
	public void view(HttpServletRequest req, HttpServletResponse resp) {
		
	}
	
	public void deleteR(HttpServletRequest req, HttpServletResponse resp) {
		
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) {
		
	}
}
