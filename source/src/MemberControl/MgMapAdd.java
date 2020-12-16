package MemberControl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MapDao;

public class MgMapAdd implements Action1 {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		String REGION = request.getParameter("region");
		String RNUM = request.getParameter("rNum");
		String RNAME = request.getParameter("rName");
		String STAND = request.getParameter("stand");
		String LAT = request.getParameter("lat");
		String LNG = request.getParameter("lng");

		MapDao dao = new MapDao();
		dao.mapAdd(REGION, RNUM, RNAME, STAND, LAT, LNG);
		
		
	}
}