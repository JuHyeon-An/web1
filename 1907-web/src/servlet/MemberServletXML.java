package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MemberDao;
import bean.MemberVo2;

public class MemberServletXML extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 요청정보 한글설정
		
		String mId = request.getParameter("mId");
		String mName= request.getParameter("mName");
		String rDate = request.getParameter("rDate");
		String grade = request.getParameter("grade");
		
		//콘솔창에 출력
		System.out.println("doPost");
		System.out.println(mId);
		System.out.println(mName);
		System.out.println(rDate);
		System.out.println(grade);

		resp.setContentType("text/html;charset=utf-8"); // 응답정보 한글설정
		// get writer를 가져오기 전에 반드시 컨텐트타입 선언 해줘야함
		
		PrintWriter out = resp.getWriter();
		out.print("<ul>");
		out.print("<li>mId="+mId);
		out.print("<li>mName="+mName);
		out.print("<li>rDate="+rDate);
		out.print("<li>grade="+grade);
		out.print("</ul>");
		//단순히 출력만 하는 경우
		
		MemberVo2 vo = new MemberVo2();
		vo.setmId(mId);
		vo.setmName(mName);
		vo.setGrade(Integer.parseInt(grade));
		vo.setrDate(rDate);
		
		MemberDao dao = new MemberDao();
		String msg = dao.insertVo2(vo);
		out.print("<h3>"+msg+"<h3>");
		out.close();
	}
}
