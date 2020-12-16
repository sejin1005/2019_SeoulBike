package MemberControl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MapDao;

public class MgMapDelete implements Action1 {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int rNum = Integer.parseInt(request.getParameter("rNum"));
		MapDao dao = new MapDao();
		dao.delete(rNum);

	}
}