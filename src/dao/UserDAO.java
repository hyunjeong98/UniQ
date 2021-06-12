package dao;

import java.sql.*;
import javax.naming.NamingException;
import util.*;

public class UserDAO {

	public boolean insert(String uid, String upass, String uname, String usex, String univename, String univedepart) throws NamingException, SQLException{
		Connection conn= ConnectionPool.get();
		PreparedStatement stmt= null;
		try{
			String sql= "INSERT INTO quser(id, password, name, sex, univ, depart) VALUES (?,?,?,?,?,?)";
			stmt= conn.prepareStatement(sql);
			stmt.setString(1, uid);
			stmt.setString(2, upass);
			stmt.setString(3, uname);
			stmt.setString(4, usex);
			stmt.setString(5, univename);
			stmt.setString(6, univedepart);
			//stmt.setString(7, uemail);
			
			int count= stmt.executeUpdate();
			return(count== 1) ? true: false;
			
		} finally{
			if(stmt!= null) stmt.close();
			if(conn!= null) conn.close();
		}
	}
	
	public boolean exists(String uid) throws NamingException, SQLException{
		Connection conn= ConnectionPool.get();
		PreparedStatement stmt= null;
		ResultSet rs= null;
		try{
			String sql= "SELECT id FROM quser WHERE id = ?";
			stmt= conn.prepareStatement(sql);
			stmt.setString(1, uid);
			rs= stmt.executeQuery();
			return rs.next();
		} finally{
			if(rs!= null) rs.close();
			if(stmt!= null) stmt.close();
			if(conn!= null) conn.close();
		}
	}
	
	public boolean delete(String uid) throws NamingException, SQLException{
		Connection conn= ConnectionPool.get();
		PreparedStatement stmt= null;
		try{
			String sql= "DELETE FROM quser WHERE id = ?";
			stmt= conn.prepareStatement(sql);
			stmt.setString(1, uid);
			
			int count= stmt.executeUpdate();
			return(count> 0) ? true: false;
		} finally{
			if(stmt!= null) stmt.close();
			if(conn!= null) conn.close();
		}
	}
	
	public int login(String uid, String upass) throws NamingException, SQLException{
		Connection conn= null;
		PreparedStatement stmt= null;
		ResultSet rs= null;
		try{
			String sql= "SELECT id, password FROM quser WHERE id = ?";
			

			conn= ConnectionPool.get();
			stmt= conn.prepareStatement(sql);
			stmt.setString(1, uid);
			
			rs= stmt.executeQuery();
			
			
			if(!rs.next()) return 1;
			if(!upass.equals(rs.getString("password"))) {
				return 2;
			}
			return 0;
		} finally{
			if(rs!= null) rs.close();
			if(stmt!= null) stmt.close();
			if(conn!= null) conn.close();
		}
	}
	
	public UserObj getUserInfo(String uid) throws NamingException, SQLException{
		Connection conn= null;
		PreparedStatement stmt= null;
		ResultSet rs = null;
		try{
			String sql= "SELECT name, univ, depart, point, ticket FROM quser WHERE id = ?";
			conn= ConnectionPool.get();
			stmt= conn.prepareStatement(sql);
			stmt.setString(1, uid);
			
			rs= stmt.executeQuery();
			
			UserObj user = null;
			
			if(rs.next()) {
				user = new UserObj(rs.getString("name"), rs.getString("univ"), rs.getString("depart"), rs.getInt("point"), rs.getInt("ticket"));
			}

			return user;
		} finally{
			if(rs!= null) rs.close();
			if(stmt!= null) stmt.close();
			if(conn!= null) conn.close();
		}
	}
	
	public boolean updatePoint(String uid, int point) throws NamingException, SQLException{
		Connection conn= ConnectionPool.get();
		PreparedStatement stmt= null;
		try{
			String sql= "UPDATE quser SET point=point+? WHERE id=?";
			stmt= conn.prepareStatement(sql);
			stmt.setInt(1, point);
			stmt.setString(2, uid);
			
			
			int count= stmt.executeUpdate();
			return(count== 1) ? true: false;
			
		} finally{
			if(stmt!= null) stmt.close();
			if(conn!= null) conn.close();
		}
	}

}
