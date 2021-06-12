package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class noticeDAO {
	public boolean insert(String atitle, String content) throws NamingException, SQLException{
		Connection conn= ConnectionPool.get();
		PreparedStatement stmt= null;
		try{
			String sql= "INSERT INTO notice(atitle, content) VALUES (?,?)";
			stmt= conn.prepareStatement(sql);
			stmt.setString(1, atitle);
			stmt.setString(2, content);
			
			
			int count= stmt.executeUpdate();
			return(count== 1) ? true: false;
			
		} finally{
			if(stmt!= null) stmt.close();
			if(conn!= null) conn.close();
		}
	}
	
	public ArrayList<noticeObj> getList() throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
		String sql = "SELECT * FROM notice ORDER BY ts DESC";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		ArrayList<noticeObj> notices = new ArrayList<noticeObj>();
		while(rs.next()) {
			notices.add(new noticeObj(rs.getString("atitle"), rs.getString("content"), rs.getString("ts")));
			}
		return notices;
		
		} finally {
		if (rs != null) rs.close();
		if (stmt != null) stmt.close(); 
		if (conn != null) conn.close();
		}
	}
}
