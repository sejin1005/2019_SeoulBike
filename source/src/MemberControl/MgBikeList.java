package MemberControl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BikeDao;
import Dto.BikeDto;

public class MgBikeList implements Action1 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BikeDao dao = new BikeDao();
		ArrayList<BikeDto> bike = dao.list();
		request.setAttribute("bikelist", bike);
		
	}

}