package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Dto.BikeDto;
import Dto.MapDto;

public class BikeDao {
	DataSource dataSource;
	Connection connection;
	PreparedStatement pstmt;
	
	public BikeDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/orcl");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결 실패");
			return;
		}
	}
	
	public ArrayList<BikeDto> list() {
		ArrayList<BikeDto> bike = new ArrayList<BikeDto>();
		connection = null;
		pstmt = null;
		ResultSet rs = null;

		try {
			connection = dataSource.getConnection();

			String query = "select BIKE.BIKENUM, BIKE.ABLE, BIKE.RNUM, RENTAL.RNAME from BIKE LEFT JOIN RENTAL ON BIKE.RNUM = RENTAL.RNUM  order by to_number(BIKE.BIKENUM)"; // 지역명 기준으로 오름차순
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				String BIKENUM = rs.getString("BIKENUM");
				String ABLE = rs.getString("ABLE");
				int RNUM = rs.getInt("RNUM");
				String RNAME = rs.getString("RNAME").substring(rs.getString("RNAME").lastIndexOf(".")+1);
				
				BikeDto dto = new BikeDto(BIKENUM, ABLE, RNUM, RNAME);
				bike.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bike;
	}
	
	public void bikeAdd(String BIKENUM, String ABLE, int RNUM) {
		connection = null;
		pstmt = null;
	
		try {
			connection = dataSource.getConnection();
			String query = "insert into BIKE (BIKENUM, ABLE, RNUM) values (?,?,?)";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, BIKENUM);
			pstmt.setString(2, ABLE);
			pstmt.setInt(3, RNUM);
		
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
	
	public void rentalUpdate(int RNUM) {
		connection = null;
		pstmt = null;
	
		try {
			connection = dataSource.getConnection();
			String query = "update RENTAL set stand=stand+1 where RNUM = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, RNUM);
		
		
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
	
	
	
	public void delete(int bikenum) {
		connection = null;
		pstmt = null;
		try {
			connection = dataSource.getConnection();
			String query = "delete from BIKE where BIKENUM = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, bikenum);
			int rn = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	public ArrayList<BikeDto> searchList(String SK, String TEXT) {
		ArrayList<BikeDto> list = new ArrayList<BikeDto>();
		connection = null;
		pstmt = null;
		ResultSet rs = null;
		
		try {
			connection = dataSource.getConnection();
			String query;
			
			if (SK.equals("bikenum")) {
				query = "select BIKE.BIKENUM, BIKE.ABLE, BIKE.RNUM, RENTAL.RNAME from BIKE LEFT JOIN RENTAL ON BIKE.RNUM = RENTAL.RNUM where BIKENUM LIKE ?";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, "%"+TEXT+"%");
				rs = pstmt.executeQuery();
			} else if (SK.equals("rname")) {
				query = "select BIKE.BIKENUM, BIKE.ABLE, BIKE.RNUM, RENTAL.RNAME from BIKE LEFT JOIN RENTAL ON BIKE.RNUM = RENTAL.RNUM where BIKE.RNUM LIKE ?";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, "%"+TEXT+"%");
				rs = pstmt.executeQuery();
			} 
			
			
			while(rs.next()) {
				String BIKENUM = rs.getString("BIKENUM");
				String ABLE = rs.getString("ABLE");
				int RNUM = rs.getInt("RNUM");
				String RNAME = rs.getString("RNAME");
				
				BikeDto dto = new BikeDto(BIKENUM, ABLE, RNUM, RNAME);
				list.add(dto);
			}
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
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
