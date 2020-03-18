package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MemberDao;
import bean.MemberVo2;

@WebServlet("*.anno")
public class MemberServletAnno extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		
		String mId = request.getParameter("mId");
		String mName= request.getParameter("mName");
		String rDate = request.getParameter("rDate");
		String grade = request.getParameter("grade");
		
		resp.setContentType("text/html;charset=utf-8"); 
		
		MemberVo2 vo = new MemberVo2();
		vo.setmId(mId);
		vo.setmName(mName);
		vo.setGrade(Integer.parseInt(grade));
		vo.setrDate(rDate);
		
		MemberDao dao = new MemberDao();
		String msg = dao.insertVo2(vo);
		
		String path = "/jsp/insert_result.jsp";
		ServletContext cont = getServletContext();
		RequestDispatcher disp = cont.getRequestDispatcher(path);
		request.setAttribute("msg", msg);
		//메시지를 저장하고
		disp.forward(request, resp);
		// 요청정보, 응답정보와 함께 forward
		
	}
}
