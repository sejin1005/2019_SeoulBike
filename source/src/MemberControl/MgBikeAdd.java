package MemberControl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BikeDao;

public class MgBikeAdd implements Action1 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String BIKENUM = request.getParameter("bikenum");
		String ABLE = request.getParameter("able");
		int RNUM = Integer.parseInt(request.getParameter("rnum"));
		
		BikeDao dao = new BikeDao();
		dao.bikeAdd(BIKENUM, ABLE, RNUM);
		dao.rentalUpdate(RNUM);
	}

}