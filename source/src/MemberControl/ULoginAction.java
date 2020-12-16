package MemberControl;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Dao.MemberDao;

public class ULoginAction implements Action2{
	@Override
	public String execute (HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		HttpSession session = request.getSession();
		

		MemberDao dao = new MemberDao();
		int check;
		check = dao.memberCheck(id, pw);
		
		if(check==0) {
			return "uLogin.jsp";
		} else if(check==-1){
			return "uLogin.jsp";
		} else if (check==2) {
			session.setAttribute("userID", id);
			return "mg_main.jsp";
		}else {
			session.setAttribute("userID", id);
			session.setMaxInactiveInterval(60*60);
			System.out.println("로그인 성공");
			return "uLoginComplete.jsp";
		} 
		
		

	}
	

}