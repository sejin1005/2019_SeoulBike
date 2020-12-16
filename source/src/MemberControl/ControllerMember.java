package MemberControl;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class ControllerMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControllerMember() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("EUC-KR");
		
		String viewPage  = null;
		Action1 action1  = null;
		Action2 action2  = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		
		if(com.equals("/uMainLoginOK.bo")) {
			viewPage = "uMainLoginOK.jsp";
		} else if(com.equals("/uMainLoginNO.bo")) {
			viewPage = "uMainLoginNO.jsp";
		}else if(com.equals("/uJoin.bo")) {
			viewPage = "uJoin.jsp";
		} else if(com.equals("/uJoinComplete.bo")) {
			action1 = new UJoinAction();
			action1.execute(request, response);
			viewPage = "uJoinComplete.jsp";
		} else if(com.equals("/uLogin.bo")) {
			viewPage="uLogin.jsp";
		} else if(com.equals("/uLoginComplete.bo")) {
			action2 = new ULoginAction();
			viewPage = action2.execute(request, response);
		} else if(com.equals("/uMainLoginOK.bo")) {
			viewPage = "uMainLoginOK.jsp";
		} else if(com.equals("/uTicketList.bo")) {
			viewPage = "uTicketList.jsp";
		} else if(com.equals("/uTicketListSeason.bo")) {
			viewPage = "uTicketListSeason.jsp";
		} else if(com.equals("/uTicketListDay.bo")) {
			viewPage = "uTicketListDay.jsp";
		} else if(com.equals("/uMemberIdFind.bo")) {
			viewPage = "uMemberIdFind.jsp";
		} else if(com.equals("/uMemberPwFind.bo")) {
			viewPage = "uMemberPwFind.jsp";
		} else if(com.equals("/uMyUseList.bo")) {
			viewPage = "uMyUseList.jsp";
		} else if(com.equals("/uMyBuyList.bo")) {
			viewPage = "uMyBuyList.jsp";
		} else if(com.equals("/uMyInfoEdit.bo")) {
			viewPage = "uMyInfoEdit.jsp";
		} else if(com.equals("/uMyCounseling.bo")) {
			viewPage = "uMyCounseling.jsp";
		} else if(com.equals("/uMyOpinionBoardWrite.bo")) {
			viewPage = "uMyOpinionBoardWrite.jsp";
		} else if(com.equals("/uMySecede.bo")) {
			viewPage = "uMySecede.jsp";
		} else if(com.equals("/uMainAdmin.bo")) {
			viewPage = "uMainAdmin.jsp";
		}
		
		
		
		
		javax.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}
}
