package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.*;
import java.time.*;
import java.time.temporal.ChronoUnit;

public class QuestDAO {
	public boolean insert(String qid, String title, String qexplain, String formlink, int mchoice, int sanswer, int leadtime, String deadline, String target) throws NamingException, SQLException{
		Connection conn= ConnectionPool.get();
		PreparedStatement stmt= null;
		try{
			String sql= "INSERT INTO quest(qid, title, qexplain, formlink, mchoice, sanswer, leadTime, deadline, target) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			stmt= conn.prepareStatement(sql);
			stmt.setString(1, qid);
			stmt.setString(2, title);
			stmt.setString(3, qexplain);
			stmt.setString(4, formlink);
			stmt.setInt(5, mchoice);
			stmt.setInt(6, sanswer);
			stmt.setInt(7, leadtime);
			stmt.setString(8, deadline);
			stmt.setString(9, target);
			
			
			int count= stmt.executeUpdate();
			return(count== 1) ? true: false;
		} finally{
			if(stmt!= null) stmt.close();
			if(conn!= null) conn.close();
		}
	}
	
	public ArrayList<QuestObj> getList() throws NamingException, SQLException{
		Connection conn= ConnectionPool.get();
		PreparedStatement stmt= null;
		ResultSet rs= null;
		try{
		String sql= "SELECT * FROM quest ORDER BY regist DESC";
		stmt= conn.prepareStatement(sql);
		rs= stmt.executeQuery(); 
		
		ArrayList<QuestObj> quests = new ArrayList<QuestObj>();
		while(rs.next()) {
		quests.add(new QuestObj(rs.getString("title"), rs.getString("qexplain"), rs.getString("formlink"), rs.getInt("mchoice"), rs.getInt("sanswer"), rs.getString("deadline"), rs.getString("target"), rs.getInt("leadTime")));
		}
		return quests;
		} finally{
		if(rs!= null) rs.close();
		if(stmt!= null) stmt.close();
		if(conn!= null) conn.close();
		}
	}
	
	public String getDday(int year, int month, int day) {
		LocalDate fromDate = LocalDate.now();
		LocalDate toDate = LocalDate.of(year, month, day);
		String Dday = Long.toString(ChronoUnit.DAYS.between(fromDate, toDate));
		return Dday;
	}
	
}
