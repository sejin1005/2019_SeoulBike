package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Dto.TicketDto;

public class TicketDao {
	static DataSource dataSource;
	static Connection connection;
	static PreparedStatement pstmt;
	static ResultSet rs;

	public TicketDao() {
		System.out.println("안녕");
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/orcl");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결 실패");
			return;
		}
	}

	public HashMap<String, Integer> getHashMap() {
		HashMap<String, Integer> map = new HashMap<String, Integer> ();
		String SQL = "select count(*) as count from TICKET where TICKET_TYPE = '정기권' group by ticket_type";
		try {
			pstmt = connection.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(map.containsKey(rs.getString(1))) {
					map.put(rs.getString(1), map.get(rs.getString(1))+1);
				} 
				else {
					map.put(rs.getString(1),1);
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return map;
	}

	public void ticketDay() { // 정기권

		connection = null;
		pstmt = null;
		rs = null;

		try {

			connection = dataSource.getConnection();
			int cnt = 0;

			String query = "select count(*) as count from TICKET where TICKET_TYPE = '일일권' group by ticket_type";
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				cnt = rs.getInt("count");
			}

			TicketDto dto = new TicketDto();
			dto.setTicketDay(cnt);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			execClose(rs, pstmt, connection);
		}

	}

	private void execClose(ResultSet rs, PreparedStatement pstmt, Connection connection) {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException ex) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {
			}
		if (connection != null)
			try {
				connection.close();
			} catch (SQLException ex) {
			}

	}

}
