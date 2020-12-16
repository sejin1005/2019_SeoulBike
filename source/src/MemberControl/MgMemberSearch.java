package MemberControl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import Dto.MemberDto;

public class MgMemberSearch implements Action1 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String SK = request.getParameter("sk");
		String TEXT = request.getParameter("text");
	
		MemberDao dao = new MemberDao();
		ArrayList<MemberDto> list = dao.searchList(SK, TEXT);
		request.setAttribute("searchList", list);
	}

}