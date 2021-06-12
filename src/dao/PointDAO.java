package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class PointDAO {
	public int loadpoint(String uid) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet rs= null;
		try {
				String sql = "select point from quser where id = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, uid);
				
				rs=stmt.executeQuery();
				
				if(!rs.next()) return 999;
				else return rs.getInt("point");
		}
		finally {
			if(rs!= null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null)conn.close();
		}
	}	
	public int loadticket(String uid) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet rs= null;
		try {
				String sql = "select ticket from quser where id = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, uid);
				
				rs=stmt.executeQuery();
				
				if(!rs.next()) return 999;
				else return rs.getInt("ticket");
		}
		finally {
			if(rs!= null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null)conn.close();
		}
	}	
	
	public boolean buy(String uid, int upoint, int ticket) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		try {
				String sql = "update quser set point = ?, ticket = ? where id = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, upoint);
				stmt.setInt(2, ticket);
				stmt.setString(3, uid);
				
				int count = stmt.executeUpdate();
				
				return (count ==1) ? true : false;
		}
		finally {
			if(stmt != null) stmt.close();
			if(conn != null)conn.close();
		}
	}	
	
	public PointObj getStock(int pno) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
				String sql = "select item, ea, price from pointshop where pno = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, pno);
				
				rs=stmt.executeQuery();
				
				PointObj pobj = null;
				
				if(rs.next()) {
					pobj = new PointObj(rs.getString("item"), rs.getInt("ea"), rs.getInt("price"));
				}
				
				return pobj;
		}
		finally {
			if(stmt != null) stmt.close();
			if(conn != null)conn.close();
		}
	}	
}
