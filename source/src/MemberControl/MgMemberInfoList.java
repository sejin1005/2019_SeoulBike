package MemberControl;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import Dto.MemberDto;

public class MgMemberInfoList implements Action1 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = new MemberDao();
		ArrayList<MemberDto> mem = dao.list();
		request.setAttribute("memlist", mem);
	}

}