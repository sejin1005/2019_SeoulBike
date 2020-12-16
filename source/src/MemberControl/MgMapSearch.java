package MemberControl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MapDao;
import Dto.MapDto;

public class MgMapSearch implements Action1 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String SK = request.getParameter("sk");
		String TEXT = request.getParameter("text");
		
		MapDao dao = new MapDao();
		ArrayList<MapDto> list = dao.searchList(SK, TEXT);
		request.setAttribute("searchList", list);
	}

}