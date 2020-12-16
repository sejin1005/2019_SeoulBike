package MemberControl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BikeDao;

public class MgBikeDelete implements Action1 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bikenum = Integer.parseInt(request.getParameter("bikenum"));
		System.out.println(bikenum);
		BikeDao dao = new BikeDao();
		dao.delete(bikenum);
	}

}