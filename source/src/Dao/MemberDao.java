package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.*;
import javax.sql.DataSource;

import Dto.MapDto;
import Dto.MemberDto;

public class MemberDao {
	DataSource dataSource;
	Connection connection;
	PreparedStatement pstmt;

	public MemberDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/orcl");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결 실패");
			return;
		}

	}

	public void memberInsert(String ID, String PWD, String PHONE, String EMAIL, String BIKE_PWD, String GENDER) {
		connection = null;
		pstmt = null;

		try {
			connection = dataSource.getConnection();
			String query = "insert into MEMBER(ID, PWD, PHONE, EMAIL, BIKE_PWD, GENDER) values(?,?,?,?,?,?)";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, ID);
			pstmt.setString(2, PWD);
			pstmt.setString(3, PHONE);
			pstmt.setString(4, EMAIL);
			pstmt.setString(5, BIKE_PWD);
			pstmt.setString(6, GENDER);
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

	
	public int memberCheck(String id, String pw) {
		connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPWD;
		int x = -1;

		try {
			String sql = "SELECT PWD FROM MEMBER WHERE ID=?";
			connection = dataSource.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
	
			if(id.equals("admin") || pw.equals("admin")){
				x = 2;
			}else if (rs.next()) {
				dbPWD = rs.getString("PWD");
				if (dbPWD.equals(pw)) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			execClose(rs, pstmt, connection);
		}
		return x;

	}
	
	
	public ArrayList<MemberDto> list() {
		ArrayList<MemberDto> mem = new ArrayList<MemberDto>();
		connection = null;
		pstmt = null;
		ResultSet rs = null;

		try {
			connection = dataSource.getConnection();

			String query = "select * from MEMBER"; 
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				String ID = rs.getString("ID");
				String PWD = rs.getString("PWD");
				String PHONE = rs.getString("PHONE");
				String EMAIL = rs.getString("EMAIL");
				String BIKE_PWD = rs.getString("BIKE_PWD");
				String GENDER = rs.getString("GENDER");

				MemberDto dto = new MemberDto(ID, PWD, PHONE, EMAIL, BIKE_PWD, GENDER);
				mem.add(dto);
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
		return mem;
	}
	
	
	public void delete(String ID) {
		connection = null;
		pstmt = null;
		try {
			connection = dataSource.getConnection();
			String query = "delete from MEMBER where ID = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, ID);
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
	
	
	public ArrayList<MemberDto> searchList(String SK, String TEXT) {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		connection = null;
		pstmt = null;
		ResultSet rs = null;
		
		try {
			connection = dataSource.getConnection();
			String query;
			
			if (SK.equals("id")) {
				query = "select * from MEMBER where ID LIKE ?";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, "%"+TEXT+"%");
				rs = pstmt.executeQuery();
			} else if (SK.equals("phone")) {
				query = "select * from MEMBER where PHONE LIKE ?";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, "%"+TEXT+"%");
				rs = pstmt.executeQuery();
			}
			
			
			while(rs.next()) {
				String ID = rs.getString("ID");
				String PWD = rs.getString("PWD");
				String PHONE = rs.getString("PHONE");
				String EMAIL = rs.getString("EMAIL");
				String BIKE_PWD = rs.getString("BIKE_PWD");
				String GENDER = rs.getString("GENDER");
				
				MemberDto dto = new MemberDto(ID, PWD, PHONE, EMAIL, BIKE_PWD, GENDER);
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
