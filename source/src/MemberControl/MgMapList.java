package MemberControl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MapDao;
import Dto.MapDto;

public class MgMapList implements Action1 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MapDao dao = new MapDao();
		ArrayList<MapDto> map = dao.list();
		request.setAttribute("maplist", map);
	}

}