package MemberControl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import MemberControl.Action1;
import Dto.MemberDto;
import Dao.MemberDao;

public class UJoinAction implements Action1{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)  {
		
		
		String ID = request.getParameter("id");
		String PWD = request.getParameter("pwd");
		String PHONE = request.getParameter("phone");
		String EMAIL = request.getParameter("email");
		String BIKE_PWD = request.getParameter("bike_pwd");
		String GENDER = request.getParameter("gender");
		
		MemberDao dao = new MemberDao();
	
		dao.memberInsert(ID, PWD, PHONE, EMAIL, BIKE_PWD, GENDER);
	
	}
}