package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import javax.sql.DataSource;


import Dto.MapDto;
import Dto.MemberDto;

public class MapDao {
	DataSource dataSource;
	Connection connection;
	PreparedStatement pstmt;

	public MapDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/orcl");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결 실패");
			return;
		}

	}

	public ArrayList<MapDto> list() {
		ArrayList<MapDto> map = new ArrayList<MapDto>();
		connection = null;
		pstmt = null;
		ResultSet rs = null;

		try {
			connection = dataSource.getConnection();

			String query = "select * from RENTAL order by REGION asc"; // 지역명 기준으로 오름차순
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				String REGION = rs.getString("REGION");
				String RNUM = rs.getString("RNUM");
				String RNAME = rs.getString("RNAME").substring(rs.getString("RNAME").lastIndexOf(".")+1);
				String STAND = rs.getString("STAND");
				String LAT = rs.getString("LAT");
				String LNG = rs.getString("LNG");

				MapDto dto = new MapDto(REGION, RNUM, RNAME, STAND, LAT, LNG);
				map.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			execClose(rs, pstmt, connection);
		}
		return map;
	}

	public void mapAdd(String REGION, String RNUM, String RNAME, String STAND, String LAT, String LNG) {
		connection = null;
		pstmt = null;

		try {
			connection = dataSource.getConnection();
			String query = "insert into RENTAL (REGION, RNUM, RNAME, STAND, LAT, LNG) values (?,?,?,?,?,?)";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, REGION);
			pstmt.setString(2, RNUM);
			pstmt.setString(3, RNAME);
			pstmt.setString(4, STAND);
			pstmt.setString(5, LAT);
			pstmt.setString(6, LNG);
			int rn = pstmt.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void delete(int rNum) {
		connection = null;
		pstmt = null;
		try {
			connection = dataSource.getConnection();
			String query = "delete from RENTAL where RNUM = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, rNum);
			int rn = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
	}
	
	public ArrayList<MapDto> searchList(String SK, String TEXT) {
		ArrayList<MapDto> list = new ArrayList<MapDto>();
		connection = null;
		pstmt = null;
		ResultSet rs = null;
		
		try {
			connection = dataSource.getConnection();
			String query;
			
			if (SK.equals("region")) {
				query = "select * from RENTAL where REGION LIKE ?";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, "%"+TEXT+"%");
				rs = pstmt.executeQuery();
			} else if (SK.equals("rnum")) {
				query = "select * from RENTAL where RNUM LIKE ?";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, "%"+TEXT+"%");
				rs = pstmt.executeQuery();
			} else if (SK.equals("rname")) {
				query = "select * from RENTAL where RNAME LIKE ?";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, "%"+TEXT+"%");
				rs = pstmt.executeQuery();
			}
			
			
			while(rs.next()) {
				String REGION = rs.getString("REGION");
				String RNUM = rs.getString("RNUM");
				String RNAME = rs.getString("RNAME").substring(rs.getString("RNAME").lastIndexOf(".")+1);
				String STAND = rs.getString("STAND");
				String LAT = rs.getString("LAT");
				String LNG = rs.getString("LNG");
				
				MapDto dto = new MapDto(REGION, RNUM, RNAME, STAND, LAT, LNG);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			execClose(rs, pstmt, connection);
		}
		return list;
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
