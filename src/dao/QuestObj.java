package dao;

public class QuestObj {
	
	//
	private String title, qexplain, formlink, deadline, target;
	private int mchoice,sanswer,leatTime;
	public QuestObj(String title, String qexplain, String formlink, int mchoice, int sanswer, String deadline, String target, int leatTime) {
	this.title= title;
	this.qexplain= qexplain;
	this.formlink= formlink;
	this.deadline= deadline;
	this.target= target;
	this.mchoice= mchoice;
	this.sanswer= sanswer;
	this.leatTime= leatTime;
	}
	
	public String getTitle() { return this.title; }
	public String getExplain() { return this.qexplain; }
	public String getFormlink() { return this.formlink; }
	public String getDeadline() { return this.deadline; }
	public String getTarget() { return this.target; }
	public int getMchoice() { return this.mchoice; }
	public int getSanswer() { return this.sanswer; }
	public int getLeatTime() { return this.leatTime; }
	

	

}
