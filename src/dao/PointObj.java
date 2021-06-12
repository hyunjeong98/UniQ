package dao;

public class PointObj {
	private String item;
	private int ea, price;
	public PointObj( String item, int ea, int price) {
	this.item = item;
	this.ea = ea;
	this.price = price;
	
	}
	public String getItem() { return this.item; }
	public int getEa() { return this.ea; }
	public int getPrice() { return this.price; }

}
