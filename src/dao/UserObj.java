package dao;

public class UserObj {
	private String name, univ, depart;
	private int point, ticket;
	public UserObj(String name, String univ, String depart, int point, int ticket) {
	this.name = name;
	this.univ = univ;
	this.depart = depart;
	this.point = point;
	this.ticket = ticket;
	
	}
	public String getName() { return this.name; }
	public String getUniv() { return this.univ; }
	public String getDepart() { return this.depart; }
	public int getPoint() { return this.point; }
	public int getTicket() { return this.ticket; }

}
