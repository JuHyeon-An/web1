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
// XML과 다른점 여기!

public class MemberServletAnno extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 요청정보 한글설정
		String mId = request.getParameter("mId");
		String mName= request.getParameter("mName");
		String rDate = request.getParameter("rDate");
		String grade = request.getParameter("grade");
		
		resp.setContentType("text/html;charset=utf-8"); // 응답정보 한글설정
		// get writer를 가져오기 전에 반드시 컨텐트타입 선언 해줘야함
		
		MemberVo2 vo = new MemberVo2();
		vo.setmId(mId);
		vo.setmName(mName);
		vo.setGrade(Integer.parseInt(grade));
		vo.setrDate(rDate);
		
		MemberDao dao = new MemberDao();
		String msg = dao.insertVo2(vo);
		
		/* 실행결과를 특정 페이지로 전달하는 방법
		      실행결과에 복잡한 html코드가 있을 경우, 단순출력(out.print)으로는 처리하기 힘드니까
		 */
		String path = "/jsp/insert_result.jsp";//로딩해야될 파일명 
		ServletContext cont = getServletContext(); // HttpServlet이 가지고 있는 context
		RequestDispatcher disp = cont.getRequestDispatcher(path);
		request.setAttribute("msg", msg);
		disp.forward(request, resp); // 현재페이지를 이동시킴
	}
}
