package MemberControl;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("*.mo")
public class ControllerManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControllerManage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("EUC-KR");
		
		String viewPage  = null;
		Action1 action  = null;
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		// map
		if(com.equals("/mg_map_add.mo")) { // 추가
			viewPage = "mg_map_add.jsp";
		}else if(com.equals("/mg_map_write.mo")) { // 추가
			action = new MgMapAdd();
			action.execute(request, response);
			viewPage = "/mg_map.mo";
		} else if(com.equals("/mg_map.mo")) {    // 리스트 보기
			action = new MgMapList();
			action.execute(request, response);
			viewPage = "mg_map.jsp";
		}else if(com.equals("/mg_map_delete.mo")){ 
			viewPage = "mg_map_delete.jsp";
		}
		else if(com.equals("/mg_map_delete2.mo")){
			action = new MgMapDelete();
			action.execute(request, response);
			viewPage = "mg_map.mo";
		} 
		else if(com.equals("/mg_map_go.mo")) {
			action = new MgMapSearch();
			action.execute(request, response);
			viewPage = "mg_map_search.mo";
		}
		else if(com.equals("/mg_map_search.mo")) {
			viewPage = "mg_map_search.jsp";
		}
		// memberinfo
		
		else if(com.equals("/mg_memberinfo.mo")) {    // 리스트 보기
			action = new MgMemberInfoList();
			action.execute(request, response);
			viewPage = "mg_memberinfo.jsp";
		} 
		else if(com.equals("/mg_memberinfo_go.mo")) {
			action = new MgMemberSearch();
			action.execute(request, response);
			viewPage = "mg_memberinfo_search.mo";
		}
		else if(com.equals("/mg_memberinfo_search.mo")) {
			viewPage = "mg_memberinfo_search.jsp";
		}
		// bike
		else if(com.equals("/mg_bike_add.mo")) { // 추가
			viewPage = "mg_bike_add.jsp";
		} 
		else if(com.equals("/mg_bike_write.mo")) { // 추가
			action = new MgBikeAdd();
			action.execute(request, response);
			viewPage = "mg_bike.mo";
		} 
		else if(com.equals("/mg_bike.mo")) {    // 리스트 보기
			action = new MgBikeList();
			action.execute(request, response);
			viewPage = "mg_bike.jsp";
		} else if(com.equals("/mg_bike_delete.mo")){ 
			viewPage = "mg_bike_delete.jsp";
		} else if(com.equals("/mg_bike_delete2.mo")){
			action = new MgBikeDelete();
			action.execute(request, response);
			viewPage = "mg_bike.mo";
		} 
		
		
		
		
		
		else if(com.equals("/mg_notice.mo")){
			viewPage = "mg_notice.jsp";
		}
		else if(com.equals("/mg_notice_add.mo")){
			viewPage = "mg_notice_add.jsp";
		}
		
		
		
		
		else if(com.equals("/mg_main.mo")) {
			viewPage = "mg_main.jsp";
		} else if(com.equals("/mg_memberinfo.mo")) {
			viewPage = "mg_memberinfo.jsp";
		} else if(com.equals("/mg_buychart.mo")) {
			viewPage = "mg_buychart.jsp";
		} else if(com.equals("/mg_read.mo")) {
			viewPage = "mg_read.jsp";
		} else if(com.equals("/mg_cycle.mo")) {
			viewPage = "mg_cycle.jsp";
		} 
		
		
		
		
		    
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}
}
